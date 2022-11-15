import 'main.dart';
import 'dart:math';

Random random = new Random();

int aiBoteasy() {
  int i = random.nextInt(9);
  int position;

  while (indices[i] == 1 || indices[i] == 2) {
    i = random.nextInt(9);
  }

  print(i);
  return i;
}

