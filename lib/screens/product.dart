import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: products.doc('hmJ8iFeT4tfwzqk8G5qY').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: CircularProgressIndicator()),
            );
          } else {
            return ListView(
              shrinkWrap: true,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: Image.network(snapshot.data['image'].toString()),
                    ),
                    Positioned(
                      top: 15,
                      right: 0,
                      child: MaterialButton(
                        onPressed: () {},
                        elevation: 5,
                        padding: EdgeInsets.all(12),
                        shape: CircleBorder(
                          side: BorderSide(color: Colors.grey.withOpacity(0.5)),
                        ),
                        child: ImageIcon(
                          AssetImage('assets/heart.png'),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 85,
                      right: 0,
                      child: MaterialButton(
                        onPressed: () {},
                        elevation: 5,
                        padding: EdgeInsets.all(12),
                        shape: CircleBorder(
                          side: BorderSide(color: Colors.grey.withOpacity(0.5)),
                        ),
                        child: ImageIcon(
                          AssetImage('assets/share.png'),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data['company'].toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF525252),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        snapshot.data['name'].toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF525252),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            '\u20B9 ${snapshot.data['discounted_price'].toString()}',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            '\u20B9${snapshot.data['original_price'].toString()}',
                            style: TextStyle(
                              fontSize: 22,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            '\u20B9${snapshot.data['discount'].toString()} off',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width / 2,
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.white,
                ),
              ),
              child: Text(
                'ADD TO CART',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width / 2,
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.orangeAccent,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              child: Text(
                'BUY NOW',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
