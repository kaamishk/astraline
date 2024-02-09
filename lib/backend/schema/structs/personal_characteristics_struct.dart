// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PersonalCharacteristicsStruct extends FFFirebaseStruct {
  PersonalCharacteristicsStruct({
    int? currentHouse,
    String? verbalLocation,
    String? currentZodiac,
    String? lordOfZodiac,
    String? lordZodiacLocation,
    int? lordHouseLocation,
    String? personalisedPrediction,
    String? lordStrength,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _currentHouse = currentHouse,
        _verbalLocation = verbalLocation,
        _currentZodiac = currentZodiac,
        _lordOfZodiac = lordOfZodiac,
        _lordZodiacLocation = lordZodiacLocation,
        _lordHouseLocation = lordHouseLocation,
        _personalisedPrediction = personalisedPrediction,
        _lordStrength = lordStrength,
        super(firestoreUtilData);

  // "currentHouse" field.
  int? _currentHouse;
  int get currentHouse => _currentHouse ?? 0;
  set currentHouse(int? val) => _currentHouse = val;
  void incrementCurrentHouse(int amount) =>
      _currentHouse = currentHouse + amount;
  bool hasCurrentHouse() => _currentHouse != null;

  // "verbalLocation" field.
  String? _verbalLocation;
  String get verbalLocation => _verbalLocation ?? '';
  set verbalLocation(String? val) => _verbalLocation = val;
  bool hasVerbalLocation() => _verbalLocation != null;

  // "currentZodiac" field.
  String? _currentZodiac;
  String get currentZodiac => _currentZodiac ?? '';
  set currentZodiac(String? val) => _currentZodiac = val;
  bool hasCurrentZodiac() => _currentZodiac != null;

  // "lordOfZodiac" field.
  String? _lordOfZodiac;
  String get lordOfZodiac => _lordOfZodiac ?? '';
  set lordOfZodiac(String? val) => _lordOfZodiac = val;
  bool hasLordOfZodiac() => _lordOfZodiac != null;

  // "lordZodiacLocation" field.
  String? _lordZodiacLocation;
  String get lordZodiacLocation => _lordZodiacLocation ?? '';
  set lordZodiacLocation(String? val) => _lordZodiacLocation = val;
  bool hasLordZodiacLocation() => _lordZodiacLocation != null;

  // "lordHouseLocation" field.
  int? _lordHouseLocation;
  int get lordHouseLocation => _lordHouseLocation ?? 0;
  set lordHouseLocation(int? val) => _lordHouseLocation = val;
  void incrementLordHouseLocation(int amount) =>
      _lordHouseLocation = lordHouseLocation + amount;
  bool hasLordHouseLocation() => _lordHouseLocation != null;

  // "personalisedPrediction" field.
  String? _personalisedPrediction;
  String get personalisedPrediction => _personalisedPrediction ?? '';
  set personalisedPrediction(String? val) => _personalisedPrediction = val;
  bool hasPersonalisedPrediction() => _personalisedPrediction != null;

  // "lordStrength" field.
  String? _lordStrength;
  String get lordStrength => _lordStrength ?? '';
  set lordStrength(String? val) => _lordStrength = val;
  bool hasLordStrength() => _lordStrength != null;

  static PersonalCharacteristicsStruct fromMap(Map<String, dynamic> data) =>
      PersonalCharacteristicsStruct(
        currentHouse: castToType<int>(data['currentHouse']),
        verbalLocation: data['verbalLocation'] as String?,
        currentZodiac: data['currentZodiac'] as String?,
        lordOfZodiac: data['lordOfZodiac'] as String?,
        lordZodiacLocation: data['lordZodiacLocation'] as String?,
        lordHouseLocation: castToType<int>(data['lordHouseLocation']),
        personalisedPrediction: data['personalisedPrediction'] as String?,
        lordStrength: data['lordStrength'] as String?,
      );

  static PersonalCharacteristicsStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? PersonalCharacteristicsStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'currentHouse': _currentHouse,
        'verbalLocation': _verbalLocation,
        'currentZodiac': _currentZodiac,
        'lordOfZodiac': _lordOfZodiac,
        'lordZodiacLocation': _lordZodiacLocation,
        'lordHouseLocation': _lordHouseLocation,
        'personalisedPrediction': _personalisedPrediction,
        'lordStrength': _lordStrength,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'currentHouse': serializeParam(
          _currentHouse,
          ParamType.int,
        ),
        'verbalLocation': serializeParam(
          _verbalLocation,
          ParamType.String,
        ),
        'currentZodiac': serializeParam(
          _currentZodiac,
          ParamType.String,
        ),
        'lordOfZodiac': serializeParam(
          _lordOfZodiac,
          ParamType.String,
        ),
        'lordZodiacLocation': serializeParam(
          _lordZodiacLocation,
          ParamType.String,
        ),
        'lordHouseLocation': serializeParam(
          _lordHouseLocation,
          ParamType.int,
        ),
        'personalisedPrediction': serializeParam(
          _personalisedPrediction,
          ParamType.String,
        ),
        'lordStrength': serializeParam(
          _lordStrength,
          ParamType.String,
        ),
      }.withoutNulls;

  static PersonalCharacteristicsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PersonalCharacteristicsStruct(
        currentHouse: deserializeParam(
          data['currentHouse'],
          ParamType.int,
          false,
        ),
        verbalLocation: deserializeParam(
          data['verbalLocation'],
          ParamType.String,
          false,
        ),
        currentZodiac: deserializeParam(
          data['currentZodiac'],
          ParamType.String,
          false,
        ),
        lordOfZodiac: deserializeParam(
          data['lordOfZodiac'],
          ParamType.String,
          false,
        ),
        lordZodiacLocation: deserializeParam(
          data['lordZodiacLocation'],
          ParamType.String,
          false,
        ),
        lordHouseLocation: deserializeParam(
          data['lordHouseLocation'],
          ParamType.int,
          false,
        ),
        personalisedPrediction: deserializeParam(
          data['personalisedPrediction'],
          ParamType.String,
          false,
        ),
        lordStrength: deserializeParam(
          data['lordStrength'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PersonalCharacteristicsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PersonalCharacteristicsStruct &&
        currentHouse == other.currentHouse &&
        verbalLocation == other.verbalLocation &&
        currentZodiac == other.currentZodiac &&
        lordOfZodiac == other.lordOfZodiac &&
        lordZodiacLocation == other.lordZodiacLocation &&
        lordHouseLocation == other.lordHouseLocation &&
        personalisedPrediction == other.personalisedPrediction &&
        lordStrength == other.lordStrength;
  }

  @override
  int get hashCode => const ListEquality().hash([
        currentHouse,
        verbalLocation,
        currentZodiac,
        lordOfZodiac,
        lordZodiacLocation,
        lordHouseLocation,
        personalisedPrediction,
        lordStrength
      ]);
}

PersonalCharacteristicsStruct createPersonalCharacteristicsStruct({
  int? currentHouse,
  String? verbalLocation,
  String? currentZodiac,
  String? lordOfZodiac,
  String? lordZodiacLocation,
  int? lordHouseLocation,
  String? personalisedPrediction,
  String? lordStrength,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PersonalCharacteristicsStruct(
      currentHouse: currentHouse,
      verbalLocation: verbalLocation,
      currentZodiac: currentZodiac,
      lordOfZodiac: lordOfZodiac,
      lordZodiacLocation: lordZodiacLocation,
      lordHouseLocation: lordHouseLocation,
      personalisedPrediction: personalisedPrediction,
      lordStrength: lordStrength,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PersonalCharacteristicsStruct? updatePersonalCharacteristicsStruct(
  PersonalCharacteristicsStruct? personalCharacteristics, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    personalCharacteristics
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPersonalCharacteristicsStructData(
  Map<String, dynamic> firestoreData,
  PersonalCharacteristicsStruct? personalCharacteristics,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (personalCharacteristics == null) {
    return;
  }
  if (personalCharacteristics.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      personalCharacteristics.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final personalCharacteristicsData = getPersonalCharacteristicsFirestoreData(
      personalCharacteristics, forFieldValue);
  final nestedData =
      personalCharacteristicsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      personalCharacteristics.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPersonalCharacteristicsFirestoreData(
  PersonalCharacteristicsStruct? personalCharacteristics, [
  bool forFieldValue = false,
]) {
  if (personalCharacteristics == null) {
    return {};
  }
  final firestoreData = mapToFirestore(personalCharacteristics.toMap());

  // Add any Firestore field values
  personalCharacteristics.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPersonalCharacteristicsListFirestoreData(
  List<PersonalCharacteristicsStruct>? personalCharacteristicss,
) =>
    personalCharacteristicss
        ?.map((e) => getPersonalCharacteristicsFirestoreData(e, true))
        .toList() ??
    [];
