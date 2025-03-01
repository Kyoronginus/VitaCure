import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/bottom_nav_bar.dart';
import 'login_button.dart';
import '../../../widgets/vitacure_logo.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/text_styles.dart';
import '../../../routes/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();
  final TextEditingController _nomorTeleponController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  void _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Save additional user data to Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'nama': _namaController.text,
          'tanggalLahir': _tanggalLahirController.text,
          'nomorTelepon': _nomorTeleponController.text,
          'email': _emailController.text,
          'weight': _weightController.text,
          'height': _heightController.text,
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Registration successful')));
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      } on FirebaseAuthException catch (e) {
        String message;
        if (e.code == 'weak-password') {
          message = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          message = 'The account already exists for that email.';
        } else {
          message = 'An error occurred. Please try again.';
        }
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('An error occurred. Please try again. wow')));
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _tanggalLahirController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Register'),
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(child: VitacureLogo()), // Add the VitacureLogo widget
              SizedBox(height: 20),
              Divider(
                color: const Color.fromARGB(
                    255, 0, 0, 0), // Set the color of the line
                thickness: 3.0, // Set the thickness of the line
              ),
              SizedBox(height: 20),
              RobotoText('Nama Lengkap', fontSize: 18),
              SizedBox(height: 5),
              CustomTextFormField(
                controller: _namaController,
                labelText: 'Nama Lengkap',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama lengkap diperlukan';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              RobotoText('Tanggal Lahir', fontSize: 18),
              SizedBox(height: 5),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: CustomTextFormField(
                    controller: _tanggalLahirController,
                    labelText: 'Tanggal Lahir',
                    prefixIcon: Icon(Icons.calendar_today),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tanggal lahir diperlukan';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              RobotoText('Nomor Telepon', fontSize: 18),
              SizedBox(height: 5),
              CustomTextFormField(
                controller: _nomorTeleponController,
                labelText: 'Nomor Telepon',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor telepon diperlukan';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              RobotoText('Email', fontSize: 18),
              SizedBox(height: 5),
              CustomTextFormField(
                controller: _emailController,
                labelText: 'Email',
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
              RobotoText('Konfirmasi Kata Sandi', fontSize: 18),
              SizedBox(height: 5),
              CustomTextFormField(
                controller: _confirmPasswordController,
                labelText: 'Masukkan kata sandi',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Konfirmasi password diperlukan';
                  }
                  if (value != _passwordController.text) {
                    return 'Password tidak cocok';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              RobotoText('Weight', fontSize: 18),
              SizedBox(height: 5),
              CustomTextFormField(
                controller: _weightController,
                labelText: 'Weight',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Weight diperlukan';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              RobotoText('Height', fontSize: 18),
              SizedBox(height: 5),
              CustomTextFormField(
                controller: _heightController,
                labelText: 'Height',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Height diperlukan';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              LoginButton(text: 'Daftar', onPressed: _register),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text('Sudah Punya Akun?'))
            ],
          ),
        ),
      ),
    );
  }
}
