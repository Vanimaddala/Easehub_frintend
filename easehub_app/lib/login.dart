import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cse_hod_page.dart';
import 'ece_hod_page.dart';
import 'security_page.dart';
import 'cse_faculty_page.dart';
import 'ece_faculty_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _token;
  bool _isLoading = false;
  bool _loginFailed = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _login(String username, String password) async {
    setState(() {
      _isLoading = true;
      _loginFailed = false;
    });

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/api/v1/auth/authenticate'),
        body: json.encode({
          'username': username,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        _token = jsonResponse['token'];
        _loginSuccess(
            jsonResponse['role'], jsonResponse['branch'], jsonResponse['name']);
      } else {
        setState(() {
          _loginFailed = true;
        });
      }
    } catch (e) {
      setState(() {
        _loginFailed = true;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _loginSuccess(String role, String branch, String name) {
    if (role == 'hod') {
      if (branch == 'cse') {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CseHodPage(name: name, designation: 'HOD')),
        );
      } else if (branch == 'ece') {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EceHodPage(name: name, designation: 'HOD')),
        );
      }
    } else if (role == 'security') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecurityPage(name: name)),
      );
    } else if (role == 'faculty') {
      if (branch == 'cse') {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CseFacultyPage(name: name, designation: 'Faculty')),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  EceFacultyPage(name: name, designation: 'Faculty')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[900]!, Colors.blue[800]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _animation,
                child: Image.asset(
                  'assets/logo.png',
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: TextStyle(color: Colors.black),
                obscureText: true,
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        _animationController.forward();
                        _login(
                          _usernameController.text,
                          _passwordController.text,
                        ).then((_) {
                          print('Login successful');
                        }).catchError((error) {
                          setState(() {
                            _loginFailed = true;
                          });
                        });
                      },
                      child: Text('Login'),
                    ),
              if (_loginFailed)
                Text(
                  'Login failed. Please try again.',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
