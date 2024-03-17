import 'package:flutter/cupertino.dart';
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
      home: const HomePage(),
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

  final Map<String, Widget> _pageMap = {
    'Home': const HomeScreen(),
    'Cari Dokter': CariDokterPage(),
    'Tanya Dokter': TanyaDokterPage(),
    'Artikel Kesehatan': ArtikelKesehatanPage(),
    'SlivaProteksi': SlivaProteksiPage(),
    'SlivaShop': SlivaShopPage(),
    'Animal Event': AnimalEventPage(),
    'Animal Academy': AnimalAcademyPage(),
  };

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _navigateToPage(BuildContext context, String pageTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _pageMap[pageTitle]!),
    );
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
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    decoration: InputDecoration(
                      hintText: 'Cari nama dokter, klinik?',
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
            IconButton(
              onPressed: () {
                // Action when chat icon is tapped
              },
              icon: const Icon(
                Icons.chat,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () {
                // Handle notification icon press
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      body: _pageMap.values.elementAt(_currentIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          border: Border(
            top: BorderSide(
              color: Colors.blue,
              width: 1.0,
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
          MaterialPageRoute(builder: (context) => CariDokterPage()),
        );
        break;
      case 'Artikel Kesehatan':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArtikelKesehatanPage()),
        );
        break;
      case 'Pesan Driver':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArtikelKesehatanPage()),
        );
        break;
      case 'Sliva Proteksi':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SlivaProteksiPage()),
        );
        break;
      case 'Sliva Shop':
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(context, 'Cari \nDokter'),
                _buildButton(context, 'Tanya \nDokter'),
                _buildButton(context, 'Artikel \nKesehatan'),
                _buildButton(context, 'Pesan \nDriver'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(context, 'Sliva \nProteksi'),
                _buildButton(context, 'Sliva \nShop'),
                _buildButton(context, 'Animal \nEvent'),
                _buildButton(context, 'Animal \nAcademy'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title) {
    return ElevatedButton(
      onPressed: () {
        _navigateToPage(context, title);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide.none,
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            'lib/assets/logo.png',
            height: 40,
            width: 40,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
