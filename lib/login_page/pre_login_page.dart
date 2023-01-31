import 'package:flutter/material.dart';
import 'package:flutter_project2/login_page/login_page.dart';

class PreLoginPage extends StatefulWidget {
  const PreLoginPage({Key? key}) : super(key: key);

  @override
  State<PreLoginPage> createState() => _PreLoginPageState();
}

class _PreLoginPageState extends State<PreLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  child: Image.asset(
                    "assets/cakephotos/delicious-desserts.jpg",
                    fit: BoxFit.cover,
                  ),
                    // borderRadius: BorderRadiusGeometry.lerp(BorderRadius.circular(10), BorderRadius.circular(10), 1),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child:  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: "Delivering the best ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                        TextSpan(
                            text: 'Bakery',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.amber,

                            )),
                        TextSpan(
                            text: "\nFood At Your doorstep ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 200,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "Get Started!! ",
                              style:
                              TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
