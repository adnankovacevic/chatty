import 'dart:math';

class Helpers {
  static final random = Random();

  static String radnomImageUrl() {
    final randomInt = random.nextInt(1000);
    return 'https://picsum.photos/seed/$randomInt/300/300';
  }

  static DateTime randomDateTime() {
    final randomInt = random.nextInt(1000);
    final currentDate = DateTime.now();
    return currentDate.subtract(Duration(seconds: randomInt * 12));
  }
}
