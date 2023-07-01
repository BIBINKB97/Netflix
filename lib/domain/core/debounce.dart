import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Dbouncer {
  final int miiliseconds;
  VoidCallback? action;
  Timer? _timer;

  Dbouncer({
    required this.miiliseconds,
  });

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: miiliseconds), action);
  }
}
