import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project2/my_home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  // var emailController=TextEditingController();
  // var passwordController=TextEditingController();
  // const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/cakephotos/menduvada.jpeg",
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SingleChildScrollView(
                  child: Card(
                    margin: EdgeInsets.all(10),
                    child: Form(
                      key: formkey,
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Container(
                            //   child: Image.asset(
                            //     "assets/cakephotos/cokkies.webp",
                            //     height: 70,
                            //     width: 70,
                            //     alignment: Alignment.center,
                            //   ),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Sign In",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.getFont(
                                      'Signika Negative',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30
                                    ),
                                  ),
                                  margin: EdgeInsets.fromLTRB(10, 30, 0, 10),
                                ),
                              ],
                            ),
                            CustomForField(
                                hintText: "Enter Email ",
                                controller: emailController,
                                obscureText: false,
                                name: 'email'),
                            CustomForField(
                                hintText: "Enter PassWord",
                                controller: passwordController,
                                obscureText: true,
                                name: 'password'),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  'Forgot PassWord?',
                                  style: TextStyle(
                                      color: Colors.brown[900], fontSize: 15,fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.brown[900],
                                  padding: EdgeInsets.fromLTRB(
                                      40, 20, 40, 20), // Background Color
                                ),
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyHomePage()));
                                    final snackBar = SnackBar(
                                      elevation: 0,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        title: 'Welcome !!!',
                                        message: '',
                                        contentType: ContentType.success,
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(snackBar);
                                  }
                                },
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't Have Account? "),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: Colors.brown[900],
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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

  Widget CustomForField(
      {required hintText,
      required controller,
      required obscureText,
      required name}) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(fontSize: 18, fontFamily: 'Yeon'),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Yeon'),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.greenAccent),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        validator: (value) {
          if (value != null && value.isEmpty) {
            return '$hintText';
          }
          if (name == 'email') {
            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
              return "Please enter a valid email address";
            }
          }
          if (name == 'password') {
            if (!RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)")
                .hasMatch(value!)) {
              return "Password should contain Capital, small letter & Number & Special";
            }
          }
        },
      ),
    );
  }
}
