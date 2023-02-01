import 'package:flutter/material.dart';
import 'package:flutter_project2/login_page/login_page.dart';

class DetailPageCake extends StatefulWidget {
  final String? name;
  final String? image;
  final String? price;

  const DetailPageCake(
      {Key? key, required this.name, required this.image, required this.price})
      : super(key: key);

  @override
  State<DetailPageCake> createState() => _DetailPageCakeState();
}

class _DetailPageCakeState extends State<DetailPageCake> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Colors.black, size: 40),
                    ),
                    Expanded(
                      child: Text(
                        "${widget.name}",
                        style: TextStyle(fontFamily: 'Pacifico', fontSize: 30),
                        maxLines: 1,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Icon(Icons.favorite,
                          color: Colors.pinkAccent, size: 30),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "${widget.image}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Container(child: SizedBox(height: 100,width: 100,),color: Colors.black,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(10, 0, 3, 10),
                        height: 70,
                        width: 130,
                        // color: Colors.amber,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: "\u{20B9} ${widget.price} ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              TextSpan(
                                  text: '/kg',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Colors.black54)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomForColumn(
                                name: "Serving Weight", detail: "320 g"),
                            CustomForColumn(
                                name: "Shelf Life ", detail: "1 Month"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomForColumn(
                                name: "Calories(100g)", detail: "510 Kcal"),
                            CustomForColumn(name: "Sweetener", detail: "Sugar"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => LoginPage())))
                },
                child: Container(
                  alignment: Alignment.center,
                  height: double.infinity,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        TextSpan(
                            text: " Add To Cart",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CustomForColumn({required name, required detail}) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Expanded(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Text(
                  textAlign: TextAlign.right,
                  "$name",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.right,
                  "$detail",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      // color: Colors.yellow,
    );
  }
}
