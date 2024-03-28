import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_feed/Components/phone_number_textfield.dart';
import 'package:social_media_feed/Components/reusable_button.dart';
import 'package:social_media_feed/Screens/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  String? phoneValidationError;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Material(
      child: Container(
        height: screenHeight,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const Spacer(),
            Center(
              child: SizedBox(
                width: screenWidth * 0.9,
                child: ReusableButton(
                  buttonText: 'Send OTP',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpScreen(
                          verificationId: '12345',
                          phoneNumber: phoneNumberController.text,
                        ),
                      ),
                    );
                  },
                  // onTap: () async {
                  //   String formattedPhoneNumber =
                  //       '+91${phoneNumberController.text}';

                  //   await FirebaseAuth.instance.verifyPhoneNumber(
                  //       verificationCompleted:
                  //           (PhoneAuthCredential credentials) {},
                  //       verificationFailed: (FirebaseAuthException ex) {},
                  //       codeSent: (String verificationid, int? resendtoken) {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => OtpScreen(
                  //               verificationId: verificationid,
                  //               phoneNumber: formattedPhoneNumber,
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //       codeAutoRetrievalTimeout: (String verificationId) {},
                  //       phoneNumber: formattedPhoneNumber);
                  // },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login',
            style: TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          PhoneNumberInputField(
            controller: phoneNumberController,
            errorText: phoneValidationError,
          ),
          SizedBox(height: 16),
          Text(
            'You will receive an SMS verification that may apply message and data rates.',
            style: TextStyle(
              color: Color.fromARGB(255, 101, 101, 101),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
