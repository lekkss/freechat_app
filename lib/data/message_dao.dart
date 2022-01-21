import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:free_chat_app/data/cyber_service.dart';

import 'cuber_api.dart';
import 'message.dart';

class MessageDao {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('messages');

  void saveMessage(Message message) async {
    CyberApi ca = await CyberService().getPosts(message.text);
    // if (ca.result!.toLowerCase() != "flagged") {
    collection.add({
      ...message.toJson(),
      ...{"flagged": ca.result!.toLowerCase() == "flagged"}
    });
    // } else {
    //   print("Message flagged");
    // }
  }

  Stream<QuerySnapshot> getMessageStream() {
    return collection.orderBy("date").snapshots();
  }
}
