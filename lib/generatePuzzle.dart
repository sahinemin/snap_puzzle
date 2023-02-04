import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:snap_puzzle/PuzzlePiece.dart';
import 'package:path_provider/path_provider.dart';
import 'profilescreen.dart';
import 'SolvePuzzle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'chat.dart';

class GeneratePuzzle extends StatefulWidget {
  final String imageUrl;
  GeneratePuzzle({Key key, this.imageUrl});

  @override
  _GeneratePuzzleState createState() => _GeneratePuzzleState();
}

class _GeneratePuzzleState extends State<GeneratePuzzle> {
  final int rows = dif;
  final int cols = dif;

  File _image;
  List<Widget> pieces = [];
  bool downloading = true;
  var dir;
  var path;

  void initState() {
    super.initState();

    downloadImage();
  }

  Future<void> downloadImage() async {
    Dio dio = new Dio();

    try {
      dir = await getApplicationDocumentsDirectory();
      path = '${dir.path}/myimage.jpg';
      print(dir);
      await dio.download(
        widget.imageUrl,
        path,
        onReceiveProgress: (count, total) {
          print(count / total);
          setState(() {
            downloading = true;
          });
        },
      );
      setState(() async {
        downloading = false;
        _image = File(path);
        pieces.clear();
        splitImage(Image.file(File(path)));
      });
    } catch (e) {
      //print(e.toString());
    }
  }

  // we need to find out the image size, to be used in the PuzzlePiece widget
  Future<Size> getImageSize(Image image) async {
    final Completer<Size> completer = Completer<Size>();
    image.image
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(Size(
        info.image.width.toDouble(),
        info.image.height.toDouble(),
      ));
    }));
    final Size imageSize = await completer.future;

    return imageSize;
  }

  // here we will split the image into small pieces using the rows and columns defined above; each piece will be added to a stack
  void splitImage(Image image) async {
    Size imageSize = await getImageSize(image);

    for (int x = 0; x < rows; x++) {
      for (int y = 0; y < cols; y++) {
        setState(() {
          pieces.add(PuzzlePiece(
              key: GlobalKey(),
              image: image,
              imageSize: imageSize,
              row: x,
              col: y,
              maxRow: rows,
              maxCol: cols,
              bringToTop: this.bringToTop,
              sendToBack: this.sendToBack));
        });
      }
    }
  }

  // when the pan of a piece starts, we need to bring it to the front of the stack
  void bringToTop(Widget widget) {
    setState(() {
      pieces.remove(widget);
      pieces.add(widget);
    });
  }

  // when a piece reaches its final position, it will be sent to the back of the stack to not get in the way of other, still movable, pieces
  void sendToBack(Widget widget) {
    setState(() {
      pieces.remove(widget);
      pieces.insert(0, widget);
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(rows.toString()+"sdadsa");
    //print(cols.toString()+"asdads");
    //print((rows*cols).toString()+"asdsda");
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: SafeArea(
        child: (control < (rows * cols))
            ? new Center(
                child: _image == null
                    ? new CircularProgressIndicator()
                    : Stack(children: pieces))
            : Column(
                children: [
                  FittedBox(
                      child: Image(
                    image: FileImage(File(path)),
                  )),
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: MaterialButton(
                        height: 37.5,
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.arrow_back,
                          size: 37.5,
                          color: Colors.white,
                          //  color: Colors.white,
                        ),
                        color: Colors.green[400],
                        visualDensity:
                            VisualDensity(horizontal: 4, vertical: 4),
                        onPressed: () async {
                          ProfileScreen.userscore += 5;
                          await updateUserData();
                          print(dex.toString());
                          FirebaseFirestore.instance
                              .collection('Chat')
                              .doc(k)
                              .collection("Messages")
                              .doc(dex.toString())
                              .set({'isencrypted': false},
                                  SetOptions(merge: true));
                          int count = 0;
                          control = 0;
                          Navigator.of(context).popUntil((_) => count++ >= 2);
                        }),
                  )
                ],
              ),
      ),
    );
  }
}
