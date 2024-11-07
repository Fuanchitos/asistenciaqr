import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfirmadosRecord extends FirestoreRecord {
  ConfirmadosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "hora" field.
  DateTime? _hora;
  DateTime? get hora => _hora;
  bool hasHora() => _hora != null;

  // "registrado" field.
  bool? _registrado;
  bool get registrado => _registrado ?? false;
  bool hasRegistrado() => _registrado != null;

  // "matricula" field.
  String? _matricula;
  String get matricula => _matricula ?? '';
  bool hasMatricula() => _matricula != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _hora = snapshotData['hora'] as DateTime?;
    _registrado = snapshotData['registrado'] as bool?;
    _matricula = snapshotData['matricula'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Confirmados')
          : FirebaseFirestore.instance.collectionGroup('Confirmados');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Confirmados').doc(id);

  static Stream<ConfirmadosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfirmadosRecord.fromSnapshot(s));

  static Future<ConfirmadosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConfirmadosRecord.fromSnapshot(s));

  static ConfirmadosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConfirmadosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfirmadosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfirmadosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfirmadosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfirmadosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfirmadosRecordData({
  String? email,
  String? displayName,
  DateTime? hora,
  bool? registrado,
  String? matricula,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'hora': hora,
      'registrado': registrado,
      'matricula': matricula,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfirmadosRecordDocumentEquality implements Equality<ConfirmadosRecord> {
  const ConfirmadosRecordDocumentEquality();

  @override
  bool equals(ConfirmadosRecord? e1, ConfirmadosRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.hora == e2?.hora &&
        e1?.registrado == e2?.registrado &&
        e1?.matricula == e2?.matricula;
  }

  @override
  int hash(ConfirmadosRecord? e) => const ListEquality()
      .hash([e?.email, e?.displayName, e?.hora, e?.registrado, e?.matricula]);

  @override
  bool isValidKey(Object? o) => o is ConfirmadosRecord;
}
