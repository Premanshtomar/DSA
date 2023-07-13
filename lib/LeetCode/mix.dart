import 'dart:math';

int? missingNumber1(List list) {
  var num = list.length;
  for (var i = num; i >= 0; i--) {
    if (!list.contains(i)) {
      return i;
    }
  }
  return null;
}

List allMissingNumbers1(List list) {
  var num = list.length;
  List newList = [];
  for (var i = num; i >= 1; i--) {
    if (!list.contains(i)) {
      newList.add(i);
    }
  }
  return newList;
}

int? singleNumber(List list) {
  Map map = {4: 1};
  for (var i in list) {
    if (!map.containsKey(i)) {
      map[i] = 0;
    } else {
      map[i]++;
    }
  }
  return null;
}

int maxProfit(List<int> list) {
  int minProfit = 200000000000000000;
  int maxProfit = 0;
  for (var i in list) {
    if (i < minProfit) {
      minProfit = i;
    } else {
      maxProfit = max(maxProfit, i - minProfit);
    }
  }
  return maxProfit;
}

List<List<int>> getRow(int n) {
  List<List<int>> tempList = [
    [1]
  ];
  Map<int, List<List<int>>> tempMap = {
    0: [
      [1]
    ],
    1: [
      [1, 1]
    ],
  };
  if (n == 0) {
    return tempList;
  } else if (n == 1) {
    tempList.add([1]);
    return tempList;
  } else {
    if (tempMap.containsKey(n)) {
      return tempMap[n]!;
    } else {
      if (tempMap.containsKey(n - 1)) {
        var i = 1;
        while (i == tempMap[n - 1]!.length) {
          tempList.add(tempMap[n - 1]![i] + tempMap[n - 1]![i - 1]);
          i++;
        }
        return tempList;
      } else {
        getRow(n - 1);
      }
    }
    return tempList;
  }
}

int climbStairs(int n) {
  Map<int, int> tempMap = {};
  int myClimbStairs(n) {
    if (n == 0 || n == 1) {
      tempMap[1] = 1;
      return 1;
    } else if (n < 0) {
      tempMap[0] = 0;
      return 0;
    } else {
      if (tempMap.containsKey(n)) {
        return tempMap[n]!;
      } else {
        tempMap[n] = myClimbStairs(n - 1) + myClimbStairs(n - 2);
        return tempMap[n]!;
      }
    }
  }

  myClimbStairs(n);
  return tempMap[n]!;
}

int getMinCost(List<int> cost) {
  int minCost = 0;
  int getCost(List<int> cost) {
    if (cost.length == 1) {
      minCost += cost[0];
      cost.removeAt(0);
      return cost[0];
    } else if (cost.isEmpty) {
      return 0;
    }
    // else if(cost.length ==3){
    //   if(cost[0]+cost[2]<cost[1]){
    //     minCost +=  cost[0]+cost[2];
    //     return minCost;
    //   }else{
    //     minCost+= cost[2];
    //     return minCost;
    //   }
    // }
    else if (cost.length == 2) {
      if (cost[0] < cost[1]) {
        minCost += cost[0];
        return minCost;
      } else {
        minCost += cost[1];
        return minCost;
      }
    } else {
      if (cost[0] < cost[1]) {
        minCost += cost[0];
        cost.removeAt(0);
      } else if (cost[0] == cost[1]) {
        minCost += cost[1];
        cost.removeAt(0);
        cost.removeAt(0);
      } else {
        minCost += cost[1];
        cost.removeAt(0);
        cost.removeAt(0);
      }
      List<int> tempList = cost;
      minCost = getCost(tempList);
    }
    return minCost;
  }

  getCost(cost);
  return minCost;
}

int tribonacci(n) {
  Map<int, int> tempMap = {};
  int getTribo(n) {
    if (n == 0) {
      tempMap[n] = 0;
      return 0;
    } else if (n == 1 || n == 2) {
      tempMap[n] = 1;
      return 1;
    } else if (n == 3) {
      tempMap[n] = 2;
      return 2;
    } else if (n == 4) {
      tempMap[n] = 4;
      return 4;
    } else {
      if (tempMap.containsKey(n)) {
        return tempMap[n]!;
      } else {
        tempMap[n] = getTribo(n - 1) + (getTribo(n - 1) - 1);
        return tempMap[n]!;
      }
    }
  }

  getTribo(n);
  return tempMap[n]!;
}

int fibonacci(int n) {
  Map<int, int> tempMap = {};
  int fib(int b) {
    if (b < 2) {
      return b;
    } else {
      if (tempMap.containsKey(b)) {
        return tempMap[b]!;
      } else {
        tempMap[b] = fib(b - 1) + fib(b - 2);
        return fib(b);
      }
    }
  }

  fib(n);
  return tempMap[n]!;
}

List<List<int>> generate(int numRows) {
  List<List<int>> temp = [
    [1],
    [1, 1]
  ];
  for (var i = 2; i <= numRows + 1; i++) {
    List<int> res = [1];
    for (var j = 1; j == i; j++) {
      int v = temp[i - 1][j] + temp[i - 1][j - 1];
      res.add(v);
    }
    res.add(1);
    temp.add(res);
  }
  return temp;
}
