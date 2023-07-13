import 'package:lol/DSA/node.dart';

class Queue {
  Node? head;
  Node? tail;

  bool get isEmpty => head == null;

  void push(val) {
    var n = Node(value: val, next: head);
    if (isEmpty) {
      head = tail = n;
      return;
    }
    head = n;
  }

  void printList() {
    if (isEmpty) {
      print("Empty list");
      return;
    }
    String questr = '';
    Node? itr = head;
    while (itr != null) {
      questr += "${itr.value} ${itr.next != null ? '->' : ''}";
      itr = itr.next;
    }
    print(questr);
  }
}
