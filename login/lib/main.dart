import 'package:flutter/material.dart';
import 'success_page.dart'; // Import file success_page.dart

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false, // Biar tidak ada tulisan debug
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String errorText = '';

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (!username.endsWith('@gmail.com')) {
      setState(() {
        errorText = 'Username harus diakhiri dengan @gmail.com';
      });
    } else if (username.contains(' ')) {
      setState(() {
        errorText = 'Username tidak boleh mengandung spasi';
      });
    } else if (password != '22421067') {
      setState(() {
        errorText = 'Password salah';
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuccessPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Login Account',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: login,
                  child: Text('Login'),
                ),
                if (errorText.isNotEmpty) ...[
                  SizedBox(height: 20),
                  Text(
                    errorText,
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
