import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
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

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
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
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const HomeWidget() : const WelcomeWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const HomeWidget() : const WelcomeWidget(),
        ),
        FFRoute(
          name: 'splash',
          path: '/splash',
          builder: (context, params) => const SplashWidget(),
        ),
        FFRoute(
          name: 'welcome',
          path: '/welcome',
          builder: (context, params) => const WelcomeWidget(),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'signup',
          path: '/signup',
          builder: (context, params) => SignupWidget(
            gSignIn: params.getParam('gSignIn', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'onboarding1',
          path: '/onboarding1',
          builder: (context, params) => const Onboarding1Widget(),
        ),
        FFRoute(
          name: 'onboarding2',
          path: '/onboarding2',
          builder: (context, params) => const Onboarding2Widget(),
        ),
        FFRoute(
          name: 'onboarding3',
          path: '/onboarding3',
          builder: (context, params) => const Onboarding3Widget(),
        ),
        FFRoute(
          name: 'home',
          path: '/home',
          builder: (context, params) => HomeWidget(
            gSignIn: params.getParam('gSignIn', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'yoga',
          path: '/yoga',
          builder: (context, params) => const YogaWidget(),
        ),
        FFRoute(
          name: 'PlanetRoutines',
          path: '/planetRoutines',
          asyncParams: {
            'doc': getDoc(['yoga'], YogaRecord.fromSnapshot),
          },
          builder: (context, params) => PlanetRoutinesWidget(
            doc: params.getParam('doc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'PoseDetails',
          path: '/poseDetails',
          asyncParams: {
            'doc': getDoc(['poses'], PosesRecord.fromSnapshot),
          },
          builder: (context, params) => PoseDetailsWidget(
            doc: params.getParam('doc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'PoseLibrary',
          path: '/poseLibrary',
          builder: (context, params) => const PoseLibraryWidget(),
        ),
        FFRoute(
          name: 'transitreport',
          path: '/transitreport',
          builder: (context, params) => const TransitreportWidget(),
        ),
        FFRoute(
          name: 'routine',
          path: '/routine',
          asyncParams: {
            'doc': getDoc(['yogaRoutine'], YogaRoutineRecord.fromSnapshot),
          },
          builder: (context, params) => RoutineWidget(
            doc: params.getParam('doc', ParamType.Document),
            difficulty: params.getParam('difficulty', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, params) => ProfileWidget(
            status: params.getParam('status', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'subscriptionplans',
          path: '/subscriptionplans',
          builder: (context, params) => const SubscriptionplansWidget(),
        ),
        FFRoute(
          name: 'extrapage',
          path: '/extrapage',
          builder: (context, params) => const ExtrapageWidget(),
        ),
        FFRoute(
          name: 'paymentmethod',
          path: '/paymentmethod',
          builder: (context, params) => const PaymentmethodWidget(),
        ),
        FFRoute(
          name: 'confirmsubscription',
          path: '/confirmsubscription',
          asyncParams: {
            'doc': getDoc(
                ['subscriptionPlans'], SubscriptionPlansRecord.fromSnapshot),
          },
          builder: (context, params) => ConfirmsubscriptionWidget(
            doc: params.getParam('doc', ParamType.Document),
            duration: params.getParam('duration', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'calendarview',
          path: '/calendarview',
          builder: (context, params) => const CalendarviewWidget(),
        ),
        FFRoute(
          name: 'transitreport2',
          path: '/transitreport2',
          builder: (context, params) => Transitreport2Widget(
            selDate: params.getParam('selDate', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'settings',
          path: '/settings',
          builder: (context, params) => const SettingsWidget(),
        ),
        FFRoute(
          name: 'profileedit',
          path: '/profileedit',
          builder: (context, params) => const ProfileeditWidget(),
        ),
        FFRoute(
          name: 'passwordverification',
          path: '/passwordverification',
          builder: (context, params) => const PasswordverificationWidget(),
        ),
        FFRoute(
          name: 'changeemail',
          path: '/changeemail',
          builder: (context, params) => const ChangeemailWidget(),
        ),
        FFRoute(
          name: 'emailconfirmation',
          path: '/emailconfirmation',
          builder: (context, params) => EmailconfirmationWidget(
            newemail: params.getParam('newemail', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'forgotpass1',
          path: '/forgotpass1',
          builder: (context, params) => const Forgotpass1Widget(),
        ),
        FFRoute(
          name: 'forgotpass2',
          path: '/forgotpass2',
          builder: (context, params) => const Forgotpass2Widget(),
        ),
        FFRoute(
          name: 'emailsentconfirmation',
          path: '/emailsentconfirmation',
          builder: (context, params) => const EmailsentconfirmationWidget(),
        ),
        FFRoute(
          name: 'resetpassword',
          path: '/resetpassword',
          builder: (context, params) => const ResetpasswordWidget(),
        ),
        FFRoute(
          name: 'passwordresetsuccess',
          path: '/passwordresetsuccess',
          builder: (context, params) => const PasswordresetsuccessWidget(),
        ),
        FFRoute(
          name: 'numberverification',
          path: '/numberverification',
          builder: (context, params) => const NumberverificationWidget(),
        ),
        FFRoute(
          name: 'otpverification',
          path: '/otpverification',
          builder: (context, params) => const OtpverificationWidget(),
        ),
        FFRoute(
          name: 'smssentconfirmation',
          path: '/smssentconfirmation',
          builder: (context, params) => const SmssentconfirmationWidget(),
        ),
        FFRoute(
          name: 'deleteacc1',
          path: '/deleteacc1',
          builder: (context, params) => const Deleteacc1Widget(),
        ),
        FFRoute(
          name: 'deleteacc2',
          path: '/deleteacc2',
          builder: (context, params) => const Deleteacc2Widget(),
        ),
        FFRoute(
          name: 'deleteacc3',
          path: '/deleteacc3',
          builder: (context, params) => const Deleteacc3Widget(),
        ),
        FFRoute(
          name: 'accdeleted',
          path: '/accdeleted',
          builder: (context, params) => const AccdeletedWidget(),
        ),
        FFRoute(
          name: 'appsettings',
          path: '/appsettings',
          builder: (context, params) => const AppsettingsWidget(),
        ),
        FFRoute(
          name: 'notifictions',
          path: '/notifictions',
          builder: (context, params) => const NotifictionsWidget(),
        ),
        FFRoute(
          name: 'helpcenter',
          path: '/helpcenter',
          builder: (context, params) => const HelpcenterWidget(),
        ),
        FFRoute(
          name: 'helpcenter2',
          path: '/helpcenter2',
          asyncParams: {
            'doc': getDoc(['help'], HelpRecord.fromSnapshot),
          },
          builder: (context, params) => Helpcenter2Widget(
            doc: params.getParam('doc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'privacynsecurity',
          path: '/privacynsecurity',
          builder: (context, params) => const PrivacynsecurityWidget(),
        ),
        FFRoute(
          name: 'changepassword',
          path: '/changepassword',
          builder: (context, params) => const ChangepasswordWidget(),
        ),
        FFRoute(
          name: 'privacypolicy',
          path: '/privacypolicy',
          builder: (context, params) => const PrivacypolicyWidget(),
        ),
        FFRoute(
          name: 'termsncondictions',
          path: '/termsncondictions',
          builder: (context, params) => const TermsncondictionsWidget(),
        ),
        FFRoute(
          name: 'disableacc',
          path: '/disableacc',
          builder: (context, params) => const DisableaccWidget(),
        ),
        FFRoute(
          name: 'diasbleacc2',
          path: '/diasbleacc2',
          builder: (context, params) => const Diasbleacc2Widget(),
        ),
        FFRoute(
          name: 'diableacc3',
          path: '/diableacc3',
          builder: (context, params) => const Diableacc3Widget(),
        ),
        FFRoute(
          name: 'deleteaccother',
          path: '/deleteaccother',
          builder: (context, params) => const DeleteaccotherWidget(),
        ),
        FFRoute(
          name: 'managesubs',
          path: '/managesubs',
          builder: (context, params) => const ManagesubsWidget(),
        ),
        FFRoute(
          name: 'upgradesubs',
          path: '/upgradesubs',
          asyncParams: {
            'doc': getDoc(
                ['subscriptionPlans'], SubscriptionPlansRecord.fromSnapshot),
          },
          builder: (context, params) => UpgradesubsWidget(
            doc: params.getParam('doc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'subsupdated',
          path: '/subsupdated',
          builder: (context, params) => const SubsupdatedWidget(),
        ),
        FFRoute(
          name: 'cancelsubs1',
          path: '/cancelsubs1',
          builder: (context, params) => const Cancelsubs1Widget(),
        ),
        FFRoute(
          name: 'cancelsubs2',
          path: '/cancelsubs2',
          builder: (context, params) => const Cancelsubs2Widget(),
        ),
        FFRoute(
          name: 'cancelsubs3',
          path: '/cancelsubs3',
          builder: (context, params) => Cancelsubs3Widget(
            reason: params.getParam('reason', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'cancelsubs4',
          path: '/cancelsubs4',
          builder: (context, params) => const Cancelsubs4Widget(),
        ),
        FFRoute(
          name: 'hushyari',
          path: '/hushyari',
          builder: (context, params) => const HushyariWidget(),
        ),
        FFRoute(
          name: 'test',
          path: '/test',
          builder: (context, params) => const TestWidget(),
        ),
        FFRoute(
          name: 'testpage',
          path: '/testpage',
          builder: (context, params) => const TestpageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
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
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
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
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
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
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/welcome';
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
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

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
