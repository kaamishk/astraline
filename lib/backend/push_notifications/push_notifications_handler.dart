import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 30.0,
            height: 30.0,
            child: SpinKitRipple(
              color: FlutterFlowTheme.of(context).midyellow,
              size: 30.0,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'splash': ParameterData.none(),
  'welcome': ParameterData.none(),
  'login': ParameterData.none(),
  'signup': (data) async => ParameterData(
        allParams: {
          'gSignIn': getParameter<bool>(data, 'gSignIn'),
        },
      ),
  'onboarding1': ParameterData.none(),
  'onboarding2': ParameterData.none(),
  'onboarding3': ParameterData.none(),
  'home': (data) async => ParameterData(
        allParams: {
          'gSignIn': getParameter<bool>(data, 'gSignIn'),
        },
      ),
  'yoga': ParameterData.none(),
  'PlanetRoutines': (data) async => ParameterData(
        allParams: {
          'doc': await getDocumentParameter<YogaRecord>(
              data, 'doc', YogaRecord.fromSnapshot),
        },
      ),
  'PoseDetails': (data) async => ParameterData(
        allParams: {
          'doc': await getDocumentParameter<PosesRecord>(
              data, 'doc', PosesRecord.fromSnapshot),
        },
      ),
  'PoseLibrary': ParameterData.none(),
  'transitreport': ParameterData.none(),
  'routine': (data) async => ParameterData(
        allParams: {
          'doc': await getDocumentParameter<YogaRoutineRecord>(
              data, 'doc', YogaRoutineRecord.fromSnapshot),
          'difficulty': getParameter<String>(data, 'difficulty'),
        },
      ),
  'profile': (data) async => ParameterData(
        allParams: {
          'status': getParameter<String>(data, 'status'),
        },
      ),
  'subscriptionplans': ParameterData.none(),
  'extrapage': ParameterData.none(),
  'paymentmethod': ParameterData.none(),
  'confirmsubscription': (data) async => ParameterData(
        allParams: {
          'doc': await getDocumentParameter<SubscriptionPlansRecord>(
              data, 'doc', SubscriptionPlansRecord.fromSnapshot),
          'duration': getParameter<String>(data, 'duration'),
        },
      ),
  'calendarview': ParameterData.none(),
  'transitreport2': (data) async => ParameterData(
        allParams: {
          'selDate': getParameter<String>(data, 'selDate'),
        },
      ),
  'settings': ParameterData.none(),
  'profileedit': ParameterData.none(),
  'passwordverification': ParameterData.none(),
  'changeemail': ParameterData.none(),
  'emailconfirmation': (data) async => ParameterData(
        allParams: {
          'newemail': getParameter<String>(data, 'newemail'),
        },
      ),
  'forgotpass1': ParameterData.none(),
  'forgotpass2': ParameterData.none(),
  'emailsentconfirmation': ParameterData.none(),
  'resetpassword': ParameterData.none(),
  'passwordresetsuccess': ParameterData.none(),
  'numberverification': ParameterData.none(),
  'otpverification': ParameterData.none(),
  'smssentconfirmation': ParameterData.none(),
  'deleteacc1': ParameterData.none(),
  'deleteacc2': ParameterData.none(),
  'deleteacc3': ParameterData.none(),
  'accdeleted': ParameterData.none(),
  'appsettings': ParameterData.none(),
  'notifictions': ParameterData.none(),
  'helpcenter': ParameterData.none(),
  'helpcenter2': (data) async => ParameterData(
        allParams: {
          'doc': await getDocumentParameter<HelpRecord>(
              data, 'doc', HelpRecord.fromSnapshot),
        },
      ),
  'privacynsecurity': ParameterData.none(),
  'changepassword': ParameterData.none(),
  'privacypolicy': ParameterData.none(),
  'termsncondictions': ParameterData.none(),
  'disableacc': ParameterData.none(),
  'diasbleacc2': ParameterData.none(),
  'diableacc3': ParameterData.none(),
  'deleteaccother': ParameterData.none(),
  'managesubs': ParameterData.none(),
  'upgradesubs': (data) async => ParameterData(
        allParams: {
          'doc': await getDocumentParameter<SubscriptionPlansRecord>(
              data, 'doc', SubscriptionPlansRecord.fromSnapshot),
        },
      ),
  'subsupdated': ParameterData.none(),
  'cancelsubs1': ParameterData.none(),
  'cancelsubs2': ParameterData.none(),
  'cancelsubs3': (data) async => ParameterData(
        allParams: {
          'reason': getParameter<String>(data, 'reason'),
        },
      ),
  'cancelsubs4': ParameterData.none(),
  'hushyari': ParameterData.none(),
  'test': ParameterData.none(),
  'testpage': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
