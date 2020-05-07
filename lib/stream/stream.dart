import 'package:flutter/material.dart';
import 'package:shopak/stream/note/note_controller.dart';
import 'package:shopak/stream/note/note_model.dart';
import 'package:shopak/stream/stream_controller.dart';

class StreamTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamClass(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightGreen,
      ),
    );
  }
}

class StreamClass extends StatefulWidget {
  @override
  _StreamClassState createState() => _StreamClassState();
}

class _StreamClassState extends State<StreamClass> {
  TickerController tickerController = TickerController();
  int ticker = 0;

  NoteController noteController = NoteController();

  // TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();

  @override
  void dispose() {
    noteController.dispose();
    // _textEditingController.dispose();
    _textEditingController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("stream"),
        ),
        body: StreamBuilder(
          // stream: noteController.streamNotes,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text("error");
            } else if (!snapshot.hasData) {
              return Text("error");
            }
            List<Note> notes = snapshot.data;
            return Container(
              // color: Colors.orangeAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(snapshot.data.toString()),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          tickerController.streamFirstDuration
                              .add(snapshot.data);
                        },
                        child: Icon(Icons.add),
                      ),
                      RaisedButton(
                        onPressed: () {
                          tickerController.streamSecondDuration
                              .add(snapshot.data);
                        },
                        child: Icon(Icons.remove),
                      ),
                    ],
                  ),
                  // RaisedButton(
                  //   onPressed: () {
                  //     tickerController.restore.add(snapshot.data);
                  //   },
                  //   child: Icon(Icons.restore),
                  // ),
                ],
              ),
            );
          },
        ));
  }
}
