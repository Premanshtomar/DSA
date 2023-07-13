import 'package:lol/DSA/node.dart';

class SinglyLinkedList {
  Node? head;
  Node? tail;

  bool get isEmptyHead => head == null;

  void push(val) {
    Node n = Node(value: val);
    if (isEmptyHead) {
      head = tail = n;
    } else {
      head = Node(value: val, next: head);
    }
  }

  void insertAtEnd(val) {
    if (isEmptyHead) {
      push(val);
    } else {
      tail!.next = Node(value: val);
      tail = tail!.next;
    }
    //   Node itr = head!;
    //   while (itr.next != null) {
    //     itr = itr.next!;
    //   }
    //   itr.next = Node(value: val);
    // }
  }

  int getLenght() {
    int count = 0;
    if (isEmptyHead) {
      return 0;
    } else {
      Node? itr = head;
      while (itr != null) {
        count += 1;
        itr = itr.next;
      }
      return count;
    }
  }

  void insertAtIndex(index, val) {
    if ((index < 0 && index != -1) || index > getLenght()) {
      print('Invalid Index');
    } else if (index == 0) {
      push(val);
    } else if (index == getLenght() || index == -1) {
      insertAtEnd(val);
    } else {
      int count = 0;
      Node itr = head!;
      while (itr.next != null) {
        if (count == index - 1) {
          Node n = Node(value: val, next: itr.next);
          itr.next = n;
        }
        itr = itr.next!;
        count += 1;
      }
    }
  }

  void removeAtIndex(index) {
    if (index < 0 || index >= getLenght()) {
      print('Invalid Index');
    } else if (index == 0) {
      head = head?.next?.next;
    } else if (index == getLenght() - 1) {
      int count = 0;
      Node itr = head!;
      while (itr.next != null) {
        if (count == index - 2) {
          itr.next!.next = null;
          tail = itr.next;
        }
        itr = itr.next!;
        count += 1;
      }
    } else {
      int count = 0;
      Node itr = head!;
      while (itr.next != null) {
        if (count == index - 1) {
          itr.next = itr.next!.next;
        }
        itr = itr.next!;
        count += 1;
      }
    }
  }

  void insertValuesFromList(list) {
    for (var i in list) {
      insertAtEnd(i);
    }
  }

  void insertAfterValue(after, val) {
    if (head!.value == after) {
      Node n = Node(value: val, next: head!.next);
      head!.next = n;
    } else if (tail!.value == after) {
      insertAtEnd(val);
    } else {
      Node itr = head!;
      while (itr.next != null) {
        if (itr.value == after) {
          itr.next = Node(value: val, next: itr.next);
        }
        itr = itr.next!;
      }
    }
  }

  void removeValue(val) {
    if (head!.value == val) {
      head = head!.next;
    } else if (tail!.value == val) {
      removeAtIndex(getLenght() - 1);
    } else {
      Node itr = head!;
      while (itr.next != null) {
        if (itr.next!.value == val) {
          itr.next = itr.next!.next;
        }
        itr = itr.next!;
      }
    }
  }

  void tString() {
    if (isEmptyHead) {
      print("Empty list");
    } else {
      var llStr = '';
      Node? itr = head;
      while (itr != null) {
        llStr += '${itr.value} ${itr.next != null ? '->' : ''}';
        itr = itr.next;
      }
      print(llStr);
    }
  }
}

SinglyLinkedList mergesort(SinglyLinkedList l, SinglyLinkedList h) {
  var k = SinglyLinkedList();
  if (l.getLenght() >= h.getLenght()) {
    Node itr = l.head!;
    while (h.head!.next != null) {
      if (l.head!.value > h.head!.value) {
        k.push(h.head!.value);
      }
    }
  }

  return k;
}
