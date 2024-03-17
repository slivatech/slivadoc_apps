import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileUpdateScreen extends StatefulWidget {
  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _bio = '';
  File? _profilePicture;
  final _usernameController = TextEditingController();
  final _bioController = TextEditingController();
  bool _isUpdating = false;

  @override
  void initState() {
    super.initState();
    _usernameController.text = _username;
    _bioController.text = _bio;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isUpdating = true;
      });
      _formKey.currentState!.save();
      // Update user profile in Firebase here
      // Navigate back to the profile screen
      Navigator.pop(context);
    }
  }

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _profilePicture = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  _profilePicture == null ? null : FileImage(_profilePicture!),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Choose an option"),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            GestureDetector(
                              child: const Text("Gallery"),
                              onTap: () {
                                Navigator.of(context).pop();
                                _getImage(ImageSource.gallery);
                              },
                            ),
                            const Padding(padding: EdgeInsets.all(8.0)),
                            GestureDetector(
                              child: const Text("Camera"),
                              onTap: () {
                                Navigator.of(context).pop();
                                _getImage(ImageSource.camera);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('Change Profile Picture'),
            ),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
              onSaved: (value) => _username = value!,
            ),
            TextFormField(
              controller: _bioController,
              decoration: const InputDecoration(labelText: 'Bio'),
              onSaved: (value) => _bio = value!,
            ),
            ElevatedButton(
              onPressed: _isUpdating ? null : _updateProfile,
              child: _isUpdating
                  ? const CircularProgressIndicator()
                  : const Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
