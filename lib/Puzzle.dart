import 'package:cloud_firestore/cloud_firestore.dart';

class TextQuiz {
  String type;
  String category;
  String difficulty;
  String desc;
  String sel1;
  String sel2;
  String sel3;
  String sel4;
  String answer;

  TextQuiz(this.type, this.category, this.difficulty, this.desc, this.sel1,
      this.sel2, this.sel3, this.sel4, this.answer);

  void submit() {

    String docName = DateTime.now().millisecondsSinceEpoch.toString();

    var resultsCol = FirebaseFirestore.instance
        .collection('Puzzles')
        .doc(category)
        .collection(type)
        .doc(difficulty)
        .collection('Results');

    resultsCol.doc(docName).set({
      '_createdOn' : FieldValue.serverTimestamp(),
      'desc': desc,
      'sel1': sel1,
      'sel2': sel2,
      'sel3': sel3,
      'sel4': sel4,
      'answer': answer
    }, SetOptions(merge: false)).then((value) {
      print('submit success');
    }).catchError((onError) {
      print('submit error');
    });
    resultsCol.doc('.resultsDoc').set({
      docName : true,
    }, SetOptions(merge: true));
  }
}

class PhotoQuiz {
  String type;
  String category;
  String difficulty;
  String url;
  String answer;

  PhotoQuiz(this.type, this.category, this.difficulty, this.url, this.answer);


  void submit() {
    String docName = DateTime.now().millisecondsSinceEpoch.toString();

    var resultsCol = FirebaseFirestore.instance
        .collection('Puzzles')
        .doc(category)
        .collection(type)
        .doc(difficulty)
        .collection('Results');

    resultsCol.doc(docName).set({
      '_createdOn' : FieldValue.serverTimestamp(),
      'type': type,
      'category': category,
      'difficulty': difficulty,
      'url': url,
      'answer': answer
    }).then((value) {
      print('submit success');
    }).catchError((onError) {
      print('error');
    });

    resultsCol.doc('.resultsDoc').set({
      docName : true,
    }, SetOptions(merge: true));
  }
}

