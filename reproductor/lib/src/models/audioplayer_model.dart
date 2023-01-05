import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _playing = false;
  Duration _songDuration = const Duration(milliseconds: 0);
  Duration _current = const Duration(milliseconds: 0);
  late AnimationController controller;

  String get songTotalDuration => PrintDuration(_songDuration);
  String get currentSecond => PrintDuration(_current);

  double get porcentaje => (_songDuration.inSeconds > 0)
      ? _current.inSeconds / _songDuration.inSeconds
      : 0;

  bool get playing => _playing;
  set playing(bool valor) {
    _playing = valor;
    notifyListeners();
  }

  Duration get songDuration => _songDuration;
  set songDuration(Duration valor) {
    _songDuration = valor;
    notifyListeners();
  }

  Duration get current => _current;
  set current(Duration valor) {
    _current = valor;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  String PrintDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
