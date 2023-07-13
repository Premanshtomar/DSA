bool containDuplicates(List<int> list) {
  Map<int, int> tempMap = {};
  for (var i in list) {
    if (tempMap.containsKey(i)) {
      return true;
    } else {
      tempMap[i] = i;
    }
  }
  return false;
}

int missingNumber(List<int> list) {
  int missing = list.length;
  for (var i = 0; i < list.length; i++) {
    missing ^= i ^ list[i];
    // can be written as missing = missing ^ (i^list[i])
    //
  }
  return missing;
}

List<int> allMissingNumbers(List<int> list) {
  Set<int> s = list.toSet();
  List<int> res = [];

  for (var i = 1; i < list.length; i++) {
    res.add(i);
  }

  return res.toSet().difference(s).toList();
}

int singleNumber(List<int> list) {
  int res = 0;
  for (int i in list) {
    res ^= i;
  }
  return res;
}
