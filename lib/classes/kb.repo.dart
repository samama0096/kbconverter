class kbyte_repo_service{
  double kbTobits(double i) {
    var res = i * 8 * 1024;
    return res;
  }

  double kbToB(double i) {
    var res = i * 1024;
    return res;
  }

  double kbToMB(double i) {
    var res = i / 1024;
    return res;
  }
}
