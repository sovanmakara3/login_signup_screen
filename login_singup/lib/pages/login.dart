import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_singup/pages/forgot_pass.dart';
import 'package:login_singup/pages/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _checkbox = false;
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = true; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 85),
                  Text(
                    'Login to your \nAccount',
                    style: GoogleFonts.outfit(
                        fontSize: 42, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 35),

                  // Email address
                  SizedBox(
                    height: 55,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(14),
                          child: FaIcon(
                            FontAwesomeIcons.solidEnvelope,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Email",
                        labelStyle: GoogleFonts.outfit(
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Password
                  SizedBox(
                    height: 55,
                    child: TextField(
                      obscureText: _obscured,
                      focusNode: textFieldFocusNode,
                      decoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(14),
                          child: FaIcon(
                            FontAwesomeIcons.lock,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Password",
                        labelStyle: GoogleFonts.outfit(
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade400,
                        ),
                        suffix: GestureDetector(
                          onTap: _toggleObscured,
                          child: Icon(
                            _obscured
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            size: 24,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        side: const BorderSide(
                          width: 2.5,
                        ),
                        activeColor: Colors.black,
                        value: _checkbox,
                        onChanged: (value) {
                          setState(() => _checkbox = !_checkbox);
                        },
                      ),
                      Text(
                        'Remember me',
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Login
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        textStyle: GoogleFonts.outfit(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ForgotPassword())));
                      },
                      child: Text(
                        'Forgot the password?',
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'or continue with',
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Google, Facebook, twitter
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google
                      Container(
                        width: 85,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.google,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Facebook
                      Container(
                        width: 85,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.facebook,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Apple
                      Container(
                        width: 85,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.apple,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account?  ",
                        style: GoogleFonts.outfit(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w300,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SingUp()));
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
