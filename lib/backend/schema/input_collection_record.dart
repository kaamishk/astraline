import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class InputCollectionRecord extends FirestoreRecord {
  InputCollectionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ascendant" field.
  String? _ascendant;
  String get ascendant => _ascendant ?? '';
  bool hasAscendant() => _ascendant != null;

  // "input1" field.
  String? _input1;
  String get input1 => _input1 ?? '';
  bool hasInput1() => _input1 != null;

  // "input2" field.
  String? _input2;
  String get input2 => _input2 ?? '';
  bool hasInput2() => _input2 != null;

  void _initializeFields() {
    _ascendant = snapshotData['ascendant'] as String?;
    _input1 = snapshotData['input1'] as String?;
    _input2 = snapshotData['input2'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inputCollection');

  static Stream<InputCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InputCollectionRecord.fromSnapshot(s));

  static Future<InputCollectionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InputCollectionRecord.fromSnapshot(s));

  static InputCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InputCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InputCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InputCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InputCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InputCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInputCollectionRecordData({
  String? ascendant,
  String? input1,
  String? input2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ascendant': ascendant,
      'input1': input1,
      'input2': input2,
    }.withoutNulls,
  );

  return firestoreData;
}

class InputCollectionRecordDocumentEquality
    implements Equality<InputCollectionRecord> {
  const InputCollectionRecordDocumentEquality();

  @override
  bool equals(InputCollectionRecord? e1, InputCollectionRecord? e2) {
    return e1?.ascendant == e2?.ascendant &&
        e1?.input1 == e2?.input1 &&
        e1?.input2 == e2?.input2;
  }

  @override
  int hash(InputCollectionRecord? e) =>
      const ListEquality().hash([e?.ascendant, e?.input1, e?.input2]);

  @override
  bool isValidKey(Object? o) => o is InputCollectionRecord;
}
