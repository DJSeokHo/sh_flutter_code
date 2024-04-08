extension DoubleExtension on double {

  double around(int digital) {
    return (this * 10).round() / (digital * 10);
  }

}
