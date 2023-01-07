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
      Icons.ac_unit_rounded,
      Icons.add_circle,
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
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.pink,
            items: <Widget>[
              Icon(Icons.add, size: 30),
              Icon(Icons.list, size: 30),
              Icon(Icons.compare_arrows, size: 30),
            ],
            onTap: (index) {
              //Handle button tap
            },
          ),
          body: Column(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
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
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (var i in l1) CustomForExpand2(icon: i),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: TextButton(
                            child: Icon(Icons.account_balance_rounded),
                            onPressed: () {},
                          ),
                        ),
                        flex: 2,
                      ),
                      Expanded(
                        child: Container(
                            child: DropdownButton(
                          value: item[0],
                          items: item.map((item) {
                            return DropdownMenuItem(
                              child: Text(

                                item,
                                style: TextStyle(fontSize: 20),
                              ),
                              value: item,
                            );
                          }).toList(),
                          onChanged: (country) {
                            print("You selected: $country");
                          },
                        )),
                        flex: 3,
                      ),
                      Expanded(
                        child: Container(
                          child: TextButton(
                            child: Icon(Icons.account_balance_rounded),
                            onPressed: () {},
                          ),
                        ),
                        flex: 2,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(color: Colors.pink),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CustomForExpand2({required icon}) {
    return FloatingActionButton(
      backgroundColor: Colors.amberAccent,
      onPressed: () {},
      child: Icon(
        icon,
        size: 35,
        color: Colors.black,
      ),
    );
  }
}
