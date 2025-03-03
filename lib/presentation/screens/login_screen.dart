import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/my_colors.dart';
import 'package:flutter_maps/constants/strings.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  late String phoneNumber;
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();

  Widget _buildIntroText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What is Your Phone Number?",
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            'Please Enter your phone number to verify your account.',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        )
      ],
    );
  }

  Widget _buildPhoneFormField() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.lightGrey),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Text(
                generateCountryFlag() + ' +20',
                style: TextStyle(fontSize: 18, letterSpacing: 2.0),
              ),
            )),
        SizedBox(
          width: 16,
        ),
        Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.blue),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: TextFormField(
                  autofocus: true,
                  style: TextStyle(fontSize: 18, letterSpacing: 2.0),
                  decoration: InputDecoration(border: InputBorder.none),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number!';
                    } else if (value.length < 11) {
                      return 'Too short for a phone number!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    phoneNumber = value!;
                  }),
            )),
      ],
    );
  }

  String generateCountryFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }

  Widget _buildNextButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, otpScreen);
          },
          child: Text(
            'Next',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
              minimumSize: Size(110, 50),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _phoneFormKey,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 28, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildIntroText(),
                  SizedBox(
                    height: 90,
                  ),
                  _buildPhoneFormField(),
                  SizedBox(
                    height: 70,
                  ),
                  _buildNextButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
