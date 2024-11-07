import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AsistenciasRecord extends FirestoreRecord {
  AsistenciasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "profesorID" field.
  String? _profesorID;
  String get profesorID => _profesorID ?? '';
  bool hasProfesorID() => _profesorID != null;

  // "horaGenerada" field.
  DateTime? _horaGenerada;
  DateTime? get horaGenerada => _horaGenerada;
  bool hasHoraGenerada() => _horaGenerada != null;

  // "evento_id" field.
  String? _eventoId;
  String get eventoId => _eventoId ?? '';
  bool hasEventoId() => _eventoId != null;

  // "confirmados" field.
  List<String>? _confirmados;
  List<String> get confirmados => _confirmados ?? const [];
  bool hasConfirmados() => _confirmados != null;

  void _initializeFields() {
    _profesorID = snapshotData['profesorID'] as String?;
    _horaGenerada = snapshotData['horaGenerada'] as DateTime?;
    _eventoId = snapshotData['evento_id'] as String?;
    _confirmados = getDataList(snapshotData['confirmados']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Asistencias');

  static Stream<AsistenciasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AsistenciasRecord.fromSnapshot(s));

  static Future<AsistenciasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AsistenciasRecord.fromSnapshot(s));

  static AsistenciasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AsistenciasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AsistenciasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AsistenciasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AsistenciasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AsistenciasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAsistenciasRecordData({
  String? profesorID,
  DateTime? horaGenerada,
  String? eventoId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'profesorID': profesorID,
      'horaGenerada': horaGenerada,
      'evento_id': eventoId,
    }.withoutNulls,
  );

  return firestoreData;
}

class AsistenciasRecordDocumentEquality implements Equality<AsistenciasRecord> {
  const AsistenciasRecordDocumentEquality();

  @override
  bool equals(AsistenciasRecord? e1, AsistenciasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.profesorID == e2?.profesorID &&
        e1?.horaGenerada == e2?.horaGenerada &&
        e1?.eventoId == e2?.eventoId &&
        listEquality.equals(e1?.confirmados, e2?.confirmados);
  }

  @override
  int hash(AsistenciasRecord? e) => const ListEquality()
      .hash([e?.profesorID, e?.horaGenerada, e?.eventoId, e?.confirmados]);

  @override
  bool isValidKey(Object? o) => o is AsistenciasRecord;
}
