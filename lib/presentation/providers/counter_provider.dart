import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<int> counterProvider = StateProvider(
  (ref) {
    return 6;
  },
);
