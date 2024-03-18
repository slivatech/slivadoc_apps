import 'package:flutter/material.dart';
import 'package:slivadoc_mobile_apps/screens/CariDokterPage.dart';
import 'package:slivadoc_mobile_apps/screens/TanyaDokterPage.dart';
import 'package:slivadoc_mobile_apps/screens/ArtikelKesehatanPage.dart';
import 'package:slivadoc_mobile_apps/screens/SlivaShopPage.dart';
import 'package:slivadoc_mobile_apps/screens/AnimalEventPage.dart';
import 'package:slivadoc_mobile_apps/screens/AnimalAcademyPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slivadoc_mobile_apps/screens/Profile.dart';
import 'package:slivadoc_mobile_apps/components/SliderBanner.dart';
import 'package:slivadoc_mobile_apps/components/SliderService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slivadoc',
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
    'Profile': ProfileUpdateScreen(),
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
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    decoration: const InputDecoration(
                      hintText: 'Cari nama dokter, klinik?',
                      border: InputBorder.none,
                      prefixIcon:
                          Icon(Icons.search, color: Color(0xFF3254AB)),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                // Handle notification icon press
              },
              icon: const Icon(
                Icons.notifications,
                color: Color(0xFF3254AB),
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
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 120, 247, 252),
              blurRadius: 3.0,
              spreadRadius: 1.0,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: onTabTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Color(0xFF3254AB)),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.stethoscope,
                    color: Color(0xFF3254AB)),
                label: 'Buat Janji',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.email, color: Color(0xFF3254AB)),
                label: 'Pesan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.article, color: Color(0xFF3254AB)),
                label: 'Transaksi',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Color(0xFF3254AB)),
                label: 'Profil',
              ),
            ],
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            elevation: 0,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _navigateToPage(BuildContext context, String pageTitle) {
    switch (pageTitle) {
      case 'Cari \nDokter':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CariDokterPage()),
        );
        break;
      case 'Tanya \nDokter':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TanyaDokterPage()),
        );
        break;
      case 'Artikel \nKesehatan':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArtikelKesehatanPage()),
        );
        break;
      case 'Pesan \nDriver':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileUpdateScreen()),
        );
        break;
      case 'Sliva \nProteksi':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileUpdateScreen()),
        );
        break;
      case 'Sliva \nShop':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SlivaShopPage()),
        );
        break;
      case 'Animal \nEvent':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AnimalEventPage()),
        );
        break;
      case 'Animal \nAcademy':
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
      padding: const EdgeInsets.symmetric(vertical: 30.0),
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
            const SizedBox(height: 20.0),
            const SliderBanner(),
            const SizedBox(height: 20.0),
            const SlivadocSlider(),
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
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ).copyWith(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return Colors.transparent;
          },
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
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
