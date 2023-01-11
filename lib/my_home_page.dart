import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project2/login_page/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List l1 = [
      Icons.home_filled,
      Icons.icecream_outlined,
      Icons.access_alarms,
      Icons.ac_unit_sharp,
      Icons.access_time_filled_outlined,
      Icons.accessible_forward_outlined,
      Icons.add_a_photo_sharp,
      Icons.account_box_rounded,
      Icons.accessible_rounded,
    ];
    List dropdownItemList = [
      {'label': 'apple', 'value': 'apple'},
      {'label': 'banana', 'value': 'banana'},
      {'label': 'grape', 'value': 'grape'},
      {'label': 'pineapple', 'value': 'pineapple'},
      {'label': 'grape fruit', 'value': 'grape fruit'},
      {'label': 'kiwi', 'value': 'kiwi'},
    ];
    List forlistview = [
      {
        'imagePath': 'cakephotos/cokkies.webp',
        'name': 'cokkies',
        'price': 233.45
      },
      {
        'imagePath': 'cakephotos/cokkies2.jpg',
        'name': 'cokkies',
        'price': 10.44
      },
      {
        'imagePath': 'cakephotos/cokkies3.jfiif',
        'name': 'cokkies',
        'price': 233.45
      },
      {
        'imagePath': 'cakephotos/cokkies.webp',
        'name': 'cokkies',
        'price': 233.45
      },
    ];
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          // buttonBackgroundColor: Colors.,
          color: Colors.black,
          backgroundColor: Colors.white,
          items: <Widget>[
            InkWell(
              onTap: () {},
              child: Icon(Icons.cake_outlined, size: 30, color: Colors.white),
            ),
            Icon(Icons.add, size: 30, color: Colors.white),
            Icon(Icons.list, size: 30, color: Colors.white),
            Icon(Icons.compare_arrows, size: 30, color: Colors.white),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
        body: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.center,
                      // color: Colors.yellow,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Chose Cokkies\nFor Your Tea Party",
                        style: GoogleFonts.getFont(
                          'Nunito',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      // color: Colors.pink,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.amber),
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.all(30)),
                                shadowColor:
                                    MaterialStatePropertyAll(Colors.black),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(15),
                                  ),
                                ))),
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()))),
                      ),
                      // color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  for (var i in l1) Center(child: CustomForExpand2(icon: i)),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomForExpand3(
                          icon: Icons.monitor_outlined,
                          alignment: Alignment.centerLeft),
                      flex: 2,
                    ),
                    Expanded(
                      child: Container(
                        child: CoolDropdown(
                          dropdownList: dropdownItemList,
                          onChange: (v) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          defaultValue: dropdownItemList[3],
                        ),
                      ),
                      flex: 3,
                    ),
                    Expanded(
                      child: CustomForExpand3(
                          icon: Icons.segment,
                          alignment: Alignment.centerRight),
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  for (var i in forlistview)
                    CustomForExpand4(
                        path: i['imagePath'],
                        name: i['name'],
                        price: i['price']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CustomForExpand2({required icon}) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
      child: FloatingActionButton(
        backgroundColor: Colors.white70,
        onPressed: () {},
        child: Icon(
          icon,
          size: 35,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget CustomForExpand3({required icon, required alignment}) {
    return Container(
      alignment: alignment,
      child: TextButton(
        child: Icon(icon, color: Colors.black),
        onPressed: () {},
      ),
    );
  }

  Widget CustomForExpand4(
      {required path, required String name, required double price}) {
    return Card(
      color: Colors.pinkAccent,
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: SizedBox(
        height: 400,
        width: 340,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                path,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(25, 20, 0, 0),
              child: Text(
                name,
                style: TextStyle(fontSize: 50),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(19),
                    child: BlurryContainer(
                      height: 70,
                      blur: 10,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: Text(
                              "\u{20B9} $price ",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            // padding: EdgeInsets.all(10),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.black),
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.fromLTRB(35, 25, 35, 25)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(40),
                                      right: Radius.circular(40),
                                    ),
                                  ))),
                              child: Icon(
                                Icons.add_shopping_cart,
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  flex: 3,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
