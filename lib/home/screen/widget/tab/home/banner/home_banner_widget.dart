import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../provider/home_banner_state.dart';

class HomeBannerWidget extends ConsumerWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(context, ref) {
    final banner = ref.watch(homeBannerProviders);
    return (banner.listBanner != null && banner.listBanner!.isNotEmpty)
        ? Container(
            padding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Column(
                children: [
                  GFCarousel(
                    autoPlay: true,
                    height: 150.0,
                    viewportFraction: 1.0,
                    items: banner.listBanner!.map(
                      (item) {
                        return InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          onTap: () {
                            // ignore: avoid_print
                            print("ID Banner: ${item.id}");
                          },
                          child: Image.network(
                            item.photo.toString(),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        );
                      },
                    ).toList(),
                    onPageChanged: (index) {},
                  ),
                ],
              ),
            ),
          )
        : const Padding(
            padding: EdgeInsets.all(20),
            child: Center(child: CupertinoActivityIndicator()),
          );
  }
}
