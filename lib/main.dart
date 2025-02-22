import 'package:flutter/material.dart';
import 'package:login_app/api_impl.dart';
import 'package:login_app/side_menu_bar_impl_new.dart';

void main() {
  runApp(const MyApp());
}

const username = "adminn";
const password = "adminn";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // formKey - to validate the form
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // usernameController - to get the value of the username field
  // passwordController - to get the value of the password field
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void validateLogin() {
    if (formKey.currentState!.validate()) {
      print("Username: ${usernameController.text}");
      print("Password: ${passwordController.text}");

      if (usernameController.text.toLowerCase() == username &&
          passwordController.text == password) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => APIImpl()),
        );
      } else {
        showSnackbar(context, "Username or password incorrect.");
      }
    } else {
      showSnackbar(context, "Incorrect details.");
    }
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        // decoration: BoxDecoration(color: Colors.redAccent),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.login, size: 100),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Value cannot be empty";
                  }
                  if (value.length < 6) {
                    return "Username should be at least 6 characters long";
                  }
                  return null;
                },
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Enter Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  helperText: "Username should be at least 6 characters long",
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Value cannot be empty";
                  }
                  if (value.length < 6) {
                    return "Password should be at least 6 characters long";
                  }
                  return null;
                },
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  hintText: "Enter Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  helperText: "Password should be at least 6 characters long",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  validateLogin();
                },
                child: Text(
                  "Submit",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.password,
    required this.username,
  });

  final String username;
  final String password;

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              showSnackbar(context, "Logged out successfully.");
            },
            child: Icon(
              Icons.logout,
            ),
          )
        ],
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Welcome $username"),
            Text("Your password is $password"),
          ],
        ),
      ),
    );
  }
}
