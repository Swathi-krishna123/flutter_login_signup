import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> signkey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  TextEditingController dateofbirthcontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();

  String selectedgender = "";
  bool passwordmatch = true;
  bool ischecked = false;

  void checkpasswordmatch() {
    setState(() {
      passwordmatch = passwordcontroller.text == confirmpasswordcontroller.text;
    });
  }

  Future<void> selecteddate(context) async {
    final DateTime? pickeddate = await showDatePicker(
        context: context, firstDate: DateTime(1950), lastDate: DateTime.now());
    if (pickeddate != null) {
      String formatdate = DateFormat("dd-MMM-yyyy").format(pickeddate);
      setState(() {
        dateofbirthcontroller.text = formatdate;
      });
    }
  }

  Future<void> selectedtime(context) async {
    final TimeOfDay? pickedtime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (pickedtime != null) {
      String formattime = pickedtime.format(context);
      setState(() {
        timecontroller.text = formattime;
      });
    }
  }

  List<String> items = [
    "thiruvanandapuram",
    "kollam",
    "pathanamthitta",
    "alappuzha",
    "kottayam",
    "idukki",
    "ernakulam",
    "thrissur",
    "palakkad",
    "malappuram",
    "kozhikkod",
    "wayanad",
    "kannur",
    "kasarkkod"
  ];
  String? selecteditem = "palakkad";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              "SIGNUP",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: signkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "SignUp",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                  const Text(
                    "Please fill in the forms to create an account",
                    style: TextStyle(color: Colors.blue),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: namecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "required field!";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Name"),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                      onTap: () {
                        selectedtime(context);
                        signkey.currentState!.validate();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "required field";
                        } else {
                          return null;
                        }
                      },
                      controller: timecontroller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "time")),
                  RadioListTile(
                    title: const Text("male"),
                    value: "Male",
                    groupValue: selectedgender,
                    onChanged: (value) {
                      setState(() {
                        selectedgender = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("female"),
                    value: "female",
                    groupValue: selectedgender,
                    onChanged: (value) {
                      setState(
                        () {
                          selectedgender = value.toString();
                        },
                      );
                    },
                  ),
                  RadioListTile(
                    title: const Text("others"),
                    value: "others",
                    groupValue: selectedgender,
                    onChanged: (value) {
                      setState(() {
                        selectedgender = value.toString();
                      });
                    },
                  ),
                  const SizedBox(),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(border: OutlineInputBorder(),hintText: "State"),
                    value: selecteditem,
                    items: items
                    
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ),
                        )
                        .toList(),
                    onChanged: (item) => setState(
                      () {
                        selecteditem = item;
                      },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                      keyboardType: TextInputType.datetime,
                      readOnly: true,
                      onTap: () {
                        selecteddate(context);
                        signkey.currentState!.validate();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "required field";
                        } else {
                          return null;
                        }
                      },
                      controller: dateofbirthcontroller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Date of Birth")),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: emailcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "required filed";
                      }
                      bool isvalid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value);
                      if (!isvalid) {
                        return "email is not valid!";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Email"),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    controller: passwordcontroller,
                    onTap: () {
                      signkey.currentState!.validate();
                    },
                    validator: (value) {
                      checkpasswordmatch();
                      if (value == null || value.isEmpty) {
                        return "required field";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Password"),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    controller: confirmpasswordcontroller,
                    validator: (value) {
                      checkpasswordmatch();

                      if (value == null || value.isEmpty) {
                        return "required field!";
                      }
                      bool isvalid = passwordmatch;
                      if (!isvalid) {
                        return "passwords do not match";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        // errorText:
                        //     passwordmatch ? null : "passwords do not match!",
                        border: OutlineInputBorder(),
                        labelText: "Confirm password"),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: ischecked,
                        onChanged: (value) {
                          setState(() {
                            ischecked = value!;
                          });
                        },
                      ),
                      const Text(
                        "I agree these terms and condition",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            ischecked == false ? Colors.grey : Colors.green)),
                    onPressed: () {
                      checkpasswordmatch();
                      log(selectedgender);
                      if (signkey.currentState!.validate()) {
                        ischecked == false
                            ? ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("please agree terms and condition"),
                                ),
                              )
                            : Navigator.of(context).pop();
                      }
                    },
                    child: const Text(
                      "SignUp",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
