import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'body_categories_widget.dart';
import 'body_home_widget.dart';

final isFirstWidgetVisibleProvider = StateProvider<int>((ref) => 1);

class BodyWidget extends ConsumerWidget {
  const BodyWidget({super.key});

  @override
  Widget build(context, ref) {
    final isFirstWidgetVisible = ref.watch(isFirstWidgetVisibleProvider);
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xFFD9D9D9))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.only(right: 40),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isFirstWidgetVisible == 1
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      width: 2,
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    ref.read(isFirstWidgetVisibleProvider.notifier).state = 1;
                  },
                  child: const Text(
                    'Home',
                    style: TextStyle(
                      fontFamily: 'UAB',
                      fontSize: 13,
                      color: Color(0xff222222),
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.only(left: 40),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isFirstWidgetVisible == 2
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      width: 2,
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    ref.read(isFirstWidgetVisibleProvider.notifier).state = 2;
                  },
                  child: const Text(
                    'Categories',
                    style: TextStyle(
                      fontFamily: 'UAB',
                      fontSize: 13,
                      color: Color(0xff222222),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: IndexedStack(
            index: isFirstWidgetVisible == 1 ? 0 : 1,
            children: [
              AnimatedOpacity(
                opacity: isFirstWidgetVisible == 1 ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 700),
                child: BodyHomeWidget(
                    currentIndex: isFirstWidgetVisible == 1 ? 0 : 1),
              ),
              AnimatedOpacity(
                opacity: isFirstWidgetVisible == 2 ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 700),
                child: BodyCategoriesWidget(
                    currentIndex: isFirstWidgetVisible == 1 ? 0 : 1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
