import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slivadoc_mobile_apps/screens/CariDokterPage.dart';
import 'package:slivadoc_mobile_apps/screens/TanyaDokterPage.dart';
import 'package:slivadoc_mobile_apps/screens/ArtikelKesehatanPage.dart';
import 'package:slivadoc_mobile_apps/screens/SlivaProteksiPage.dart';
import 'package:slivadoc_mobile_apps/screens/SlivaShopPage.dart';
import 'package:slivadoc_mobile_apps/screens/AnimalEventPage.dart';
import 'package:slivadoc_mobile_apps/screens/AnimalAcademyPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomeScreen(),
    CariDokterPage(),
    TanyaDokterPage(),
    ArtikelKesehatanPage(),
    SlivaProteksiPage(),
    SlivaShopPage(),
    // AnimalEventPage(),
    // AnimalAcademyPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _navigateToPage(BuildContext context, String pageTitle) {
    switch (pageTitle) {
      case 'Cari Dokter':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CariDokterPage()),
        );
        break;
      case 'Tanya Dokter':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TanyaDokterPage()),
        );
        break;
      case 'Artikel Kesehatan':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArtikelKesehatanPage()),
        );
        break;
      case 'SlivaProteksi':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SlivaProteksiPage()),
        );
        break;
      case 'SlivaShop':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SlivaShopPage()),
        );
        break;
      case 'Animal Event':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AnimalEventPage()),
        );
        break;
      case 'Animal Academy':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AnimalAcademyPage()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: SizedBox(
                  height: 32,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Cari nama dokter, klinik, produk?',
                      prefixIcon:
                          const Icon(Icons.search, color: Color(0xFF00B7FF)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: SizedBox(
                      child: Image.asset(
                        'lib/assets/logo.png',
                        width: 32,
                        height: 32,
                      ),
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
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
                _navigateToPage(context, 'Cari Dokter');
              },
            ),
            ListTile(
              title: const Text('Tanya Dokter'),
              onTap: () {
                _navigateToPage(context, 'Tanya Dokter');
              },
            ),
            ListTile(
              title: const Text('Artikel Kesehatan'),
              onTap: () {
                _navigateToPage(context, 'Artikel Kesehatan');
              },
            ),
            ListTile(
              title: const Text('SlivaProteksi'),
              onTap: () {
                _navigateToPage(context, 'SlivaProteksi');
              },
            ),
            ListTile(
              title: const Text('SlivaShop'),
              onTap: () {
                _navigateToPage(context, 'SlivaShop');
              },
            ),
            ListTile(
              title: const Text('Animal Event'),
              onTap: () {
                _navigateToPage(context, 'Animal Event');
              },
            ),
            ListTile(
              title: const Text('Animal Academy'),
              onTap: () {
                _navigateToPage(context, 'Animal Academy');
              },
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          border: Border(
            top: BorderSide(
              color: Colors.blue, // Warna border atas
              width: 1.0, // Lebar border
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Cari Dokter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.question_answer),
              label: 'Tanya Dokter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Artikel Kesehatan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_pharmacy),
              label: 'SlivaProteksi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'SlivaShop',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.event),
            //   label: 'Animal Event',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.school),
            //   label: 'Animal Academy',
            // ),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            child: Image.asset(
              'lib/assets/meow.png',
              height: 300,
              width: 300,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Hubungi Klinik page
                },
                child: const Text('Hubungi Klinik'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Hubungi Dokter page
                },
                child: const Text('Hubungi Dokter'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Klinik Terdekat',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/klinik_${index + 1}.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Klinik Hewan SlivaDoc ${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
