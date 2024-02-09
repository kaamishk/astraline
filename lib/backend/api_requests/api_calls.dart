import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PersonalCharacteristicsCall {
  static Future<ApiCallResponse> call({
    String? dob = '',
    String? tob = '',
    double? lat,
    double? lon,
    double? tz,
    String? apiKey = '24299c3c-455c-549c-9a46-88500fd8782b',
    String? lang = 'en',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'PersonalCharacteristics',
      apiUrl:
          'https://api.vedicastroapi.com/v3-json/horoscope/personal-characteristics',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'dob': dob,
        'tob': tob,
        'lat': lat,
        'lon': lon,
        'tz': tz,
        'api_key': apiKey,
        'lang': lang,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? currentHouse(dynamic response) => (getJsonField(
        response,
        r'''$.response[:].current_house''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? verbalLocation(dynamic response) => (getJsonField(
        response,
        r'''$.response[:].verbal_location''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? currentZodiac(dynamic response) => (getJsonField(
        response,
        r'''$.response[:].current_zodiac''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lordOfZodiac(dynamic response) => (getJsonField(
        response,
        r'''$.response[:].lord_of_zodiac''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lordZodiacLocation(dynamic response) => (getJsonField(
        response,
        r'''$.response[:].lord_zodiac_location''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? lordHouseLocation(dynamic response) => (getJsonField(
        response,
        r'''$.response[:].lord_house_location''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? personalisedPrediction(dynamic response) =>
      (getJsonField(
        response,
        r'''$.response[:].personalised_prediction''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lordStrength(dynamic response) => (getJsonField(
        response,
        r'''$.response[:].lord_strength''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VedicChartCall {
  static Future<ApiCallResponse> call({
    String? dob = '',
    String? tob = '',
    double? lat,
    double? lon,
    double? tz,
    String? apiKey = '24299c3c-455c-549c-9a46-88500fd8782b',
    String? lang = 'en',
    String? color = '',
    String? style = '',
    String? div = '',
    String? format = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'VedicChart',
      apiUrl: 'https://api.vedicastroapi.com/v3-json/horoscope/chart-image',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'dob': dob,
        'tob': tob,
        'lat': lat,
        'lon': lon,
        'tz': tz,
        'api_key': apiKey,
        'lang': lang,
        'color': color,
        'style': style,
        'div': div,
        'format': format,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BirthDetailVedicApiCall {
  static Future<ApiCallResponse> call({
    String? dob = '',
    String? tob = '',
    double? lat,
    double? lon,
    double? tz,
    String? apiKey = '24299c3c-455c-549c-9a46-88500fd8782b',
    String? lang = 'en',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BirthDetailVedicApi',
      apiUrl: 'https://api.vedicastroapi.com/v3-json/horoscope/planet-details',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'dob': dob,
        'tob': tob,
        'lat': lat,
        'lon': lon,
        'tz': tz,
        'api_key': apiKey,
        'lang': lang,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? zodiacList(dynamic response) => (getJsonField(
        response,
        r'''$.response..zodiac''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VediPredictionDailySunCall {
  static Future<ApiCallResponse> call({
    String? lang = 'en',
    String? zodiac = '',
    String? type = '',
    String? date = '',
    bool? showSame = false,
    bool? split,
    String? apiKey = '24299c3c-455c-549c-9a46-88500fd8782b',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'VediPredictionDailySun',
      apiUrl:
          'https://api.vedicastroapi.com/v3-json/prediction/daily-sun?zodiac=$zodiac&date=$date&show_same=$showSame&api_key=$apiKey&lang=$lang&split=$split&type=$type',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? responseList(dynamic response) => (getJsonField(
        response,
        r'''$..split_response''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GeoCordinatesVediAPICall {
  static Future<ApiCallResponse> call({
    String? apiKey = '24299c3c-455c-549c-9a46-88500fd8782b',
    String? city = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GeoCordinatesVediAPI',
      apiUrl: 'https://api.vedicastroapi.com/v3-json/utilities/geo-search',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'api_key': apiKey,
        'city': city,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? lng(dynamic response) => (getJsonField(
        response,
        r'''$.geonames[:].lng''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countryCode(dynamic response) => (getJsonField(
        response,
        r'''$.geonames[:].countryCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? city(dynamic response) => (getJsonField(
        response,
        r'''$.geonames[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lat(dynamic response) => (getJsonField(
        response,
        r'''$.geonames[:].lat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class MoonPhaseVediAPICall {
  static Future<ApiCallResponse> call({
    String? apiKey = '24299c3c-455c-549c-9a46-88500fd8782b',
    String? date = '',
    double? tz,
    String? lang = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'MoonPhaseVediAPI',
      apiUrl: 'https://api.vedicastroapi.com/v3-json/panchang/moon-calendar',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'api_key': apiKey,
        'date': date,
        'tz': tz,
        'lang': lang,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? moonState(dynamic response) => (getJsonField(
        response,
        r'''$.response[:].state''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? moonStateDate(dynamic response) => (getJsonField(
        response,
        r'''$.response[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CustomPushNotificationCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? title = '',
    String? body = '',
    String? initialPageName = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'customPushNotification',
      apiUrl:
          'https://us-central1-astraline-c5463.cloudfunctions.net/customNotification',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'userId': userId,
        'title': title,
        'body': body,
        'initialPageName': initialPageName,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CustomEmailsCall {
  static Future<ApiCallResponse> call({
    String? subject = '',
    String? text = '',
    String? toEmail = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'customEmails',
      apiUrl:
          'https://us-central1-astraline-c5463.cloudfunctions.net/customEmails',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'toEmail': toEmail,
        'subject': subject,
        'text': text,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AstroEventCall {
  static Future<ApiCallResponse> call({
    String? inputData2 = '',
    String? ascendant = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'astroEvent',
      apiUrl:
          'https://us-central1-astraline-c5463.cloudfunctions.net/astroEvent',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'inputData2': inputData2,
        'ascendant': ascendant,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? textRes(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[0].text''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
