import 'package:cfl/api/api_services.dart';
import 'package:cfl/controllers/reference_controller.dart';
import 'package:cfl/screens/authentication/kyc/kyc_info.dart';
import 'package:cfl/screens/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../tnc-privacy/terms_and_condition.dart';

class ReferenceContact extends StatelessWidget {
  final ReferenceController cont = Get.put(ReferenceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 4),
            Obx(
              () => cont.listContact.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: cont.listContact.length,
                      controller: cont.scrollController,
                      padding: const EdgeInsets.only(top: 17),
                      itemBuilder: (context, index) {
                        return ContactView(
                          contact: cont.listContact[index],
                          index: index,
                          list: cont.listContact,
                        );
                      },
                    )
                  : const SizedBox(),
            ),
            _buildContactForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff365EF1), Color(0xff2799EB)],
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(25, 80, 25, 60),
        child: Text(
          'Emergency Contact',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Column(
      children: [
        contactWidget(cont.nameController, cont.relationController,
            cont.contactController, context),
        const SizedBox(height: 10),
        _buildAddMoreButton(context),
        const SizedBox(height: 25),
        _buildSubmitButton(),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget _buildAddMoreButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 26.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              if (_isContactInfoValid()) {
                cont.listContact.add(Contact(
                  relation: cont.relationController.text,
                  name: cont.nameController.text,
                  phone: cont.contactController.text,
                ));
                _clearContactInfo();
              }
            },
            child: Text(
              'Add More',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                decoration: TextDecoration.underline,
                decorationColor: _isContactInfoValid()
                    ? Color(0xff1965F2)
                    : Color(0x801965f2),
                color: _isContactInfoValid()
                    ? Color(0xff1965F2)
                    : Color(0x801965f2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 25),
        Obx(
          () => Opacity(
            opacity: _isSubmitButtonEnabled() ? 1 : 0.6,
            child: InkWell(
              onTap: () async {
                if (_isSubmitButtonEnabled()) {
                  await _saveContacts();
                }
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(33, 12, 33, 12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff2799EB), Color(0xff1354D1)],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Submit',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool _isContactInfoValid() {
    return cont.relationController.text.isNotEmpty &&
        cont.nameController.text.isNotEmpty &&
        cont.contactController.text.length == 10;
  }

  void _clearContactInfo() {
    cont.relationController.clear();
    cont.nameController.clear();
    cont.contactController.clear();
  }

  bool _isSubmitButtonEnabled() {
    return cont.listContact.isNotEmpty || _isContactInfoValid();
  }

  Future<void> _saveContacts() async {
    try {
      List<Contact> contactsToSave = cont.listContact.isNotEmpty
          ? cont.listContact
          : [
              Contact(
                relation: cont.relationController.text,
                name: cont.nameController.text,
                phone: cont.contactController.text,
              )
            ];
      if (cont.listContact.isNotEmpty &&
          cont.relationController.text.isNotEmpty &&
          cont.nameController.text.isNotEmpty &&
          cont.contactController.text.length == 10) {
        contactsToSave.add(Contact(
          relation: cont.relationController.text,
          name: cont.nameController.text,
          phone: cont.contactController.text,
        ));
      }
      Map<String, dynamic> response =
          await APIServices.saveEmergencyContacts(contactsToSave);
      print(response);
      _clearContactInfo();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (response['message'] == 'Contacts updated successfully!') {
        prefs.setBool('isLoggedIn', true);

        Get.offAll(() => MainScreen());
      }
      // Navigate to Terms and Conditions page
      // Get.off(() => TermsAndConditions());
      // Get.off(() => KYCInfo());
    } catch (e) {
      print('Error saving contacts: $e');
      // Handle error appropriately
    }
  }

  Widget contactWidget(
    TextEditingController nameController,
    TextEditingController relationController,
    TextEditingController contactController,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel('Relationship'),
          const SizedBox(height: 7),
          _buildRelationshipField(context),
          const SizedBox(height: 15),
          _buildLabel('Name'),
          const SizedBox(height: 7),
          _buildTextField(
            controller: nameController,
            hintText: 'Enter the name of the contact',
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))
            ],
          ),
          const SizedBox(height: 15),
          _buildLabel('Phone'),
          const SizedBox(height: 7),
          _buildTextField(
            controller: contactController,
            hintText: 'Enter phone number',
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              LengthLimitingTextInputFormatter(10)
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: const Color(0xff333B63),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildRelationshipField(BuildContext context) {
    return InkWell(
      onTap: () {
        _showRelationshipBottomSheet(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: const Color(0xd304ffe),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                enabled: false,
                controller: cont.relationController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Select type of Relationship',
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 14, color: const Color(0x73333b63)),
                ),
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
              ),
            ),
            const Icon(
              CupertinoIcons.chevron_down,
              color: Color(0xff323232),
            ),
          ],
        ),
      ),
    );
  }

  void _showRelationshipBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Select type of Relationship',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              _buildRelationshipOption(context, 'Parents'),
              _buildRelationshipOption(context, 'Child'),
              _buildRelationshipOption(context, 'Sibling'),
              _buildRelationshipOption(context, 'Spouse'),
              _buildRelationshipOption(context, 'Aunt/Uncle'),
              _buildRelationshipOption(context, 'Niece/Nephew'),
              _buildRelationshipOption(context, 'Cousin'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRelationshipOption(BuildContext context, String relationship) {
    return ListTile(
      title: Text(
        relationship,
        style: GoogleFonts.poppins(fontSize: 18),
      ),
      onTap: () {
        cont.relationController.text = relationship;
        Navigator.pop(context);
      },
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required String hintText,
      List<TextInputFormatter>? inputFormatters,
      TextInputType keyboardType = TextInputType.text,
      FocusNode? focusNode}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: const Color(0xd304ffe),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        onChanged: (value) {
          if (value.length == 10) {}
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle:
              GoogleFonts.poppins(fontSize: 14, color: const Color(0x735c6371)),
        ),
        style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
      ),
    );
  }
}
