
class StaticVariable {
  static String? staticVar = "";

  StaticVariable();

  set setNameStr(String str) {
    staticVar = str;
  }
}