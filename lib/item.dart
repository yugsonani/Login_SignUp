import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'global.dart';

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    List<dynamic> detail = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('cart');
        },
        child: Icon(Icons.shopping_cart),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: ListView(
          children: detail
              .map(
                (e) => Card(
                  elevation: 5,
                  child: ListTile(
                      leading: Container(
                        child: Image.asset(
                          "${e['image']}",
                          height: 50,
                        ),
                      ),
                      title: Text(
                        "${e['name']}",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "₹${e['price']}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side:
                              BorderSide(color: Colors.grey.withOpacity(0.2))),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              e['cart'] = true;
                              if (e['cart'] == true) {
                                Global.cart.add(e);
                                e['i']++;

                                Global.finalCart = Global.cart.toList();
                                Global.totalBill += e['price'];
                              }
                            });
                          },
                          icon: (e['cart'] == false)
                              ? Icon(Icons.shopping_cart_outlined)
                              : Icon(Icons.done))),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
