import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                    TextStyle(color: Colors.black, fontSize: 18, height: 1.4)),
          ),
        )
      ],
    );
  }

  Widget _buildPinCodeField() {
    return Container();
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
              _buildPinCodeField(),
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
