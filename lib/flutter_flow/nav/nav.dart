import 'dart:async';

import 'package:flutter/material.dart';
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
  BryanFirebaseUser? initialUser;
  BryanFirebaseUser? user;
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

  void update(BryanFirebaseUser newUser) {
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
          appStateNotifier.loggedIn ? NavBarPage() : SplashWidget(),
      navigatorBuilder: (_, __, child) => DynamicLinksHandler(child: child),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : SplashWidget(),
          routes: [
            FFRoute(
              name: 'splash',
              path: 'splash',
              builder: (context, params) => SplashWidget(),
            ),
            FFRoute(
              name: 'getStarted',
              path: 'getStarted',
              builder: (context, params) => GetStartedWidget(),
            ),
            FFRoute(
              name: 'phoneSignIn',
              path: 'phoneSignIn',
              builder: (context, params) => PhoneSignInWidget(),
            ),
            FFRoute(
              name: 'loginCopy',
              path: 'loginCopy',
              builder: (context, params) => LoginCopyWidget(),
            ),
            FFRoute(
              name: 'userProfileCopy',
              path: 'userProfileCopy',
              builder: (context, params) => UserProfileCopyWidget(),
            ),
            FFRoute(
              name: 'register',
              path: 'register',
              builder: (context, params) => RegisterWidget(),
            ),
            FFRoute(
              name: 'orderMgmtAdminCopy',
              path: 'orderMgmtAdminCopy',
              builder: (context, params) => OrderMgmtAdminCopyWidget(),
            ),
            FFRoute(
              name: 'userProfileViewCopy',
              path: 'userProfileViewCopy',
              builder: (context, params) => UserProfileViewCopyWidget(
                shopReference: params.getParam('shopReference',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'verifyOTP',
              path: 'verifyOTP',
              builder: (context, params) => VerifyOTPWidget(),
            ),
            FFRoute(
              name: 'searchResults',
              path: 'searchResults',
              builder: (context, params) => SearchResultsWidget(),
            ),
            FFRoute(
              name: 'login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'shops',
              path: 'shops',
              builder: (context, params) => ShopsWidget(
                shopDetails: params.getParam('shopDetails',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'Products',
              path: 'products',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Products')
                  : ProductsWidget(),
            ),
            FFRoute(
              name: 'forgotPassword',
              path: 'forgotPassword',
              builder: (context, params) => ForgotPasswordWidget(),
            ),
            FFRoute(
              name: 'shoppingCart',
              path: 'shoppingCart',
              builder: (context, params) => ShoppingCartWidget(),
            ),
            FFRoute(
              name: 'productDetails',
              path: 'productDetails',
              builder: (context, params) => ProductDetailsWidget(
                productDetails: params.getParam('productDetails',
                    ParamType.DocumentReference, false, ['products']),
              ),
            ),
            FFRoute(
              name: 'termsConditions',
              path: 'termsConditions',
              builder: (context, params) => TermsConditionsWidget(),
            ),
            FFRoute(
              name: 'paymentSuccess',
              path: 'paymentSuccess',
              builder: (context, params) => PaymentSuccessWidget(
                orderDetails: params.getParam('orderDetails',
                    ParamType.DocumentReference, false, ['users', 'userOrder']),
                paymentStatus: params.getParam('paymentStatus', ParamType.bool),
                transactionId:
                    params.getParam('transactionId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'sellerSettings',
              path: 'sellerSettings',
              builder: (context, params) => SellerSettingsWidget(),
            ),
            FFRoute(
              name: 'sellersDetails',
              path: 'sellersDetails',
              builder: (context, params) => SellersDetailsWidget(),
            ),
            FFRoute(
              name: 'sellersDetailsPreview',
              path: 'sellersDetailsPreview',
              builder: (context, params) => SellersDetailsPreviewWidget(
                userReference: params.getParam('userReference',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'sellersDetailsEdit',
              path: 'sellersDetailsEdit',
              builder: (context, params) => SellersDetailsEditWidget(
                userReference: params.getParam('userReference',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'orderDetailsPreview',
              path: 'orderDetailsPreview',
              builder: (context, params) => OrderDetailsPreviewWidget(
                orderNo: params.getParam('orderNo', ParamType.String),
                shopRef: params.getParam(
                    'shopRef', ParamType.DocumentReference, false, ['users']),
                userRef: params.getParam(
                    'userRef', ParamType.DocumentReference, false, ['users']),
                addressRef: params.getParam('addressRef',
                    ParamType.DocumentReference, false, ['address']),
              ),
            ),
            FFRoute(
              name: 'orderDetailsEdit',
              path: 'orderDetailsEdit',
              builder: (context, params) => OrderDetailsEditWidget(
                orderReference: params.getParam('orderReference',
                    ParamType.DocumentReference, false, ['orders']),
              ),
            ),
            FFRoute(
              name: 'adminSettings',
              path: 'adminSettings',
              builder: (context, params) => AdminSettingsWidget(),
            ),
            FFRoute(
              name: 'sellerApproval',
              path: 'sellerApproval',
              builder: (context, params) => SellerApprovalWidget(
                newSellerApprovalRef: params.getParam('newSellerApprovalRef',
                    ParamType.DocumentReference, false, ['newSellerRequest']),
              ),
            ),
            FFRoute(
              name: 'AdminCreateChannel',
              path: 'adminCreateChannel',
              builder: (context, params) => AdminCreateChannelWidget(),
            ),
            FFRoute(
              name: 'SellerApprovalList',
              path: 'sellerApprovalList',
              builder: (context, params) => SellerApprovalListWidget(),
            ),
            FFRoute(
              name: 'ChannelApprovalList',
              path: 'channelApprovalList',
              builder: (context, params) => ChannelApprovalListWidget(),
            ),
            FFRoute(
              name: 'VerifyChannel',
              path: 'verifyChannel',
              builder: (context, params) => VerifyChannelWidget(
                channelReference: params.getParam('channelReference',
                    ParamType.DocumentReference, false, ['channels']),
              ),
            ),
            FFRoute(
              name: 'AdminShopEarningsList',
              path: 'adminShopEarningsList',
              builder: (context, params) => AdminShopEarningsListWidget(),
            ),
            FFRoute(
              name: 'AdminShopEarnings',
              path: 'adminShopEarnings',
              builder: (context, params) => AdminShopEarningsWidget(),
            ),
            FFRoute(
              name: 'AdminEarningsDeposit',
              path: 'adminEarningsDeposit',
              builder: (context, params) => AdminEarningsDepositWidget(
                orderRef: params.getParam(
                    'orderRef', ParamType.DocumentReference, false, ['orders']),
              ),
            ),
            FFRoute(
              name: 'orderMgmtAdminList',
              path: 'orderMgmtAdminList',
              builder: (context, params) => OrderMgmtAdminListWidget(),
            ),
            FFRoute(
              name: 'orderMgmtAdmin',
              path: 'orderMgmtAdmin',
              builder: (context, params) => OrderMgmtAdminWidget(),
            ),
            FFRoute(
              name: 'orderDetailsPreviewAdmin',
              path: 'orderDetailsPreviewAdmin',
              builder: (context, params) => OrderDetailsPreviewAdminWidget(
                orderNo: params.getParam('orderNo', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'livestreamViewer',
              path: 'livestreamViewer',
              builder: (context, params) => LivestreamViewerWidget(
                url: params.getParam('url', ParamType.String),
                streamID: params.getParam('streamID',
                    ParamType.DocumentReference, false, ['streams']),
                channelRef: params.getParam('channelRef',
                    ParamType.DocumentReference, false, ['channels']),
              ),
            ),
            FFRoute(
              name: 'liveBroadcast',
              path: 'liveBroadcast',
              builder: (context, params) => LiveBroadcastWidget(
                videoName: params.getParam('videoName', ParamType.String),
                channelRef: params.getParam<DocumentReference>('channelRef',
                    ParamType.DocumentReference, true, ['channels']),
              ),
            ),
            FFRoute(
              name: 'privacyPol',
              path: 'privacyPol',
              builder: (context, params) => PrivacyPolWidget(),
            ),
            FFRoute(
              name: 'userProfile',
              path: 'userProfile',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'userProfile')
                  : UserProfileWidget(),
            ),
            FFRoute(
              name: 'userProfileView',
              path: 'userProfileView',
              builder: (context, params) => UserProfileViewWidget(
                shopReference: params.getParam('shopReference',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'live',
              path: 'live',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'live')
                  : LiveWidget(),
            ),
            FFRoute(
              name: 'addProduct',
              path: 'addProduct',
              builder: (context, params) => AddProductWidget(),
            ),
            FFRoute(
              name: 'editProduct',
              path: 'editProduct',
              builder: (context, params) => EditProductWidget(
                productRef: params.getParam('productRef',
                    ParamType.DocumentReference, false, ['products']),
              ),
            ),
            FFRoute(
              name: 'createChannels',
              path: 'createChannels',
              builder: (context, params) => CreateChannelsWidget(),
            ),
            FFRoute(
              name: 'editSellerChannels',
              path: 'editSellerChannels',
              builder: (context, params) => EditSellerChannelsWidget(
                channelRef: params.getParam('channelRef',
                    ParamType.DocumentReference, false, ['channels']),
              ),
            ),
            FFRoute(
              name: 'userSettings',
              path: 'userSettings',
              builder: (context, params) => UserSettingsWidget(),
            ),
            FFRoute(
              name: 'accountSettings',
              path: 'accountSettings',
              builder: (context, params) => AccountSettingsWidget(),
            ),
            FFRoute(
              name: 'orderHistoryList',
              path: 'orderHistoryList',
              builder: (context, params) => OrderHistoryListWidget(),
            ),
            FFRoute(
              name: 'orderHistory',
              path: 'orderHistory',
              builder: (context, params) => OrderHistoryWidget(
                orderNo: params.getParam('orderNo', ParamType.String),
                userRef: params.getParam(
                    'userRef', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'addressList',
              path: 'addressList',
              builder: (context, params) => AddressListWidget(),
            ),
            FFRoute(
              name: 'addressDetails',
              path: 'addressDetails',
              builder: (context, params) => AddressDetailsWidget(
                addressReference: params.getParam('addressReference',
                    ParamType.DocumentReference, false, ['address']),
              ),
            ),
            FFRoute(
              name: 'UpdateAddressDetails',
              path: 'updateAddressDetails',
              builder: (context, params) => UpdateAddressDetailsWidget(
                addressReference: params.getParam('addressReference',
                    ParamType.DocumentReference, false, ['address']),
              ),
            ),
            FFRoute(
              name: 'cartAddress',
              path: 'cartAddress',
              builder: (context, params) => CartAddressWidget(
                addressReference: params.getParam('addressReference',
                    ParamType.DocumentReference, false, ['address']),
              ),
            ),
            FFRoute(
              name: 'chatPage',
              path: 'chatPage',
              asyncParams: {
                'chatUser': getDoc(['users'], UsersRecord.serializer),
              },
              builder: (context, params) => ChatPageWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, false, ['chats']),
              ),
            ),
            FFRoute(
              name: 'allChats',
              path: 'allChats',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'allChats')
                  : AllChatsWidget(),
            ),
            FFRoute(
              name: 'inviteUsers',
              path: 'inviteUsers',
              builder: (context, params) => InviteUsersWidget(),
            ),
            FFRoute(
              name: 'addChat',
              path: 'addChat',
              asyncParams: {
                'chat': getDoc(['chats'], ChatsRecord.serializer),
              },
              builder: (context, params) => AddChatWidget(
                chat: params.getParam('chat', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'searchShop',
              path: 'searchShop',
              builder: (context, params) => SearchShopWidget(
                searchValue: params.getParam('searchValue', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'orderManagement',
              path: 'orderManagement',
              builder: (context, params) => OrderManagementWidget(),
            ),
            FFRoute(
              name: 'ShopEarnings',
              path: 'shopEarnings',
              builder: (context, params) => ShopEarningsWidget(),
            ),
            FFRoute(
              name: 'shopEarningDetails',
              path: 'shopEarningDetails',
              builder: (context, params) => ShopEarningDetailsWidget(
                orderDate: params.getParam('orderDate', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'AddUser',
              path: 'addUser',
              asyncParams: {
                'chat': getDoc(['chats'], ChatsRecord.serializer),
              },
              builder: (context, params) => AddUserWidget(
                chat: params.getParam('chat', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'RemoveUser',
              path: 'removeUser',
              asyncParams: {
                'chat': getDoc(['chats'], ChatsRecord.serializer),
              },
              builder: (context, params) => RemoveUserWidget(
                chat: params.getParam('chat', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'SellerChannels',
              path: 'sellerChannels',
              builder: (context, params) => SellerChannelsWidget(),
            ),
            FFRoute(
              name: 'EditChannel',
              path: 'editChannel',
              builder: (context, params) => EditChannelWidget(
                channelReference: params.getParam('channelReference',
                    ParamType.DocumentReference, false, ['channels']),
              ),
            ),
            FFRoute(
              name: 'channelDetails',
              path: 'channelDetails',
              builder: (context, params) => ChannelDetailsWidget(
                channelRef: params.getParam('channelRef',
                    ParamType.DocumentReference, false, ['channels']),
              ),
            ),
            FFRoute(
              name: 'channelList',
              path: 'channelList',
              builder: (context, params) => ChannelListWidget(
                url: params.getParam('url', ParamType.String),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
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
            return '/splash';
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
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Screenshot_2022-11-22_at_10.59.54_PM.png',
                    fit: BoxFit.cover,
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
