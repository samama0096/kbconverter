import 'package:flutter/material.dart';
import 'package:kbconverter/classes/kb.repo.dart';

class kbScreen extends StatefulWidget {
  kbScreen({Key? key}) : super(key: key);

  @override
  _kbScreenState createState() => _kbScreenState();
}

class _kbScreenState extends State<kbScreen> {
  double? v;
  double res1 = 0.0;
  double res2 = 0.0;
  double res3 = 0.0;
  double res4 = 0.0;
  double bytesInput = 0.0;
  String txt = "0";
  String val = "";
  @override
  Widget build(BuildContext context) {
    final ts = new TextStyle(
        color: Colors.black, fontSize: 16, fontStyle: FontStyle.italic);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: MediaQuery.of(context).size.height,
          // ignore: missing_required_param
          child: Center(
            child: ListView(children: [
              Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("B", style: ts),
                          Text(
                            ":",
                            style: ts,
                          ),
                          Text(
                            "$res1",
                            style: ts,
                          )
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      height: 0.1,
                      color: Colors.white,
                      width: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("MB", style: ts),
                        Text(
                          ":",
                          style: ts,
                        ),
                        Text(
                          "$res2",
                          style: ts,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      height: 0.1,
                      color: Colors.white,
                      width: 100,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Bits", style: ts),
                          Text(
                            ":",
                            style: ts,
                          ),
                          Text(
                            "$res3",
                            style: ts,
                          )
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      height: 0.1,
                      color: Colors.white,
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                  ),
                  Text("$txt   KB",
                      style: TextStyle(color: Colors.black54, fontSize: 14)),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 300,
                    child: Slider(
                        min: 0,
                        max: 20000,
                        activeColor: Colors.redAccent,
                        inactiveColor: Colors.white60,
                        value: double.parse((bytesInput).toStringAsFixed(0)),
                        onChanged: (v) {
                          setState(() {
                            bytesInput = double.parse((v).toStringAsFixed(0));
                            txt = bytesInput.toStringAsFixed(0);
                            res1 = double.parse(
                                (kbyte_repo_service().kbToB(bytesInput))
                                    .toStringAsFixed(2));
                            res2 = double.parse(
                                (kbyte_repo_service().kbToMB(bytesInput))
                                    .toStringAsFixed(2));
                            res3 = double.parse(
                                (kbyte_repo_service().kbTobits(bytesInput))
                                    .toStringAsFixed(2));
                          });
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 70,
                      width: 275,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 2, right: 5, bottom: 5),
                          child: TextFormField(
                              maxLength: 20000,
                              onChanged: (vl) {
                                setState(() {
                                  val = vl;
                                });
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        bytesInput = double.parse((val));
                                        txt = bytesInput.toStringAsFixed(0);
                                        res1 = double.parse(
                                            (kbyte_repo_service()
                                                    .kbToB(bytesInput))
                                                .toStringAsFixed(2));
                                        res2 = double.parse(
                                            (kbyte_repo_service()
                                                    .kbToMB(bytesInput))
                                                .toStringAsFixed(2));
                                        res3 = double.parse(
                                            (kbyte_repo_service()
                                                    .kbTobits(bytesInput))
                                                .toStringAsFixed(2));
                                      });
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        height: 2,
                                        width: 8,
                                        child: Icon(
                                          Icons.search,
                                          size: 35,
                                          color: Colors.redAccent,
                                        )),
                                  ),
                                  hintText: "Enter K-Bytes",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[700]))),
                        ),
                      ))
                ],
              ),
            ]),
          )),
    );
  }
}
