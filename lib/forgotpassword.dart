import 'package:flutter/material.dart';
import 'main.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {
  // Controllers
  final TextEditingController fullNameController =
      TextEditingController();
  final TextEditingController usernameController =
      TextEditingController();
  final TextEditingController newPasswordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          // 🔵 TOP PURPLE HEADER
          Container(
            width: double.infinity,
            height: 220,
            color: const Color(0xFF8E24AA),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 35,
                  backgroundColor:
                      Colors.white24,
                  child: Icon(
                    Icons.airplanemode_active,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "TravelLounge: SEA",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Reset your password",
                  style: TextStyle(
                      color: Colors.white70),
                ),
              ],
            ),
          ),

          // FORM CARD
          Expanded(
            child: Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.all(20),
              decoration:
                  const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child:
                  SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Reset Password",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                        height: 20),

                    // FULL NAME
                    const Text(
                        "Full Name"),
                    const SizedBox(
                        height: 8),
                    TextField(
                      controller:
                          fullNameController,
                      decoration:
                          InputDecoration(
                        hintText:
                            "Enter your full name",
                        prefixIcon:
                            const Icon(Icons
                                .person_outline),
                        filled: true,
                        fillColor:
                            Colors.grey[100],
                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      10),
                          borderSide:
                              BorderSide
                                  .none,
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 15),

                    // USERNAME
                    const Text(
                        "Username"),
                    const SizedBox(
                        height: 8),
                    TextField(
                      controller:
                          usernameController,
                      decoration:
                          InputDecoration(
                        hintText:
                            "Enter your username",
                        prefixIcon:
                            const Icon(Icons
                                .alternate_email),
                        filled: true,
                        fillColor:
                            Colors.grey[100],
                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      10),
                          borderSide:
                              BorderSide
                                  .none,
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 15),

                    // NEW PASSWORD
                    const Text(
                        "New Password"),
                    const SizedBox(
                        height: 8),
                    TextField(
                      controller:
                          newPasswordController,
                      obscureText:
                          true,
                      decoration:
                          InputDecoration(
                        hintText:
                            "Enter your new password",
                        prefixIcon:
                            const Icon(Icons
                                .lock_outline),
                        suffixIcon:
                            const Icon(Icons
                                .visibility_outlined),
                        filled: true,
                        fillColor:
                            Colors.grey[100],
                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      10),
                          borderSide:
                              BorderSide
                                  .none,
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 15),

                    // CONFIRM PASSWORD
                    const Text(
                        "Confirm Password"),
                    const SizedBox(
                        height: 8),
                    TextField(
                      controller:
                          confirmPasswordController,
                      obscureText:
                          true,
                      decoration:
                          InputDecoration(
                        hintText:
                            "Confirm your new password",
                        prefixIcon:
                            const Icon(Icons
                                .lock_outline),
                        suffixIcon:
                            const Icon(Icons
                                .visibility_outlined),
                        filled: true,
                        fillColor:
                            Colors.grey[100],
                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      10),
                          borderSide:
                              BorderSide
                                  .none,
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 20),

                    // ✅ RESET BUTTON (WHITE TEXT + Redirect)
                    SizedBox(
                      width: double
                          .infinity,
                      child:
                          ElevatedButton(
                        style:
                            ElevatedButton
                                .styleFrom(
                          padding:
                              const EdgeInsets
                                  .all(
                                      14),
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius
                                    .circular(
                                        10),
                          ),
                          backgroundColor:
                              const Color(
                                  0xFF7B1FA2),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(
                                  context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Password Reset Successful!"),
                            ),
                          );

                          // Redirect to Login
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LoginScreen(),
                            ),
                            (route) =>
                                false,
                          );
                        },
                        child:
                            const Text(
                          "Reset Password",
                          style:
                              TextStyle(
                            fontSize:
                                16,
                            color: Colors
                                .white, // ✅ White text
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 25),

                    // ✅ CLICKABLE RETURN TO LOGIN
                    Center(
                      child:
                          GestureDetector(
                        onTap: () {
                          Navigator
                              .pop(
                                  context);
                        },
                        child:
                            const Text(
                          "Return to Login",
                          style:
                              TextStyle(
                            color: Colors
                                .purple,
                            fontWeight:
                                FontWeight
                                    .bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
