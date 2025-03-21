import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/bottom_nav_bar.dart';
import 'login_button.dart';
import '../../../widgets/vitacure_logo.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          DocumentSnapshot userData = await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();
          print('User data: ${userData.data()}');
        }

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Login successful')));
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      } on FirebaseAuthException catch (e) {
        String message;
        if (e.code == 'user-not-found') {
          message = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          message = 'Wrong password provided.';
        } else {
          message = 'Email or password is incorrect.';
        }
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('An error occurred. Please try again.')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Login'),
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(child: VitacureLogo()),
              SizedBox(height: 20),
              Divider(
                color: const Color.fromARGB(255, 0, 0, 0),
                thickness: 3.0,
              ),
              SizedBox(height: 20),
              RobotoText('Alamat E-Mail', fontSize: 18),
              SizedBox(height: 5),
              CustomTextFormField(
                controller: _emailController,
                labelText: 'contoh@gmail.com',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email diperlukan';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              RobotoText('Kata Sandi', fontSize: 18),
              SizedBox(height: 5),
              CustomTextFormField(
                controller: _passwordController,
                labelText: 'Masukkan kata sandi',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password diperlukan';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              LoginButton(text: 'Login', onPressed: _login),
              SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text('Belum Punya Akun?'))
            ],
          ),
        ),
      ),
    );
  }
}
