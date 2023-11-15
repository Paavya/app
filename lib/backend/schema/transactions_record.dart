import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "merchant_name" field.
  String? _merchantName;
  String get merchantName => _merchantName ?? '';
  bool hasMerchantName() => _merchantName != null;

  // "iso_currency_code" field.
  String? _isoCurrencyCode;
  String get isoCurrencyCode => _isoCurrencyCode ?? '';
  bool hasIsoCurrencyCode() => _isoCurrencyCode != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "expense" field.
  bool? _expense;
  bool get expense => _expense ?? false;
  bool hasExpense() => _expense != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "merchant_logo" field.
  String? _merchantLogo;
  String get merchantLogo => _merchantLogo ?? '';
  bool hasMerchantLogo() => _merchantLogo != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _merchantName = snapshotData['merchant_name'] as String?;
    _isoCurrencyCode = snapshotData['iso_currency_code'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _expense = snapshotData['expense'] as bool?;
    _date = snapshotData['date'] as DateTime?;
    _time = snapshotData['time'] as DateTime?;
    _category = snapshotData['category'] as String?;
    _merchantLogo = snapshotData['merchant_logo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  static TransactionsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      TransactionsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'merchant_name': snapshot.data['merchant_name'],
          'iso_currency_code': snapshot.data['iso_currency_code'],
          'amount': convertAlgoliaParam(
            snapshot.data['amount'],
            ParamType.double,
            false,
          ),
          'expense': snapshot.data['expense'],
          'date': convertAlgoliaParam(
            snapshot.data['date'],
            ParamType.DateTime,
            false,
          ),
          'time': convertAlgoliaParam(
            snapshot.data['time'],
            ParamType.DateTime,
            false,
          ),
          'category': snapshot.data['category'],
          'merchant_logo': snapshot.data['merchant_logo'],
        },
        TransactionsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TransactionsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'transactions',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  String? name,
  String? merchantName,
  String? isoCurrencyCode,
  double? amount,
  bool? expense,
  DateTime? date,
  DateTime? time,
  String? category,
  String? merchantLogo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'merchant_name': merchantName,
      'iso_currency_code': isoCurrencyCode,
      'amount': amount,
      'expense': expense,
      'date': date,
      'time': time,
      'category': category,
      'merchant_logo': merchantLogo,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.merchantName == e2?.merchantName &&
        e1?.isoCurrencyCode == e2?.isoCurrencyCode &&
        e1?.amount == e2?.amount &&
        e1?.expense == e2?.expense &&
        e1?.date == e2?.date &&
        e1?.time == e2?.time &&
        e1?.category == e2?.category &&
        e1?.merchantLogo == e2?.merchantLogo;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.merchantName,
        e?.isoCurrencyCode,
        e?.amount,
        e?.expense,
        e?.date,
        e?.time,
        e?.category,
        e?.merchantLogo
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
