import 'package:flutter/material.dart';

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
            Container(
              margin: EdgeInsets.only(top: 30),
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
                        color: Colors.pinkAccent, size: 40),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
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
                          margin: EdgeInsets.fromLTRB(10, 0, 5, 30),
                          height: 70,
                          width: 150,
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
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CustomForColumn(name: "Serving Wight", detail: "320 g"),
                        CustomForColumn(name: "Serving Wight", detail: "320 g"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        CustomForColumn(name: "Serving Wight", detail: "320 g"),
                        CustomForColumn(name: "Serving Wight", detail: "320 g"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CustomForColumn({required name, required detail}) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: Expanded(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Text(
                    "$name",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.grey,),
                  ),
                ),
                Text("$detail"),
              ],
            ),
          ),
        ),
        // color: Colors.yellow,
      ),
    );
  }
}
