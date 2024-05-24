import '../../../../framework/utility/parsing/parsing_utility.dart';

class ActivityModel {

  final String key;
  final String activity;
  final String type;
  final int participants;
  final double price;
  final double accessibility;
  final String link;

  ActivityModel({required this.key, required this.activity, required this.type,
    required this.participants, required this.price, required this.accessibility, required this.link});
}

ActivityModel activityModelParser(Map<String, dynamic> map) {

  return ActivityModel(
    key: ParsingUtility.parsingString(map, "key"),
    activity: ParsingUtility.parsingString(map, "activity"),
    type: ParsingUtility.parsingString(map, "type"),
    participants: ParsingUtility.parsingInt(map, "participants"),
    price: ParsingUtility.parsingDouble(map, "price"),
    accessibility: ParsingUtility.parsingDouble(map, "accessibility"),
    link: ParsingUtility.parsingString(map, "link")
  );
}