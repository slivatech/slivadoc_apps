import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Doctor {
  final String image;
  final String name;
  final String specialist;
  final String category;
  final String price;

  Doctor({
    required this.image,
    required this.name,
    required this.specialist,
    required this.category,
    required this.price,
  });
}

class CariDokterPage extends StatefulWidget {
  @override
  _CariDokterPageState createState() => _CariDokterPageState();
}

class _CariDokterPageState extends State<CariDokterPage> {
  String _selectedFilter = '';
  String _tempSelectedFilter = '';
  int _currentIndex = 0;

  List<Doctor> doctors = [
    Doctor(
      image: 'lib/assets/promo.png',
      name: 'Dr. John Doe',
      specialist: 'Cardiologist',
      category: 'Heart',
      price: '\$100',
    ),
    Doctor(
      image: 'assets/doctors.png',
      name: 'Dr. Jane Smith',
      specialist: 'Pediatrician',
      category: 'Children',
      price: '\$90',
    ),
    // Add more doctors as needed
  ];

  List<String> klinikData = [
    'Klinik A',
    'Klinik B',
    'Klinik C',
    'Klinik D',
  ];

  List<String> layananData = [
    'Layanan X',
    'Layanan Y',
    'Layanan Z',
  ];

  List<dynamic> getDisplayedData() {
    switch (_currentIndex) {
      case 0:
        return doctors;
      case 1:
        return klinikData;
      case 2:
        return layananData;
      default:
        return [];
    }
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      // Reset temporary filter selection when switching tabs
      _tempSelectedFilter = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat Dengan Dokter',
          style: TextStyle(
            fontSize: 17,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter Berdasarkan',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedFilter = '';
                    });
                  },
                  child: const Text(
                    'Hapus Filter',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                FilterButton(
                  text: 'Keahlian',
                  onPressed: () => _showFilterOptions(context, 'Keahlian'),
                ),
                const SizedBox(width: 10),
                FilterButton(
                  text: 'Pengalaman',
                  onPressed: () => _showFilterOptions(context, 'Pengalaman'),
                ),
                const SizedBox(width: 10),
                FilterButton(
                  text: 'Jenis Kelamin',
                  onPressed: () => _showFilterOptions(context, 'Jenis Kelamin'),
                ),
                const SizedBox(width: 10),
                FilterButton(
                  text: 'Harga',
                  onPressed: () => _showFilterOptions(context, 'Harga'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: getDisplayedData().length,
              itemBuilder: (context, index) {
                final data = getDisplayedData()[index];
                if (data is Doctor) {
                  Doctor doctor = data;
                  return ListTile(
                    leading: Container(
                      height: 100,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        // color: Colors.blue,
                        image: DecorationImage(
                          image: AssetImage('lib/assets/doctors.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.person, size: 12),
                            const SizedBox(width: 5),
                            Text(
                              doctor.specialist,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.category, size: 12),
                            const SizedBox(width: 5),
                            Text(
                              doctor.category,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Price: ${doctor.price}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Add functionality for the button here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              child: Container(
                                child: const Text(
                                  'Chat Dokter',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else if (data is String) {
                  return ListTile(
                    title: Text(data),
                  );
                }
                return Container(); // Return empty container if data type is unknown
              },
            ),
          ),
        ],
      ),
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
                icon: FaIcon(FontAwesomeIcons.stethoscope,
                    color: Color(0xFF3254AB)),
                label: 'Dokter',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pets,
                    color: Color(0xFF3254AB)), // Mengubah ikon sesuai label
                label: 'Klinik Hewan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_hospital, color: Color(0xFF3254AB)),
                label: 'Layanan Medis',
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

  void _showFilterOptions(BuildContext context, String filterTitle) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          filterTitle,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _tempSelectedFilter = '';
                            });
                          },
                          child: const Text(
                            'Hapus Filter',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Here you can add radio buttons or any other filtering options
                  ListTile(
                    title: const Text('Option 1'),
                    leading: Radio(
                      value: 'Option 1',
                      groupValue: _tempSelectedFilter,
                      onChanged: (value) {
                        setState(() {
                          _tempSelectedFilter = value as String;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Option 2'),
                    leading: Radio(
                      value: 'Option 2',
                      groupValue: _tempSelectedFilter,
                      onChanged: (value) {
                        setState(() {
                          _tempSelectedFilter = value as String;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedFilter = _tempSelectedFilter;
                          });
                          print('Filter Applied: $_selectedFilter');
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: Colors.blue),
                          ),
                        ),
                        child: const Text(
                          'Batalkan',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedFilter = _tempSelectedFilter;
                          });
                          print('Filter Applied: $_selectedFilter');
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Terapkan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const FilterButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(minWidth: 50, minHeight: 15),
            child: Text(
              text,
              style: const TextStyle(fontSize: 10, color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}
