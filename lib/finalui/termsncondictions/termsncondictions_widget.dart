import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'termsncondictions_model.dart';
export 'termsncondictions_model.dart';

class TermsncondictionsWidget extends StatefulWidget {
  const TermsncondictionsWidget({super.key});

  @override
  State<TermsncondictionsWidget> createState() =>
      _TermsncondictionsWidgetState();
}

class _TermsncondictionsWidgetState extends State<TermsncondictionsWidget> {
  late TermsncondictionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsncondictionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).background,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(17.0, 12.0, 17.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 28.0,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 24.0, 0.0),
                          child: Text(
                            'Terms and Condition',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 12.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text:
                                      'BY USING ANY PORTION OF THE SERVICE, YOU ARE AGREEING TO BE BOUND BY AND ARE BECOMING A PARTY TO THESE TERMS. IF YOU DO NOT AGREE TO THESE TERMS, DO NOT USE THE SERVICE. If you are using the Service on behalf of your employer, you represent that you are authorized to accept these Terms on your employer’s behalf.\n\nThese Terms of Service (“Terms”) are a legal agreement between you and Astraline LLC regarding your use of services available at ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: 'http://www.downdogapp.com/',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).blue,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      ' or through any iOS/Android application made by Astraline LLC and available for download through a third party applications store, including any downloadable software program that you are accessing or installing on your device or personal computer and the services available through that software program (together, the “Service(s)”).',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nDescription of Service\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'The astrology portion of this app is designed for entertainment purposes only and is not meant to be taken as professional counseling for any form of mental, emotional or physical illness. Please contact your health service provider if you need help in these areas.\nThe service is an education tool designed to help with various forms of fitness, health and wellbeing, including but not limited to the practice of yoga, high intensity interval training, barre, running, meditation, and breathwork.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nEligibility of Usage\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'The Service is not intended for those under the age of 18. Use of the Service is void where prohibited. You must be 18 years of age or older to use the Service. You represent and warrant that any profile information you submit is true and accurate and that you are 18 years of age or older and are fully able and competent to enter into, and abide by these Terms.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text:
                                      '\n\nConsent to Electronic Communications\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'By using the Service, you consent to receiving electronic communications from us. These communications may include notices about your account and information concerning or related to the Service. You are solely responsible for all fees charged by your telecommunications service provider, or any other service provider related to your use of the Service, including without limitation any SMS / text messaging fees, data charges, and other fees. You agree that any notices, agreements, disclosures, or other communications that we send to you electronically will satisfy any legal communication requirements, including that such communications be in writing.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nAccount\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'In order to use the Service, you must create an account. When registering for an account, you must provide accurate and complete information and promptly update this information to keep it current. If you provide any information that is inaccurate or incomplete, or we have reason to believe that the information is inaccurate or incomplete, we may suspend or terminate your account and your use of the Service. To protect your account from unauthorized use, do not provide your username or password to anyone else. Please notify us immediately of any unauthorized use of your account or any other breach of security by sending an email to ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: 'kevin@astralinapp.com',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).blue,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      '. You are solely responsible for all activities that occur through your account.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nTrademark Ownership\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'We, our affiliates, and our suppliers and licensors own all right, title, and interest, including all intellectual property rights, in and to the Service. Other products, brands, and company names and logos used on the Service are the trademarks or registered trademarks of their respective owners. Any use of any of the marks appearing on the Service without the prior written consent of Astraline LLC or the owner of the mark, as appropriate, is strictly prohibited. Except for those rights expressly granted in these Terms, no other rights are granted, either expressed or implied, to you. Astraline is a trademark of Astraline LLC.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nLimited Liability\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'Each provision of these terms that provides for a limitation of liability, disclaimer of warranties, or exclusion of damages is to allocate the risks under these terms between the parties. Neither Astraline LLC nor its affiliates, licensors, suppliers, or distributors will be liable for any indirect, incidental, special, consequential, or exemplary damages, including but not limited to, damages for loss of profits, goodwill, use, data or other intangible losses even if advised of the possibility of these damages, resulting from your access or use of the service. because some states do not allow the exclusion or limitation of liability for consequential or incidental damages, the above limitation may not apply to you. This allocation is an essential element of the basis of the bargain between the parties. each of these provisions is severable and independent of all other provisions of these terms. The limitations in this section will apply even if any limited remedy fails in its essential purpose Except as otherwise expressly set forth in these terms, the maximum total liability of astraline, its affiliates, licensors, suppliers, and distributors to you for any claim related to the service, whether in contract, tort, or otherwise, is the greater of the amount you paid for the service or \$30.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nFee Changes\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'We may at any time and from time to time, in our sole discretion, change the fees and charges, or add new fees and charges, in relation to any of the Services. We will notify you by email at least 15 calendar days in advance of any such change if the change will affect the amount you are charged for the Services. If you do not agree to the change, you may cancel your membership as described below.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nCancellation Policy\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'You may cancel a monthly or annual subscription at any time. Cancellation is effective at the end of the applicable monthly period for monthly subscriptions, or annual period for annual subscriptions. Please note that if you purchase a subscription through the Apple iTunes Store or our iPhone application, you must cancel automatic renewal of paid In App Subscriptions by selecting Manage App Subscriptions in your iTunes Account settings and selecting the subscription you want to modify. We may suspend or terminate your use of the Services as a result of your fraud or breach of any obligation under these Terms. Such termination or suspension may be immediate and',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text:
                                      '\n\nSubscription Services Description\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'Certain parts of the Service may be subject to payments now and in the future (the “Subscription Service(s)”).\nIt is possible that certain items from the Subscription Services will become free features, or that they will be removed from the App entirely. We may also add new items to the Subscription Services throughout your subscription term. . Astraline LLC makes no guarantee that it will continue providing any of the specific services listed on its FAQ or on its in-App payment screen throughout the term of your subscription. Please note that any payment terms presented to you in the process of using or signing up for a Subscription Service are deemed part of this Agreement. You acknowledge that Astraline LLC may do so in Astraline LLC’s sole discretion at any time without notice. In our continued assessment of the Subscription Services, we may from time to time, with respect to any or all our users, experiment with or otherwise offer certain features or other elements of the Services, including promotional features, user interfaces, plans, pricing, and advertisements. You also agree that Astraline LLC will not be liable to you for any modification, suspension, or discontinuance of the Services, although if you subscribe to the Subscription Services and Astraline LLC suspends or discontinues your subscription to the Subscription Services, Astraline LLC may, in its sole discretion, provide you with a credit, refund, discount or other form of consideration (for example, we may credit additional days of service to your account). Your purchase will additionally be subject to Apple’s applicable payment policy, which also may not provide for refunds. However, if Astraline LLC terminates your account or suspends or discontinues your access to Services due to your violation of these Terms, then you will not be eligible for any such credit, refund, discount or other consideration.\nPlease note that if you purchase a subscription through the Apple iTunes Store or our iPhone application, the sale is final, and we will not provide a refund. Please note that if you purchase a subscription through the Android Play Store or Amazon store, the sale is final, and we will not provide a refund. Your purchase will additionally be subject to Android’s or Amazon’s applicable payment policy, respectively, which also may not provide for refunds.\nAstraline LLC offers monthly, six moth and twelve month subscription options. For the purposes of those subscriptions, a month constitutes 30 calendar days, 6 months constitutes 180 calendar days and a year constitutes 365 calendar days,..\nOur monthly subscriptions are paid in monthly installments. For each month that your monthly subscription is active, you acknowledge and agree that Astraline LLC is authorized to charge the same credit card or other payment method (the “Payment Method”) as was used for the initial subscription fee in the amount of the then current monthly subscription fee. The monthly renewal subscription fees will continue to be billed to the Payment Method you provided, automatically until cancelled. You must cancel your subscription before it renews each month in order to avoid billing of the next month’s subscription fee to the Payment Method you provided. Refunds cannot be claimed for any partial-month subscription period.\nOur annual subscriptions are paid for by an upfront one-off payment with automatic annual renewals respectively. You acknowledge and agree that Astraline LLC is authorized to charge the Payment Method used for the initial annual subscription fee at the rate secured at the time of purchase. This includes discounted rates secured with a promotional offer. You must cancel your subscription before it renews in order to avoid billing of the renewal subscription fee to the Payment Method you provided. Refunds cannot be claimed for any partial subscription period.\nYou are responsible for all applicable fees and charges incurred, including applicable taxes, and all subscriptions purchased by you. You agree to promptly notify Astraline LLC of any changes to the Payment Method you provided while any subscriptions remain outstanding Astraline LLc uses a third-party payment processor (the “Payment Processor”) to link your credit card account to the Service. In connection with your use of the Service, Astraline LLC. will obtain certain transaction details, which Astraline LLC will use solely in accordance with its Privacy Policy. The processing of payments or credits, as applicable, in connection with your use of the Service will be subject to the terms, conditions and privacy policies of the Payment Processor and your credit card issuer in addition to these Terms. Astraline LLC is not responsible for any errors by the Payment Processor. Our obligation to provide a Subscription Service only comes into being when we take receipt of your order. You agree not to hold us responsible for banking charges incurred due to payments on your account. If payment is not received by us from the Payment Method you provided, you agree to pay all amounts due upon demand by us. You agree that you are not permitted to resell any parts of the Service for commercial purposes.\nwithout notice. A breach of these Terms includes without limitation, the unauthorized copying or download of our audio or video content from the Website or the Apps.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nPromotional Items\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'Any free trial or other promotion that provides access to a Subscription Service must be used within the specified time of the trial. You must stop using a Subscription Service before the end of the trial period in order to avoid being charged for that Subscription Service. If you cancel prior to the end of the trial period and are inadvertently charged for a Subscription Service, please contact us at ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: 'kevin@astralineapp.com',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).blue,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      '. Any promotion code or offer provided by us may not be used in conjunction with any other promotion code or offer, past or present. Introductory offers are only available to new users of the Service, except where expressly stated otherwise. Previous users or trial users of the Service do not qualify as a new user.\nUnless otherwise specified, trial offers are one-time only for new members and are limited to one per household. Additional terms and limitations may apply to trial offers and promotions and will be more fully explained at the time you sign up. Any such additional terms and limitations are deemed part of this Agreement.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nUsage License\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'Subject to the terms and conditions of these terms, Astraline LLC grants you a personal, non-exclusive, non-assignable, non-transferable, revocable license to access and use the Service, including a reasonable number of copies of any content, material or software made available by Astraline LLC, for noncommercial and personal use only.\nYou must comply with all applicable laws when using the Service. Except as may be expressly permitted by applicable law or expressly enabled by a feature of the Service, you will not, and will not permit anyone else to:; (1) compile or collect any content available on the Service as part of a database or other work; (2) store, copy, modify, or distribute any of the content made available on the Service; (3) frame or otherwise incorporate the Service or any portion of the Service as part of another website or service; (4) use any automated tool (e.g., robots, spiders) or manual process to monitor, store, copy, modify, distribute, or resell any content from the Service (5) reproduce, duplicate, copy, sell, resell, or exploit for any commercial purposes any portion of the Service (including the display of third party advertising); ; (6) use the Service in a manner that threatens the integrity, performance, or availability of the Service (7) circumvent or disable any digital rights management, usage rules, or other security features of the Service, or any content available on the Service;',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nCopyright Infringement\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'Astraline LLC respects the intellectual property rights of others and asks you to do the same. It is Astraline LLC’s policy to terminate the access privileges of those who repeatedly infringe the copyright of others. If you believe that your work has been posted on the Service in a way that constitutes copyright infringement, please contact Astraline LLC and provide the following information: (1) an electronic or physical signature of the person authorized to act on behalf of the owner of an exclusive right that is allegedly infringed; (2) a description of the copyright-protected work that you claim has been infringed; (3) your address, telephone number, and email address; (4) the location on the Service of the material that you claim is infringing; (4) a statement by you, made under penalty of perjury, that the information in your notice is accurate and that you are the copyright owner or authorized to act on the copyright owner’s behalf. (5) a statement by you regarding your good faith belief that the disputed use is not authorized by the copyright owner, its agent, or the law; and by submitting a copyright infringement notice, you acknowledge and agree that Astraline LLC or its copyright agent may forward the information you provide in this notice to the person who uploaded the allegedly infringing material.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nService Modification Access\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'Astraline LLC does not provide you with the equipment to use the Service. You are responsible for all fees charged by third parties to access and use the Service (e.g., charges by ISPs or mobile carriers). Astraline LLC will not be liable to you or to any third party for any modification, suspension, or discontinuance of the Service. Astraline LLC reserves the right to modify or discontinue, temporarily or permanently, all or a part of the Service without notice.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nWaver of Support\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'Unless otherwise agreed by Astraline LLC in writing, Astraline LLC is not obligated to provide any support for the Service.',
                                  style: TextStyle(),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    fontSize: 16.0,
                                  ),
                            ),
                          ),
                          RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: const [
                                TextSpan(
                                  text: '\n\nFeedback\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'If you provide feedback to Astraline LLC regarding the Service (“Feedback”), you acknowledge that the Feedback is not confidential, and you authorize Astraline LLC to use that Feedback without restriction and without payment to you. Accordingly, you hereby grant to Astraline LLC a nonexclusive, royalty-free, fully paid, perpetual, irrevocable, transferable, and fully sublicensable right to use the Feedback in any manner and for any purpose.',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: '\n\nChanges to Terms\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'We reserve the right to modify these Terms from time to time.. It is your responsibility to review these Terms regularly. Use of the Service after the effective date of a modification constitutes your acceptance of any modified Terms.',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: '\n\nTermination\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'You may terminate your use of the Service at any time by terminating your account and deleting any Astraline LLC software from your device or personal computer. Astraline LLC may suspend or terminate your access to the Service at any time, for any reason. Termination of your account is your sole right and remedy with respect to any dispute with Astraline LLC regarding the Service or these Terms. Your rights under these Terms will terminate automatically if you fail to comply with any of these Terms. If Astraline LLC suspects that you have violated any provision of these Terms, Astraline LLC may also seek any other available legal remedy. Your rights under these Terms will terminate automatically if you fail to comply with any of these Terms. Upon termination, you must destroy or delete any copy of Astraline LLC software in your possession. Neither Astraline LLC nor any of its licensors, suppliers, or publishers are liable to you or to any third party for any loss caused by any termination of the Service or termination of your access to the Service. You remain solely liable for all obligations related to use of the Service, even after you have stopped using the Service. Neither Astraline LLC nor any of its licensors, suppliers, or publishers are liable to you or to any third party for any loss caused by any termination of the Service or termination of your access to the Service.',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: '\n\nThird-Party Content\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'We may email or provide you coupons, offers, and other specials from third parties (collectively “Promotions”). All Promotions featured as a part of the Service are subject to change without notice and we have no control over their legality or the ability of any merchant to complete the Promotion (including the sale in accordance with the offer). Astraline LLC is not responsible for the redemption, errors, omissions, or expiration of Promotions. Additionally, if you follow a link or otherwise navigate away from the Service, please be aware that these Terms will no longer govern. The Service may contain links to Web pages and content of third parties (“Third-Party Content”) as a service to those interested in this information. We do not monitor, endorse, or adopt, or have any control over, any Third-Party Content. We undertake no responsibility to update or review any Third-Party Content and can make no guarantee as to its accuracy or completeness. The Service may contain advertisements and promotions from third parties. Your business dealings or correspondence with, or participation in promotions of, advertisers other than us, and any terms, conditions, warranties, or representations associated with such dealings, are solely between you and such third party. You should review the applicable terms and policies, including privacy and data gathering practices, of any Third-Party Content provider to which you navigate from the Service. You access and use Third-Party Content at your own risk.',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: '\n\nHealth Disclaimer and Warning\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Astraline LLC offers fitness, health and wellbeing information designed for education purposes only. You should not rely on the information in any Application made by Astraline LLC (including but not limited to desktop, mobile, and device Applications, website, blogs, and any social media pages maintained by Astraline LLC or Down Dog) as a substitute for professional medical advice, diagnosis, or treatment. The use of any information provided on this, or any other Application made by Astraline LLC is solely at your own risk. We are not a health care provider, and our applications should not be considered medical advice. We do not in any way guarantee or warrant the accuracy, completeness, or usefulness of any content found in any Application. Do not use any Application while driving, operating heavy machinery, or engaging in another activity that requires concentration. Engaging in any fitness, health or wellbeing activity, including but not limited to the practice of yoga or any other form of mental or physical exercise, carries risk of injury. We assume no responsibility for injuries suffered while practicing these techniques and Astraline LLC shall not be held liable for any damages, circumstances, conditions or injuries that may occur, directly or indirectly, from engaging in any activities or ideas presented in any Application made by Astraline LLC. We do not recommend engaging in any health or fitness activity without appropriate supervision if you are pregnant or under 18 years of age. Consult with your physician or health care provider before starting any fitness, health or wellbeing program, or if you have any questions or concerns about your physical or mental health By using any Application, you accept all responsibility for your physical and mental health and any resultant injury or mishap that may affect your well-being or health and/or your baby’s well-being or health in any way. If you experience anxiety, depression, or the worsening of any psychological condition while using any of our applications, you should stop immediately and seek medical attention. Do not start a fitness, health or wellbeing program if your physician or healthcare provider advises against it. If you experience faintness, dizziness, pain or shortness of breath at any time while exercising or using any of our applications, you should stop immediately and seek immediate medical attention.',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: '\n\nWarranties Disclaimer\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Your use of the service is at your sole risk. the service is provided on an “as is” and “as available” basis. Astraline llc, its affiliates, licensors, suppliers, and distributors expressly disclaim all warranties of any kind, whether express or implied, including, but not limited to the implied warranties of merchantability, fitness for a particular purpose, title, and non-infringement. astraline llc does not warrant uninterrupted use or operation of the service or that any data sent by or to you will be accurate, complete, transmitted in uncorrupted form, or transmitted within a reasonable amount of time. you will be solely responsible for any delay or loss of any kind that results from your access or use of the service, including loss of any loss or harm to your mobile device. No advice or information, whether oral or written, obtained by you from Astraline LLC, through or from the service, will create any warranty not expressly stated in these terms. some states may prohibit a disclaimer of warranties and you may have other rights that vary from state to state.',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: '\n\nIndemnity\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'You will defend, indemnify and hold Astraline LLC, its affiliates, directors, officers, agents, employees, and its licensors, suppliers, and Distributors harmless from any costs, damages, expenses, and liability caused by your use of the Service, your violation of these Terms, or your violation of any rights of a third party through use of the Service.',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: '\n\nAssignment\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'These Terms, and any rights or licenses granted under these Terms, may not be transferred or assigned by you, but may be assigned by Astraline LLC without restriction. Any assignment attempted in violation of these Terms is void.',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: '\n\nGoverning Law; Venue\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'You agree that any judicial proceedings will be brought in and you hereby consent to the exclusive jurisdiction and venue in the state and federal courts in Phoenix, Arizona. These Terms will be governed by and construed in accordance with the laws of the State of Arizona, excluding its conflict of law provisions.',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: '\n\nClaims\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'You agree that any cause of action arising out of or related to the service must commence within one year after the cause of action accrues. otherwise, that cause of action is permanently barred.',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text:
                                      '\n\nWaiver and Severability of Terms\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Any waiver of any provision of these Terms will be effective only if in writing and signed by Astraline LLC. The failure of Astraline LLC to exercise or enforce any right or provision of these Terms will not constitute a waiver of such right or provision. . If any provision of these Terms is found by a court of competent jurisdiction to be invalid, the parties nevertheless agree that the court should endeavor to give effect to the parties’ intentions as reflected in the provision, and the other provisions of these Terms remain in full force and effect.',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: '\n\nFull Agreement\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'These Terms are the full agreement between you and Astraline LLC regarding your use of the Service.',
                                  style: TextStyle(),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    fontSize: 16.0,
                                  ),
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
        ),
      ),
    );
  }
}
