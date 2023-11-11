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

  // "budgetGoals" field.
  List<DocumentReference>? _budgetGoals;
  List<DocumentReference> get budgetGoals => _budgetGoals ?? const [];
  bool hasBudgetGoals() => _budgetGoals != null;

  void _initializeFields() {
    _budgetGoals = getDataList(snapshotData['budgetGoals']);
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

Map<String, dynamic> createBudgetRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class BudgetRecordDocumentEquality implements Equality<BudgetRecord> {
  const BudgetRecordDocumentEquality();

  @override
  bool equals(BudgetRecord? e1, BudgetRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.budgetGoals, e2?.budgetGoals);
  }

  @override
  int hash(BudgetRecord? e) => const ListEquality().hash([e?.budgetGoals]);

  @override
  bool isValidKey(Object? o) => o is BudgetRecord;
}
