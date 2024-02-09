import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TransitReportsRecord extends FirestoreRecord {
  TransitReportsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "createdByRef" field.
  DocumentReference? _createdByRef;
  DocumentReference? get createdByRef => _createdByRef;
  bool hasCreatedByRef() => _createdByRef != null;

  // "planetPosition" field.
  List<String>? _planetPosition;
  List<String> get planetPosition => _planetPosition ?? const [];
  bool hasPlanetPosition() => _planetPosition != null;

  // "date1" field.
  List<String>? _date1;
  List<String> get date1 => _date1 ?? const [];
  bool hasDate1() => _date1 != null;

  // "forecast" field.
  List<String>? _forecast;
  List<String> get forecast => _forecast ?? const [];
  bool hasForecast() => _forecast != null;

  // "filterDate" field.
  String? _filterDate;
  String get filterDate => _filterDate ?? '';
  bool hasFilterDate() => _filterDate != null;

  void _initializeFields() {
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _createdByRef = snapshotData['createdByRef'] as DocumentReference?;
    _planetPosition = getDataList(snapshotData['planetPosition']);
    _date1 = getDataList(snapshotData['date1']);
    _forecast = getDataList(snapshotData['forecast']);
    _filterDate = snapshotData['filterDate'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transitReports');

  static Stream<TransitReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransitReportsRecord.fromSnapshot(s));

  static Future<TransitReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransitReportsRecord.fromSnapshot(s));

  static TransitReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransitReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransitReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransitReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransitReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransitReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransitReportsRecordData({
  DateTime? createdAt,
  DocumentReference? createdByRef,
  String? filterDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdAt': createdAt,
      'createdByRef': createdByRef,
      'filterDate': filterDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransitReportsRecordDocumentEquality
    implements Equality<TransitReportsRecord> {
  const TransitReportsRecordDocumentEquality();

  @override
  bool equals(TransitReportsRecord? e1, TransitReportsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.createdByRef == e2?.createdByRef &&
        listEquality.equals(e1?.planetPosition, e2?.planetPosition) &&
        listEquality.equals(e1?.date1, e2?.date1) &&
        listEquality.equals(e1?.forecast, e2?.forecast) &&
        e1?.filterDate == e2?.filterDate;
  }

  @override
  int hash(TransitReportsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.createdByRef,
        e?.planetPosition,
        e?.date1,
        e?.forecast,
        e?.filterDate
      ]);

  @override
  bool isValidKey(Object? o) => o is TransitReportsRecord;
}
