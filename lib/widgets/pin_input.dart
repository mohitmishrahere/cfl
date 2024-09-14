import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class PinInputWidget extends StatefulWidget {
  @override
  _PinInputWidgetState createState() => _PinInputWidgetState();
}

class _PinInputWidgetState extends State<PinInputWidget> {
  final TextEditingController pinController = TextEditingController(text: '______');
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white
      ),
    );

    final focusedBorderColor = Colors.blue;

    return Pinput(
      length: 6,
      controller: pinController,
      focusNode: focusNode,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      listenForMultipleSmsOnAndroid: true,
      defaultPinTheme: defaultPinTheme,
      separatorBuilder: (index) => const SizedBox(width: 8),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        PinInputFormatter(),
      ],
      validator: (value) {
        return value == '222222' ? null : 'Pin is incorrect';
      },
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: (pin) {
        debugPrint('onCompleted: $pin');
      },
      onChanged: (value) {
        debugPrint('onChanged: $value');
      },
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: focusedBorderColor,
          ),
        ],
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: focusedBorderColor),
          color: Colors.white,
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: focusedBorderColor),
          color: Colors.white,
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: Colors.redAccent),
      ),
    );
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}

class PinInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Handle input replacement for underscores
    String oldText = oldValue.text;
    String newText = newValue.text;

    if (newText.length > oldText.length) {
      // User added a character, replace the first underscore
      int firstUnderscore = oldText.indexOf('_');
      if (firstUnderscore != -1) {
        newText = oldText.replaceRange(firstUnderscore, firstUnderscore + 1, newText.substring(firstUnderscore, firstUnderscore + 1));
      }
    }

    return TextEditingValue(
      text: newText,
      selection: newValue.selection,
    );
  }
}