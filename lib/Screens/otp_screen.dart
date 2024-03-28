import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:social_media_feed/Components/reusable_button.dart';
import 'package:social_media_feed/Screens/home_screen.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;
  const OtpScreen({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });

  @override
  OtpScreenState createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> otpControllers =
      List.generate(5, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(5, (index) => FocusNode());

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < otpControllers.length - 1; i++) {
      otpControllers[i].addListener(() {
        if (otpControllers[i].text.length == 1) {
          _focusNodes[i + 1].requestFocus();
        }
      });
    }
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 5, right: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'OTP',
            style: TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'We’ve sent an SMS with an activation code to your phone ${widget.phoneNumber}', // Displaying phone number
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 35.0),
          // _buildOtpRow(),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

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
            Center(
                child: Pinput(
                    length: 6,
                    defaultPinTheme: PinTheme(
                      width: 60,
                      height: 60,
                      textStyle: const TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 40, 40, 40)),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 201, 201, 201),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color.fromARGB(255, 241, 241, 241)),
                      ),
                      constraints:
                          const BoxConstraints(minWidth: 40, minHeight: 40),
                    ))),
            const Spacer(),
            Center(
              child: SizedBox(
                width: screenWidth * 0.9,
                child: ReusableButton(
                  buttonText: 'Verify & Continue',
                  onTap: () async {
                    try {
                      String otp = otpControllers.fold(
                        '',
                        (prev, controller) => prev += controller.text,
                      );
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                        verificationId: widget.verificationId,
                        smsCode: otp,
                      );
                      await FirebaseAuth.instance
                          .signInWithCredential(credential);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    } catch (ex) {
                      print(ex.toString());
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
