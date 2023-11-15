import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SavingsGoalsRecord extends FirestoreRecord {
  SavingsGoalsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('savings_goals');

  static Stream<SavingsGoalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SavingsGoalsRecord.fromSnapshot(s));

  static Future<SavingsGoalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SavingsGoalsRecord.fromSnapshot(s));

  static SavingsGoalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SavingsGoalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SavingsGoalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SavingsGoalsRecord._(reference, mapFromFirestore(data));

  static SavingsGoalsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      SavingsGoalsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'description': snapshot.data['description'],
          'image': snapshot.data['image'],
          'amount': convertAlgoliaParam(
            snapshot.data['amount'],
            ParamType.double,
            false,
          ),
          'start_date': convertAlgoliaParam(
            snapshot.data['start_date'],
            ParamType.DateTime,
            false,
          ),
          'end_date': convertAlgoliaParam(
            snapshot.data['end_date'],
            ParamType.DateTime,
            false,
          ),
        },
        SavingsGoalsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<SavingsGoalsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'savings_goals',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'SavingsGoalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SavingsGoalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSavingsGoalsRecordData({
  String? name,
  String? description,
  String? image,
  double? amount,
  DateTime? startDate,
  DateTime? endDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'image': image,
      'amount': amount,
      'start_date': startDate,
      'end_date': endDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class SavingsGoalsRecordDocumentEquality
    implements Equality<SavingsGoalsRecord> {
  const SavingsGoalsRecordDocumentEquality();

  @override
  bool equals(SavingsGoalsRecord? e1, SavingsGoalsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.amount == e2?.amount &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate;
  }

  @override
  int hash(SavingsGoalsRecord? e) => const ListEquality().hash(
      [e?.name, e?.description, e?.image, e?.amount, e?.startDate, e?.endDate]);

  @override
  bool isValidKey(Object? o) => o is SavingsGoalsRecord;
}
