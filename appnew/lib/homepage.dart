import 'dart:async';
import 'package:appnew/apiModel.dart';
// import 'package:appnew/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.accessibility_outlined)],
        title: const Center(child: Text("Products")),
      ),
      body: FutureBuilder<List<APIDataModel>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            List<APIDataModel>? products = snapshot.data;

            if (products != null && products.isNotEmpty) {
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  APIDataModel item = products[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 2, // Adjust the elevation as needed
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        leading: Text("${item.id}"),
                        title: Column(
                          children: [
                            Text("${item.name}",
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text("${item.email}"),
                            Text("${item.phone}"),
                            Text(
                              "${item.address.street} ,${item.address.suite}, ${item.address.city}  ",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                        trailing: Text("${item.username}"),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("No data available"),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text("the Error: ${snapshot.error}"),
            );
          } else {
            return const Center(
              child: Text("No data available"),
            );
          }
        },
      ),
    );
  }

  Future<List<APIDataModel>> getData() async {
    try {
      Dio dio = Dio();
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/users');
      print(response.data);
      if (response.statusCode == 200) {
        final jsonResponse = response.data as List;
        List<APIDataModel> products =
            jsonResponse.map((e) => APIDataModel.fromJson(e)).toList();
        return products;
      } else {
        throw Exception("Failed to get data");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
