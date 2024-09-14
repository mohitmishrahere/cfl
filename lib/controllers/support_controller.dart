import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SupportCenterController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;

  var messages = <Message>[].obs;

  TextEditingController chatText = TextEditingController();
  TextEditingController nameText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController subjectText = TextEditingController();
  TextEditingController messageText = TextEditingController();

  var isLoading = false.obs;
  final ScrollController scrollController = ScrollController();


  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    init();

    messages.value = [
      Message(content: 'Welcome, I am your virtual assistant.', isUser: false),
      Message(content: 'How can I help you today?', isUser: false, time: '14:00'),
      Message(content: 'Hello! I have a question. How can I record my expenses by date?', isUser: true, time: '14:01'),
      Message(content: 'Response to your request:\nYou can register expenses in the top menu of the homepage.', isUser: false),
      Message(content: 'Enter the purchase information, including the date, etc.', isUser: false, time: '14:03'),
      Message(content: 'OK, thanks a lot.', isUser: true, time: '14:05'),
      Message(content: 'It was a pleasure to accommodate your request. See you soon!', isUser: false, time: '14:06 | Chat Ended'),
    ];
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }

  void addMessage(String text) {
    messages.add(Message(content: text, isUser: true));
  }

  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nameText.text = prefs.getString('name')!.capitalizeFirst!;
    emailText.text = prefs.getString('email')!;
  }
}

class Message {
  final String content;
  final bool isUser;
  final String? time;

  Message({required this.content, required this.isUser, this.time});
}

class ChatBubble extends StatelessWidget {
  final Message message;

  ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: message.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 120,
                ),
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.only(left: 22, right: 22, top: 12, bottom: 12),
                decoration: BoxDecoration(
                  color: message.isUser ? Color(0xff365EF1) : Color(0xd365ef1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.content,
                      style: GoogleFonts.poppins(
                        color: message.isUser ? Colors.white : Color(0xff333B63),
                        fontWeight:FontWeight.w400,
                        fontSize:12
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (message.time != null) ...[
            SizedBox(height: 3),
            Text(
              message.time!,
              style: GoogleFonts.poppins(
                color: Color(0xff333B63),
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
