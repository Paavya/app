import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BudgetsRecord extends FirestoreRecord {
  BudgetsRecord._(
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

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "frequency" field.
  List<String>? _frequency;
  List<String> get frequency => _frequency ?? const [];
  bool hasFrequency() => _frequency != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "category_color" field.
  Color? _categoryColor;
  Color? get categoryColor => _categoryColor;
  bool hasCategoryColor() => _categoryColor != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _frequency = getDataList(snapshotData['frequency']);
    _image = snapshotData['image'] as String?;
    _categoryColor = getSchemaColor(snapshotData['category_color']);
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('budgets');

  static Stream<BudgetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BudgetsRecord.fromSnapshot(s));

  static Future<BudgetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BudgetsRecord.fromSnapshot(s));

  static BudgetsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BudgetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BudgetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BudgetsRecord._(reference, mapFromFirestore(data));

  static BudgetsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      BudgetsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'description': snapshot.data['description'],
          'amount': convertAlgoliaParam(
            snapshot.data['amount'],
            ParamType.double,
            false,
          ),
          'frequency': safeGet(
            () => snapshot.data['frequency'].toList(),
          ),
          'image': snapshot.data['image'],
          'category_color': convertAlgoliaParam(
            snapshot.data['category_color'],
            ParamType.Color,
            false,
          ),
          'category': snapshot.data['category'],
        },
        BudgetsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<BudgetsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'budgets',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'BudgetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BudgetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBudgetsRecordData({
  String? name,
  String? description,
  double? amount,
  String? image,
  Color? categoryColor,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'amount': amount,
      'image': image,
      'category_color': categoryColor,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class BudgetsRecordDocumentEquality implements Equality<BudgetsRecord> {
  const BudgetsRecordDocumentEquality();

  @override
  bool equals(BudgetsRecord? e1, BudgetsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.amount == e2?.amount &&
        listEquality.equals(e1?.frequency, e2?.frequency) &&
        e1?.image == e2?.image &&
        e1?.categoryColor == e2?.categoryColor &&
        e1?.category == e2?.category;
  }

  @override
  int hash(BudgetsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.amount,
        e?.frequency,
        e?.image,
        e?.categoryColor,
        e?.category
      ]);

  @override
  bool isValidKey(Object? o) => o is BudgetsRecord;
}
