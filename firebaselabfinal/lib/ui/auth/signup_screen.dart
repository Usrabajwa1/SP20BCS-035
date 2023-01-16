import 'package:flutter/material.dart';

import '../../home.dart';

class SigupScreen extends StatefulWidget {
  const SigupScreen({Key? key}) : super(key: key);

  @override
  State<SigupScreen> createState() => _SigupScreenState();
}

class _SigupScreenState extends State<SigupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: Column(
            children: const [
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black,),
                ),
              ),
            ],
          )
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.yellow,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: nameController,
                        decoration: const InputDecoration(
                            hintText: 'Name',
                            prefixIcon: Icon(Icons.edit)

                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: nameController,
                        decoration: const InputDecoration(
                            hintText: 'Father Name',
                            prefixIcon: Icon(Icons.edit)

                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: phoneController,
                        decoration: const InputDecoration(
                            hintText: 'Phone',
                            prefixIcon: Icon(Icons.phone_android)

                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: const InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email)

                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'Password',

                            prefixIcon: Icon(Icons.password_rounded)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter password';
                          }
                          return null;
                        },
                      ),

                    ],
                  )
              ),
              const SizedBox(height: 50,),

              ElevatedButton(
                child: Text("Login"),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => TutorialHome())

                  );
                },
              ),

              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You have already an account?"),
                  TextButton(onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => SigupScreen())

                    );
                  },
                      child: Text('Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),))
                ],
              )

            ],
          ),
        )

      ),
    );
  }
}