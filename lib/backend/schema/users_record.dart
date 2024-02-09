import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "birthDate" field.
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  bool hasBirthDate() => _birthDate != null;

  // "birthTime" field.
  DateTime? _birthTime;
  DateTime? get birthTime => _birthTime;
  bool hasBirthTime() => _birthTime != null;

  // "birthPlace" field.
  String? _birthPlace;
  String get birthPlace => _birthPlace ?? '';
  bool hasBirthPlace() => _birthPlace != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "sunSign" field.
  String? _sunSign;
  String get sunSign => _sunSign ?? '';
  bool hasSunSign() => _sunSign != null;

  // "moonSign" field.
  String? _moonSign;
  String get moonSign => _moonSign ?? '';
  bool hasMoonSign() => _moonSign != null;

  // "ascendantSign" field.
  String? _ascendantSign;
  String get ascendantSign => _ascendantSign ?? '';
  bool hasAscendantSign() => _ascendantSign != null;

  // "elementSign" field.
  String? _elementSign;
  String get elementSign => _elementSign ?? '';
  bool hasElementSign() => _elementSign != null;

  // "birthChart" field.
  String? _birthChart;
  String get birthChart => _birthChart ?? '';
  bool hasBirthChart() => _birthChart != null;

  // "day" field.
  int? _day;
  int get day => _day ?? 0;
  bool hasDay() => _day != null;

  // "month" field.
  int? _month;
  int get month => _month ?? 0;
  bool hasMonth() => _month != null;

  // "year" field.
  int? _year;
  int get year => _year ?? 0;
  bool hasYear() => _year != null;

  // "hour" field.
  int? _hour;
  int get hour => _hour ?? 0;
  bool hasHour() => _hour != null;

  // "min" field.
  int? _min;
  int get min => _min ?? 0;
  bool hasMin() => _min != null;

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  bool hasLat() => _lat != null;

  // "long" field.
  double? _long;
  double get long => _long ?? 0.0;
  bool hasLong() => _long != null;

  // "tZone" field.
  double? _tZone;
  double get tZone => _tZone ?? 0.0;
  bool hasTZone() => _tZone != null;

  // "zodiacNumber" field.
  int? _zodiacNumber;
  int get zodiacNumber => _zodiacNumber ?? 0;
  bool hasZodiacNumber() => _zodiacNumber != null;

  // "currentHouse" field.
  List<int>? _currentHouse;
  List<int> get currentHouse => _currentHouse ?? const [];
  bool hasCurrentHouse() => _currentHouse != null;

  // "verbalLocation" field.
  List<String>? _verbalLocation;
  List<String> get verbalLocation => _verbalLocation ?? const [];
  bool hasVerbalLocation() => _verbalLocation != null;

  // "currentZodiac" field.
  List<String>? _currentZodiac;
  List<String> get currentZodiac => _currentZodiac ?? const [];
  bool hasCurrentZodiac() => _currentZodiac != null;

  // "lordOfZodiac" field.
  List<String>? _lordOfZodiac;
  List<String> get lordOfZodiac => _lordOfZodiac ?? const [];
  bool hasLordOfZodiac() => _lordOfZodiac != null;

  // "lordZodiacLocation" field.
  List<String>? _lordZodiacLocation;
  List<String> get lordZodiacLocation => _lordZodiacLocation ?? const [];
  bool hasLordZodiacLocation() => _lordZodiacLocation != null;

  // "lordHouseLocation" field.
  List<int>? _lordHouseLocation;
  List<int> get lordHouseLocation => _lordHouseLocation ?? const [];
  bool hasLordHouseLocation() => _lordHouseLocation != null;

  // "personalisedPrediction" field.
  List<String>? _personalisedPrediction;
  List<String> get personalisedPrediction =>
      _personalisedPrediction ?? const [];
  bool hasPersonalisedPrediction() => _personalisedPrediction != null;

  // "lordStrength" field.
  List<String>? _lordStrength;
  List<String> get lordStrength => _lordStrength ?? const [];
  bool hasLordStrength() => _lordStrength != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "birthCountry" field.
  String? _birthCountry;
  String get birthCountry => _birthCountry ?? '';
  bool hasBirthCountry() => _birthCountry != null;

  // "birthState" field.
  String? _birthState;
  String get birthState => _birthState ?? '';
  bool hasBirthState() => _birthState != null;

  // "subscriptionPlan" field.
  String? _subscriptionPlan;
  String get subscriptionPlan => _subscriptionPlan ?? '';
  bool hasSubscriptionPlan() => _subscriptionPlan != null;

  // "notificationAll" field.
  bool? _notificationAll;
  bool get notificationAll => _notificationAll ?? false;
  bool hasNotificationAll() => _notificationAll != null;

  // "dtsEmail" field.
  bool? _dtsEmail;
  bool get dtsEmail => _dtsEmail ?? false;
  bool hasDtsEmail() => _dtsEmail != null;

  // "dtsPush" field.
  bool? _dtsPush;
  bool get dtsPush => _dtsPush ?? false;
  bool hasDtsPush() => _dtsPush != null;

  // "sEmail" field.
  bool? _sEmail;
  bool get sEmail => _sEmail ?? false;
  bool hasSEmail() => _sEmail != null;

  // "sPush" field.
  bool? _sPush;
  bool get sPush => _sPush ?? false;
  bool hasSPush() => _sPush != null;

  // "mEmail" field.
  bool? _mEmail;
  bool get mEmail => _mEmail ?? false;
  bool hasMEmail() => _mEmail != null;

  // "cEmail" field.
  bool? _cEmail;
  bool get cEmail => _cEmail ?? false;
  bool hasCEmail() => _cEmail != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "subscriptionStart" field.
  DateTime? _subscriptionStart;
  DateTime? get subscriptionStart => _subscriptionStart;
  bool hasSubscriptionStart() => _subscriptionStart != null;

  // "subscriptionEnd" field.
  DateTime? _subscriptionEnd;
  DateTime? get subscriptionEnd => _subscriptionEnd;
  bool hasSubscriptionEnd() => _subscriptionEnd != null;

  // "selectedPlan" field.
  DocumentReference? _selectedPlan;
  DocumentReference? get selectedPlan => _selectedPlan;
  bool hasSelectedPlan() => _selectedPlan != null;

  // "cancelSubscription" field.
  bool? _cancelSubscription;
  bool get cancelSubscription => _cancelSubscription ?? false;
  bool hasCancelSubscription() => _cancelSubscription != null;

  // "svgContent" field.
  String? _svgContent;
  String get svgContent => _svgContent ?? '';
  bool hasSvgContent() => _svgContent != null;

  // "needAdmin" field.
  bool? _needAdmin;
  bool get needAdmin => _needAdmin ?? false;
  bool hasNeedAdmin() => _needAdmin != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _lastName = snapshotData['lastName'] as String?;
    _birthDate = snapshotData['birthDate'] as DateTime?;
    _birthTime = snapshotData['birthTime'] as DateTime?;
    _birthPlace = snapshotData['birthPlace'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _sunSign = snapshotData['sunSign'] as String?;
    _moonSign = snapshotData['moonSign'] as String?;
    _ascendantSign = snapshotData['ascendantSign'] as String?;
    _elementSign = snapshotData['elementSign'] as String?;
    _birthChart = snapshotData['birthChart'] as String?;
    _day = castToType<int>(snapshotData['day']);
    _month = castToType<int>(snapshotData['month']);
    _year = castToType<int>(snapshotData['year']);
    _hour = castToType<int>(snapshotData['hour']);
    _min = castToType<int>(snapshotData['min']);
    _lat = castToType<double>(snapshotData['lat']);
    _long = castToType<double>(snapshotData['long']);
    _tZone = castToType<double>(snapshotData['tZone']);
    _zodiacNumber = castToType<int>(snapshotData['zodiacNumber']);
    _currentHouse = getDataList(snapshotData['currentHouse']);
    _verbalLocation = getDataList(snapshotData['verbalLocation']);
    _currentZodiac = getDataList(snapshotData['currentZodiac']);
    _lordOfZodiac = getDataList(snapshotData['lordOfZodiac']);
    _lordZodiacLocation = getDataList(snapshotData['lordZodiacLocation']);
    _lordHouseLocation = getDataList(snapshotData['lordHouseLocation']);
    _personalisedPrediction =
        getDataList(snapshotData['personalisedPrediction']);
    _lordStrength = getDataList(snapshotData['lordStrength']);
    _gender = snapshotData['gender'] as String?;
    _birthCountry = snapshotData['birthCountry'] as String?;
    _birthState = snapshotData['birthState'] as String?;
    _subscriptionPlan = snapshotData['subscriptionPlan'] as String?;
    _notificationAll = snapshotData['notificationAll'] as bool?;
    _dtsEmail = snapshotData['dtsEmail'] as bool?;
    _dtsPush = snapshotData['dtsPush'] as bool?;
    _sEmail = snapshotData['sEmail'] as bool?;
    _sPush = snapshotData['sPush'] as bool?;
    _mEmail = snapshotData['mEmail'] as bool?;
    _cEmail = snapshotData['cEmail'] as bool?;
    _password = snapshotData['password'] as String?;
    _subscriptionStart = snapshotData['subscriptionStart'] as DateTime?;
    _subscriptionEnd = snapshotData['subscriptionEnd'] as DateTime?;
    _selectedPlan = snapshotData['selectedPlan'] as DocumentReference?;
    _cancelSubscription = snapshotData['cancelSubscription'] as bool?;
    _svgContent = snapshotData['svgContent'] as String?;
    _needAdmin = snapshotData['needAdmin'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? photoUrl,
  String? uid,
  String? lastName,
  DateTime? birthDate,
  DateTime? birthTime,
  String? birthPlace,
  String? displayName,
  DateTime? createdTime,
  String? phoneNumber,
  String? sunSign,
  String? moonSign,
  String? ascendantSign,
  String? elementSign,
  String? birthChart,
  int? day,
  int? month,
  int? year,
  int? hour,
  int? min,
  double? lat,
  double? long,
  double? tZone,
  int? zodiacNumber,
  String? gender,
  String? birthCountry,
  String? birthState,
  String? subscriptionPlan,
  bool? notificationAll,
  bool? dtsEmail,
  bool? dtsPush,
  bool? sEmail,
  bool? sPush,
  bool? mEmail,
  bool? cEmail,
  String? password,
  DateTime? subscriptionStart,
  DateTime? subscriptionEnd,
  DocumentReference? selectedPlan,
  bool? cancelSubscription,
  String? svgContent,
  bool? needAdmin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'lastName': lastName,
      'birthDate': birthDate,
      'birthTime': birthTime,
      'birthPlace': birthPlace,
      'display_name': displayName,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'sunSign': sunSign,
      'moonSign': moonSign,
      'ascendantSign': ascendantSign,
      'elementSign': elementSign,
      'birthChart': birthChart,
      'day': day,
      'month': month,
      'year': year,
      'hour': hour,
      'min': min,
      'lat': lat,
      'long': long,
      'tZone': tZone,
      'zodiacNumber': zodiacNumber,
      'gender': gender,
      'birthCountry': birthCountry,
      'birthState': birthState,
      'subscriptionPlan': subscriptionPlan,
      'notificationAll': notificationAll,
      'dtsEmail': dtsEmail,
      'dtsPush': dtsPush,
      'sEmail': sEmail,
      'sPush': sPush,
      'mEmail': mEmail,
      'cEmail': cEmail,
      'password': password,
      'subscriptionStart': subscriptionStart,
      'subscriptionEnd': subscriptionEnd,
      'selectedPlan': selectedPlan,
      'cancelSubscription': cancelSubscription,
      'svgContent': svgContent,
      'needAdmin': needAdmin,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.lastName == e2?.lastName &&
        e1?.birthDate == e2?.birthDate &&
        e1?.birthTime == e2?.birthTime &&
        e1?.birthPlace == e2?.birthPlace &&
        e1?.displayName == e2?.displayName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.sunSign == e2?.sunSign &&
        e1?.moonSign == e2?.moonSign &&
        e1?.ascendantSign == e2?.ascendantSign &&
        e1?.elementSign == e2?.elementSign &&
        e1?.birthChart == e2?.birthChart &&
        e1?.day == e2?.day &&
        e1?.month == e2?.month &&
        e1?.year == e2?.year &&
        e1?.hour == e2?.hour &&
        e1?.min == e2?.min &&
        e1?.lat == e2?.lat &&
        e1?.long == e2?.long &&
        e1?.tZone == e2?.tZone &&
        e1?.zodiacNumber == e2?.zodiacNumber &&
        listEquality.equals(e1?.currentHouse, e2?.currentHouse) &&
        listEquality.equals(e1?.verbalLocation, e2?.verbalLocation) &&
        listEquality.equals(e1?.currentZodiac, e2?.currentZodiac) &&
        listEquality.equals(e1?.lordOfZodiac, e2?.lordOfZodiac) &&
        listEquality.equals(e1?.lordZodiacLocation, e2?.lordZodiacLocation) &&
        listEquality.equals(e1?.lordHouseLocation, e2?.lordHouseLocation) &&
        listEquality.equals(
            e1?.personalisedPrediction, e2?.personalisedPrediction) &&
        listEquality.equals(e1?.lordStrength, e2?.lordStrength) &&
        e1?.gender == e2?.gender &&
        e1?.birthCountry == e2?.birthCountry &&
        e1?.birthState == e2?.birthState &&
        e1?.subscriptionPlan == e2?.subscriptionPlan &&
        e1?.notificationAll == e2?.notificationAll &&
        e1?.dtsEmail == e2?.dtsEmail &&
        e1?.dtsPush == e2?.dtsPush &&
        e1?.sEmail == e2?.sEmail &&
        e1?.sPush == e2?.sPush &&
        e1?.mEmail == e2?.mEmail &&
        e1?.cEmail == e2?.cEmail &&
        e1?.password == e2?.password &&
        e1?.subscriptionStart == e2?.subscriptionStart &&
        e1?.subscriptionEnd == e2?.subscriptionEnd &&
        e1?.selectedPlan == e2?.selectedPlan &&
        e1?.cancelSubscription == e2?.cancelSubscription &&
        e1?.svgContent == e2?.svgContent &&
        e1?.needAdmin == e2?.needAdmin;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.lastName,
        e?.birthDate,
        e?.birthTime,
        e?.birthPlace,
        e?.displayName,
        e?.createdTime,
        e?.phoneNumber,
        e?.sunSign,
        e?.moonSign,
        e?.ascendantSign,
        e?.elementSign,
        e?.birthChart,
        e?.day,
        e?.month,
        e?.year,
        e?.hour,
        e?.min,
        e?.lat,
        e?.long,
        e?.tZone,
        e?.zodiacNumber,
        e?.currentHouse,
        e?.verbalLocation,
        e?.currentZodiac,
        e?.lordOfZodiac,
        e?.lordZodiacLocation,
        e?.lordHouseLocation,
        e?.personalisedPrediction,
        e?.lordStrength,
        e?.gender,
        e?.birthCountry,
        e?.birthState,
        e?.subscriptionPlan,
        e?.notificationAll,
        e?.dtsEmail,
        e?.dtsPush,
        e?.sEmail,
        e?.sPush,
        e?.mEmail,
        e?.cEmail,
        e?.password,
        e?.subscriptionStart,
        e?.subscriptionEnd,
        e?.selectedPlan,
        e?.cancelSubscription,
        e?.svgContent,
        e?.needAdmin
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
