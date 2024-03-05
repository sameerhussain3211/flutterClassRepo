import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mocktext/modelclass.dart';
// import 'package:MOCKTEST/modelclass.dart';

class myHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _myHomeState();
  }
}

List<modelclass> sampleList = [];
modelclass? exp;

class _myHomeState extends State<myHome> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Product")),
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
                  modelclass item = products[index];
                  exp = products[index];
                  // print(item.thumbnail);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            138, 76, 175, 79), // Set color here
                        borderRadius:
                            BorderRadius.circular(20), // Set border radius here
                      ),
                      height: 250,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(
                                  138, 76, 175, 79), // Set color here
                              borderRadius: BorderRadius.circular(
                                  20), // Set border radius here
                            ),
                            height: 130,
                            width: MediaQuery.of(context).size.width - 20,
                            child: Image.network(
                              item.thumbnail.toString(),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                print("Error loading image: $error");
                                return const Text("Error loading image");
                              },
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null)
                                  return child;
                                else
                                  return const Center(
                                      child: CircularProgressIndicator());
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: 200,
                                  height: 50,
                                  child: Text(
                                    item.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )),
                              const SizedBox(
                                width: 140,
                              ),
                              Text(
                                "${item.price} USD",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  _showBorromSheet(context, item);
                                },
                                child: const Icon(Icons.remove_red_eye_sharp),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 55,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                '${item.description}',
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
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

  Future<List<modelclass>> getData() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      final jsonResponse =
          jsonDecode(response.body.toString())['products'] as List;
      List<modelclass> products =
          jsonResponse.map((e) => modelclass.fromJson(e)).toList();
      // for (Map<String, dynamic> index in data) {
      //   sampleList.add(modelclass.fromJson(index));
      // }
      return products;

      // return sampleList;
    } else {
      throw Exception("Failed to get data");
    }
  }

  Future<void> _showBorromSheet(
    BuildContext context,
    modelclass product,
  ) {
    return showModalBottomSheet(
      backgroundColor: const Color.fromARGB(255, 246, 202, 192),
      context: context,
      builder: (BuildContext context) {
        return Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150, // Adjust height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product.images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 250,
                      height: 200, // Adjust width as needed
                      child: Image.network(
                        product.images[index].toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              " ${product.title} ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("${product.description}"),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(" \$",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(" ${product.price}.00",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text("${product.rating}"),
                const SizedBox(
                  width: 150,
                ),
                Text("${product.discountPercentage}%"),
                const Icon(
                  Icons.discount,
                  color: Colors.blueAccent,
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
