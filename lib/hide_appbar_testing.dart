import 'package:flutter/material.dart';

class HideAppBar extends StatefulWidget {
  const HideAppBar({Key? key}) : super(key: key);

  @override
  State<HideAppBar> createState() => _HideAppBarState();
}

class _HideAppBarState extends State<HideAppBar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // scaffold
      home: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: Icon(Icons.wallpaper),
                title: Container(
                    color: Colors.blue,
                    child: Text("Hidden AppBar")
                ),
                elevation: 10.0,
                automaticallyImplyLeading: false,
                expandedHeight: 50,
                floating: true,
                snap: true,
              )
            ];
          },
          // list of images for scrolling
          body: ListView.builder(itemBuilder: (context, index) {
            return Text("Hello");
          },)
        ),
      ),
    );
  }
}
