import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BillsRecord extends FirestoreRecord {
  BillsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "billName" field.
  String? _billName;
  String get billName => _billName ?? '';
  bool hasBillName() => _billName != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "recurring" field.
  bool? _recurring;
  bool get recurring => _recurring ?? false;
  bool hasRecurring() => _recurring != null;

  // "dueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "autoDraft" field.
  bool? _autoDraft;
  bool get autoDraft => _autoDraft ?? false;
  bool hasAutoDraft() => _autoDraft != null;

  // "isTaxdeductible" field.
  bool? _isTaxdeductible;
  bool get isTaxdeductible => _isTaxdeductible ?? false;
  bool hasIsTaxdeductible() => _isTaxdeductible != null;

  void _initializeFields() {
    _billName = snapshotData['billName'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _recurring = snapshotData['recurring'] as bool?;
    _dueDate = snapshotData['dueDate'] as DateTime?;
    _autoDraft = snapshotData['autoDraft'] as bool?;
    _isTaxdeductible = snapshotData['isTaxdeductible'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bills');

  static Stream<BillsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BillsRecord.fromSnapshot(s));

  static Future<BillsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BillsRecord.fromSnapshot(s));

  static BillsRecord fromSnapshot(DocumentSnapshot snapshot) => BillsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BillsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BillsRecord._(reference, mapFromFirestore(data));

  static BillsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      BillsRecord.getDocumentFromData(
        {
          'billName': snapshot.data['billName'],
          'amount': convertAlgoliaParam(
            snapshot.data['amount'],
            ParamType.double,
            false,
          ),
          'recurring': snapshot.data['recurring'],
          'dueDate': convertAlgoliaParam(
            snapshot.data['dueDate'],
            ParamType.DateTime,
            false,
          ),
          'autoDraft': snapshot.data['autoDraft'],
          'isTaxdeductible': snapshot.data['isTaxdeductible'],
        },
        BillsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<BillsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'bills',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'BillsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BillsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBillsRecordData({
  String? billName,
  double? amount,
  bool? recurring,
  DateTime? dueDate,
  bool? autoDraft,
  bool? isTaxdeductible,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'billName': billName,
      'amount': amount,
      'recurring': recurring,
      'dueDate': dueDate,
      'autoDraft': autoDraft,
      'isTaxdeductible': isTaxdeductible,
    }.withoutNulls,
  );

  return firestoreData;
}

class BillsRecordDocumentEquality implements Equality<BillsRecord> {
  const BillsRecordDocumentEquality();

  @override
  bool equals(BillsRecord? e1, BillsRecord? e2) {
    return e1?.billName == e2?.billName &&
        e1?.amount == e2?.amount &&
        e1?.recurring == e2?.recurring &&
        e1?.dueDate == e2?.dueDate &&
        e1?.autoDraft == e2?.autoDraft &&
        e1?.isTaxdeductible == e2?.isTaxdeductible;
  }

  @override
  int hash(BillsRecord? e) => const ListEquality().hash([
        e?.billName,
        e?.amount,
        e?.recurring,
        e?.dueDate,
        e?.autoDraft,
        e?.isTaxdeductible
      ]);

  @override
  bool isValidKey(Object? o) => o is BillsRecord;
}
