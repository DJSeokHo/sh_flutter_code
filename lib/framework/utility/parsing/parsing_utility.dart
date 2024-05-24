class ParsingUtility {

  static String parsingString(Map<String, dynamic> map, String key, {String defaultValue = ""}) {
    if (map.isEmpty) {
      return defaultValue;
    }

    if (!map.containsKey(key)) {
      return defaultValue;
    }

    if (map[key] == null) {
      return defaultValue;
    }

    return map[key];
  }

  static int parsingInt(Map<String, dynamic> map, String key, {int defaultValue = 0}) {
    if (map.isEmpty) {
      return defaultValue;
    }

    if (!map.containsKey(key)) {
      return defaultValue;
    }

    if (map[key] == null) {
      return defaultValue;
    }

    return map[key];
  }

  static double parsingDouble(Map<String, dynamic> map, String key, {double defaultValue = 0}) {
    if (map.isEmpty) {
      return defaultValue;
    }

    if (!map.containsKey(key)) {
      return defaultValue;
    }

    if (map[key] == null) {
      return defaultValue;
    }

    return map[key];
  }

  static bool parsingBool(Map<String, dynamic> map, String key, {bool defaultValue = false}) {
    if (map.isEmpty) {
      return defaultValue;
    }

    if (!map.containsKey(key)) {
      return defaultValue;
    }

    if (map[key] == null) {
      return defaultValue;
    }

    return map[key];
  }
}