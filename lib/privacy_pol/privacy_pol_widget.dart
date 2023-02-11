import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'privacy_pol_model.dart';
export 'privacy_pol_model.dart';

class PrivacyPolWidget extends StatefulWidget {
  const PrivacyPolWidget({Key? key}) : super(key: key);

  @override
  _PrivacyPolWidgetState createState() => _PrivacyPolWidgetState();
}

class _PrivacyPolWidgetState extends State<PrivacyPolWidget> {
  late PrivacyPolModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: responsiveVisibility(
        context: context,
        tablet: false,
        tabletLandscape: false,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Privacy Policy',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 20,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2,
            )
          : null,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 30),
                                  child: Text(
                                    'Privacy Policy for Kiki Tech Pte. Ltd\n\nAt Kiki, accessible from https://www.kikilive.app, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by Kiki and how we use it.\n\nIf you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.\n\nThis Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in Kiki. This policy is not applicable to any information collected offline or via channels other than this website. Our Privacy Policy was created with the help of the Free Privacy Policy Generator.\n\nConsent\n\nBy using our website, you hereby consent to our Privacy Policy and agree to its terms.\n\nInformation we collect\n\nThe personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.\n\nIf you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide.\n\nWhen you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.\n\nHow we use your information\n\nWe use the information we collect in various ways, including to:\n\nProvide, operate, and maintain our website\nImprove, personalize, and expand our website\nUnderstand and analyze how you use our website\nDevelop new products, services, features, and functionality\nCommunicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes\nSend you emails\nFind and prevent fraud\nLog Files\n\nKiki follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services\' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users\' movement on the website, and gathering demographic information.\n\nCookies and Web Beacons\n\nLike any other website, Kiki uses \'cookies\'. These cookies are used to store information including visitors\' preferences, and the pages on the website that the visitor accessed or visited. The information is used to optimize the users\' experience by customizing our web page content based on visitors\' browser type and/or other information.\n\nGoogle DoubleClick DART Cookie\n\nGoogle is one of a third-party vendor on our site. It also uses cookies, known as DART cookies, to serve ads to our site visitors based upon their visit to www.website.com and other sites on the internet. However, visitors may choose to decline the use of DART cookies by visiting the Google ad and content network Privacy Policy at the following URL – https://policies.google.com/technologies/ads\n\nOur Advertising Partners\n\nSome of advertisers on our site may use cookies and web beacons. Our advertising partners are listed below. Each of our advertising partners has their own Privacy Policy for their policies on user data. For easier access, we hyperlinked to their Privacy Policies below.\n\nGoogle\n\nhttps://policies.google.com/technologies/ads\n\nAdvertising Partners Privacy Policies\n\nYou may consult this list to find the Privacy Policy for each of the advertising partners of Kiki.\n\nThird-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on Kiki, which are sent directly to users\' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.\n\nNote that Kiki has no access to or control over these cookies that are used by third-party advertisers.\n\nThird Party Privacy Policies\n\nKiki\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.\n\nYou can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers\' respective websites.\n\nCCPA Privacy Rights (Do Not Sell My Personal Information)\n\nUnder the CCPA, among other rights, California consumers have the right to:\n\nRequest that a business that collects a consumer\'s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.\n\nRequest that a business delete any personal data about the consumer that a business has collected.\n\nRequest that a business that sells a consumer\'s personal data, not sell the consumer\'s personal data.\n\nIf you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.\n\nGDPR Data Protection Rights\n\nWe would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:\n\nThe right to access – You have the right to request copies of your personal data. We may charge you a small fee for this service.\n\nThe right to rectification – You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.\n\nThe right to erasure – You have the right to request that we erase your personal data, under certain conditions.\n\nThe right to restrict processing – You have the right to request that we restrict the processing of your personal data, under certain conditions.\n\nThe right to object to processing – You have the right to object to our processing of your personal data, under certain conditions.\n\nThe right to data portability – You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.\n\nIf you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.\n\nChildren\'s Information\n\nAnother part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.\n\nKiki does not knowingly collect any Personal Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
