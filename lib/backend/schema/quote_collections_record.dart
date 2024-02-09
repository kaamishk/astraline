import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class QuoteCollectionsRecord extends FirestoreRecord {
  QuoteCollectionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "quoteOfTheDay" field.
  String? _quoteOfTheDay;
  String get quoteOfTheDay => _quoteOfTheDay ?? '';
  bool hasQuoteOfTheDay() => _quoteOfTheDay != null;

  // "heading" field.
  String? _heading;
  String get heading => _heading ?? '';
  bool hasHeading() => _heading != null;

  void _initializeFields() {
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _quoteOfTheDay = snapshotData['quoteOfTheDay'] as String?;
    _heading = snapshotData['heading'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quoteCollections');

  static Stream<QuoteCollectionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuoteCollectionsRecord.fromSnapshot(s));

  static Future<QuoteCollectionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => QuoteCollectionsRecord.fromSnapshot(s));

  static QuoteCollectionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuoteCollectionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuoteCollectionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuoteCollectionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuoteCollectionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuoteCollectionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuoteCollectionsRecordData({
  DateTime? createdAt,
  String? quoteOfTheDay,
  String? heading,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdAt': createdAt,
      'quoteOfTheDay': quoteOfTheDay,
      'heading': heading,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuoteCollectionsRecordDocumentEquality
    implements Equality<QuoteCollectionsRecord> {
  const QuoteCollectionsRecordDocumentEquality();

  @override
  bool equals(QuoteCollectionsRecord? e1, QuoteCollectionsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.quoteOfTheDay == e2?.quoteOfTheDay &&
        e1?.heading == e2?.heading;
  }

  @override
  int hash(QuoteCollectionsRecord? e) =>
      const ListEquality().hash([e?.createdAt, e?.quoteOfTheDay, e?.heading]);

  @override
  bool isValidKey(Object? o) => o is QuoteCollectionsRecord;
}
