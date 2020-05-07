import 'dart:async';

import 'package:shopak/stream/disposeable.dart';

import 'note_model.dart';

class NoteController implements Disposeable {
  List<Note> notes;

  final StreamController<List<Note>> _notesController =
      StreamController<List<Note>>();

  Stream<List<Note>> get notesStream => _notesController.stream;

  StreamSink<List<Note>> get notesSinke => _notesController.sink;

  final StreamController<Note> _noteController = StreamController<Note>();

  // Stream<List<Note>> get streamNote => _notesController.stream;
  StreamSink<Note> get addNewNote => _noteController.sink;

  final StreamController<Note> _removeController = StreamController<Note>();

  // Stream<List<Note>> get streamNote => _notesController.stream;
  StreamSink<Note> get removeNewNote => _removeController.sink;

  NoteController() {
    notes = [];
    _notesController.add(notes);
    _noteController.stream.listen(addNote);
    _removeController.stream.listen(removeNote);
  }

  void addNote(Note note) {
    notes.add(note);
    notesSinke.add(notes);
  }

  void removeNote(Note note) {
    notes.remove(note);
    notesSinke.add(notes);
  }

  @override
  void dispose() {
    _notesController.close();
    _noteController.close();
    _removeController.close();
  }
}
