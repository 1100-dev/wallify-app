import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isLoading = false;
  bool obscure = true;

  Future<void> signup() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      _show("Please fill all fields");
      return;
    }

    if (password != confirmPassword) {
      _show("Passwords do not match");
      return;
    }

    if (password.length < 6) {
      _show("Password must be at least 6 characters");
      return;
    }

    setState(() => isLoading = true);

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!mounted) return;

      _show("Account created ");

      Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      _show(_mapError(e.code));
    } catch (e) {
      _show("Something went wrong");
    }

    if (mounted) {
      setState(() => isLoading = false);
    }
  }

  String _mapError(String code) {
    switch (code) {
      case "email-already-in-use":
        return "Email already exists";

      case "invalid-email":
        return "Invalid email";

      case "weak-password":
        return "Password too weak";

      default:
        return "Signup failed";
    }
  }

  void _show(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Container(
            width: 420,
            padding: const EdgeInsets.all(25),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                //--------------------------------
                // HEADER
                //--------------------------------
                const Center(
                  child: Icon(
                    Icons.person_add_alt_1,
                    size: 55,
                    color: Colors.deepPurple,
                  ),
                ),

                const SizedBox(height: 15),

                const Center(
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                const Center(
                  child: Text(
                    "Join Wallify today",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                //--------------------------------
                // EMAIL
                //--------------------------------
                _input(
                  emailController,
                  "Email",
                  false,
                ),

                const SizedBox(height: 15),

                //--------------------------------
                // PASSWORD
                //--------------------------------
                TextField(
                  controller: passwordController,
                  obscureText: obscure,

                  decoration:
                  _decoration("Password")
                      .copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                //--------------------------------
                // CONFIRM PASSWORD
                //--------------------------------
                _input(
                  confirmPasswordController,
                  "Confirm Password",
                  true,
                ),

                const SizedBox(height: 25),

                //--------------------------------
                // BUTTON
                //--------------------------------
                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    onPressed:
                    isLoading ? null : signup,

                    style:
                    ElevatedButton.styleFrom(
                      backgroundColor:
                      Colors.deepPurple,

                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                            14),
                      ),
                    ),

                    child: isLoading
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                //--------------------------------
                // LOGIN LINK
                //--------------------------------
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text(
                      "Already have an account? Login",
                      style: TextStyle(
                        color: Colors.deepPurple,
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

  Widget _input(
      TextEditingController controller,
      String label,
      bool obscure,
      ) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: _decoration(label),
    );
  }

  InputDecoration _decoration(
      String label,
      ) {
    return InputDecoration(
      labelText: label,

      filled: true,
      fillColor: const Color(0xFFF7F8FC),

      border: OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(14),

        borderSide: BorderSide.none,
      ),
    );
  }
}