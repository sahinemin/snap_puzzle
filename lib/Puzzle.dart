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
    FirebaseFirestore.instance
        .collection('Puzzles')
        .doc(category).
        set({'name': "süs olsun"});
    FirebaseFirestore.instance
        .collection('Puzzles')
        .doc(category).collection(type).doc(difficulty).
    set({'name': "süs olsun"});
    FirebaseFirestore.instance
        .collection('Puzzles')
        .doc(category)
        .collection(type)
        .doc(difficulty)
        .collection('Results')
        .add({
      'type': type,
      'category': category,
      'difficulty': difficulty,
      'desc': desc,
      'sel1': sel1,
      'sel2': sel2,
      'sel3': sel3,
      'sel4': sel4,
      'answer': answer
    }).then((value) {
      print('submit success');
    }).catchError((onError) {
      print('error');
    });
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
    FirebaseFirestore.instance
        .collection('Puzzles')
        .doc(category).
    set({'name': "süs olsun"});
    FirebaseFirestore.instance
        .collection('Puzzles')
        .doc(category).collection(type).doc(difficulty).
    set({'name': "süs olsun"});
    FirebaseFirestore.instance
        .collection('Puzzles')
        .doc(category)
        .collection(type)
        .doc(difficulty)
        .collection('Results')
        .add({
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
  }
}

class PuzzleQuiz {
  String difficulty;
  String url;

  PuzzleQuiz(this.difficulty, this.url);

  void submit() {
    int a;
    if (difficulty == 'Easy')
      a = 2;
    else if (difficulty == 'Normal')
      a = 3;
    else
      a = 4;
    FirebaseFirestore.instance
        .collection('Puzzles')
        .doc('photo')
        .set({'name': "süs olsun"});
    FirebaseFirestore.instance
        .collection('Puzzles')
        .doc('photo')
        .collection(a.toString())
        .add({'url': url, 'difficulty': a.toString()});
  }
}
