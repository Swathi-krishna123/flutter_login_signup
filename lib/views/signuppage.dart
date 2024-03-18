import 'package:flutter/material.dart';

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
  String selectedgender = "";
  bool passwordmatch = true;

  void checkpasswordmatch() {
    setState(() {
      passwordmatch = passwordcontroller.text == confirmpasswordcontroller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SIGNUP",
          style: TextStyle(color: Colors.white),
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
                      setState(() {
                        selectedgender = value.toString();
                      });
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
                  TextFormField(
                      onTap: () {
                        showDatePicker(
                            context: context,
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now());
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
                    validator: (value) {
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
                      } else {
                        return null;
                      }
                    },
                    decoration:  InputDecoration(
                      errorText: passwordmatch ? null :"passwords do not match!",
                        border: OutlineInputBorder(),
                        labelText: "Confirm password"),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {
                      checkpasswordmatch();
                      print(selectedgender);
                      if (signkey.currentState!.validate()) {
                        Navigator.of(context).pop();
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
