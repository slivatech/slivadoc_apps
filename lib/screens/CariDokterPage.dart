import 'package:flutter/material.dart';

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
  String _tempSelectedFilter =
      ''; // Variable untuk menyimpan sementara filter yang dipilih

  List<Doctor> doctors = [
    Doctor(
      image: 'assets/doctors.png',
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
    Doctor(
      image: 'assets/doctors.png',
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
    ),Doctor(
      image: 'assets/doctors.png',
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
  ];

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
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    width: 50,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage(doctors[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctors[index].name,
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
                            doctors[index].specialist,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.category, size: 12),
                          const SizedBox(width: 5),
                          Text(
                            doctors[index].category,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price: ${doctors[index].price}',
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
              },
            ),
          ),
        ],
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
                    title: Text('Option 1'),
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
