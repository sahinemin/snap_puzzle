import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:snap_puzzle/PuzzlePiece.dart';
import 'package:snap_puzzle/SolvePuzzle.dart';
import 'dart:convert';
import 'chat.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:http/http.dart'as http;
import 'package:image_picker_saver/image_picker_saver.dart';



int rows=dif;
int cols=dif;
File _image;
class GeneratePuzzle extends StatefulWidget {
  //final int maxPoints;
  final String url;

  GeneratePuzzle({Key key, this.url})
      : super(key: key);

  @override
  _GeneratePuzzleState createState() => _GeneratePuzzleState();
}


class _GeneratePuzzleState extends State<GeneratePuzzle> {

  File _image;
  List<Widget> pieces = [];

  Future getImage() async {
    var filePath;
    Uri uri;
    uri=Uri.parse(phuri);
    var response = await http.get(uri);
    filePath = await ImagePickerSaver.saveFile(fileData: response.bodyBytes,title: "deneme",description:"simdi");
    print(filePath.toString()+"dasads");


    setState(() {
      _image = File(filePath);
        pieces.clear();
      });
    splitImage(Image.file(File(filePath)));



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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Puzzle'),
      ),
      body: Container(
        child:Center(child: IconButton(icon: Icon(Icons.event),
          onPressed: ()async
          {
            await getImage();
          },
        ),)
      ),
    );
  }
}
