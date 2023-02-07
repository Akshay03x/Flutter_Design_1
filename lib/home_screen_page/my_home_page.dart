import 'dart:convert';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project2/detail_pages/detail_cake_page.dart';
import 'package:flutter_project2/home_screen_page/custom_for_dropdown_row.dart';
import 'package:flutter_project2/home_screen_page/custom_for_icon_list.dart';
import 'package:flutter_project2/login_page/login_page.dart';
import 'package:flutter_project2/logout_page/log_out_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyHomePage extends StatefulWidget {
  final name;
  const  MyHomePage({required this.name});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   // var name=this.name;
  int SelectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

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
        'price': 233.45,
        'description':
            'Establishments producing and selling flour-based food like cakes, cookies, and pastries are what bakeries are all about. Several bakeries offer services for festivities and occasions like birthdays, weddings, and other events.'
      },
      {
        'imagePath': 'cakephotos/cokkies2.jpg',
        'name': 'cokkies For Deep',
        'price': 10.44,
        'description':
            'Establishments producing and selling flour-based food like cakes, cookies, and pastries are what bakeries are all about. Several bakeries offer services for festivities and occasions like birthdays, weddings, and other events.'
      },
      {
        'imagePath': 'cakephotos/cokkies2.jpg',
        'name': 'cokkies',
        'price': 233.45,
        'description':
            'Establishments producing and selling flour-based food like cakes, cookies, and pastries are what bakeries are all about. Several bakeries offer services for festivities and occasions like birthdays, weddings, and other events.'
      },
      {
        'imagePath': 'cakephotos/elevated-view.jpg',
        'name': 'cokkies',
        'price': 233.45,
        'description':
            'Establishments producing and selling flour-based food like cakes, cookies, and pastries are what bakeries are all about. Several bakeries offer services for festivities and occasions like birthdays, weddings, and other events.'
      },
      {
        'imagePath': 'cakephotos/cokkies.webp',
        'name': 'cokkies',
        'price': 233.45,
        'description':
            'Establishments producing and selling flour-based food like cakes, cookies, and pastries are what bakeries are all about. Several bakeries offer services for festivities and occasions like birthdays, weddings, and other events.'
      },
      {
        'imagePath': 'cakephotos/elevated-view.jpg',
        'name': 'cokkies',
        'price': 233.45,
        'description':
            'Establishments producing and selling flour-based food like cakes, cookies, and pastries are what bakeries are all about. Several bakeries offer services for festivities and occasions like birthdays, weddings, and other events.'
      },
      {
        'imagePath': 'cakephotos/cokkies.webp',
        'name': 'cokkies',
        'price': 233.45,
        'description':
            'Establishments producing and selling flour-based food like cakes, cookies, and pastries are what bakeries are all about. Several bakeries offer services for festivities and occasions like birthdays, weddings, and other events.'
      },
    ];
    List<Widget> widgetList = [
      Column(
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
                      "Choose Cokkies\nFor Your Tea Party",
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
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.all(30)),
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
                        icon: Icons.segment, alignment: Alignment.centerRight),
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: FutureBuilder<List<dynamic>>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (var i in snapshot.data!)
                        CustomForExpand4(
                          path: i['imagePath'],
                          name: i['name'],
                          price: i['price'],
                        ),
                    ],
                  );
                }
                return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.black,
                    size: 100 ,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      LoginPage(),
      LoginPage(),
      LogOut(name: widget.name,),
    ];

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.black,
          backgroundColor: Colors.white,
          items: <Widget>[
            Icon(Icons.cake_outlined, size: 30, color: Colors.white),
            Icon(Icons.add, size: 30, color: Colors.white),
            Icon(Icons.list, size: 30, color: Colors.white),
            Icon(Icons.compare_arrows, size: 30, color: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              SelectedIndex = index;
            });
          },
        ),
        body: widgetList[SelectedIndex],
      ),
    );
  }



  Widget CustomForExpand4(
      {required path, required String name, required double price}) {
    return Card(
      // color: Colors.pinkAccent,
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(19),
                    child: BlurryContainer(
                      height: 60,
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
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStatePropertyAll(Colors.black),
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.fromLTRB(35, 20, 35, 20)),
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPageCake(
                                        name: name,
                                        image: path,
                                        price: price.toString()),
                                  ));
                            },
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

Future<List<dynamic>> getData() async {
  final url = 'http://localhost:3333/cake';
  final res = await http.get(Uri.parse(url));
  if (res.statusCode == 200) {
    List l = await jsonDecode(res.body);
    return l;
  } else {
    throw Exception("Not FAtch");
  }
}
