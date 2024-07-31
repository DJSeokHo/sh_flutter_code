import '../../framework/debug/i_log.dart';



enum Season {
  spring,
  summer,
  autumn,
  winter
}

void main() {

  var currentSeason = Season.spring;

  switch (currentSeason) {
    case Season.spring:
      ILog.debug("???", "1-3");
      break;
    case Season.summer:
      ILog.debug("???", "4-6");
      break;
    case Season.autumn:
      ILog.debug("???", "7-9");
      break;
    case Season.winter:
      ILog.debug("???", "9-12");
      break;
  }
}
