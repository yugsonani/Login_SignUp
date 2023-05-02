import 'package:flutter/material.dart';

import 'global.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('pdf', arguments: Global.finalCart);
        },
        child: const Icon(Icons.shopping_cart),
      ),
      body: Container(
        child: ListView(
          children: Global.finalCart
              .map(
                (e) => Container(
                  margin: const EdgeInsets.all(20),
                  height: 200,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            e['image'],
                            height: 100,
                            width: 50,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${e['name']}",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "₹${e['price']}",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(5),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.grey.withOpacity(1)),
                        ),
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    e['cart'] = false;
                                    if (e['cart'] == false) {
                                      Global.finalCart.remove(e);
                                      e['i']--;
                                    }
                                  });
                                },
                                child: const Text("Remove")),
                            Container(
                              height: 35,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.grey.withOpacity(1)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        e['remove'] = true;
                                        if (e['remove'] == true) {
                                          e['i']--;
                                          Global.totalBill -= e['price'];
                                          if (e['i'] <= 0) {
                                            e['i'] = 0;
                                          }
                                          if (e['i'] == 0) {
                                            Global.finalCart.remove(e);
                                          }
                                        }
                                      });
                                    },
                                    icon: const Icon(Icons.remove),
                                  )),
                                  Expanded(
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Text("${e['i']}"))),
                                  Expanded(
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              e['add'] = true;
                                              if (e['add'] == true) {
                                                e['i']++;
                                                e['total'] =
                                                    e['price'] * e['i'];
                                                Global.totalBill =
                                                    Global.totalBill +
                                                        e['price'];
                                              }
                                            });
                                          },
                                          icon: const Icon(Icons.add)))
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
