import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slivadoc_mobile_apps/screens/LoginPage.dart';

class PageRegister extends StatefulWidget {
  @override
  _PageRegisterState createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _whatsAppController = TextEditingController();
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _whatsAppCountryCode = '+62'; // Default country code
  String _whatsAppNumber = '';
  bool _isAgreed = false;

  void _register() {
    if (_formKey.currentState != null &&
        _formKey.currentState!.validate() &&
        _isAgreed) {
      String fullName = '$_firstName $_lastName';
      String phoneNumber = '$_whatsAppCountryCode$_whatsAppNumber';
      String userEmail = _emailController.text;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding:
                const EdgeInsets.all(16.0),
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    'lib/assets/logo.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                const Text(
                  'Berhasil!',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Pendaftaran berhasil untuk:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text('Nama: $fullName'),
                Text('Email: $userEmail'),
                Text('Nomor Telepon: $phoneNumber'),
              ],
            ),
            actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  'lib/assets/logo.png',
                  width: 24,
                  height: 24,
                ),
              ),
              const Text(
                'Buat Akun Baru',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nama Depan',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    hintText: 'Nama Depan',
                    hintStyle:
                        const TextStyle(fontSize: 12.0, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 15.0,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama depan tidak boleh kosong';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _firstName = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Nama Belakang',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    hintText: 'Nama Belakang',
                    hintStyle:
                        const TextStyle(fontSize: 12.0, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15.0,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama belakang tidak boleh kosong';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _lastName = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle:
                        const TextStyle(fontSize: 12.0, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15.0,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    if (!value.contains('@')) {
                      return 'Email tidak valid';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'WhatsApp',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(
                      width: 100.0,
                      child: DropdownButtonFormField<String>(
                        value: _whatsAppCountryCode,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 15.0,
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: '+62',
                            child: Text(
                              '+62',
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                          ),
                          DropdownMenuItem(
                            value: '+1',
                            child: Text(
                              '+1',
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                          ),
                          // Add more country codes as needed
                        ],
                        onChanged: (value) {
                          setState(() {
                            _whatsAppCountryCode = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        controller: _whatsAppController,
                        decoration: InputDecoration(
                          hintText: 'Nomor WhatsApp',
                          hintStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 15.0,
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^[8]\d*')),
                          LengthLimitingTextInputFormatter(15),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'WhatsApp tidak boleh kosong';
                          }
                          if (value.length < 10) {
                            return 'WhatsApp harus lebih dari 10 digit';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _whatsAppNumber = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Checkbox(
                      value: _isAgreed,
                      onChanged: (value) {
                        setState(() {
                          _isAgreed = value!;
                        });
                      },
                    ),
                    const Expanded(
                      child: Text(
                        'Saya telah membaca dan setuju dengan syarat dan ketentuan yang berlaku',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _register,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.blue;
                      }
                      return Colors.white;
                    }),
                    foregroundColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.white;
                      }
                      return Colors.blue;
                    }),
                    side: MaterialStateProperty.all(
                        const BorderSide(color: Colors.blue)),
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 48)),
                  ),
                  child: const Text(
                    'Kembali',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _whatsAppController.dispose();
    super.dispose();
  }
}
