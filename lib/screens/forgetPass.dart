import 'package:flutter/material.dart';
import './otpScreen.dart';
import './ResetPassword.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController contactController = TextEditingController();

  // Function to handle "Get OTP" button press
  void getOtp() {
    final contact = contactController.text;

    if (contact.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your registered email or mobile number')),
      );
    } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Code Send Successful"),
          content: Text("A verification code has been sent successfully to $contact."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OtpScreen()),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    }
  }

  @override
  void dispose() {
    contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your registered email or mobile number',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            // TextField to input email or mobile number
            TextField(
              controller: contactController,
              decoration: InputDecoration(
                hintText: 'Email or Mobile Number',
                prefixIcon: Icon(Icons.contact_mail), 
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0xFFFFFFFF),
              ),
            ),
            SizedBox(height: 40),
            // Get OTP button
            SizedBox(
              width: double.infinity,
              height: 55.0,
              child: ElevatedButton(
                onPressed: getOtp,
                child: Text('Get OTP'),
                style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.symmetric(vertical: 10),
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
