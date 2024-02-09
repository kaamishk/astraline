import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PosesRecord extends FirestoreRecord {
  PosesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "pose" field.
  String? _pose;
  String get pose => _pose ?? '';
  bool hasPose() => _pose != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "difficulty" field.
  String? _difficulty;
  String get difficulty => _difficulty ?? '';
  bool hasDifficulty() => _difficulty != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "videoList" field.
  List<String>? _videoList;
  List<String> get videoList => _videoList ?? const [];
  bool hasVideoList() => _videoList != null;

  // "recoZodiac" field.
  List<String>? _recoZodiac;
  List<String> get recoZodiac => _recoZodiac ?? const [];
  bool hasRecoZodiac() => _recoZodiac != null;

  // "benefits" field.
  List<String>? _benefits;
  List<String> get benefits => _benefits ?? const [];
  bool hasBenefits() => _benefits != null;

  void _initializeFields() {
    _pose = snapshotData['pose'] as String?;
    _category = snapshotData['category'] as String?;
    _type = snapshotData['type'] as String?;
    _difficulty = snapshotData['difficulty'] as String?;
    _description = snapshotData['description'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _videoList = getDataList(snapshotData['videoList']);
    _recoZodiac = getDataList(snapshotData['recoZodiac']);
    _benefits = getDataList(snapshotData['benefits']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('poses');

  static Stream<PosesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PosesRecord.fromSnapshot(s));

  static Future<PosesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PosesRecord.fromSnapshot(s));

  static PosesRecord fromSnapshot(DocumentSnapshot snapshot) => PosesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PosesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PosesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PosesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PosesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPosesRecordData({
  String? pose,
  String? category,
  String? type,
  String? difficulty,
  String? description,
  String? imageUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pose': pose,
      'category': category,
      'type': type,
      'difficulty': difficulty,
      'description': description,
      'imageUrl': imageUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class PosesRecordDocumentEquality implements Equality<PosesRecord> {
  const PosesRecordDocumentEquality();

  @override
  bool equals(PosesRecord? e1, PosesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.pose == e2?.pose &&
        e1?.category == e2?.category &&
        e1?.type == e2?.type &&
        e1?.difficulty == e2?.difficulty &&
        e1?.description == e2?.description &&
        e1?.imageUrl == e2?.imageUrl &&
        listEquality.equals(e1?.videoList, e2?.videoList) &&
        listEquality.equals(e1?.recoZodiac, e2?.recoZodiac) &&
        listEquality.equals(e1?.benefits, e2?.benefits);
  }

  @override
  int hash(PosesRecord? e) => const ListEquality().hash([
        e?.pose,
        e?.category,
        e?.type,
        e?.difficulty,
        e?.description,
        e?.imageUrl,
        e?.videoList,
        e?.recoZodiac,
        e?.benefits
      ]);

  @override
  bool isValidKey(Object? o) => o is PosesRecord;
}
