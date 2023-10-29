import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BudgetRecord extends FirestoreRecord {
  BudgetRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "goal_name" field.
  String? _goalName;
  String get goalName => _goalName ?? '';
  bool hasGoalName() => _goalName != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  void _initializeFields() {
    _goalName = snapshotData['goal_name'] as String?;
    _startDate = snapshotData['start_date'] as DateTime?;
    _amount = castToType<int>(snapshotData['amount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('budget');

  static Stream<BudgetRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BudgetRecord.fromSnapshot(s));

  static Future<BudgetRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BudgetRecord.fromSnapshot(s));

  static BudgetRecord fromSnapshot(DocumentSnapshot snapshot) => BudgetRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BudgetRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BudgetRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BudgetRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BudgetRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBudgetRecordData({
  String? goalName,
  DateTime? startDate,
  int? amount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'goal_name': goalName,
      'start_date': startDate,
      'amount': amount,
    }.withoutNulls,
  );

  return firestoreData;
}

class BudgetRecordDocumentEquality implements Equality<BudgetRecord> {
  const BudgetRecordDocumentEquality();

  @override
  bool equals(BudgetRecord? e1, BudgetRecord? e2) {
    return e1?.goalName == e2?.goalName &&
        e1?.startDate == e2?.startDate &&
        e1?.amount == e2?.amount;
  }

  @override
  int hash(BudgetRecord? e) =>
      const ListEquality().hash([e?.goalName, e?.startDate, e?.amount]);

  @override
  bool isValidKey(Object? o) => o is BudgetRecord;
}
