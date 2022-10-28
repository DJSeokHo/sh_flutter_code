
import '../framework/debug/i_log.dart';

class VIIInterface {

  void test() {

    var database = Database();
    database.add();
    database.select();
    database.put();
    database.delete();

  }
}

class Database implements IDatabase {

  static const tag = "Database";

  @override
  void add() {
    ILog.debug(tag, "add");
  }

  @override
  void delete() {
    ILog.debug(tag, "delete");
  }

  @override
  void put() {
    ILog.debug(tag, "put");
  }

  @override
  void select() {
    ILog.debug(tag, "select");
  }
}

abstract class IDatabase {
  void add();
  void select();
  void put();
  void delete();
}