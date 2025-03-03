import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/my_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  final phoneNumber = '';

  Widget _buildIntroText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Verify Your Phone Number",
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: RichText(
            text: TextSpan(
                text: 'Enter the 6 digits code sent to your number',
                style:
                    TextStyle(color: Colors.black, fontSize: 18, height: 1.4),
                children: <TextSpan>[
                  TextSpan(
                      text: '$phoneNumber',
                      style: TextStyle(color: MyColors.blue)),
                ]),
          ),
        )
      ],
    );
  }

  Widget _buildPinCodeField(BuildContext context) {
    return Container(
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            borderWidth: 1,
            activeColor: MyColors.blue,
            inactiveColor: MyColors.blueGrey,
            inactiveFillColor: Colors.white,
            activeFillColor: MyColors.blueGrey,
            selectedColor: MyColors.blue,
            selectedFillColor: Colors.white),
        animationDuration: Duration(milliseconds: 300),
        enableActiveFill: true,
        onCompleted: (code) {
          //otpCode = code;
          print("Completed");
        },
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }

  Widget _buildVerifyButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Verify',
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
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 28, vertical: 30),
          child: Column(
            children: [
              _buildIntroText(),
              SizedBox(
                height: 88,
              ),
              _buildPinCodeField(context),
              SizedBox(
                height: 60,
              ),
              _buildVerifyButton(),
            ],
          ),
        ),
      ),
    );
  }
}
