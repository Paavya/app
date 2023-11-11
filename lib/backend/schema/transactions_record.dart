import 'dart:async';

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

  // "logo_url" field.
  String? _logoUrl;
  String get logoUrl => _logoUrl ?? '';
  bool hasLogoUrl() => _logoUrl != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _merchantName = snapshotData['merchant_name'] as String?;
    _isoCurrencyCode = snapshotData['iso_currency_code'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _expense = snapshotData['expense'] as bool?;
    _logoUrl = snapshotData['logo_url'] as String?;
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
  String? logoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'merchant_name': merchantName,
      'iso_currency_code': isoCurrencyCode,
      'amount': amount,
      'expense': expense,
      'logo_url': logoUrl,
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
        e1?.logoUrl == e2?.logoUrl;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.merchantName,
        e?.isoCurrencyCode,
        e?.amount,
        e?.expense,
        e?.logoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
