import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'privacypolicy_model.dart';
export 'privacypolicy_model.dart';

class PrivacypolicyWidget extends StatefulWidget {
  const PrivacypolicyWidget({super.key});

  @override
  State<PrivacypolicyWidget> createState() => _PrivacypolicyWidgetState();
}

class _PrivacypolicyWidgetState extends State<PrivacypolicyWidget> {
  late PrivacypolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacypolicyModel());

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
                            'Privacy Policy',
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text:
                                      'This Privacy Policy describes how Astraline LLC (collectively, “Astraline LLC”, “we”, “our”, or “us”) collects, uses, and shares information about you (“you”, “your”, or “user”) when you use our website with a homepage located at “astralineapp.com”, any applications we may provide (including mobile applications), together with all products and services we may offer from time to time via our website and/or related applications, our related social media websites such as Instagram, Twitter, Facebook, or otherwise through your interactions with us (our website, applications, products, services, and social media pages, collectively, the “Services”). This Privacy Policy also describes your and our legal rights and responsibilities with respect to information which we collect from or about you through the methods described below (see “Information We Collect” and “How We Use Your Information”), including without limitation information which identifies you or which could be used to identify you such as your name and contact details, or your user account information, which we call “Personal Information” in the text below. “Personal Information” also may include information about how you use our website, applications, and social media websites (collectively, our “Website”). Astraline LLC takes very seriously its responsibility to protect the safety and security of your Personal Information that we process and is committed to respecting your privacy rights.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text:
                                      '\n\nApplicability of Astraline LLC\' Privacy Policy\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'We will refer to access, use, transmission, and exchanges of information, availability or utilization of features, functions or activities, simply as “use” in the material below. This Privacy Policy applies to Personal Information that we use to provide the Services. This Privacy Policy applies regardless of the means used to access or provide the Services. This Privacy Policy also applies to our targeted content, including online offers and advertisements for products and services, which you may see on third party websites, platforms and applications (“Offer Sites”) based on your online activity. These Offer Sites may have their own privacy policies and terms and conditions. We encourage you to read them before using those Offer Sites. This Privacy Policy does not apply to information from or about you collected by third parties and not shared with Astraline LLC, such as Astraline LLC service providers and social media pages. The collection and use of your information by such third parties is governed by the relevant third party’s privacy policies, statements, and practices and under no circumstances are we responsible or liable for any third party’s compliance therewith. This Privacy Policy does not apply to websites that link to Astraline LLC Website or websites that may be accessed through the Services. We may provide links to other websites that contain information that we believe may be useful to you or that you will find valuable. However, we have not investigated the security of those linked websites and you should not assume those sites have a privacy policy equivalent to ours. If you access such a third party website through a link we provide, you will be subject to the privacy policy of the new site. ASTRALINE LLCis not responsible for the contents of any linked webpages referenced from our Website. If you have any questions regarding the privacy, security, or content of those sites, you should contact the appropriate contact(s) at those websites directly.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nAcceptance of Privacy Policy\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'By using ASTRALINE LLC Services, including our Website, you signify your acceptance of this Privacy Policy. If you do not agree to the terms of this Privacy Policy, please do not use ASTRALINE LLC Services. Your continued use of ASTRALINE LLC Services following the posting of changes to this Privacy Policy will mean that you accept those changes.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nAge of Consent\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'By accessing ASTRALINE LLC Services, you represent that you are at least the age of majority in your state or province of residence, or that you are the age of majority in your state or province of residence and you have given us your consent to allow any of your minor dependents to use the Services.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nInformation We Collect\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      '1. Information That You Provide: We collect information that you provide directly to us. For example, we collect information when you use our website, call us on the phone, create an online account, sign up to receive our emails, participate in a giveaway sweepstakes, contest, promotion or survey, request customer support, apply for a job or otherwise communicate with us. We also may collect information when you communicate with us via third party social media sites such as Facebook or Instagram (e.g. to create an account) or when you use sites and services that allow you to share information (e.g., via plugins, widgets or other tools), but always in accordance with the authorization procedures and privacy settings you establish with such services. Providing your Personal Information to us is voluntary, however, if you do not provide some or all of the information we request, we may not be able to provide you with certain products, services or information.\n\n. The types of information you may provide directly to us include, but are not limited to your name, shipping address, billing address, zip or postal code, telephone number, email address, birth date, credit card or payment information, product and communication preferences, family members, demographic information, or any other information that could be used to contact you or any other information that you may choose to disclose to ASTRALINE LLC, such as providing a profile photo or interest in prenatal classes.\n\n. In some cases, we may also collect information you provide about others, such as if you purchase a gift card for someone and request that we deliver it electronically, create and share a “wishlist” or decide to purchase and ship products to someone. We will use this information to fulfill your requests and will not send marketing communications to your contacts unless they separately opt in to receive communications from us. Additionally, we may collect employment or education information when indirectly provided via the use of a redemption code.\n\n2. Information We Collect Automatically: In order to improve the overall quality of your online experience, ASTRALINE LLC, its partners, and/or vendors automatically collect certain information about you when you access or use our website or Offer Sites, interact with our emails or online advertisements, or when you transact business with us. Information we automatically collect includes:\n\n. Log File Information: We collect information about your use of our website, such as the type of browser you use, access date/times, pages viewed, your Internet Protocol (“IP”) address and the referring link through which you accessed our websites. An IP address is a number that automatically identifies the computer or device you use to access the Internet. The IP address enables our server to send you the web pages that you want to visit, and it may disclose the server owned by your Internet Service Provider. We track and aggregate certain information about the visits to our website to analyze trends and statistics such as general traffic flow and feature usage related to ASTRALINE LLC website and app. We compile traffic-based statistics that show the numbers and frequency of visitors to our website, its individual pages, and our app. This data is collected and stored as an aggregated statistical report that we use internally to better understand our website traffic, manage our website, and help diagnose any problems. ASTRALINE LLC may make such aggregated data available to others as part of its business; however, we will not identify you when providing such information or make it possible to identify you by others in providing this information.\n\n. Cookies: Our website, online advertisements, and emails use first and third-party “cookies”, pixel tags, and other technologies to automatically collect information about you such as browser type, pages viewed, links clicked, and other actions you take in connection with our websites, online advertisements, and email. A cookie is data sent to your Internet browser from a Web server and stored directly on your computer hard drive. Cookies and similar technologies within a web browser allow us to collect and store data as you navigate our website. We use this information for various purposes, including to facilitate web page navigation, display information more effectively, personalize your online experience, to understand how our websites are used by users, market our products and services, measure the success of our marketing campaigns, and for security purposes.\n\n-Most web browsers are set up to accept cookies. You can adjust your browser settings to refuse all cookies or to inform you when a cookie is being placed on your hard drive. However, certain features of ASTRALINE LLC website may not work properly and you may be required to re-enter certain information each time you use our website.\n\n-Where we use Google Analytics, we have set up the service to anonymize your IP address as soon as data is received by the Analytics Collection Network, before any storage or processing takes place. To opt out of being tracked by Google Analytics across all websites please visit ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text:
                                      'http://tools.google.com/dlpage/gaoptout',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).blue,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      '\n\n3. Transaction Information: When you purchase or return a product or subscription, we collect information about the transaction, such as product details and the date and location of the purchase/return.\n\n4. Mobile Information: When you access our website from a mobile or smartphone device, we may receive information about your general location and your mobile device, such as unique device identifiers.\n\n5. Information From Third Party Sources: We also receive information about you from other sources, including service providers such as Google, and through your interactions with us on social media websites, and we add it to the information we associate with your account.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text:
                                      '\n\nSecurity of Transmission of Personal Information\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'Unfortunately, the transmission of information via the Internet or e-mail is not completely secure. Although we will do our best to protect Personal Information that you submit to us, we cannot guarantee the security of your data transmitted to our site; any transmission is at your own risk. Once we have received your information, we will use commercially reasonable procedures and security features to try to prevent unauthorized access.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nHow We Use Your Information\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'We may use your Personal Information to provide products and services and to support our business functions. For example, we may use this information for the following purposes:\nProvide, Improve, and Develop the ASTRALINE LLC Website and App.\n\nProvide the Services to you\n\nProcess and fulfill your order, including by shipping products to you, or others you designate, and sending emails to you, or others you designate, to confirm your order status and shipment and to process merchandise returns\n\nProvide customer service\n\nOperate, protect, improve, and optimize the ASTRALINE LLC Website and the user experience, such as by performing analytics and conducting research\n\nCommunicate with you and to send you information by email, postal mail, telephone, text message, or other means about our products, services, contests, support messages, updates, security alerts, and account notifications\n\nCommunicate with other persons using contact information you provide, such as when you designate another person as the recipient of a gift purchase\n\nMake your membership experience easier, more personalized, more enjoyable and more efficient\n\nAddress problems with and improve our products, brands, services and technologies, as well as to develop new products and services\n\nAllow you to use our online technologies\n\nProvide consistent, personalized services\n\nOrganize local community events, promotions and in-store experiences\n\nFacilitate your ability to share information to social media\n\nAdminister and fulfill our contests and other promotions\n\nHelp us learn more about your personal preferences or product preferences, including through the use of UTMs\n\nFulfill a contract we have with you\n\nOperate, protect, improve, and optimize the ASTRALINE LLC Website and experience, and personalize and customize your experience (such as making automatically entering your saved shipping information), we conduct profiling based on your interactions with the ASTRALINE LLC Website, your search and booking history, your profile information and preferences, and other content you submit to the ASTRALINE LLC Website. We process this information given our legitimate interest in improving the ASTRALINE LLC Website and our user’s experience with it, and where it is necessary for the adequate performance of the contract with you.\n\nCreate and Maintain a Trusted and Safer Environment.\n\nPrevent, detect, mitigate and investigate fraud, security breaches and activities that are or potentially may be prohibited or illegal\n\nConduct security investigations and risk assessments\n\nVerify or authenticate information\n\nAs we believe to be required or appropriate to protect the rights, property, safety and security of ASTRALINE LLC and our employees, customers and others\n\nAs we believe to be required or appropriate under applicable law, to respond to requests from government authorities and to comply with legal process, investigations, regulatory or governmental enquiries or for other legal or regulatory purposes\n\nResolve any disputes with any of our users or subscribers and enforce our agreements with third parties Comply with our legal obligations\n\nEnforce our Terms of Use or other policies\n\nWe process this information given our legitimate interest in protecting the ASTRALINE LLC Website, to measure the adequate performance of our contract with you, and to comply with applicable laws.\nProvide, Personalize, Measure, and Improve our Advertising and Marketing.\n\nSocial media advertising through social media platforms such as Facebook, Instagram, or Google).\n\nPersonalize, measure, and improve our advertising.\n\nAdminister referral programs, rewards, surveys, sweepstakes, contests, or other promotional activities or events sponsored or managed by ASTRALINE LLC or its third party partners.\n\nSend you promotional messages, marketing, advertising and other information that we think may be of interest to you depending on your subscription status and email engagement.\n\nWe will process your Personal Information for the purposes listed in this section given our legitimate interest in undertaking marketing activities to offer you products or services that may be of your interest. You can opt-out of receiving marketing communications from us by following the unsubscribe instructions included in our marketing communications or changing your notification settings within your ASTRALINE LLC Account. We also make efforts to exclude current subscribers from targeted advertisements, including, for example, across Meta platforms.\nOther Purposes\n\nWhen you consent to it\n\nWhen it is necessary to protect your vital interests or that of another person\n\nWhen it is necessary for the performance of a task requested by you or carried out in the public interest\n\nWhen it is in our legitimate interests. Legitimate interests are our business or commercial reasons for using your data, such as (i) keeping our records up to date (ii) providing the Services to you; (iii) maintaining or administering the Services (iv) performing business analyses or for other internal purposes to improve the quality of our business and the Services we offer; (v) prevention of fraud and financial crime to protect the public; (vi) communicating with you concerning programs or services consistent with our obligations to provide those services or otherwise; and (vii) participating in litigation, investigations, regulatory or governmental enquiries or for other legal or regulatory purposes involving our customers who use or have used our Services or other third parties. We will not unfairly place our legitimate interests above what is best for you.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nHow We Share Your Information\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'We share your Personal Information with, or obtain data from, third parties in the following ways:\n\nBy You. You may disclose Personal Information when you post, link or tag digital content to our website, third party websites, or other public forums, such as ASTRALINE LLC social media pages, blogs, and online product reviews. Any information that you disclose through these services will become public.\n\nThird Party Service Providers. We share your information with third party service providers who we work with or who manage our customer information and perform services on our behalf, such as hosting our e-commerce platform, fulfilling promotions, processing online payments, providing and maintaining website features, sending communications and products to our customers, and conducting surveys. Our third party service providers are only authorized to collect, use, and disclose your information to the extent necessary to allow the third party service providers to perform the services they provide to us. Certain third-party service providers have their own terms of use and privacy policies with respect to the information we are required to share with them in order to provide us with their services. For these third party service providers, we recommend that you read their privacy policies so you can understand the manner in which your personal information will be handled by these providers. Some of our partners are SalesForce, Heap, NewRelic, Google Analytics, Sentry, Firebase Crashlytics, Facebook, Pepperjam, and Amazon.\n\nThird Parties. We may share your information when we team up with another company to offer or provide products, services, contests, or promotions to our customers.\n\nSocial Sharing. Your Personal Information may be disclosed in connection with your social sharing activity, such as if you log into your customer account from your social media account. By connecting your customer account and your social media account, you authorize us to share information with your social media account provider, and you understand that the use of the information we share will be governed by the social media site’s privacy policy.\n\nLegal Requirements. We may share information about you if necessary or appropriate to comply with laws or regulations or in response to a valid subpoena, court order, legal processes, or government request, or to protect the operations, privacy, safety, property or rights of Color Image Apparel, Inc or others, or when we believe it is necessary to share such information in order to investigate, prevent, or take action regarding illegal activities, suspected fraud, situations involving potential threats to the physical safety of any person, or as otherwise required by law or to protect the public.\n\nBusiness Transfer. In the event of a sale or merger of Color Image Apparel, Inc. or any of our businesses, our customers’ Personal Information and other information we have collected as described in this policy may be among the transferred business assets.\n\nOther Disclosures. We may share your Personal Information with our legal, regulatory, audit, and other professional advisors. Those companies may use your Personal Information to assist us in our operations consistent with our legitimate business interests. We also may share information about you as described at the point of collection or otherwise pursuant to your consent or where ASTRALINE LLC has a legitimate interest in doing so.\n\nThese third parties do not have any independent right to share your Personal Information. We will exercise reasonable measures to have the third parties to whom we disclose your Personal Information respect your Personal Information and comply with applicable data protection laws.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nHow We Keep Your Information\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'We will store your Personal Information for as long as is necessary to achieve the purposes for which it was collected, whether that is to provide services to you, for our own legitimate interests (described above), or so that we can comply with the law. We reserve the right to retain it to the full extent not prohibited by law. We may delete Personal Information in our discretion, so you should retain your own records, and not rely upon our storage of any Personal Information, content, or other data.\nWe will review the information we hold and when there no longer is a user, legal, or business need for us to hold it, we will either delete it securely or in some cases irreversibly anonymize it. When we delete any information, it will be deleted from our active databases but may remain in our archives.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text:
                                      '\n\nHow We Protect Your Personal Information\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'To prevent unauthorized access, maintain data accuracy, and facilitate the correct use of Personal Information obtained through our website, we have put in place appropriate physical, technical, and operational measures to safeguard and secure the Personal Information we collect online against unauthorized access, unlawful use, accidental loss, corruption, or destruction.\nWe also use operational measures to protect your Personal Information, for example by limiting the number of people who have access to your membership information. Access to Personal Information is restricted to ASTRALINE LLC staff members and third party service providers who require the access for specific purposes, such as helping us provide the Services to you.\nWe use technical measures such as password protection to protect your data and the systems where they are stored. However, messages you send to us through the Internet or otherwise electronically may not be secure. We recommend that you do not send any confidential information to us by email. If you choose to send confidential information to us, you accept the risk that a third party may intercept this information. We make reasonable efforts to keep your information safe and secure while shopping. We protect your online order and Personal Information by using Secure Sockets Layer (SSL) technology. Generally, the data that travels between your computer and our servers is SSL encrypted, and then stored on a computer that is not connected to the Web. To make sure you are accessing a secure server, look at the lower left or right hand corner of your browser window after accessing the server. An un-broken key or closed lock (depending on your browser) indicates that SSL is active in your window. Some versions of browsers and firewalls don’t permit communication through secure servers. In that case, you’ll be unable to connect to the server so you won’t have to worry about mistakenly placing an order through an unsecured connection.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text:
                                      '\n\nLocation of Your Personal Information / Your Particular Consent\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'We may disclose Personal Information to third-party service providers (e.g., value-added resellers, payment processors, data storage and processing facility vendors) that assist us in our work. We limit the Personal Information provided to these service providers to that which is reasonably necessary for them to perform their functions, and we require them to agree to maintain the confidentiality of such Personal Information.\nConsent to International Transfer and Disclosure of Personal Information: ASTRALINE LLC is located in the United States (“U.S.”) and is subject to the applicable laws of the United States (where data privacy laws are less stringent than in the European Union and certain other jurisdictions). We will store and process information we receive about you, as described in this Privacy Policy, in the U.S.\nWe are involved in business activities in a variety of countries. You agree that ASTRALINE LLC and those with whom we share your Personal Information (“Recipients”) may disclose, transfer, process, and store your Personal Information outside of your country of origin to our affiliates, sponsors and partners, and any other third party service providers for the purposes described in this Privacy Policy.\nSome of the recipients of Personal Information as specified above may be located in countries that do not provide a level of data protection equivalent to that set forth by the European Union and some other jurisdictions. If you submit any Personal Information or choose to access or use the Services offered by ASTRALINE LLC such as our website, you consent to such disclosure, transfer, process, and storage of information in accordance with this Privacy Notice and subject to such applicable laws which may include access by law enforcement and other government entities including courts and tribunals. If we do transfer Personal Information outside the U.S., we will make sure that it is protected in the same way as if it were being used in the U.S. We will use one of the following legally recognized safeguards to protect your information:\n\nTransfer the data to a non-EEA country that has privacy laws at least as protective as those within the EEA, or\n\nPut in place a contract with the recipient of the data, which means the recipient must protect the data to the same standards as required within the EEA, or\n\nTransfer it to organizations that are part of the Privacy Shield. The Privacy Shield is a framework that sets out the standards for data to be sent between the United States and European countries. The Privacy Shield ensures that data are protected to the same standards as used within the EEA.\n\nConsent to Electronic Notice If There is a Security Breach: We will take reasonable measures to safeguard your Personal Information and prevent such information from unauthorized access, disclosure, or use. However, there can never be a guarantee of data security. If we or a Recipient is required to provide notice of unauthorized access to or other invasion of certain security systems, you agree that we (or they) may do so when required (or voluntarily) by posting notice on our website or sending notice to any email address we have for you, in our (or their) good faith discretion. You agree that notice to you will count as notice to others for whom you are acting, and agree to pass the notice on to them.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nChildren\'s Privacy\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'We do not knowingly collect personally identifiable information from anyone under the age of 13. If you are a parent or guardian and you are aware that your child has provided us with Personal Information, please contact us. If we become aware that we have collected Personal Information from children without verifiable parental consent, we will take steps to remove that information from our servers.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text: '\n\nYour Opt-Out Choices\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'We also work with third parties such as Google and Facebook to manage our advertising on other websites. Our third party advertising partners may use cookies or similar technologies on our website and other websites to provide you advertising based upon your browsing activities and interests, or to display ads that link back to our site. For more information about how targeted advertising works, you can visit the Network Advertising Initiative’s educational page. You can opt-out of some, but not all, online behavioral based advertising by clicking here or by using your browser settings to block cookies or notify you when a cookie is set. If you are in the European Union, click here to opt out of online behavioral based advertising.\nIf you do not want ASTRALINE LLC to send you email or postal mail regarding ASTRALINE LLC or its Services, you can choose not to provide your Personal Information to ASTRALINE LLC, even though it might be necessary to make a purchase or to take advantage of certain features on our Services. You may also manage, update and correct the information you provide as part of your online account by logging into your user account and clicking on the “Settings” hyperlink. If you choose not to give us certain Personal Information, you can still use many aspects of our website. However, you will not be able to access website areas that require account registration.\nIf you have previously opted-in to receiving marketing emails from us, you can update your preferences to tell us specifically what you are interested in hearing about by clicking on the preferences link included in the marketing e-mails. You can update your preferences at any time.\nIf you would prefer not to receive marketing emails sent by ASTRALINE LLC, simply click on the “unsubscribe” link included at the bottom of any of those emails. If you opt out of receiving marketing emails, we may still send you other types of messages, such as purchase receipts, information about shipments, or emails about your user account.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text:
                                      '\n\nYour Rights Over Your Personal Information EU Privacy Rights\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'If you are a European Union resident, in accordance with ASTRALINE LLCs policies and procedures you have the right to review, verify, correct, and request erasure of the Personal Information that we hold about you under certain circumstances. You also have the right to limit, restrict, or object to the processing of your Personal Information under certain circumstances. You may also have the right to request that we transfer your Personal Information to another party to the extent provided for under applicable data privacy laws. For more information on your rights, please see ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text:
                                      'https://ec.europa.eu/info/law/law-topic/data-protection/reform/rights-citizens_en',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).blue,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      '\nIf you want to review, verify, correct, or request erasure of your Personal Information; limit, restrict, or object to the processing of your Personal Information; or request a transfer of your Personal Information to another party, please contact us at ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: 'mailto:KEVIN@ASTRALINEAPP.COM',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).blue,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      '\n\nTo protect your privacy and security, we also will take reasonable steps to verify your identity before granting access, making corrections, or following such a request to correct or delete your data.\nWhen you contact us, we will respond as soon as possible and where possible within one month. If your request is more complicated, it may take longer to respond to you, but we will respond within three months of your request. There is no charge for most requests, but if you ask us to provide a significant amount of data, for example, we may ask you to pay a reasonable administrative fee. We also may ask you to verify your identity before we provide any information to you.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text:
                                      '\n\nSupplemental Notice for Nevada Residents\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'If you are a resident of Nevada, you have the right to opt-out of the sale of certain Personal Information to third parties who intend to license or sell that Personal Information. You can exercise this right by contacting us At',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: 'KEVIN@astralineapp.com',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).blue,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      ' with the subject line “Nevada Do Not Sell Request” and providing us with your name and the email address associated with your account. Please note that we do not currently sell your Personal Information as sales are defined in Nevada Revised Statutes Chapter 603A. If you have any questions, please contact us as set forth below.',
                                  style: TextStyle(),
                                ),
                                const TextSpan(
                                  text:
                                      '\n\nYour California Privacy Rights\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'The following section pertains to the rights of individuals or households in California (“California consumers”).Civil Code Section 1798.83: Under certain circumstances, California Civil Code Section 1798.83 states that, upon receipt of a request by a California consumer, a business may be required to provide detailed information regarding how that business has shared that customer’s Personal Information with third parties for direct marking purposes. California residents who would like to make such a request may submit a request to the contact information provide below. The request should attest to the fact that the requester is a California resident, and provide a current California address. We are only required to respond to a customer request once during any calendar year. Please be aware that not all information sharing is covered by California’s “Shine the Light” law and only information sharing that is covered will be included in our response.\nRights under the CCPA: As of January 1, 2020, the CCPA (California Civil Code Section 1798.100 et seq.) provided California consumers with additional rights regarding Personal Information. The categories of Personal Information we collect are generally described above but differ for individual consumers depending on the Services used by such consumers.\nUnder the CCPA, qualifying California consumers may have the following rights:\n\nRight to Know. You have the right to request that we disclose certain information to you about our collection and use of your personal data over the past 12 months. Once we receive your request and confirm your identity, we will disclose to you:\n\nThe categories of personal data we collected about you.\n\nThe categories of sources for the personal data we collected about you.\n\nOur business or commercial purpose for collecting or selling that personal data.\n\nThe categories of third parties with whom we share that personal data.\n\nIf we sold or disclosed your personal data for a business purpose, two separate lists disclosing:\n\nsales, identifying the personal data categories that each category of recipient purchased; and\n\ndisclosures for a business purpose, identifying the personal data categories that each category of recipient obtained.\n\nThe specific pieces of personal data we collected about you (also called a data portability request).\n\nRight to Access. You have the right to confirm whether we are processing personal data about you and to access the personal data we hold about you. Once we receive your request and confirm your identity, we will provide to you a copy of your data as required under the applicable data protection laws. We may provide this data to you through your user account with us, or via email to the email address you have provided with your request.\n\nRight to Delete. Subject to certain exceptions, you have the right to request that we delete any of your personal data. Once we receive your request and confirm your identity, we will review your request to see if an exception allowing us to retain the information applies. We will delete or deidentify personal data not subject to one of these exceptions from our records and will direct our service providers to take similar action.\n\nRight to Correct. Subject to certain exceptions, you have the right to request that we correct inaccurate personal data that we have collected about you. Once we receive your request and confirm your identity, we will review your request, taking into account the nature of the personal information and the purposes of the processing of the personal information to see if we can correct the data. We may also request additional information showing that the information you want to correct is inaccurate.\n\nNon-Discrimination. We will not discriminate against you for exercising any of your data privacy rights.\n\nExercising Your Rights. To exercise your rights described above, please submit a request by either:\n\nEmailing us at ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: 'kevin@astralinapp.com',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).blue,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      '\n\nOnly you, or someone legally authorized to act on your behalf, may make a request to know or delete related to your personal data. You may also make a request to know or delete on behalf of your child.\nCertain data protection laws limit the ability to make a request to know to twice within a 12-month period, and allow us to charge a reasonable fee for responding to numerous requests from the same user. We cannot respond to your request or provide you with personal data if we cannot verify your identity or authority to make the request and confirm the personal data relates to you.\nYou do not need to create an account with us to submit a request to know or delete. However, we do consider requests made through your password protected account sufficiently verified when the request relates to personal data associated with that specific account.\nWe will only use personal data provided in the request to verify the requestor’s identity or authority to make it.\nFinancial Incentive Program. We may offer you certain financial incentives permitted by the applicable data protection law that can result in different prices, rates, or quality levels. Any financial incentive we offer will reasonably relate to your personal data’s value and contain written terms that describe the program’s material aspects. Participation in a financial incentive program requires your prior opt-in consent, which you may revoke at any time. We currently provide the following financial incentives:\nUnder certain circumstances, we will not provide such information, including where the disclosure creates a substantial, articulable and unreasonable risk to the security of that Personal Information, customers’ account with us, or the security of our systems or networks. We also will not disclose California consumers’ social security numbers, driver’s license numbers or other government-issued identification numbers, financial account numbers, any health insurance or medical identification numbers, or account passwords and security questions and answers.\nVerifying Requests: If we receive any request we will use a two-step process for online requests where the California consumer must first, clearly submit the request and then second, separately confirm the request. We will use other appropriate measures to verify requests received by mail or telephone.\nIn submitting a request, a California consumer must provide sufficient information to identify the consumer, such as name, e-mail address, home or work address, or other such information that is on record with us so that we can match such information to the Personal Information that we maintain. Do not provide social security numbers, driver’s license numbers, account numbers, credit or debit card numbers, medical information or health information with requests. If requests are unclear or submitted through means other than outline above, we will provide the California consumer with specific directions on how to submit the request or remedy any deficiencies. If we cannot verify the identity of the requestor, we may deny the request.\nCalifornia Do Not Track Disclosure: Do Not Track is a privacy preference that users can set in their web browsers. When a user turns on the Do Not Track signal, the browser sends a message to websites requesting them not to track the user. At this time, we do not respond to Do Not Track browser settings or signals. For information about Do Not Track, please visit: ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text:
                                      'https://astralineapp.com/privacy-policy/www.allaboutdnt.org',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).blue,
                                  ),
                                ),
                                const TextSpan(
                                  text: '\n\nComplaints\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'If you have any complaints concerning ASTRALINE LLC processing of your Personal Information, please email us at ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: 'kevin@astralineapp.com',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).blue,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      '\n\nPlease note that if you are an EU Resident, you may have the right to lodge a complaint with a European Union supervisory authority that is responsible for the protection of Personal Information in the country where you live or work, or in which you think a breach of data protection laws might have taken place. You can learn more about these rights at ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text:
                                      'https://ec.europa.eu/info/law/law-topic/data-protection/reform/rights-citizens_en',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).blue,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      '.\n\nCustomers in the United Kingdom can contact the Information Commissioner’s Office by telephone on 0303 123 1113, or by using the live chat service that is available through the Information Commissioner’s website ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text:
                                      'https://astralineapp.com/privacy-policy/www.ico.org.uk',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).blue,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      '\n\nChanges to This Privacy Policy\n\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      'ASTRALINE LLC may change this Privacy Policy from time to time to reflect our current practices. Any changes to this Privacy Policy will be posted on this website and will be effective when posted unless another date is referenced in the notice. We recommend you check the Privacy Policy on a regular basis so that you know the current terms and conditions that apply to you. If you use our website after any changes are effective, you are agreeing to comply with and be bound by them.',
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
