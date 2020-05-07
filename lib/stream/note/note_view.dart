import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopak/stream/note/note_controller.dart';
import 'package:shopak/stream/note/note_model.dart';

class NoteView extends StatefulWidget {
  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  NoteController noteController = NoteController();
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();

  @override
  void dispose() {
    noteController.dispose();
    _textEditingController.dispose();
    _textEditingController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("note")),
        body: StreamBuilder<Object>(
          stream: noteController.notesStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text("error");
            } else if (!snapshot.hasData) {
              return Text("error");
            } else {
              List<Note> notes = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Flexible(
                      child: ListView.builder(
                        itemCount: notes.length,
                        itemBuilder: (context, positon) {
                          return Container(
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            color: Colors.green,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(notes[positon].title),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: () {
                                        // Note note ;
                                        //     _textEditingController.text,
                                        //     _textEditingController2.text);
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Text(
                                                    "do you want to delete?"),
                                                actions: <Widget>[
                                                  RaisedButton(
                                                    onPressed: () {
                                                      exit(0);
                                                    },
                                                    child: Text("no"),
                                                  ),
                                                  RaisedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      noteController
                                                          .removeNewNote
                                                          .add(notes[positon]);
                                                    },
                                                    child: Text("yes"),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      icon: Icon(Icons.delete),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.remove),
                                    ),
                                    Text(notes[positon].numberOfIteration),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.add),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            // child: Text(notes[positon].title),
                          );
                        },
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "title"),
                      controller: _textEditingController,
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: "number of  iteration"),
                      controller: _textEditingController2,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Note note = Note(_textEditingController.text,
                            _textEditingController2.text);

                        noteController.addNewNote.add(note);
                      },
                      child: Text("add"),
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
