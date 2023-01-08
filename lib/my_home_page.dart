import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key}) : super(key: key);

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
    List item = ['item1', 'item2', 'item3', 'item4', 'item5'];
    String dropDownValue = 'Hello';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            // buttonBackgroundColor: Colors.,
            color: Colors.black,
            backgroundColor: Colors.white,
            items: <Widget>[
              Icon(Icons.cake_outlined, size: 30, color: Colors.white),
              Icon(Icons.add, size: 30, color: Colors.white),
              Icon(Icons.list, size: 30, color: Colors.white),
              Icon(Icons.compare_arrows, size: 30, color: Colors.white),
            ],
            onTap: (index) {
              //Handle button tap
            },
          ),
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        // color: Colors.,
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
                            onPressed: () {},
                          ),
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
                          child: DropdownButton(
                            value: item[0],
                            items: item.map(
                              (item) {
                                return DropdownMenuItem(
                                  child: Text(
                                    item,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  value: item,
                                );
                              },
                            ).toList(),
                            onChanged: (country) {
                              print("You selected: $country");
                            },
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
                    for (var i=0;i<=6;i++)
                    CustomForExpand4(),
                  ],
                ),
              ),
            ],
          ),
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

  Widget CustomForExpand4() {
    return  Container(
      height: 400,
      width: 340,
      // alignment: Alignment.center,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: Colors.pinkAccent,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'cakephotos/cake2.jpg',
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Hello",
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
                flex: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}