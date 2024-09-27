import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './forgetPass.dart';
import '../coursescreens/appLayout.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(home: LoginPage()),
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isObscure = true;
  bool _isObscurePhone = true;
  // Controllers for text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String emailValue = 'admin@gmail.com';
  String passwordValue = 'admin123';
  int phoneNumber = 0996486675;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

 void applayout() async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppLayout()),
                  );
 }
 bool isValidEmail(String email) {
  String emailPattern = r'^[^@]+@[^@]+\.[^@]+';
  RegExp regExp = RegExp(emailPattern);
  return regExp.hasMatch(email);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Login to your account and enjoy learning...',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(text: 'Email'),
                      Tab(text: 'Phone'),
                    ],
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    indicator: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 300,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Email Login Tab
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: double.infinity,
                              child: TextField(
                                controller: passwordController,
                                obscureText: _isObscurePhone,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscurePhone
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscurePhone = !_isObscurePhone;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              width: double.infinity,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  final email = emailController.text;
                                  final password = passwordController.text;
                                  // print('Email: $email, Password: $password');
                                  if(email.isEmpty || password.isEmpty) {
                                     ScaffoldMessenger.of(context).showSnackBar(
                                         SnackBar(content: Text('Please enter email and password')),
                                         );
                                  } else if(!isValidEmail(email)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                         SnackBar(content: Text('Please enter vaild email address')),
                                         );
                                  } else if (email != emailValue || password != passwordValue) {
                                       ScaffoldMessenger.of(context).showSnackBar(
                                         SnackBar(content: Text('Incorrect Credentials')),
                                         );
                                  } else {
                                  applayout();
                                  }
                                },
                                child: Text('Login'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Center(
                                child: Text(
                                  'By continuing, you agree to our Terms of Service and Privacy Policy.',
                                  style: TextStyle(fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Phone Login Tab
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                controller: phoneController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 10,
                                decoration: InputDecoration(
                                  hintText: 'Phone Number',
                                  counterText: '',
                                  prefixIcon: Icon(Icons.phone),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: double.infinity,
                              child: TextField(
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              height: 50.0,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  final phone = phoneController.text;
                                  final password = passwordController.text;
                                 if(phone.isEmpty || password.isEmpty) {
                                     ScaffoldMessenger.of(context).showSnackBar(
                                         SnackBar(content: Text('Please enter phone number and password')),
                                         );
                                  } else if (phone != emailValue || password != passwordValue) {
                                       ScaffoldMessenger.of(context).showSnackBar(
                                         SnackBar(content: Text('Incorrect Credentials')),
                                         );
                                  } else {
                                  applayout();
                                  }
                                },
                                child: Text('Login'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blue,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Center(
                                child: Text(
                                  'By continuing, you agree to our Terms of Service and Privacy Policy.',
                                  style: TextStyle(fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Buttons at the bottom
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 16,color: Colors.black),
                ),
                TextButton(
                  onPressed: () {
                  print('Page...');
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage()),
                    );
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
