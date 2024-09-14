import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';

class ReferenceController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController relationController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final FocusNode focusNodeNumber = FocusNode();
  final FocusNode focusNodeName = FocusNode();
  var isOneContactAdded = false.obs;
  var listContact = <Contact>[].obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
  }
}

class Contact {
  final String relation;
  final String name;
  final String phone;

  Contact({required this.relation, required this.name, required this.phone});

  Map<String, dynamic> toJson() {
    return {
      'relation': relation,
      'name': name,
      'phone': phone,
    };
  }
}

class ContactView extends StatelessWidget {
  final Contact contact;
  final int index;
  final RxList list;

  ContactView({required this.contact, required this.index, required this.list});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 15),
            child: Text(
              'Relationship',
              style: GoogleFonts.poppins(
                  color: Color(0xff333B63),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              height: 48,
              decoration: BoxDecoration(
                  color: Color(0xd304ffe),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    width: 200,
                    child: Text(
                     contact.relation,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                ],
              )),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              'Name',
              style: GoogleFonts.poppins(
                  color: Color(0xff333B63),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              height: 48,
              decoration: BoxDecoration(
                  color: Color(0xd304ffe),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Text(
                    contact.name,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              'Phone',
              style: GoogleFonts.poppins(
                  color: Color(0xff333B63),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              height: 48,
              decoration: BoxDecoration(
                  color: Color(0xd304ffe),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Text(

                   contact.phone,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    list.removeAt(index);
                  },
                  child: Text(
                    'Remove',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xff333B63),
                      color: Color(0xff333B63),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
