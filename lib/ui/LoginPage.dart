import 'package:flutter/material.dart';
import 'package:offline_phone_book/ui/HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var userFixed = 'bigm';
  var passFixed = '12345';
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController = TextEditingController();
    super.dispose();
  }

  void authentication(String name, String password) {
    if (name == userFixed && password == passFixed) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const MyHomePage(
              title: 'Phone Book',
            );
          },
        ),
      );
    } else {
      showSnackBar('Try Again !!!');
    }
  }

  void showSnackBar(String massage) {
    var snackBar = SnackBar(content: Text(massage));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  controller: _usernameController,
                  cursorColor: Colors.blue,
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                    //suffixIcon: Icon(Icons.clear),
                    labelText: 'Username',
                    hintText: 'bigm',
                    hintStyle: TextStyle(color: Colors.black26),
                    //helperText: 'Username : bigm',
                    filled: false,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  controller: _passwordController,
                  obscureText: true,
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.blue,
                    ),
                    //suffixIcon: Icon(Icons.clear),
                    labelText: 'Password',
                    hintText: '12345',
                    hintStyle: TextStyle(color: Colors.black26),
                    //helperText: 'Password : 12345',
                    filled: false,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    authentication(
                      _usernameController.text,
                      _passwordController.text,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
