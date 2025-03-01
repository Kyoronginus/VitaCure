import 'package:flutter/material.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'login_button.dart';
import '../../../widgets/vitacure_logo.dart';
import '../../../widgets/text_styles.dart';

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

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Implement registration logic here
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
              LoginButton(text: 'Daftar', onPressed: _register)
            ],
          ),
        ),
      ),
    );
  }
}
