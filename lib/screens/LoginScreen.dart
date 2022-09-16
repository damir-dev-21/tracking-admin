import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';
import 'package:tracking_admin_panel/routes/router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObsured = true;
  late FToast fToast;
  bool isLoad = false;

  String name = '';
  String surname = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Войти",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (e) {
                  setState(() {
                    name = e;
                  });
                },
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    labelText: 'Имя',
                    focusColor: Colors.amber,
                    labelStyle: const TextStyle(color: Colors.black),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              child: TextField(
                keyboardType: TextInputType.text,
                onChanged: (text) => {
                  setState(() {
                    password = text;
                  })
                },
                cursorColor: Colors.blueGrey,
                obscureText: isObsured,
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    labelStyle: const TextStyle(color: Colors.blueGrey),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    suffixIconColor: Colors.black,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isObsured ? Icons.visibility : Icons.visibility_off,
                        color: Colors.blueGrey,
                      ),
                      onPressed: () {
                        setState(() {
                          isObsured = !isObsured;
                        });
                      },
                    ),
                    labelText: "Пароль",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 17,
            ),
            GestureDetector(
              onTap: () {
                if (name == "admin" && password == "123") {
                  context.router.push(MainRoute());
                }
              },
              child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(6)),
                  child: const Center(
                    child: Text(
                      "Войти",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
