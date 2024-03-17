import 'package:flutter/material.dart';

class AnimalAcademyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal Academy'),
      ),
      body: const Center(
        child: Text('Halaman Pelatihan Hewan Peliharaan'),
      ),
    );
  }
}