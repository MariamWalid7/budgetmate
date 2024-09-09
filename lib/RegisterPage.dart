import 'package:flutter/material.dart';
import 'database.dart';

class RegisterPage extends StatefulWidget{
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  Future<void> registerUser() async {
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    if (password == confirmPasswordController.text) {
      // Save user to the database using DatabaseHelper
      Map<String, dynamic> user = {
        'username': username,
        'email': email,
        'password': password,
      };

      await DatabaseHelper().insertUser(user);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Registered!")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Passwords do not match!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40), // Add padding for top content
              Text(
                'BudgetMate',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4E9A7D),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Create an account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Manage Your Financial Expenses today',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 16),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Enter your username',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16,),
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4E9A7D))
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter you email',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Please Enter Your Password',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  labelText: 'Password',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4E9A7D))
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Please Confirm Your Password',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  labelText: 'Password Confirmation',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4E9A7D))
                  ),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: registerUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4E9A7D),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Register', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              SizedBox(height: 24),
              TextButton(
                onPressed: () {
                  // Add login navigation here
                },
                child: Text(
                  'Already have an account? Login',
                  style: TextStyle(color: Color(0xFF4E9A7D)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}