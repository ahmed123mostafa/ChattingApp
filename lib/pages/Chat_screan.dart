import 'package:chatapp/component/chatBubble.dart';
import 'package:chatapp/constants.dart';
import 'package:chatapp/models/model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScrean extends StatelessWidget {
  ChatScrean({super.key});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference message =
      FirebaseFirestore.instance.collection('message');
  TextEditingController controller = TextEditingController();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: message.orderBy(KCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> listmassege = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              listmassege.add(Message.fromjson(snapshot.data!.docs[i]));
            }

            return Scaffold(
                backgroundColor: Colors.grey,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: kPrimaryColor,
                  automaticallyImplyLeading: false,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("images/massage.png"),
                      ),
                      Text(
                        "Chat",
                        style: TextStyle(fontFamily: "Pacifico"),
                      )
                    ],
                  ),
                  centerTitle: true,
                ),
                body: Column(children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: listmassege.length,
                        itemBuilder: (context, index) {
                          return listmassege[index].id == email
                              ? ChatBubble(
                                  message: listmassege[index],
                                )
                              : ChatBubbleforafriend(
                                  message: listmassege[index]);
                        }),
                  ),
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: TextField(
                        controller: controller,
                        onSubmitted: (value) {
                          message.add({
                            "message": value,
                            KCreatedAt: DateTime.now(),
                            "id": email
                          });
                          controller.clear();
                          _controller.animateTo(
                            _controller.position.maxScrollExtent,
                            duration: Duration(seconds: 2),
                            curve: Curves.fastOutSlowIn,
                          );
                        },
                        decoration: InputDecoration(
                            hintText: "Write amessage here",
                            hintStyle: TextStyle(fontFamily: "Pacifico"),
                            suffixIcon: Icon(
                              Icons.send,
                              color: kPrimaryColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: kPrimaryColor))),
                      ))
                ]));
          } else {
            return Center(child: Text("loadin....."));
          }
        });
  }
}
