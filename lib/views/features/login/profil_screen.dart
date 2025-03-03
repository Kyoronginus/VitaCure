import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ureekaphase2_kesehatan/widgets/text_styles.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../../../widgets/custom_app_bar.dart';
import 'login_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  User? user;
  Map<String, dynamic>? userData;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();
  final TextEditingController _nomorTeleponController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  void _getUser() async {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDataSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();
      setState(() {
        userData = userDataSnapshot.data() as Map<String, dynamic>?;
        _namaController.text = userData?['nama'] ?? '';
        _tanggalLahirController.text = userData?['tanggalLahir'] ?? '';
        _nomorTeleponController.text = userData?['nomorTelepon'] ?? '';
        _emailController.text = userData?['email'] ?? '';
        _weightController.text = userData?['weight'] ?? '';
        _heightController.text = userData?['height'] ?? '';
      });
    }
  }

  void _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .update({
          'nama': _namaController.text,
          'tanggalLahir': _tanggalLahirController.text,
          'nomorTelepon': _nomorTeleponController.text,
          'email': _emailController.text,
          'weight': _weightController.text,
          'height': _heightController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Profile updated successfully')));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('An error occurred. Please try again.')));
      }
    }
  }

  void _deleteAccount() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .delete();
      await user!.delete();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Account deleted successfully')));
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred. Please try again.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Profil Saya',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: user == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.account_circle, size: 100, color: Colors.grey),
                    SizedBox(height: 10),
                    Text(
                      'Guest',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    RobotoText('Masuk Untuk\nMelihat Profil'),
                    SizedBox(height: 16.0),
                    LoginButton(
                      text: 'Masuk',
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                  ],
                )
              : Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                                radius: 40,
                                backgroundImage: user != null
                                    ? AssetImage(
                                        'assets/images/icon_loggedin.png')
                                    : AssetImage(
                                        'assets/images/Profileuser1.png')),
                            SizedBox(height: 10),
                            Text(
                              userData?['nama'] ?? 'User',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      ExpansionTile(
                        leading: Icon(Icons.person, color: Colors.teal),
                        title: Text('Data Diri',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        children: [
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
                          Center(
                            child: LoginButton(
                              text: 'Simpan',
                              onPressed: _saveProfile,
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                      ExpansionTile(
                        leading: Icon(Icons.payment, color: Colors.teal),
                        title: Text('Metode Pembayaran',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        children: [
                          Padding(
                              padding: EdgeInsets.all(16.0),
                              child: LoginButton(
                                  text: "Tambah Metode Pembayaran",
                                  onPressed: () {})),
                        ],
                      ),
                      ExpansionTile(
                        leading: Icon(Icons.delete, color: Colors.red),
                        title: Text('Hapus Akun',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Apakah Anda Ingin Menghapus Akun?',
                                  style: TextStyle(color: Colors.red),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Ketik nama akun disini',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: LoginButton(
                                    text: 'Hapus',
                                    onPressed: _deleteAccount,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ListTile(
                        leading: Icon(Icons.logout, color: Colors.teal),
                        title: Text('Keluar',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          setState(() {
                            user = null;
                            userData = null;
                          });
                        },
                      ),
                    ],
                  ),
                ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
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
}
