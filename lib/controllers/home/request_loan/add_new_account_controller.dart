import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddNewAccountController extends GetxController {

  var selectedBank = ''.obs;
  var selectedBankController = TextEditingController();
  final List<String> banks = [
    'Axis Bank',
    'Bandhan Bank',
    'Bank of Baroda',
    'Bank of India',
    'Canara Bank',
    'Central Bank of India',
    'City Union Bank',
    'Corporation Bank',
    'Dhanlaxmi Bank',
    'Federal Bank',
    'HDFC Bank',
    'ICICI Bank',
    'IDBI Bank',
    'IDFC First Bank',
    'Indian Bank',
    'Indian Overseas Bank',
    'IndusInd Bank',
    'Jammu & Kashmir Bank',
    'Karnataka Bank',
    'Karur Vysya Bank',
    'Kotak Mahindra Bank',
    'Punjab National Bank',
    'RBL Bank',
    'South Indian Bank',
    'State Bank of India',
    'Syndicate Bank',
    'UCO Bank',
    'Union Bank of India',
    'Yes Bank',
  ];
  TextEditingController ifscController = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController accountHolderName = TextEditingController();
  FocusNode ifscFocusNode = FocusNode();
  var isLoading = false.obs;
}