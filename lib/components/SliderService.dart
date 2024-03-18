import 'package:flutter/material.dart';

class SlivadocSlider extends StatelessWidget {
  const SlivadocSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            'Layanan Slivadoc',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          height: MediaQuery.of(context).size.height * 0.21,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildSlivadocItem(
                context,
                imageUrl: 'lib/assets/logo.png',
                title: 'Vaksin',
              ),
              _buildSlivadocItem(
                context,
                imageUrl: 'lib/assets/logo.png',
                title: 'Sterilisasi',
              ),
              _buildSlivadocItem(
                context,
                imageUrl: 'lib/assets/logo.png',
                title: 'Grooming',
              ),
              _buildSlivadocItem(
                context,
                imageUrl: 'lib/assets/logo.png',
                title: 'Lion Cut',
              ),
              _buildSlivadocItem(
                context,
                imageUrl: 'lib/assets/logo.png',
                title: 'Rawat Inap',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSlivadocItem(
  BuildContext context, {
  required String imageUrl,
  required String title,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.blue,

            ),
          ),
        ),
        const SizedBox(height: 3.0),

      ],
    ),
  );
}
}
