import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController emailController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  bool showpass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.fill)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Create Account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: Container(
                      child: Column(
                    children: [
                      // username

                      SizedBox(
                        width: 350,
                        child: TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                              prefixIconColor: Colors.white,
                              hintText: 'Enter your name',
                              prefixIcon: const Icon(Icons.person),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // email

                      SizedBox(
                        width: 350,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              prefixIconColor: Colors.white,
                              hintText: 'Enter your gmail',
                              prefixIcon: const Icon(Icons.mail),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      // password
                      SizedBox(
                        width: 350,
                        child: TextField(
                          controller: passwordController,
                          obscureText: showpass,
                          decoration: InputDecoration(
                              prefixIconColor: Colors.white,
                              suffixIconColor: Colors.white,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showpass = !showpass;
                                  });
                                },
                                icon: showpass
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                              ),
                              hintText: 'Enter your password',
                              prefixIcon: const Icon(Icons.lock),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //age
                      SizedBox(
                        width: 350,
                        child: TextField(
                          controller: ageController,
                          decoration: InputDecoration(
                              prefixIconColor: Colors.white,
                              hintText: 'Enter your Age',
                              prefixIcon: const Icon(Icons.numbers),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                        width: 250,
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text('Create')),
                      )
                    ],
                  )),
                )
              ],
            )));
  }
}
