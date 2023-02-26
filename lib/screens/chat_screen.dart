import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/services/asset_manager.dart';
import 'package:chatgpt/widgets/chat_widget.dart';
import 'package:chatgpt/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTyping = true;
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        leading: Padding(
            padding: EdgeInsets.all(8),
            child: Image.asset(AssetsManager.openaiLogo)),
        title: const Text('Chat GPT'),
        actions: [
          IconButton(
            onPressed: () async {
              await Services.showModalSheet(context: context);
            },
            icon: Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: Column(children: [
        Flexible(
          child: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              // return Text('data');
              return ChatWidget(
                msg: chatMessages[index]['msg'].toString(),
                chatIndex:
                    int.parse(chatMessages[index]['chatIndex'].toString()),
              );
            },
          ),
        ),
        if (_isTyping) ...[
          const SpinKitThreeBounce(
            color: Colors.white,
            size: 18,
          ),
          SizedBox(
            height: 15,
          ),
          Material(
            color: cardColor,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: textEditingController,
                      onSubmitted: (value) {},
                      decoration: InputDecoration.collapsed(
                          hintText: 'How can I help you',
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          )
        ]
      ]),
    );
  }
}
