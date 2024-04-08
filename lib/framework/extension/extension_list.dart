extension ListExtensions<T> on List<T> {
  void removeAll(Iterable<T> elements) {
    for (var element in elements) {
      while (contains(element)) {
        remove(element);
      }
    }
  }
}
