// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HousesStruct extends FFFirebaseStruct {
  HousesStruct({
    String? houseName,
    int? houseNumber,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _houseName = houseName,
        _houseNumber = houseNumber,
        super(firestoreUtilData);

  // "HouseName" field.
  String? _houseName;
  String get houseName => _houseName ?? '';
  set houseName(String? val) => _houseName = val;
  bool hasHouseName() => _houseName != null;

  // "houseNumber" field.
  int? _houseNumber;
  int get houseNumber => _houseNumber ?? 0;
  set houseNumber(int? val) => _houseNumber = val;
  void incrementHouseNumber(int amount) => _houseNumber = houseNumber + amount;
  bool hasHouseNumber() => _houseNumber != null;

  static HousesStruct fromMap(Map<String, dynamic> data) => HousesStruct(
        houseName: data['HouseName'] as String?,
        houseNumber: castToType<int>(data['houseNumber']),
      );

  static HousesStruct? maybeFromMap(dynamic data) =>
      data is Map ? HousesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'HouseName': _houseName,
        'houseNumber': _houseNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'HouseName': serializeParam(
          _houseName,
          ParamType.String,
        ),
        'houseNumber': serializeParam(
          _houseNumber,
          ParamType.int,
        ),
      }.withoutNulls;

  static HousesStruct fromSerializableMap(Map<String, dynamic> data) =>
      HousesStruct(
        houseName: deserializeParam(
          data['HouseName'],
          ParamType.String,
          false,
        ),
        houseNumber: deserializeParam(
          data['houseNumber'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'HousesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HousesStruct &&
        houseName == other.houseName &&
        houseNumber == other.houseNumber;
  }

  @override
  int get hashCode => const ListEquality().hash([houseName, houseNumber]);
}

HousesStruct createHousesStruct({
  String? houseName,
  int? houseNumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HousesStruct(
      houseName: houseName,
      houseNumber: houseNumber,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HousesStruct? updateHousesStruct(
  HousesStruct? houses, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    houses
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHousesStructData(
  Map<String, dynamic> firestoreData,
  HousesStruct? houses,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (houses == null) {
    return;
  }
  if (houses.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && houses.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final housesData = getHousesFirestoreData(houses, forFieldValue);
  final nestedData = housesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = houses.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHousesFirestoreData(
  HousesStruct? houses, [
  bool forFieldValue = false,
]) {
  if (houses == null) {
    return {};
  }
  final firestoreData = mapToFirestore(houses.toMap());

  // Add any Firestore field values
  houses.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHousesListFirestoreData(
  List<HousesStruct>? housess,
) =>
    housess?.map((e) => getHousesFirestoreData(e, true)).toList() ?? [];
