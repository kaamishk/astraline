import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_astroEvent')) {
        try {
          _astroEvent = jsonDecode(prefs.getString('ff_astroEvent') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_horoscope')) {
        try {
          _horoscope = jsonDecode(prefs.getString('ff_horoscope') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_stats')) {
        try {
          _stats = jsonDecode(prefs.getString('ff_stats') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_lunar')) {
        try {
          _lunar = jsonDecode(prefs.getString('ff_lunar') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _dataUpdatedToday =
          prefs.getBool('ff_dataUpdatedToday') ?? _dataUpdatedToday;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_pChar')) {
        try {
          _pChar = jsonDecode(prefs.getString('ff_pChar') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _pCharDtList = prefs
              .getStringList('ff_pCharDtList')
              ?.map((x) {
                try {
                  return PersonalCharacteristicsStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _pCharDtList;
    });
    _safeInit(() {
      _upDate = prefs.getString('ff_upDate') ?? _upDate;
    });
    _safeInit(() {
      _cities = prefs.getStringList('ff_cities')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _cities;
    });
    _safeInit(() {
      _email = prefs.getString('ff_email') ?? _email;
    });
    _safeInit(() {
      _isGoogleLogin = prefs.getBool('ff_isGoogleLogin') ?? _isGoogleLogin;
    });
    _safeInit(() {
      _selectedPlan = prefs.getString('ff_selectedPlan')?.ref ?? _selectedPlan;
    });
    _safeInit(() {
      _zodiacToday = prefs.getStringList('ff_zodiacToday') ?? _zodiacToday;
    });
    _safeInit(() {
      _planetToday = prefs.getStringList('ff_planetToday') ?? _planetToday;
    });
    _safeInit(() {
      _moonState = prefs.getStringList('ff_moonState') ?? _moonState;
    });
    _safeInit(() {
      _moonStateDate =
          prefs.getStringList('ff_moonStateDate') ?? _moonStateDate;
    });
    _safeInit(() {
      _adminEmail = prefs.getString('ff_adminEmail') ?? _adminEmail;
    });
    _safeInit(() {
      _astroEventList =
          prefs.getStringList('ff_astroEventList') ?? _astroEventList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  dynamic _astroEvent;
  dynamic get astroEvent => _astroEvent;
  set astroEvent(dynamic value) {
    _astroEvent = value;
    prefs.setString('ff_astroEvent', jsonEncode(value));
  }

  dynamic _horoscope;
  dynamic get horoscope => _horoscope;
  set horoscope(dynamic value) {
    _horoscope = value;
    prefs.setString('ff_horoscope', jsonEncode(value));
  }

  dynamic _stats;
  dynamic get stats => _stats;
  set stats(dynamic value) {
    _stats = value;
    prefs.setString('ff_stats', jsonEncode(value));
  }

  dynamic _lunar;
  dynamic get lunar => _lunar;
  set lunar(dynamic value) {
    _lunar = value;
    prefs.setString('ff_lunar', jsonEncode(value));
  }

  bool _dataUpdatedToday = false;
  bool get dataUpdatedToday => _dataUpdatedToday;
  set dataUpdatedToday(bool value) {
    _dataUpdatedToday = value;
    prefs.setBool('ff_dataUpdatedToday', value);
  }

  dynamic _pChar;
  dynamic get pChar => _pChar;
  set pChar(dynamic value) {
    _pChar = value;
    prefs.setString('ff_pChar', jsonEncode(value));
  }

  List<PersonalCharacteristicsStruct> _pCharDtList = [];
  List<PersonalCharacteristicsStruct> get pCharDtList => _pCharDtList;
  set pCharDtList(List<PersonalCharacteristicsStruct> value) {
    _pCharDtList = value;
    prefs.setStringList(
        'ff_pCharDtList', value.map((x) => x.serialize()).toList());
  }

  void addToPCharDtList(PersonalCharacteristicsStruct value) {
    _pCharDtList.add(value);
    prefs.setStringList(
        'ff_pCharDtList', _pCharDtList.map((x) => x.serialize()).toList());
  }

  void removeFromPCharDtList(PersonalCharacteristicsStruct value) {
    _pCharDtList.remove(value);
    prefs.setStringList(
        'ff_pCharDtList', _pCharDtList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPCharDtList(int index) {
    _pCharDtList.removeAt(index);
    prefs.setStringList(
        'ff_pCharDtList', _pCharDtList.map((x) => x.serialize()).toList());
  }

  void updatePCharDtListAtIndex(
    int index,
    PersonalCharacteristicsStruct Function(PersonalCharacteristicsStruct)
        updateFn,
  ) {
    _pCharDtList[index] = updateFn(_pCharDtList[index]);
    prefs.setStringList(
        'ff_pCharDtList', _pCharDtList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPCharDtList(
      int index, PersonalCharacteristicsStruct value) {
    _pCharDtList.insert(index, value);
    prefs.setStringList(
        'ff_pCharDtList', _pCharDtList.map((x) => x.serialize()).toList());
  }

  String _upDate = '';
  String get upDate => _upDate;
  set upDate(String value) {
    _upDate = value;
    prefs.setString('ff_upDate', value);
  }

  dynamic _geoDetails;
  dynamic get geoDetails => _geoDetails;
  set geoDetails(dynamic value) {
    _geoDetails = value;
  }

  List<dynamic> _cities = [jsonDecode('{}')];
  List<dynamic> get cities => _cities;
  set cities(List<dynamic> value) {
    _cities = value;
    prefs.setStringList('ff_cities', value.map((x) => jsonEncode(x)).toList());
  }

  void addToCities(dynamic value) {
    _cities.add(value);
    prefs.setStringList(
        'ff_cities', _cities.map((x) => jsonEncode(x)).toList());
  }

  void removeFromCities(dynamic value) {
    _cities.remove(value);
    prefs.setStringList(
        'ff_cities', _cities.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromCities(int index) {
    _cities.removeAt(index);
    prefs.setStringList(
        'ff_cities', _cities.map((x) => jsonEncode(x)).toList());
  }

  void updateCitiesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _cities[index] = updateFn(_cities[index]);
    prefs.setStringList(
        'ff_cities', _cities.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInCities(int index, dynamic value) {
    _cities.insert(index, value);
    prefs.setStringList(
        'ff_cities', _cities.map((x) => jsonEncode(x)).toList());
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
    prefs.setString('ff_email', value);
  }

  bool _isGoogleLogin = false;
  bool get isGoogleLogin => _isGoogleLogin;
  set isGoogleLogin(bool value) {
    _isGoogleLogin = value;
    prefs.setBool('ff_isGoogleLogin', value);
  }

  DocumentReference? _selectedPlan =
      FirebaseFirestore.instance.doc('/subscriptionPlans/MqvrpSKA5K2eHDYDBaiJ');
  DocumentReference? get selectedPlan => _selectedPlan;
  set selectedPlan(DocumentReference? value) {
    _selectedPlan = value;
    value != null
        ? prefs.setString('ff_selectedPlan', value.path)
        : prefs.remove('ff_selectedPlan');
  }

  List<String> _zodiacToday = ['Scorpio'];
  List<String> get zodiacToday => _zodiacToday;
  set zodiacToday(List<String> value) {
    _zodiacToday = value;
    prefs.setStringList('ff_zodiacToday', value);
  }

  void addToZodiacToday(String value) {
    _zodiacToday.add(value);
    prefs.setStringList('ff_zodiacToday', _zodiacToday);
  }

  void removeFromZodiacToday(String value) {
    _zodiacToday.remove(value);
    prefs.setStringList('ff_zodiacToday', _zodiacToday);
  }

  void removeAtIndexFromZodiacToday(int index) {
    _zodiacToday.removeAt(index);
    prefs.setStringList('ff_zodiacToday', _zodiacToday);
  }

  void updateZodiacTodayAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _zodiacToday[index] = updateFn(_zodiacToday[index]);
    prefs.setStringList('ff_zodiacToday', _zodiacToday);
  }

  void insertAtIndexInZodiacToday(int index, String value) {
    _zodiacToday.insert(index, value);
    prefs.setStringList('ff_zodiacToday', _zodiacToday);
  }

  List<String> _planetToday = ['Moon'];
  List<String> get planetToday => _planetToday;
  set planetToday(List<String> value) {
    _planetToday = value;
    prefs.setStringList('ff_planetToday', value);
  }

  void addToPlanetToday(String value) {
    _planetToday.add(value);
    prefs.setStringList('ff_planetToday', _planetToday);
  }

  void removeFromPlanetToday(String value) {
    _planetToday.remove(value);
    prefs.setStringList('ff_planetToday', _planetToday);
  }

  void removeAtIndexFromPlanetToday(int index) {
    _planetToday.removeAt(index);
    prefs.setStringList('ff_planetToday', _planetToday);
  }

  void updatePlanetTodayAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _planetToday[index] = updateFn(_planetToday[index]);
    prefs.setStringList('ff_planetToday', _planetToday);
  }

  void insertAtIndexInPlanetToday(int index, String value) {
    _planetToday.insert(index, value);
    prefs.setStringList('ff_planetToday', _planetToday);
  }

  List<String> _moonState = [
    'newmoon',
    'quarter',
    'fullmoon',
    'last quarter',
    'waxing cresent',
    'waxing gibbous',
    'waning gibbous',
    'waning cresent'
  ];
  List<String> get moonState => _moonState;
  set moonState(List<String> value) {
    _moonState = value;
    prefs.setStringList('ff_moonState', value);
  }

  void addToMoonState(String value) {
    _moonState.add(value);
    prefs.setStringList('ff_moonState', _moonState);
  }

  void removeFromMoonState(String value) {
    _moonState.remove(value);
    prefs.setStringList('ff_moonState', _moonState);
  }

  void removeAtIndexFromMoonState(int index) {
    _moonState.removeAt(index);
    prefs.setStringList('ff_moonState', _moonState);
  }

  void updateMoonStateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _moonState[index] = updateFn(_moonState[index]);
    prefs.setStringList('ff_moonState', _moonState);
  }

  void insertAtIndexInMoonState(int index, String value) {
    _moonState.insert(index, value);
    prefs.setStringList('ff_moonState', _moonState);
  }

  List<String> _moonStateDate = [
    'Sun Mar 10 1994',
    'Sun Mar 20 1994',
    'Sun Ma 30 1994',
    'Sun Mar 25 1994',
    'Sun Mar 26 1994',
    'Sun Mar 27 1994',
    'Sun Mar 28 1994',
    'Sun Mar 29 1994'
  ];
  List<String> get moonStateDate => _moonStateDate;
  set moonStateDate(List<String> value) {
    _moonStateDate = value;
    prefs.setStringList('ff_moonStateDate', value);
  }

  void addToMoonStateDate(String value) {
    _moonStateDate.add(value);
    prefs.setStringList('ff_moonStateDate', _moonStateDate);
  }

  void removeFromMoonStateDate(String value) {
    _moonStateDate.remove(value);
    prefs.setStringList('ff_moonStateDate', _moonStateDate);
  }

  void removeAtIndexFromMoonStateDate(int index) {
    _moonStateDate.removeAt(index);
    prefs.setStringList('ff_moonStateDate', _moonStateDate);
  }

  void updateMoonStateDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _moonStateDate[index] = updateFn(_moonStateDate[index]);
    prefs.setStringList('ff_moonStateDate', _moonStateDate);
  }

  void insertAtIndexInMoonStateDate(int index, String value) {
    _moonStateDate.insert(index, value);
    prefs.setStringList('ff_moonStateDate', _moonStateDate);
  }

  String _adminEmail = 'flutterflowdemo@gmail.com';
  String get adminEmail => _adminEmail;
  set adminEmail(String value) {
    _adminEmail = value;
    prefs.setString('ff_adminEmail', value);
  }

  List<String> _astroEventList = [
    'Waiting for data....',
    'Waiting for data....',
    'Waiting for data....',
    'Waiting for data....',
    'Waiting for data....',
    'Waiting for data....',
    'Waiting for data....',
    'Waiting for data....',
    'Waiting for data....',
    'Waiting for data....',
    'Waiting for data....'
  ];
  List<String> get astroEventList => _astroEventList;
  set astroEventList(List<String> value) {
    _astroEventList = value;
    prefs.setStringList('ff_astroEventList', value);
  }

  void addToAstroEventList(String value) {
    _astroEventList.add(value);
    prefs.setStringList('ff_astroEventList', _astroEventList);
  }

  void removeFromAstroEventList(String value) {
    _astroEventList.remove(value);
    prefs.setStringList('ff_astroEventList', _astroEventList);
  }

  void removeAtIndexFromAstroEventList(int index) {
    _astroEventList.removeAt(index);
    prefs.setStringList('ff_astroEventList', _astroEventList);
  }

  void updateAstroEventListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _astroEventList[index] = updateFn(_astroEventList[index]);
    prefs.setStringList('ff_astroEventList', _astroEventList);
  }

  void insertAtIndexInAstroEventList(int index, String value) {
    _astroEventList.insert(index, value);
    prefs.setStringList('ff_astroEventList', _astroEventList);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
