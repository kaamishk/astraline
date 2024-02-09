import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionPlansRecord extends FirestoreRecord {
  SubscriptionPlansRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "planName" field.
  String? _planName;
  String get planName => _planName ?? '';
  bool hasPlanName() => _planName != null;

  // "planDescription" field.
  String? _planDescription;
  String get planDescription => _planDescription ?? '';
  bool hasPlanDescription() => _planDescription != null;

  // "orderId" field.
  int? _orderId;
  int get orderId => _orderId ?? 0;
  bool hasOrderId() => _orderId != null;

  // "planPrice" field.
  double? _planPrice;
  double get planPrice => _planPrice ?? 0.0;
  bool hasPlanPrice() => _planPrice != null;

  // "includes" field.
  List<String>? _includes;
  List<String> get includes => _includes ?? const [];
  bool hasIncludes() => _includes != null;

  void _initializeFields() {
    _planName = snapshotData['planName'] as String?;
    _planDescription = snapshotData['planDescription'] as String?;
    _orderId = castToType<int>(snapshotData['orderId']);
    _planPrice = castToType<double>(snapshotData['planPrice']);
    _includes = getDataList(snapshotData['includes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscriptionPlans');

  static Stream<SubscriptionPlansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionPlansRecord.fromSnapshot(s));

  static Future<SubscriptionPlansRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SubscriptionPlansRecord.fromSnapshot(s));

  static SubscriptionPlansRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionPlansRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionPlansRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionPlansRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionPlansRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionPlansRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubscriptionPlansRecordData({
  String? planName,
  String? planDescription,
  int? orderId,
  double? planPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'planName': planName,
      'planDescription': planDescription,
      'orderId': orderId,
      'planPrice': planPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubscriptionPlansRecordDocumentEquality
    implements Equality<SubscriptionPlansRecord> {
  const SubscriptionPlansRecordDocumentEquality();

  @override
  bool equals(SubscriptionPlansRecord? e1, SubscriptionPlansRecord? e2) {
    const listEquality = ListEquality();
    return e1?.planName == e2?.planName &&
        e1?.planDescription == e2?.planDescription &&
        e1?.orderId == e2?.orderId &&
        e1?.planPrice == e2?.planPrice &&
        listEquality.equals(e1?.includes, e2?.includes);
  }

  @override
  int hash(SubscriptionPlansRecord? e) => const ListEquality().hash(
      [e?.planName, e?.planDescription, e?.orderId, e?.planPrice, e?.includes]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionPlansRecord;
}
