import 'dart:convert';
import 'dart:io';

import 'package:cfl/controllers/reference_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_const.dart';
import 'package:http/http.dart' as http;

class APIServices {
  // 1
  static Future<Map<String, dynamic>> isUserExists(String mobile) async {
    var url = '${APIConstants.BASE_URL}isUserExists';

    var data = {
      "mobile": mobile,
    };

    var body = json.encode(data);

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json', // Set the proper content type
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print('Successfull');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else if (response.statusCode == 404) {
      // Fluttertoast.showToast(msg: response.toString());
      return {'server': 'error'};
    } else if (response.statusCode == 503) {
      // Fluttertoast.showToast(msg: response.toString());
      return {'server': 'error'};
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 2
  static Future<Map<String, dynamic>> login(String mobile, String pwd) async {
    var url = '${APIConstants.BASE_URL}login';

    var data = {"mobile": mobile, "password": pwd};

    var body = json.encode(data);

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json', // Set the proper content type
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print('Successfull');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 3
  static Future<Map<String, dynamic>> signUp(
      String name,
      String email,
      String mobile,
      String dob,
      String fatherName,
      String maritalStatus,
      String qualification,
      String occupation,
      String gender,
      String pwd,
      String referral,
      String spouse) async {
    var url = '${APIConstants.BASE_URL}signup';
    var month = dob.split('/')[1].length == 1
        ? '0${dob.split('/')[1]}'
        : dob.split('/')[1];
    var day = dob.split('/')[0].length == 1
        ? '0${dob.split('/')[0]}'
        : dob.split('/')[0];

    if (qualification == 'graduate and above') {
      qualification = 'graduate';
    }

    if (occupation == 'salaried employee') {
      occupation = 'salaried';
    }

    print(dob.split('/'));
    var data = {
      "name": name,
      "email": email,
      "mobile": mobile,
      "dob": '${dob.split('/')[2]}-$month-$day',
      "father_name": fatherName,
      "marital_status": maritalStatus,
      "qualification_status": qualification,
      "occupation_status": occupation,
      "gender": gender,
      "password": pwd,
      "referral": referral,
      "spouse": spouse,
    };

    var body = json.encode(data);

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json', // Set the proper content type
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print('Successfull');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 4
  static Future<Map<String, dynamic>> saveAddress(
    String residenceAddress,
    String residencePincode,
    String permanentAddress,
    String permanentPincode,
    bool isChecked,
  ) async {
    var url = '${APIConstants.BASE_URL}saveaddress';

    var data = {
      "resident_info": residenceAddress,
      "resident_pincode": residencePincode,
      "isPermanentAddSameAsResident": isChecked,
      "permanent_address": permanentAddress,
      "permanent_pincode": permanentPincode
    };

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');

    var body = json.encode(data);

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        'Content-Type': 'application/json', // Set the proper content type
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print('Successfull');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 5
  static Future<Map<String, dynamic>> saveAadharNumber(
      String aadharNumber) async {
    var url = '${APIConstants.BASE_URL}saveaadhaar';

    var data = {
      "aadharNumber": aadharNumber,
    };

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');

    var body = json.encode(data);

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        'Content-Type': 'application/json', // Set the proper content type
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print('Successfull');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 6
  static Future<Map<String, dynamic>> uploadImage(File imageFile) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${APIConstants.BASE_URL}upload'));

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');

    // Add image file to request
    request.files.add(await http.MultipartFile.fromPath(
      'file', // the field name in the API
      imageFile.path,
      contentType:
          MediaType('image', 'jpeg'), // adjust content type if necessary
    ));

    request.headers.addAll({
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data',
    });

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Image uploaded successfully!');
      // Decode the response
      String responseString = await response.stream.bytesToString();
      Map<String, dynamic> jsonMap = json.decode(responseString);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 404) {
      // Handle 404 error
      print('404 Error: Not Found');
      return {'error': 'Not Found'};
    } else {
      // Handle other errors
      print('Image upload failed with status: ${response.statusCode}');
      print(
          'Image upload failed with status: ${await response.stream.bytesToString()}');
      return {'error': 'Upload Failed'};
    }
  }

  // 7
  static Future<Map<String, dynamic>> saveOccupationInfo(
      bool isBusiness,
      String officeName,
      String officeAddress,
      String pincode,
      String poV) async {
    var url = '${APIConstants.BASE_URL}saveuserbusinessinfo';

    var data = {
      "shopname": officeName,
      "officename": officeName,
      "officeaddress": officeAddress,
      "shopaddress": officeAddress,
      "officepincode": pincode,
      "shoppincode": pincode,
      "proof_of_validation": poV,
    };

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');

    var body = json.encode(data);

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        'Content-Type': 'application/json', // Set the proper content type
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print('Successfull');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 8
  static Future<Map<String, dynamic>> saveSelfie(String selfie) async {
    var url = '${APIConstants.BASE_URL}updateProfileImage';

    var data = {
      "profilepic": selfie,
    };

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');

    var body = json.encode(data);

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        'Content-Type': 'application/json', // Set the proper content type
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print('Successfull');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 9
  static Future<Map<String, dynamic>> getProfile() async {
    var url = '${APIConstants.BASE_URL}profile';

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');

    var response = await http.get(
      Uri.parse(url),
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        'Content-Type': 'application/json', // Set the proper content type
      },
    );

    if (response.statusCode == 200) {
      print('Succes');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap['data']);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 10
  static Future<Map<String, dynamic>> acceptTnC() async {
    var url = '${APIConstants.BASE_URL}accept-terms-conditions';

    var data = {
      "accept_terms": true,
    };

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');

    var body = json.encode(data);

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        'Content-Type': 'application/json', // Set the proper content type
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print('Successfull');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 11
  static Future<Map<String, dynamic>> saveEmergencyContacts(
      List<Contact> contacts) async {
    var url = '${APIConstants.BASE_URL}saveEmergencyContacts';

    var data = {
      "contacts": contacts,
    };

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');

    var body = jsonEncode(data);
    print(body);
    print(contacts);
    // var body = json.encode(data);
    // var body = jsonEncode(contacts.map((contact) => contact.toJson()).toList());

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print('Successful');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 12
  static Future<Map<String, dynamic>> sendMessage(
    String name,
    String email,
    String subject,
    String message,
  ) async {
    var url = '${APIConstants.BASE_URL}contact-us';

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');

    var data = {
      "name": name,
      "email": email,
      "subject": subject,
      "message": message,
    };

    var body = json.encode(data);

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        'Content-Type': 'application/json', // Set the proper content type
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print('Successfull');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 13
  static Future<Map<String, dynamic>> resetPassword(
      String mobile, String pwd) async {
    var url = '${APIConstants.BASE_URL}password-reset';

    var data = {
      "mobile": mobile,
      "password": pwd,
      "confirmPassword": pwd,
    };

    var body = json.encode(data);

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json', // Set the proper content type
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print('Successfull');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 14
  static Future<Map<String, dynamic>> sendOTPForAadharNumber(
      String aadharNumber) async {
    var url = '${APIConstants.BASE_URL}aadhar-requestotp';

    var data = {
      "aadharNumber": aadharNumber,
    };

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');

    var body = json.encode(data);

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        'Content-Type': 'application/json', // Set the proper content type
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print('Successfull');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 15
  static Future<Map<String, dynamic>> verifyOTPForAadharNumber(
      String otp, String requestId) async {
    var url = '${APIConstants.BASE_URL}aadhar-verifyotp';

    var data = {"otp": otp, "requestId": requestId};

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');

    var body = json.encode(data);

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        'Content-Type': 'application/json', // Set the proper content type
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print('Successfull');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 16
  static Future<Map<String, dynamic>> verifyPAN(String pan) async {
    var url = '${APIConstants.BASE_URL}verify-pancard';

    var data = {"pannumber": pan};

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');

    var body = json.encode(data);

    print(token);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        'Content-Type': 'application/json', // Set the proper content type
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print('Successfull');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 17
  static Future<Map<String, dynamic>> addBankAccount(String bankName,
      String accountNumber, String accountHolder, String ifsc) async {
    var url = '${APIConstants.BASE_URL}add-bank';

    var data = {
      "bankName": bankName,
      "accountNumber": accountNumber,
      "accountHolderName": accountHolder,
      "ifscCode": ifsc
    };

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');

    var body = json.encode(data);

    print(token);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        'Content-Type': 'application/json', // Set the proper content type
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print('Successfull');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 18
  static Future<Map<String, dynamic>> getBankAccount() async {
    var url = '${APIConstants.BASE_URL}user-bank-accounts';

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');

    print(token);
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        'Content-Type': 'application/json', // Set the proper content type
      },
    );

    if (response.statusCode == 200) {
      print('Successfull');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 19
  static Future<Map<String, dynamic>> getLoanLimit() async {
    var url = '${APIConstants.BASE_URL}get-loan-limit';

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');

    print(token);
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        'Content-Type': 'application/json', // Set the proper content type
      },
    );

    if (response.statusCode == 200) {
      print('Successfull');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }

  // 20
  static Future<Map<String, dynamic>> requestLoan(int loanAmount,
      String bankAccountId, String tenure, String remarks) async {
    var url = '${APIConstants.BASE_URL}request-loan';

    var data = {
      "loanAmount": loanAmount,
      "bankAccount": bankAccountId,
      "tenureDays": tenure,
      "user_remarks": remarks
    };

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');

    var body = json.encode(data);

    print(token);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        'Content-Type': 'application/json', // Set the proper content type
      },
      body: body
    );

    if (response.statusCode == 200) {
      print('Successfull');
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap;
    } else if (response.statusCode == 401) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      print('Response body: ${response.body}');
      return json.decode(response.body);
    }
  }
}
