import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HelpRecord extends FirestoreRecord {
  HelpRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "idNo" field.
  int? _idNo;
  int get idNo => _idNo ?? 0;
  bool hasIdNo() => _idNo != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _idNo = castToType<int>(snapshotData['idNo']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('help');

  static Stream<HelpRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HelpRecord.fromSnapshot(s));

  static Future<HelpRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HelpRecord.fromSnapshot(s));

  static HelpRecord fromSnapshot(DocumentSnapshot snapshot) => HelpRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HelpRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HelpRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HelpRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HelpRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHelpRecordData({
  String? title,
  String? description,
  int? idNo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'idNo': idNo,
    }.withoutNulls,
  );

  return firestoreData;
}

class HelpRecordDocumentEquality implements Equality<HelpRecord> {
  const HelpRecordDocumentEquality();

  @override
  bool equals(HelpRecord? e1, HelpRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.idNo == e2?.idNo;
  }

  @override
  int hash(HelpRecord? e) =>
      const ListEquality().hash([e?.title, e?.description, e?.idNo]);

  @override
  bool isValidKey(Object? o) => o is HelpRecord;
}
