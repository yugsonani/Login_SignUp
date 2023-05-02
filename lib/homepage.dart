
import 'package:flutter/material.dart';

import 'global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: Global.item
              .map(
                (e) => Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: Colors.grey.withOpacity(1)),
                      ),
                      child: Image.asset(
                        e['image'],
                        width: 70,
                      ),
                    ),
                    title: Text(
                      e['name'],
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('item', arguments: e['itemList']);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.grey.withOpacity(0.2))),
                    horizontalTitleGap: 50,
                    contentPadding: const EdgeInsets.all(10),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
