import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class OutputCollectionRecord extends FirestoreRecord {
  OutputCollectionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ascendant" field.
  String? _ascendant;
  String get ascendant => _ascendant ?? '';
  bool hasAscendant() => _ascendant != null;

  // "response" field.
  String? _response;
  String get response => _response ?? '';
  bool hasResponse() => _response != null;

  // "timestamp" field.
  String? _timestamp;
  String get timestamp => _timestamp ?? '';
  bool hasTimestamp() => _timestamp != null;

  // "vedicZodiacInfo" field.
  String? _vedicZodiacInfo;
  String get vedicZodiacInfo => _vedicZodiacInfo ?? '';
  bool hasVedicZodiacInfo() => _vedicZodiacInfo != null;

  // "inputDocumentId" field.
  String? _inputDocumentId;
  String get inputDocumentId => _inputDocumentId ?? '';
  bool hasInputDocumentId() => _inputDocumentId != null;

  void _initializeFields() {
    _ascendant = snapshotData['ascendant'] as String?;
    _response = snapshotData['response'] as String?;
    _timestamp = snapshotData['timestamp'] as String?;
    _vedicZodiacInfo = snapshotData['vedicZodiacInfo'] as String?;
    _inputDocumentId = snapshotData['inputDocumentId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('outputCollection');

  static Stream<OutputCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OutputCollectionRecord.fromSnapshot(s));

  static Future<OutputCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => OutputCollectionRecord.fromSnapshot(s));

  static OutputCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OutputCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OutputCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OutputCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OutputCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OutputCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOutputCollectionRecordData({
  String? ascendant,
  String? response,
  String? timestamp,
  String? vedicZodiacInfo,
  String? inputDocumentId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ascendant': ascendant,
      'response': response,
      'timestamp': timestamp,
      'vedicZodiacInfo': vedicZodiacInfo,
      'inputDocumentId': inputDocumentId,
    }.withoutNulls,
  );

  return firestoreData;
}

class OutputCollectionRecordDocumentEquality
    implements Equality<OutputCollectionRecord> {
  const OutputCollectionRecordDocumentEquality();

  @override
  bool equals(OutputCollectionRecord? e1, OutputCollectionRecord? e2) {
    return e1?.ascendant == e2?.ascendant &&
        e1?.response == e2?.response &&
        e1?.timestamp == e2?.timestamp &&
        e1?.vedicZodiacInfo == e2?.vedicZodiacInfo &&
        e1?.inputDocumentId == e2?.inputDocumentId;
  }

  @override
  int hash(OutputCollectionRecord? e) => const ListEquality().hash([
        e?.ascendant,
        e?.response,
        e?.timestamp,
        e?.vedicZodiacInfo,
        e?.inputDocumentId
      ]);

  @override
  bool isValidKey(Object? o) => o is OutputCollectionRecord;
}
