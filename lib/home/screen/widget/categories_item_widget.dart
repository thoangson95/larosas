import 'package:flutter/material.dart';

class CategoriesItemWidget extends StatelessWidget {
  final String id;
  final String name;
  final String image;

  const CategoriesItemWidget(this.id, this.name, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 25),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: 70 / 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 80,
              child: Text(
                name,
                style: const TextStyle(
                  fontFamily: 'UAB',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
