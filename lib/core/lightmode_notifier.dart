
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LightModeNotifier extends StateNotifier<bool> {
  LightModeNotifier(): super(false);

  void toggle(){
    state = !state;
  }

}

final lightModeProvider = StateNotifierProvider<LightModeNotifier, bool>((ref) => LightModeNotifier());