import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('lib/assets/logo.png', width: 32, height: 32),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: SizedBox(
                    width: 48, // Adjust the width as needed
                    height: 48, // Adjust the height as needed
                    child: Image.asset('lib/assets/humberger.png', width: 48, height: 48), // Set the desired width and height
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Cari Dokter'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Tanya Dokter'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Artikel Kesehatan'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('SlivaProteksi'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('SlivaShop'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Animal Event'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Animal Academy'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Welcome to the HomePage!'),
      ),
    );
  }
}
