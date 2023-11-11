import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoalRecord extends FirestoreRecord {
  GoalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "is_monthly" field.
  bool? _isMonthly;
  bool get isMonthly => _isMonthly ?? false;
  bool hasIsMonthly() => _isMonthly != null;

  // "is_weekly" field.
  bool? _isWeekly;
  bool get isWeekly => _isWeekly ?? false;
  bool hasIsWeekly() => _isWeekly != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _isMonthly = snapshotData['is_monthly'] as bool?;
    _isWeekly = snapshotData['is_weekly'] as bool?;
    _color = getSchemaColor(snapshotData['color']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('goal')
          : FirebaseFirestore.instance.collectionGroup('goal');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('goal').doc();

  static Stream<GoalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GoalRecord.fromSnapshot(s));

  static Future<GoalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GoalRecord.fromSnapshot(s));

  static GoalRecord fromSnapshot(DocumentSnapshot snapshot) => GoalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GoalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GoalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GoalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GoalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGoalRecordData({
  String? name,
  double? amount,
  bool? isMonthly,
  bool? isWeekly,
  Color? color,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'amount': amount,
      'is_monthly': isMonthly,
      'is_weekly': isWeekly,
      'color': color,
    }.withoutNulls,
  );

  return firestoreData;
}

class GoalRecordDocumentEquality implements Equality<GoalRecord> {
  const GoalRecordDocumentEquality();

  @override
  bool equals(GoalRecord? e1, GoalRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.amount == e2?.amount &&
        e1?.isMonthly == e2?.isMonthly &&
        e1?.isWeekly == e2?.isWeekly &&
        e1?.color == e2?.color;
  }

  @override
  int hash(GoalRecord? e) => const ListEquality()
      .hash([e?.name, e?.amount, e?.isMonthly, e?.isWeekly, e?.color]);

  @override
  bool isValidKey(Object? o) => o is GoalRecord;
}
