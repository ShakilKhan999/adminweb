import 'package:adminweb/screen/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool visiblepass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Admin Panel',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF4B5563),
                      fontSize: 7.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100.w,
                        height: 50.h,
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF0a7bc4), width: 1.2)),
                            prefixIcon: Icon(Icons.mail_outline,
                                color: Color(0xFF0a7bc4)),
                            labelText: 'Email',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.2)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.2)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 100.w,
                        height: 50.h,
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: !visiblepass,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock_outlined,
                                color: Color(0xFF0a7bc4),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF0a7bc4), width: 1.2)),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.2)),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.2)),
                              suffixIcon: visiblepass
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          visiblepass
                                              ? visiblepass = false
                                              : visiblepass = true;
                                        });
                                      },
                                      icon: const Icon(Icons.visibility,
                                          color: Color(0xFF0a7bc4)))
                                  : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          visiblepass
                                              ? visiblepass = false
                                              : visiblepass = true;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.visibility_off,
                                        color: Color(0xFF0a7bc4),
                                      )),
                              labelText: 'Password',
                              labelStyle: const TextStyle(color: Colors.black)),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 100.w,
                        height: 40.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0a7bc4),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DashboardScreen(),
                                    ));
                            if (emailController.text == '') {
                              const snackBar = SnackBar(
                                content: Text('Email required'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;
                            }
                            if (passwordController.text == '') {
                              const snackBar = SnackBar(
                                content: Text('Password required'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              return;
                            } else {
                              if (emailController.text == "admin@gmail.com" &&
                                  passwordController.text == "admin") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DashboardScreen(),
                                    ));
                              } else {
                                const snackBar = SnackBar(
                                  content: Text('Invalid Email or Password'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            }
                          },
                          child: Text(
                            'Login',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.h),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
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
