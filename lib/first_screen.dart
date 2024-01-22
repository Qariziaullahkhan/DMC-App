import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late int eng, urdu, isl, Maths, Pak, com;
  String obtmarks = "Obtain Marks";
  String percentage = "Percentage";
  String grade = "Grade";
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text(
          "D  M  C",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 100),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "English Marks",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (String? text) {
                    if (text == null || text.isEmpty) {
                      return "Please Provide the English Marks";
                    }
                    eng = int.parse(text);
                    return null;
                  },
                ),
                const Gap(20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Urdu Marks",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (String? text) {
                    if (text == null || text.isEmpty) {
                      return "Please Provide the Urdu Marks";
                    }
                    urdu = int.parse(text);
                    return null;
                  },
                ),
                const Gap(20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Islamiat Marks",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (String? text) {
                    if (text == null || text.isEmpty) {
                      return "Please Provide the Islamiat Marks";
                    }
                    isl = int.parse(text);
                    return null;
                  },
                ),
                const Gap(20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Maths Marks",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  validator: (String? text) {
                    if (text == null || text.isEmpty) {
                      return "Please Provide the Maths Marks";
                    }
                    Maths = int.parse(text);
                    return null;
                  },
                ),
                const Gap(20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Pak Study Marks",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  validator: (String? text) {
                    if (text == null || text.isEmpty) {
                      return "Please Provide the Pak Study  Marks";
                    }
                    Pak = int.parse(text);
                    return null;
                  },
                ),
                const Gap(20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Computer Science Marks",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  validator: (String? text) {
                    if (text == null || text.isEmpty) {
                      return "Please Provide the Computer Science Marks";
                    }
                    com = int.parse(text);
                    return null;
                  },
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                            onPressed: () {
                              formkey.currentState!.reset();
                              obtmarks = "ObtainMarks";
                              percentage = "Percentage";
                              grade = "";
                            },
                            child: Text("Clear"))),
                    const Gap(20),
                    Expanded(
                        child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                Fluttertoast.showToast(msg: "valid");
                                int ObatinMarks =
                                    eng + urdu + isl + Maths + Pak + com;
                                double percentage = ObatinMarks * 100 / 600;
                                setState(() {
                                  obtmarks = "ObtainMarks $ObatinMarks";
                                  this.percentage = "Percentage $percentage";
                                  grade = decideGrade(percentage);
                                });
                              } else {
                                Fluttertoast.showToast(msg: "invalid");
                              }
                            },
                            child: Text("Calculate"))),
                  ],
                ),
                const Gap(10),
                Text(
                  obtmarks,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Gap(10),
                Text(
                  percentage,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Gap(10),
                Text(
                  grade,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String decideGrade(double percentage) {
    if (percentage >= 80)
      return "A";
    else if (percentage >= 70)
      return "B";
    else if (percentage >= 60)
      return "C";
    else if (percentage >= 50)
      return "D";
    else
      return "Fail";
  }
}
