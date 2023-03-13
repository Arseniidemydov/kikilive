import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';

import '../../auth/firebase_user_provider.dart';

import '../../backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show DynamicLinksHandler;
import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '../../backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  KikiFirebaseUser? initialUser;
  KikiFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(KikiFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
      navigatorBuilder: (_, __, child) => DynamicLinksHandler(child: child),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
          routes: [
            FFRoute(
              name: 'signin_phone_page',
              path: 'signinPhonePage',
              builder: (context, params) => SigninPhonePageWidget(),
            ),
            FFRoute(
              name: 'register_page',
              path: 'registerPage',
              builder: (context, params) => RegisterPageWidget(),
            ),
            FFRoute(
              name: 'signin_otp_page',
              path: 'signinOtpPage',
              builder: (context, params) => SigninOtpPageWidget(),
            ),
            FFRoute(
              name: 'login_page',
              path: 'loginPage',
              builder: (context, params) => LoginPageWidget(),
            ),
            FFRoute(
              name: 'forgot_password_page',
              path: 'forgotPasswordPage',
              builder: (context, params) => ForgotPasswordPageWidget(),
            ),
            FFRoute(
              name: 'terms_and_condition',
              path: 'termsAndCondition',
              requireAuth: true,
              builder: (context, params) => TermsAndConditionWidget(),
            ),
            FFRoute(
              name: 'products_page',
              path: 'productsPage',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'products_page')
                  : ProductsPageWidget(),
            ),
            FFRoute(
              name: 'search_results_page',
              path: 'searchResultsPage',
              requireAuth: true,
              builder: (context, params) => SearchResultsPageWidget(
                tab: params.getParam('tab', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'shopping_cart_page',
              path: 'shoppingCartPage',
              requireAuth: true,
              builder: (context, params) => ShoppingCartPageWidget(),
            ),
            FFRoute(
              name: 'product_details_page',
              path: 'productDetailsPage',
              requireAuth: true,
              builder: (context, params) => ProductDetailsPageWidget(
                productDetails: params.getParam('productDetails',
                    ParamType.DocumentReference, false, ['products']),
              ),
            ),
            FFRoute(
              name: 'payment_success_page',
              path: 'paymentSuccessPage',
              requireAuth: true,
              builder: (context, params) => PaymentSuccessPageWidget(
                paymentStatus: params.getParam('paymentStatus', ParamType.bool),
                transactionId:
                    params.getParam('transactionId', ParamType.String),
                orderlist: params.getParam('orderlist',
                    ParamType.DocumentReference, false, ['order_list']),
              ),
            ),
            FFRoute(
              name: 'user_profile_page',
              path: 'userProfilePage',
              requireAuth: true,
              builder: (context, params) => UserProfilePageWidget(),
            ),
            FFRoute(
              name: 'seller_get_verified',
              path: 'sellerGetVerified',
              requireAuth: true,
              builder: (context, params) => SellerGetVerifiedWidget(),
            ),
            FFRoute(
              name: 'admin_seller_earnings',
              path: 'adminSellerEarnings',
              requireAuth: true,
              builder: (context, params) => AdminSellerEarningsWidget(
                userRef: params.getParam(
                    'userRef', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'order_list_details',
              path: 'orderListDetails',
              requireAuth: true,
              builder: (context, params) => OrderListDetailsWidget(
                orderList: params.getParam('orderList',
                    ParamType.DocumentReference, false, ['order_list']),
                sellerRef: params.getParam(
                    'sellerRef', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'admin_seller_approval',
              path: 'adminSellerApproval',
              requireAuth: true,
              builder: (context, params) => AdminSellerApprovalWidget(
                userRef: params.getParam(
                    'userRef', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'admin_seller_approval_list',
              path: 'adminSellerApprovalList',
              requireAuth: true,
              builder: (context, params) => AdminSellerApprovalListWidget(),
            ),
            FFRoute(
              name: 'admin_channel_approval_list',
              path: 'adminChannelApprovalList',
              requireAuth: true,
              builder: (context, params) => AdminChannelApprovalListWidget(),
            ),
            FFRoute(
              name: 'admin_verify_channel',
              path: 'adminVerifyChannel',
              requireAuth: true,
              builder: (context, params) => AdminVerifyChannelWidget(
                channelReference: params.getParam('channelReference',
                    ParamType.DocumentReference, false, ['channels']),
              ),
            ),
            FFRoute(
              name: 'order_admin_mgmt_list',
              path: 'orderAdminMgmtList',
              requireAuth: true,
              builder: (context, params) => OrderAdminMgmtListWidget(),
            ),
            FFRoute(
              name: 'order_mgmt_list',
              path: 'orderMgmtList',
              requireAuth: true,
              builder: (context, params) => OrderMgmtListWidget(
                shopRef: params.getParam(
                    'shopRef', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'admin_seller_earnings_list',
              path: 'adminSellerEarningsList',
              requireAuth: true,
              builder: (context, params) => AdminSellerEarningsListWidget(),
            ),
            FFRoute(
              name: 'order_update_page',
              path: 'orderUpdatePage',
              requireAuth: true,
              builder: (context, params) => OrderUpdatePageWidget(
                orderReference: params.getParam('orderReference',
                    ParamType.DocumentReference, false, ['order']),
              ),
            ),
            FFRoute(
              name: 'live_broadcaster_page',
              path: 'liveBroadcasterPage',
              requireAuth: true,
              builder: (context, params) => LiveBroadcasterPageWidget(
                videoName: params.getParam('videoName', ParamType.String),
                channelRef: params.getParam<DocumentReference>('channelRef',
                    ParamType.DocumentReference, true, ['channels']),
              ),
            ),
            FFRoute(
              name: 'live_watcher_page',
              path: 'liveWatcherPage',
              requireAuth: true,
              builder: (context, params) => LiveWatcherPageWidget(
                url: params.getParam('url', ParamType.String),
                streamID: params.getParam('streamID',
                    ParamType.DocumentReference, false, ['streams']),
                channelRef: params.getParam('channelRef',
                    ParamType.DocumentReference, false, ['channels']),
              ),
            ),
            FFRoute(
              name: 'privacy_policy',
              path: 'privacyPolicy',
              requireAuth: true,
              builder: (context, params) => PrivacyPolicyWidget(),
            ),
            FFRoute(
              name: 'user_profile',
              path: 'userProfile',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'user_profile')
                  : UserProfileWidget(),
            ),
            FFRoute(
              name: 'user_profile_view',
              path: 'userProfileView',
              requireAuth: true,
              builder: (context, params) => UserProfileViewWidget(
                userRef: params.getParam(
                    'userRef', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'product_add_page',
              path: 'productAddPage',
              requireAuth: true,
              builder: (context, params) => ProductAddPageWidget(),
            ),
            FFRoute(
              name: 'product_edit_page',
              path: 'productEditPage',
              requireAuth: true,
              builder: (context, params) => ProductEditPageWidget(
                productRef: params.getParam('productRef',
                    ParamType.DocumentReference, false, ['products']),
              ),
            ),
            FFRoute(
              name: 'user_create_channel',
              path: 'userCreateChannel',
              requireAuth: true,
              builder: (context, params) => UserCreateChannelWidget(),
            ),
            FFRoute(
              name: 'live_home_page',
              path: 'liveHomePage',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'live_home_page')
                  : LiveHomePageWidget(),
            ),
            FFRoute(
              name: 'user_channel_edit',
              path: 'userChannelEdit',
              requireAuth: true,
              builder: (context, params) => UserChannelEditWidget(
                channelRef: params.getParam('channelRef',
                    ParamType.DocumentReference, false, ['channels']),
              ),
            ),
            FFRoute(
              name: 'user_account_settings',
              path: 'userAccountSettings',
              requireAuth: true,
              builder: (context, params) => UserAccountSettingsWidget(),
            ),
            FFRoute(
              name: 'order_history_list',
              path: 'orderHistoryList',
              requireAuth: true,
              builder: (context, params) => OrderHistoryListWidget(),
            ),
            FFRoute(
              name: 'user_address_list',
              path: 'userAddressList',
              requireAuth: true,
              builder: (context, params) => UserAddressListWidget(),
            ),
            FFRoute(
              name: 'order_history',
              path: 'orderHistory',
              requireAuth: true,
              builder: (context, params) => OrderHistoryWidget(
                orderNo: params.getParam('orderNo', ParamType.String),
                userRef: params.getParam(
                    'userRef', ParamType.DocumentReference, false, ['users']),
                orderList: params.getParam('orderList',
                    ParamType.DocumentReference, false, ['order_list']),
              ),
            ),
            FFRoute(
              name: 'address_edit_page',
              path: 'addressEditPage',
              requireAuth: true,
              builder: (context, params) => AddressEditPageWidget(
                addressReference: params.getParam('addressReference',
                    ParamType.DocumentReference, false, ['address']),
              ),
            ),
            FFRoute(
              name: 'all_chats_page',
              path: 'allChatsPage',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'all_chats_page')
                  : AllChatsPageWidget(),
            ),
            FFRoute(
              name: 'create_chat_page',
              path: 'createChatPage',
              requireAuth: true,
              builder: (context, params) => CreateChatPageWidget(),
            ),
            FFRoute(
              name: 'chat_page',
              path: 'chatPage',
              requireAuth: true,
              asyncParams: {
                'chatUser': getDoc(['users'], UsersRecord.serializer),
              },
              builder: (context, params) => ChatPageWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, false, ['chats']),
                isGroup: params.getParam('isGroup', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'add_user_chat_group_page',
              path: 'addUserChatGroupPage',
              requireAuth: true,
              builder: (context, params) => AddUserChatGroupPageWidget(
                chat: params.getParam(
                    'chat', ParamType.DocumentReference, false, ['chats']),
              ),
            ),
            FFRoute(
              name: 'invite_user_chat_group_page',
              path: 'inviteUserChatGroupPage',
              requireAuth: true,
              builder: (context, params) => InviteUserChatGroupPageWidget(
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, false, ['chats']),
              ),
            ),
            FFRoute(
              name: 'seller_earnings_all',
              path: 'sellerEarningsAll',
              requireAuth: true,
              builder: (context, params) => SellerEarningsAllWidget(
                orderListID: params.getParam('orderListID',
                    ParamType.DocumentReference, false, ['order_list']),
                sellerRef: params.getParam(
                    'sellerRef', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'seller_earnings_details',
              path: 'sellerEarningsDetails',
              requireAuth: true,
              builder: (context, params) => SellerEarningsDetailsWidget(
                sellerRef: params.getParam(
                    'sellerRef', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'remove_user_chat_group_page',
              path: 'removeUserChatGroupPage',
              requireAuth: true,
              asyncParams: {
                'chat': getDoc(['chats'], ChatsRecord.serializer),
              },
              builder: (context, params) => RemoveUserChatGroupPageWidget(
                chat: params.getParam('chat', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'user_channel_list',
              path: 'userChannelList',
              requireAuth: true,
              builder: (context, params) => UserChannelListWidget(),
            ),
            FFRoute(
              name: 'channel_edit_page',
              path: 'channelEditPage',
              requireAuth: true,
              builder: (context, params) => ChannelEditPageWidget(
                channelReference: params.getParam('channelReference',
                    ParamType.DocumentReference, false, ['channels']),
              ),
            ),
            FFRoute(
              name: 'channel_detaisl_page',
              path: 'channelDetaislPage',
              requireAuth: true,
              builder: (context, params) => ChannelDetaislPageWidget(
                channelRef: params.getParam('channelRef',
                    ParamType.DocumentReference, false, ['channels']),
              ),
            ),
            FFRoute(
              name: 'user_channel_subscription',
              path: 'userChannelSubscription',
              requireAuth: true,
              builder: (context, params) => UserChannelSubscriptionWidget(),
            ),
            FFRoute(
              name: 'address_add_page',
              path: 'addressAddPage',
              requireAuth: true,
              builder: (context, params) => AddressAddPageWidget(
                addressReference: params.getParam('addressReference',
                    ParamType.DocumentReference, false, ['address']),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (GoRouter.of(this).routerDelegate.matches.length <= 1) {
      go('/');
    } else {
      pop();
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Color(0xFF9BCEF9),
                  child: Center(
                    child: Image.asset(
                      'assets/images/51E84C83-FE68-48E6-B522-B418230842DB.gif',
                      width: MediaQuery.of(context).size.width * 0.5,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
