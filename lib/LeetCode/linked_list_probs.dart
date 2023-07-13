import 'dart:math';

import 'package:lol/DSA/node.dart';
import 'package:lol/DSA/singlylinkedlist.dart';

Node middleNode(SinglyLinkedList l) {
  if (l.getLenght() % 2 == 0) {
    int middle = l.getLenght() ~/ 2;
    int count = 0;
    var k = Node(value: 0);
    Node itr = l.head!;
    while (itr.next != null) {
      if (count == middle) {
        k.value = itr.value;
      }
      count += 1;
      itr = itr.next!;
    }
    return k;
  } else {
    int middle = (l.getLenght() / 2).floor();
    int count = 0;
    var h = Node(value: 0);
    Node itr = l.head!;
    while (itr.next != null) {
      if (count == middle) {
        h.value = itr.value;
      }
      count += 1;
      itr = itr.next!;
    }
    return h;
  }
}

SinglyLinkedList? sorting(SinglyLinkedList l) {
  var n = SinglyLinkedList();
  if (l.head!.next == null) {
    n.push(l.head!.value);
    return n;
  } else if (l.head == null) {
    return null;
  } else {
    n.push(l.head!.value);
    if (n.head!.value > l.head!.next!.value) {
      n.push(l.head!.next!.value);
    } else {
      n.insertAtEnd(l.head!.next!.value);
    }
    Node itr = l.head!.next!;
    print('=======================');
    while (itr.next != null) {
      if (itr.next!.value < n.head!.value) {
        n.push(itr.next!.value);
      } else if (itr.next!.value > n.tail!.value) {
        n.insertAtEnd(itr.next!.value);
      } else {
        Node temp = n.head!;
        while (temp.next != null) {
          if (temp.value < itr.next!.value) {
            Node k = Node(value: itr.next!.value, next: temp.next);
            temp.next = k;
          }
          temp = temp.next!;
        }
      }
      itr = itr.next!;
    }
    return n;
  }
}

SinglyLinkedList removeDuplicate(SinglyLinkedList l) {
  var k = SinglyLinkedList();
  k.push(l.head!.value);
  Node itr = l.head!;
  while (itr.next != null) {
    if (itr.value == itr.next!.value) {
      itr.next = itr.next!.next;
    }
    k.insertAtEnd(itr.next!.value);
    itr = itr.next!;
  }
  return k;
}

SinglyLinkedList mergeSortedList(SinglyLinkedList l, SinglyLinkedList k) {
  var h = SinglyLinkedList();
  // if (l == null || k == null) return h;
  if (l.head == null) return k;
  if (k.head == null) return l;

  while (k.head != null && l.head != null) {
    if (l.head!.value < k.head!.value) {
      h.insertAtEnd(l.head!.value);
      l.head = l.head!.next;
    } else {
      h.insertAtEnd(k.head!.value);
      k.head = k.head!.next;
    }
  }
  if (l.head != null) h.tail!.next = l.head;
  if (k.head != null) h.tail!.next = k.head;
  return h;
}

bool linkedListCycle(SinglyLinkedList l) {
  if (l.isEmptyHead && l.head!.next == null) {
    return false;
  }
  Node slow = l.head!;
  Node fast = l.head!;
  // var i = 0;
  // var d = {};
  // while (i<= l.getLenght()){
  //   if(d.containsKey(itr)){
  //     return true;
  //   }else{
  //     d[itr] = 1;
  //   }
  // }
  while (fast.next != null && fast.next!.next != null) {
    fast = fast.next!.next!;
    slow = slow.next!;

    if (fast.value == slow.value) {
      return true;
    }
  }

  return false;
}

SinglyLinkedList reversed(SinglyLinkedList l) {
  var k = SinglyLinkedList();
  Node itr = l.head!;
  while (itr.next != null) {
    k.push(itr.value);
    itr = itr.next!;
  }
  k.push(l.tail!.value);
  return k;
}

bool palindrome(SinglyLinkedList l) {
  if (l == reversed(l)) {
    return true;
  } else {
    return false;
  }
}

num? binaryToInteger(SinglyLinkedList l) {
  num result = l.tail!.value;
  // result.toInt();
  int listlength = l.getLenght();
  Node itr = l.head!;
  while (itr.next != null) {
    if (itr.value == 1 || itr.value == 0) {
      result += itr.value * (pow(2, (listlength - 1)));
      listlength -= 1;
      itr = itr.next!;
    } else {
      print('Invalid Binary');
    }
  }
  return result;
}

SinglyLinkedList deleteElements(SinglyLinkedList l, int val) {
  var k = SinglyLinkedList();
  var i = l.getLenght();
  while (i != 0) {
    if (l.head!.value == val) {
      // k.insertAtEnd(l.head!.value);
      l.head = l.head!.next;
    } else {
      k.insertAtEnd(l.head!.value);
      l.head = l.head?.next;
    }
    i--;
  }
  // Node itr = l.head!;
  // while (itr.next != null){
  //   if (itr.next)
  // }
  return k;
}

SinglyLinkedList deleteNodes(SinglyLinkedList l, int val2, int val1) {
  var k = SinglyLinkedList();
  if (l.head == null || l.head!.next == null) {
    return l;
  }
  int count = 0;
  Node itr = l.head!;
  while (itr.next != null) {
    if (count <= val1) {
      k.insertAtEnd(itr.value);
      l.head = l.head!.next;
    }
    count += 1;
    itr = itr.next!;
  }
  int count2 = 0;
  Node itr2 = l.head!;
  if (val2 == l.getLenght()) {
    return k;
  } else {
    while (itr2.next != null) {
      if (count2 == val2) {
        k.tail!.next = itr2;
      }
      itr2 = itr2.next!;
      count2 += 1;
    }
    if (val2 == l.getLenght() - 1) {
      k.insertAtEnd(l.tail!.value);
    }
    l.tString();
    return k;
  }
}

dynamic intersection(SinglyLinkedList l, SinglyLinkedList k) {
  int h = l.getLenght() - k.getLenght();
  if (h < 0) {
    while (h < 0) {
      k.head = k.head!.next;
      h++;
    }
  } else {
    while (h > 0) {
      l.head = l.head!.next;
      h--;
    }
  }
  while (l.head != null && k.head != null) {
    if (l.head == k.head) {
      return k.tString();
    }
    l.head = l.head!.next;
    k.head = k.head!.next;
  }
  return k.tString();
}

int ticket(SinglyLinkedList l) {
  int count = 0;
  int random = l.getLenght();
  int first = l.head!.value;
  while (first > 0) {
    if (l.head!.value == 0) {
      l.head = l.head!.next;
      count -= 1;
    } else {
      l.insertAtEnd(l.head!.value - 1);
      l.head = l.head!.next;
    }
    count += 1;
    random -= 1;
    if (random == 0) {
      first -= 1;
      random = l.getLenght();
    }
  }
  return count;
}

dynamic sandwiches(SinglyLinkedList l, SinglyLinkedList k) {
  int length = l.getLenght();

  int count = 0;
  while (l.head != null) {
    if (l.head!.value == k.head!.value) {
      l.head = l.head?.next;
      k.head = k.head?.next;
      length = l.getLenght();
      count -= 1;
    } else {
      l.insertAtEnd(l.head!.value);
      l.head = l.head?.next;
      count += 1;
    }
    if (count == length) {
      return count;
    }
  }
  return 0;
}
