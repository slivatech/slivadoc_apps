import 'package:flutter/material.dart';

class SliderBanner extends StatelessWidget {
  const SliderBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            'Penawaran Menarik',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TabBar(
                labelStyle: const TextStyle(fontSize: 11, color: Colors.white),
                unselectedLabelStyle: const TextStyle(
                    fontSize: 10, color: Color.fromARGB(255, 20, 123, 219)),
                indicator: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                indicatorPadding: const EdgeInsets.symmetric(vertical: 7),
                tabs: [
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text('Semua'),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text('Promo'),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text('Kerja Sama'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Container(
                height: MediaQuery.of(context).size.height * 0.21,
                child: TabBarView(
                  children: [
                    _buildSlider(
                      context,
                      [
                        'lib/assets/promo.png',
                        'lib/assets/promo1.png',
                        'lib/assets/promo2.png',
                        'lib/assets/promo3.png',
                        'lib/assets/partnership.png',
                        'lib/assets/partner1.png',
                        'lib/assets/partner2.png',
                        'lib/assets/apps.png',
                      ],
                    ),
                    _buildSlider(
                      context,
                      [
                        'lib/assets/promo.png',
                        'lib/assets/promo1.png',
                        'lib/assets/promo2.png',
                        'lib/assets/promo3.png',
                      ],
                    ),
                    _buildSlider(context, [
                      'lib/assets/partnership.png',
                      'lib/assets/partner1.png',
                      'lib/assets/partner2.png',
                      'lib/assets/apps.png',
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSlider(BuildContext context, List<String> imageUrls) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: imageUrls.map((imageUrl) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
