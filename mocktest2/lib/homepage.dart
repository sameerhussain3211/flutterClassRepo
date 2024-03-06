import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mocktest2/model.dart';

class homePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _homePageState();
  }
}

List<APIDataModel> sampleList = [];
APIDataModel? temp;

class _homePageState extends State<homePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.accessibility_outlined)],
        title: const Center(child: Text("Products")),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List products = snapshot.data!;

            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  APIDataModel item = products[index];
                  return InkWell(
                    onTap: () {
                      _showBorromSheet(context, item);
                    },
                    child: Container(
                      height: 100,
                      child: Card(
                        elevation: 5,
                        shadowColor: Colors.green,
                        child: ListTile(
                          leading: CircleAvatar(
                            foregroundImage: NetworkImage("${item.imageLink}"),
                            backgroundColor: Colors.greenAccent,
                            radius: 30,
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                // height: 50,
                                child: Text(
                                  "${item.name}",
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                          trailing: Text(
                            "\$ ${item.price}.00",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Text("no data availables");
            }
          }
        },
      ),
    );
  }

  Future<List<APIDataModel>> getData() async {
    final response = await http.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body.toString()) as List;
      List<APIDataModel> products =
          jsonResponse.map((e) => APIDataModel.fromJson(e)).toList();

      return products;
    } else {
      throw Exception("Failed to get data");
    }
  }

  Future<void> _showBorromSheet(
    BuildContext context,
    APIDataModel product,
  ) {
    return showModalBottomSheet(
      backgroundColor: const Color.fromARGB(255, 246, 202, 192),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        child: Image.network("${product.imageLink}"),
                      ),
                      Column(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 150,
                              child: Text(
                                "${product.name}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 150,
                              child: Text("${product.description}".trim())),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          child: Text("brand: "),
                        ),
                        SizedBox(
                          child: Text(
                            "${product.brand}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        SizedBox(
                          child: Text("Price: "),
                        ),
                        SizedBox(
                          child: Text(
                            "\$ ${product.price}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          child: Text("Product type: "),
                        ),
                        SizedBox(
                          child: Text(
                            "${product.productType}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        SizedBox(
                          child: Text("Rating: "),
                        ),
                        SizedBox(
                          child: Text(
                            " ${product.rating}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print(product.productColors!.length);
                      for (int i = 0; i < product.productColors!.length; i++) {
                        print(product.productColors![i].hexValue);
                      }
                    },
                    child: Text("hello"),
                  ),
                  // ListView.builder(
                  //   itemCount: 6,
                  //   itemBuilder: (context, index) {
                  //     final colorHexValue =
                  //         product.productColors![index].hexValue;
                  //     Color color;
                  //     try {
                  //       color =
                  //           Color(int.parse('0xFF$colorHexValue', radix: 16));
                  //     } catch (e) {
                  //       color = Colors.amber; // Default color if parsing fails
                  //     }
                  //     return Container(
                  //       width: 10,
                  //       height: 10,
                  //       color: color,
                  //     );
                  //   },
                  // )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
