// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TransitEntriesStruct extends FFFirebaseStruct {
  TransitEntriesStruct({
    String? planetPosition,
    String? date1,
    String? forecast,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _planetPosition = planetPosition,
        _date1 = date1,
        _forecast = forecast,
        super(firestoreUtilData);

  // "planetPosition" field.
  String? _planetPosition;
  String get planetPosition => _planetPosition ?? '';
  set planetPosition(String? val) => _planetPosition = val;
  bool hasPlanetPosition() => _planetPosition != null;

  // "date1" field.
  String? _date1;
  String get date1 => _date1 ?? '';
  set date1(String? val) => _date1 = val;
  bool hasDate1() => _date1 != null;

  // "forecast" field.
  String? _forecast;
  String get forecast => _forecast ?? '';
  set forecast(String? val) => _forecast = val;
  bool hasForecast() => _forecast != null;

  static TransitEntriesStruct fromMap(Map<String, dynamic> data) =>
      TransitEntriesStruct(
        planetPosition: data['planetPosition'] as String?,
        date1: data['date1'] as String?,
        forecast: data['forecast'] as String?,
      );

  static TransitEntriesStruct? maybeFromMap(dynamic data) => data is Map
      ? TransitEntriesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'planetPosition': _planetPosition,
        'date1': _date1,
        'forecast': _forecast,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'planetPosition': serializeParam(
          _planetPosition,
          ParamType.String,
        ),
        'date1': serializeParam(
          _date1,
          ParamType.String,
        ),
        'forecast': serializeParam(
          _forecast,
          ParamType.String,
        ),
      }.withoutNulls;

  static TransitEntriesStruct fromSerializableMap(Map<String, dynamic> data) =>
      TransitEntriesStruct(
        planetPosition: deserializeParam(
          data['planetPosition'],
          ParamType.String,
          false,
        ),
        date1: deserializeParam(
          data['date1'],
          ParamType.String,
          false,
        ),
        forecast: deserializeParam(
          data['forecast'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TransitEntriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TransitEntriesStruct &&
        planetPosition == other.planetPosition &&
        date1 == other.date1 &&
        forecast == other.forecast;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([planetPosition, date1, forecast]);
}

TransitEntriesStruct createTransitEntriesStruct({
  String? planetPosition,
  String? date1,
  String? forecast,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TransitEntriesStruct(
      planetPosition: planetPosition,
      date1: date1,
      forecast: forecast,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TransitEntriesStruct? updateTransitEntriesStruct(
  TransitEntriesStruct? transitEntries, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    transitEntries
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTransitEntriesStructData(
  Map<String, dynamic> firestoreData,
  TransitEntriesStruct? transitEntries,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (transitEntries == null) {
    return;
  }
  if (transitEntries.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && transitEntries.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final transitEntriesData =
      getTransitEntriesFirestoreData(transitEntries, forFieldValue);
  final nestedData =
      transitEntriesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = transitEntries.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTransitEntriesFirestoreData(
  TransitEntriesStruct? transitEntries, [
  bool forFieldValue = false,
]) {
  if (transitEntries == null) {
    return {};
  }
  final firestoreData = mapToFirestore(transitEntries.toMap());

  // Add any Firestore field values
  transitEntries.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTransitEntriesListFirestoreData(
  List<TransitEntriesStruct>? transitEntriess,
) =>
    transitEntriess
        ?.map((e) => getTransitEntriesFirestoreData(e, true))
        .toList() ??
    [];
