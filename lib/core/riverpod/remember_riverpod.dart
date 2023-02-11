import 'package:flutter_riverpod/flutter_riverpod.dart';

final rememberMeProvider = StateNotifierProvider<RememberProvider,bool>((ref) {
    return RememberProvider();
  });

class RememberProvider extends StateNotifier<bool> {
  RememberProvider() : super(false);

  void changeState() {
    state = !state;
  
  }


}