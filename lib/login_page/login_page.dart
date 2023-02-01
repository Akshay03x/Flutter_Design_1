import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:blur/blur.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/foundation.dart';
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
              "assets/cakephotos/3606.jpg",
              fit: BoxFit.cover,
            ),
            // BlurryContainer(child: Container(),blur: 1,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end
              ,
              children: [
                SingleChildScrollView(
                  child: Card(
                    color: Colors.black54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    margin: EdgeInsets.all(10),
                    child: Form(
                      key: formkey,
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Welcome !!",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.getFont(
                                            'Dancing Script',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: Colors.white),
                                      ),
                                      margin: EdgeInsets.fromLTRB(10, 30, 0, 5),
                                    ),
                                    Container(
                                      child: Text(
                                        "There's Is Nothing a Cupcake \nand Coffee can't solve",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.getFont(
                                            'Dancing Script',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    ),
                                  ],
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
                              alignment: AlignmentDirectional.bottomEnd,
                              margin: EdgeInsets.fromLTRB(0, 5, 10, 0),
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: GoogleFonts.getFont('Space Grotesk',
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white70,
                                  padding: EdgeInsets.fromLTRB(
                                      80, 20, 80, 20), // Background Color
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
                                        contentType: ContentType.warning,
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(snackBar);
                                  }
                                },
                                child: Text(
                                  "Sign In",
                                  style: GoogleFonts.getFont('Space Grotesk',
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't Have Account? ",
                                    style: GoogleFonts.getFont('Space Grotesk',color: Colors.white),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "Sign Up",
                                      style: GoogleFonts.getFont('Space Grotesk',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
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
          filled: true,
          fillColor: Colors.white54,
          hintText: hintText,
          hintStyle: GoogleFonts.getFont("Pacifico",
              color: Colors.white, fontSize: 15, ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.white),
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
