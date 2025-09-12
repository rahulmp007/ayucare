import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text:
            'By creating or logging into an account you are agreeing with our ',
        style: TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: 'Terms and Conditions',
            style: TextStyle(color: Colors.blue),
          ),
          TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(color: Colors.blue),
          ),
          TextSpan(text: '.'),
        ],
      ),
    );
  }
}
