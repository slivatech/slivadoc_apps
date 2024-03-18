import 'package:flutter/material.dart';

class BestSellingProduct extends StatelessWidget {
  const BestSellingProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 5.0),
          child: Text(
            'Produk Paling Dicari',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          height: MediaQuery.of(context).size.height * 0.12,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildSlivadocItem(
                context,
                imageUrl: 'lib/assets/logo.png',
                title: 'Pencernaan',
              ),
              _buildSlivadocItem(
                context,
                imageUrl: 'lib/assets/logo.png',
                title: 'Vitamin',
              ),
              _buildSlivadocItem(
                context,
                imageUrl: 'lib/assets/logo.png',
                title: 'Makanan',
              ),
              _buildSlivadocItem(
                context,
                imageUrl: 'lib/assets/logo.png',
                title: 'Demam',
              ),
              _buildSlivadocItem(
                context,
                imageUrl: 'lib/assets/logo.png',
                title: 'Aksesoris',
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
            width: 40,
            height: 40,
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
