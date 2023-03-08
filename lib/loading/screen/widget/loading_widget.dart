import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLoadingProvider = StateProvider.autoDispose<bool>((ref) => false);

class LoadingWidget extends ConsumerWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final isLoading = ref.watch(isLoadingProvider);

    return isLoading
        ? const Center(
            child: CupertinoActivityIndicator(),
          )
        : Container();
  }
}
