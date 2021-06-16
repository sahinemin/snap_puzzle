import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:snap_puzzle/PuzzlePiece.dart';
import 'dart:convert';

int rows;
int cols;

class GeneratePuzzle extends StatefulWidget {
  final int maxPoints;
  final String difficulty;
  final String url;

   GeneratePuzzle({Key key, this.url, this.difficulty, this.maxPoints}) : super(key: key);

  @override
  _GeneratePuzzleState createState() => _GeneratePuzzleState();
}

class _GeneratePuzzleState extends State<GeneratePuzzle> {

  File _image;
  List<Widget> pieces = [];

  Future getImage(ImageSource source) async {
    var image = await ImagePicker().getImage(source: source);

    if (image != null) {
      setState(() {
        _image = File(image.path);
        pieces.clear();
      });
      splitImage(Image.file(File(image.path)));
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

    rows = int.parse(widget.difficulty);
    cols = int.parse(widget.difficulty);

    for (int x = 0; x < rows; x++) {
      for (int y = 0; y < cols; y++) {
        setState(() {
          pieces.add(PuzzlePiece(key: GlobalKey(),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Puzzle'),
      ),
      body: SafeArea(

        child:control<(rows*cols)? new Center(
            child: _image == null
                ? new Text('No image selected.')
                : Stack(children: pieces)
        ):new Text('Tamamlandı'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          control=0;
          showModalBottomSheet(context: context,
              builder: (BuildContext context) {
                return SafeArea(
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      new ListTile(
                        leading: new Icon(Icons.camera),
                        title: new Text('Camera'),
                        onTap: () {
                          getImage(ImageSource.camera);
                          // this is how you dismiss the modal bottom sheet after making a choice
                          Navigator.pop(context);
                        },
                      ),
                      new ListTile(
                        leading: new Icon(Icons.image),
                        title: new Text('Gallery'),
                        onTap: () {
                          getImage(ImageSource.gallery);
                          // dismiss the modal sheet
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              }
          );
        },
        tooltip: 'New Image',
        child: Icon(Icons.add),
      ),
    );
  }
}




