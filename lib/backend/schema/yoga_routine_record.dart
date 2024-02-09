import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class YogaRoutineRecord extends FirestoreRecord {
  YogaRoutineRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "posesList" field.
  List<DocumentReference>? _posesList;
  List<DocumentReference> get posesList => _posesList ?? const [];
  bool hasPosesList() => _posesList != null;

  // "videoList" field.
  List<String>? _videoList;
  List<String> get videoList => _videoList ?? const [];
  bool hasVideoList() => _videoList != null;

  // "recoZodiac" field.
  List<String>? _recoZodiac;
  List<String> get recoZodiac => _recoZodiac ?? const [];
  bool hasRecoZodiac() => _recoZodiac != null;

  // "routineName" field.
  String? _routineName;
  String get routineName => _routineName ?? '';
  bool hasRoutineName() => _routineName != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "benefits" field.
  List<String>? _benefits;
  List<String> get benefits => _benefits ?? const [];
  bool hasBenefits() => _benefits != null;

  // "difficulty" field.
  String? _difficulty;
  String get difficulty => _difficulty ?? '';
  bool hasDifficulty() => _difficulty != null;

  // "routinrType" field.
  String? _routinrType;
  String get routinrType => _routinrType ?? '';
  bool hasRoutinrType() => _routinrType != null;

  // "durationType" field.
  String? _durationType;
  String get durationType => _durationType ?? '';
  bool hasDurationType() => _durationType != null;

  void _initializeFields() {
    _details = snapshotData['details'] as String?;
    _posesList = getDataList(snapshotData['posesList']);
    _videoList = getDataList(snapshotData['videoList']);
    _recoZodiac = getDataList(snapshotData['recoZodiac']);
    _routineName = snapshotData['routineName'] as String?;
    _duration = snapshotData['duration'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _benefits = getDataList(snapshotData['benefits']);
    _difficulty = snapshotData['difficulty'] as String?;
    _routinrType = snapshotData['routinrType'] as String?;
    _durationType = snapshotData['durationType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('yogaRoutine');

  static Stream<YogaRoutineRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => YogaRoutineRecord.fromSnapshot(s));

  static Future<YogaRoutineRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => YogaRoutineRecord.fromSnapshot(s));

  static YogaRoutineRecord fromSnapshot(DocumentSnapshot snapshot) =>
      YogaRoutineRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static YogaRoutineRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      YogaRoutineRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'YogaRoutineRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is YogaRoutineRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createYogaRoutineRecordData({
  String? details,
  String? routineName,
  String? duration,
  String? imageUrl,
  String? difficulty,
  String? routinrType,
  String? durationType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'details': details,
      'routineName': routineName,
      'duration': duration,
      'imageUrl': imageUrl,
      'difficulty': difficulty,
      'routinrType': routinrType,
      'durationType': durationType,
    }.withoutNulls,
  );

  return firestoreData;
}

class YogaRoutineRecordDocumentEquality implements Equality<YogaRoutineRecord> {
  const YogaRoutineRecordDocumentEquality();

  @override
  bool equals(YogaRoutineRecord? e1, YogaRoutineRecord? e2) {
    const listEquality = ListEquality();
    return e1?.details == e2?.details &&
        listEquality.equals(e1?.posesList, e2?.posesList) &&
        listEquality.equals(e1?.videoList, e2?.videoList) &&
        listEquality.equals(e1?.recoZodiac, e2?.recoZodiac) &&
        e1?.routineName == e2?.routineName &&
        e1?.duration == e2?.duration &&
        e1?.imageUrl == e2?.imageUrl &&
        listEquality.equals(e1?.benefits, e2?.benefits) &&
        e1?.difficulty == e2?.difficulty &&
        e1?.routinrType == e2?.routinrType &&
        e1?.durationType == e2?.durationType;
  }

  @override
  int hash(YogaRoutineRecord? e) => const ListEquality().hash([
        e?.details,
        e?.posesList,
        e?.videoList,
        e?.recoZodiac,
        e?.routineName,
        e?.duration,
        e?.imageUrl,
        e?.benefits,
        e?.difficulty,
        e?.routinrType,
        e?.durationType
      ]);

  @override
  bool isValidKey(Object? o) => o is YogaRoutineRecord;
}
