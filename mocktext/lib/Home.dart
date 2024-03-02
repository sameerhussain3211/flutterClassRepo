import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mocktext/list1.dart';

class viewlist extends StatelessWidget {
  int totalNumberList = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Products")),
      ),
      body: Expanded(
        flex: totalNumberList,
        child: Container(
          color: const Color.fromARGB(50, 68, 137, 255),
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8),
                // Added comma here
                child: InkWell(
                  child: list1(
                    img: Image.asset(
                        'assects/images/sam.jpg'), // Corrected img parameter
                    NameMob: "iphone 13",
                    PriceMob: "1000",
                    detail:
                        "lorem haha ahah ahah aha ahdsjd jhs du sameer is good man and he loves playing footbsll",
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 350,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Row(
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Container(
                                                width: 300,
                                                child: Image.asset(
                                                    'assects/images/sam.jpg')),
                                            Container(
                                              width: 30,
                                            ),
                                            Container(
                                                width: 300,
                                                child: Image.asset(
                                                    'assects/images/sam.jpg')),
                                            Container(
                                              width: 30,
                                            ),
                                            Container(
                                                width: 300,
                                                child: Image.asset(
                                                    'assects/images/sam.jpg')),
                                            Container(
                                              width: 30,
                                            ),
                                            Container(
                                                width: 300,
                                                child: Image.asset(
                                                    'assects/images/sam.jpg')),
                                            Container(
                                              width: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text("iphone 6"),
                                      Text("Proce 100usd"),
                                      Text(
                                          "he is a foo man and he loves playing football and table tennis jhs djhs dja sjh dsaj hdasjdhd asjdh ")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return acceptreject();
                    // }));
                    print("hello");
                  },
                )),
            itemCount: 20,
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
}
