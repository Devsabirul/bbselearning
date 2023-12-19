import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bbselearning/models/questionpapers_model.dart';
import 'package:get/get.dart';

class QuestionPapersController extends GetxController {
  RxString category = "".obs;
  RxInt questionACLength = 0.obs;
  RxInt questionEconomicLength = 0.obs;
  RxInt questionManageLength = 0.obs;
  RxInt questionBanglaLength = 0.obs;
  RxInt noticboardLength = 0.obs;
  RxInt blogsLength = 0.obs;
  RxInt teachersLength = 0.obs;
  RxInt topicslength = 0.obs;

  List<QuestionPapersModel> questionPapersList = [];

  Future<List<QuestionPapersModel>?> getquestionpapers() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('questionpapers')
          .where('category', isEqualTo: category.value)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;
          QuestionPapersModel questionPapersModel =
              QuestionPapersModel.fromMap(data);
          questionPapersList.add(questionPapersModel);
        }
        return questionPapersList;
      }

      return null;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<QuestionPapersModel?> getQuestionPaperById(String documentId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('questionpapers')
          .doc(documentId)
          .get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        return QuestionPapersModel.fromMap(data);
      } else {
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }

  Future<void> topicsLength() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('questionpapers').get();
    topicslength.value = querySnapshot.docs.length;
  }

  Future<void> getLength(String category) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('questionpapers')
          .where('category', isEqualTo: category)
          .get();

      if (category == "accounting") {
        questionACLength.value = querySnapshot.docs.length;
      } else if (category == "economics") {
        questionEconomicLength.value = querySnapshot.docs.length;
      } else if (category == "management") {
        questionManageLength.value = querySnapshot.docs.length;
      } else if (category == "compulsory") {
        questionBanglaLength.value = querySnapshot.docs.length;
      }
    } catch (e) {
      return null;
    }
  }
}
