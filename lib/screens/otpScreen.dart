import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import './ResetPassword.dart';

void main() {
  runApp(
    MaterialApp(
      home: OtpScreen(),
    ),
  );
}

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpCode = '';

  void submitOtp() {
    if (otpCode.length == 4) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Verification Successful"),
            content: Text("You have successfully verified your OTP."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResetPasswordScreen()),
                  );
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter 4-digit verification code')),
      );
    }
  }

  void onCodeChanged(String code) {}
  void resendCode() {
    // Resend code logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Verification',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 40),
            Text(
              'Enter your 4-digit OTP sent to +91 6958473654',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Center(
              child: OtpTextField(
                numberOfFields: 4,
                borderColor: Color(0xFF512DA8),
                focusedBorderColor: Color(0xFF512DA8),
                showFieldAsBox: true,
                filled: true,
                fieldWidth: 65,
                borderWidth: 0,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                 onSubmit: (String verificationCode) {
                  otpCode = verificationCode; 
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't get code?",
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: resendCode,
                  child: Text(
                    'Resend Code',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              height: 55.0,
              child: ElevatedButton(
                onPressed: submitOtp,
                child: Text('Verify OTP'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
