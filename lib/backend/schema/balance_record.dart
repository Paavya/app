import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BalanceRecord extends FirestoreRecord {
  BalanceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "account_id" field.
  String? _accountId;
  String get accountId => _accountId ?? '';
  bool hasAccountId() => _accountId != null;

  // "available" field.
  double? _available;
  double get available => _available ?? 0.0;
  bool hasAvailable() => _available != null;

  // "current" field.
  double? _current;
  double get current => _current ?? 0.0;
  bool hasCurrent() => _current != null;

  // "iso_currency_code" field.
  String? _isoCurrencyCode;
  String get isoCurrencyCode => _isoCurrencyCode ?? '';
  bool hasIsoCurrencyCode() => _isoCurrencyCode != null;

  // "limit" field.
  double? _limit;
  double get limit => _limit ?? 0.0;
  bool hasLimit() => _limit != null;

  // "unofficial_currency_code" field.
  String? _unofficialCurrencyCode;
  String get unofficialCurrencyCode => _unofficialCurrencyCode ?? '';
  bool hasUnofficialCurrencyCode() => _unofficialCurrencyCode != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "subtype" field.
  String? _subtype;
  String get subtype => _subtype ?? '';
  bool hasSubtype() => _subtype != null;

  void _initializeFields() {
    _accountId = snapshotData['account_id'] as String?;
    _available = castToType<double>(snapshotData['available']);
    _current = castToType<double>(snapshotData['current']);
    _isoCurrencyCode = snapshotData['iso_currency_code'] as String?;
    _limit = castToType<double>(snapshotData['limit']);
    _unofficialCurrencyCode =
        snapshotData['unofficial_currency_code'] as String?;
    _type = snapshotData['type'] as String?;
    _subtype = snapshotData['subtype'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('balance');

  static Stream<BalanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BalanceRecord.fromSnapshot(s));

  static Future<BalanceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BalanceRecord.fromSnapshot(s));

  static BalanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BalanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BalanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BalanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BalanceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BalanceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBalanceRecordData({
  String? accountId,
  double? available,
  double? current,
  String? isoCurrencyCode,
  double? limit,
  String? unofficialCurrencyCode,
  String? type,
  String? subtype,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'account_id': accountId,
      'available': available,
      'current': current,
      'iso_currency_code': isoCurrencyCode,
      'limit': limit,
      'unofficial_currency_code': unofficialCurrencyCode,
      'type': type,
      'subtype': subtype,
    }.withoutNulls,
  );

  return firestoreData;
}

class BalanceRecordDocumentEquality implements Equality<BalanceRecord> {
  const BalanceRecordDocumentEquality();

  @override
  bool equals(BalanceRecord? e1, BalanceRecord? e2) {
    return e1?.accountId == e2?.accountId &&
        e1?.available == e2?.available &&
        e1?.current == e2?.current &&
        e1?.isoCurrencyCode == e2?.isoCurrencyCode &&
        e1?.limit == e2?.limit &&
        e1?.unofficialCurrencyCode == e2?.unofficialCurrencyCode &&
        e1?.type == e2?.type &&
        e1?.subtype == e2?.subtype;
  }

  @override
  int hash(BalanceRecord? e) => const ListEquality().hash([
        e?.accountId,
        e?.available,
        e?.current,
        e?.isoCurrencyCode,
        e?.limit,
        e?.unofficialCurrencyCode,
        e?.type,
        e?.subtype
      ]);

  @override
  bool isValidKey(Object? o) => o is BalanceRecord;
}
