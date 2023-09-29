import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:progetto_m335_flutter/model/promemoria.dart';
import 'package:progetto_m335_flutter/model/note.dart';

class FireDb {

  Future createPromemoria(Promemoria promemoria) async {
    final docPromemoria =
        FirebaseFirestore.instance.collection('promemoria').doc();

    final json = {
      'id': docPromemoria.id,
      'title': promemoria.getTitle(),
      'creationDate': promemoria.getCreationDate(),
      'lastModificationDate': promemoria.getLastModificationDate(),
      'expirationDate': promemoria.getExpirationDate(),
      'arrayPromemoria': promemoria.getArrayPromemoria(),
      'description': promemoria.getDescription(),
      'priority': promemoria.getPriority(),
      'color': promemoria.getColor(),
    };

    await docPromemoria.set(json);
  }

  Future createAllPromemoria(List<Promemoria> promemorias) async {
    for (var promemoria in promemorias) {
      await createPromemoria(promemoria);
    }
  }

  Future createNote(Note note) async {
    final docNote = FirebaseFirestore.instance.collection('note').doc();

    final json = {
      'id': docNote.id,
      'title': note.getTitle(),
      'creationDate': note.getCreationDate(),
      'lastModificationDate': note.getLastModificationDate(),
      'arrayPromemoria': note.getArrayPromemoria(),
      'description': note.getDescription(),
    };

    await docNote.set(json);
  }

  Future createAllNotes(List<Note> notes) async {
    for (var note in notes) {
      await createNote(note);
    }
  }

  Future<List<Promemoria>> readAllPromemoria() async {
    var promemorias =
        await FirebaseFirestore.instance.collection('promemoria').get();

    List<Promemoria> promemoriaList = [];

    for (var promemoria in promemorias.docs) {
      promemoriaList.add(Promemoria.fromJson(promemoria.data()));
    }

    return promemoriaList;
  }

  Future<List<Note>> readAllNotes() async {
    var notes = await FirebaseFirestore.instance.collection('note').get();

    List<Note> noteList = [];

    for (var note in notes.docs) {
      noteList.add(Note.fromJson(note.data()));
    }

    return noteList;
  }

  Future<Note?> readNoteById(String id) async {
    var docNote = await FirebaseFirestore.instance.collection('note').doc(id);
    final snapshot = await docNote.get();

    if (snapshot.exists) {
      return Note.fromJson(snapshot.data()!);
    } else {
      return null;
    }
  }

  Future<Promemoria?> readPromemoriaById(String id) async {
    final docPromemoria =
        await FirebaseFirestore.instance.collection('promemoria').doc(id);
    final snapshot = await docPromemoria.get();

    if (snapshot.exists) {
      return Promemoria.fromJson(snapshot.data()!);
    } else {
      return null;
    }
  }

  /*

  Future updateNote(Note note) async {
    final docNote = FirebaseFirestore.instance.collection('note').doc(note.getId());

    final json = {
      'id': note.getId(),
      'title': note.getTitle(),
      'creationDate': note.getCreationDate(),
      'lastModificationDate': note.getLastModificationDate(),
      'arrayPromemoria': note.getArrayPromemoria(),
      'description': note.getDescription(),
    };

    await docNote.update(json);
  }

  Future updatePromemoria(Promemoria promemoria) async {
    final docPromemoria = FirebaseFirestore.instance.collection('promemoria').doc(promemoria.getId());

    final json = {
      'id': docPromemoria.id,
      'title': promemoria.getTitle(),
      'creationDate': promemoria.getCreationDate(),
      'lastModificationDate': promemoria.getLastModificationDate(),
      'expirationDate': promemoria.getExpirationDate(),
      'arrayPromemoria': promemoria.getArrayPromemoria(),
      'description': promemoria.getDescription(),
      'priority': promemoria.getPriority(),
      'color': promemoria.getColor(),
    };

    await docPromemoria.update(json);
  }

   */

  Future deleteNoteById(String id) async {
    final docNote = FirebaseFirestore.instance.collection('note').doc(id);

    await docNote.delete();
  }

  Future deletePromemoriaById(String id) async {
    final docPromemoria = FirebaseFirestore.instance.collection('promemoria').doc(id);

    await docPromemoria.delete();
  }

  Future deleteAllNotes() async {
    var notes = await FirebaseFirestore.instance.collection('note').get();

    for (var note in notes.docs) {
      await deleteNoteById(note.id);
    }
  }

  Future deleteAllPromemoria() async {
    var promemorias = await FirebaseFirestore.instance.collection('promemoria').get();

    for (var promemoria in promemorias.docs) {
      await deletePromemoriaById(promemoria.id);
    }
  }

}
