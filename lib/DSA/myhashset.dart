import 'package:lol/DSA/node.dart';

class MyHashSet {
  Node? head;
  Node? tail;

  bool get isNone => head == null;

  dynamic add(val) {
    if (isNone) {
      head = tail = Node(value: val, next: null);
      return;
    } else {
      if (head!.value > val) {
        head = Node(value: val, next: head);
      } else {
        if (tail!.value < val) {
          Node n = Node(value: val, next: null);
          tail?.next = n;
          tail = n;
          return;
        } else {
          Node? itr = head;
          while (itr != null) {
            if (itr.value == val) {
              print('Value is in set');
              return;
            } else {
              if (itr.next?.value > val) {
                itr.next = Node(value: val, next: itr.next);
              }
            }
            itr = itr.next!;
          }
        }
      }
    }
  }

  dynamic contains(val) {
    if (isNone) {
      return 'Empty Set';
    }
    if (tail!.value == val || head!.value == val) {
      return true;
    }
    Node itr = head!;
    while (itr.next != null) {
      if (itr.value == val) {
        return true;
      }
      itr = itr.next!;
    }
    return false;
  }

  void removeval(val) {
    Node? itr = head;
    while (itr != null) {
      if (itr.next!.value == val) {
        itr.next = itr.next!.next;
      }
      itr = itr.next;
    }
  }

  void getset() {
    String setstr = '';
    if (isNone) {
      print('Empty Set');
    } else {
      Node? itr = head;
      while (itr != null) {
        setstr += '${itr.value} ${itr.next != null ? ',' : ""}';
        itr = itr.next;
      }
    }

    print(setstr);
  }
}
