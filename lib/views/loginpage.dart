

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app1/views/homepage.dart';
import 'package:flutter_app1/views/signuppage.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> loginkey = GlobalKey<FormState>();
    TextEditingController usernamecontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    void login(String username, String password) {
      if (username == "swathi" && password == "1234") {
        log("correct");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Homepage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("incorrect username or password!"),
          backgroundColor: Colors.grey,
        ));
        log("invalid username or password");
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: loginkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    color: Colors.blue),
              ),
              const SizedBox(height: 30),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "required field!";
                  } else {
                    return null;
                  }
                },
                controller: usernamecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "username",
                  hintText: " enter your user name",
                  hintStyle:
                      TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "required field!";
                  } else {
                    return null;
                  }
                },
                controller: passwordcontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "password",
                    hintText: "enter your password",
                    hintStyle:
                        TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                    prefixIcon: Icon(
                      Icons.key,
                      color: Colors.blue,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "forgot password?",
                        style: TextStyle(
                            color: Colors.black, fontStyle: FontStyle.italic),
                      )),
                ],
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  if (loginkey.currentState!.validate()) {
                    login(usernamecontroller.text, passwordcontroller.text);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Homepage()));
                  }

                },
                child: const Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.black),
                ),
              ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                  children: [
                    const Text(
                      "Not a member?",
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.black),
                    ),
                    TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Signup()));}, child: const Text("signup",style: TextStyle(color: Colors.blue),))
                  ],
                               ),
               )
            ],
          ),
        ),
      ),
    );
  }
}
