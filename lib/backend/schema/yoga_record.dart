import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class YogaRecord extends FirestoreRecord {
  YogaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "zodiacName" field.
  String? _zodiacName;
  String get zodiacName => _zodiacName ?? '';
  bool hasZodiacName() => _zodiacName != null;

  // "lordOfZodiac" field.
  String? _lordOfZodiac;
  String get lordOfZodiac => _lordOfZodiac ?? '';
  bool hasLordOfZodiac() => _lordOfZodiac != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "videoList" field.
  List<String>? _videoList;
  List<String> get videoList => _videoList ?? const [];
  bool hasVideoList() => _videoList != null;

  // "recoZodiac" field.
  List<String>? _recoZodiac;
  List<String> get recoZodiac => _recoZodiac ?? const [];
  bool hasRecoZodiac() => _recoZodiac != null;

  // "routineList" field.
  List<DocumentReference>? _routineList;
  List<DocumentReference> get routineList => _routineList ?? const [];
  bool hasRoutineList() => _routineList != null;

  // "benefits" field.
  List<String>? _benefits;
  List<String> get benefits => _benefits ?? const [];
  bool hasBenefits() => _benefits != null;

  void _initializeFields() {
    _zodiacName = snapshotData['zodiacName'] as String?;
    _lordOfZodiac = snapshotData['lordOfZodiac'] as String?;
    _details = snapshotData['details'] as String?;
    _videoList = getDataList(snapshotData['videoList']);
    _recoZodiac = getDataList(snapshotData['recoZodiac']);
    _routineList = getDataList(snapshotData['routineList']);
    _benefits = getDataList(snapshotData['benefits']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('yoga');

  static Stream<YogaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => YogaRecord.fromSnapshot(s));

  static Future<YogaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => YogaRecord.fromSnapshot(s));

  static YogaRecord fromSnapshot(DocumentSnapshot snapshot) => YogaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static YogaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      YogaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'YogaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is YogaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createYogaRecordData({
  String? zodiacName,
  String? lordOfZodiac,
  String? details,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'zodiacName': zodiacName,
      'lordOfZodiac': lordOfZodiac,
      'details': details,
    }.withoutNulls,
  );

  return firestoreData;
}

class YogaRecordDocumentEquality implements Equality<YogaRecord> {
  const YogaRecordDocumentEquality();

  @override
  bool equals(YogaRecord? e1, YogaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.zodiacName == e2?.zodiacName &&
        e1?.lordOfZodiac == e2?.lordOfZodiac &&
        e1?.details == e2?.details &&
        listEquality.equals(e1?.videoList, e2?.videoList) &&
        listEquality.equals(e1?.recoZodiac, e2?.recoZodiac) &&
        listEquality.equals(e1?.routineList, e2?.routineList) &&
        listEquality.equals(e1?.benefits, e2?.benefits);
  }

  @override
  int hash(YogaRecord? e) => const ListEquality().hash([
        e?.zodiacName,
        e?.lordOfZodiac,
        e?.details,
        e?.videoList,
        e?.recoZodiac,
        e?.routineList,
        e?.benefits
      ]);

  @override
  bool isValidKey(Object? o) => o is YogaRecord;
}
