import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesItemWidget extends ConsumerWidget {
  final String id;
  final String namevi;
  final String photo;

  const CategoriesItemWidget(this.id, this.namevi, this.photo, {super.key});

  @override
  Widget build(context, ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: ClipRRect(
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          onTap: () {
            // ignore: avoid_print
            print("ID Categories:$id");
          },
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                  photo.toString(),
                  width: 1000,
                  height: 95,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                left: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    namevi,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
