import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'global.dart';

class Pdf extends StatefulWidget {
  const Pdf({Key? key}) : super(key: key);

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  late List<dynamic> data;

  final pdf = pw.Document();
  @override
  void initState() {
    super.initState();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Container(
            padding: pw.EdgeInsets.all(10),
            alignment: pw.Alignment.center,
            width: double.infinity,
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("BILL From :"),
                    pw.Text("Stationery App"),
                  ],
                ),
                pw.Row(
                  children: [
                    pw.Expanded(
                        flex: 2,
                        child: pw.Text(
                          "Product",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        )),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Price",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        )),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Quantity",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        )),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Total",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        )),
                  ],
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Column(
                    children: data
                        .map(
                          (e) => pw.Row(
                            children: [
                              pw.Expanded(
                                  flex: 3, child: pw.Text("${e['name']}")),
                              pw.Expanded(
                                  flex: 1, child: pw.Text("${e['price']}")),
                              pw.Expanded(flex: 1, child: pw.Text("${e['i']}")),
                              pw.Expanded(
                                  flex: 1, child: pw.Text("${e['total']}")),
                            ],
                          ),
                        )
                        .toList()),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Row(
                  children: [
                    pw.Text("Total"),
                    pw.SizedBox(
                      width: 150,
                    ),
                    pw.Text("${Global.totalBill}")
                  ],
                )
              ],
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> dataf = ModalRoute.of(context)!.settings.arguments as List;

    data = dataf;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Directory? tempDir = await getExternalStorageDirectory();
          File locate = File('${tempDir!.path}/invoice.pdf');
          await locate.writeAsBytes(await pdf.save());
        },
        child: Icon(Icons.download),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("BILL From :"),
                Text("Stationery App"),
              ],
            ),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Text(
                      "Product",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      "Price",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      "Quantity",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      "Total",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
                children: dataf
                    .map(
                      (e) => Row(
                        children: [
                          Expanded(flex: 3, child: Text("${e['name']}")),
                          Expanded(flex: 1, child: Text("${e['price']}")),
                          Expanded(flex: 1, child: Text("${e['i']}")),
                          Expanded(flex: 1, child: Text("${e['total']}")),
                        ],
                      ),
                    )
                    .toList()),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Total"),
                SizedBox(
                  width: 150,
                ),
                Text("${Global.totalBill}")
              ],
            )
          ],
        ),
      ),
    );
  }
}
