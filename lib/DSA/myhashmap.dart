import 'package:lol/DSA/myhashmapnode.dart';

class MyHashmap {
  HashNode? head;
  HashNode? tail;

  bool get isNone => (head == null);

  void addValue(dynamic key, dynamic val) {
    HashNode n = HashNode(value: val, next: null, key: key);
    if (isNone) {
      head = tail = n;
    } else {
      HashNode? itr = head;
      while (itr != null) {
        if (itr.key == key) {
          itr.value = val;
          return;
        }
        itr = itr.next;
      }
      head = HashNode(value: val, next: head, key: key);
    }
  }

  void getMap() {
    if (isNone) {
      print("Empty Hash Map");
    }
    String getmap = '';
    HashNode? itr = head;
    while (itr != null) {
      getmap += '${itr.key}: ${itr.value} ${itr.next != null ? ',' : ''}';
      itr = itr.next;
    }
    print(getmap);
  }

  void getLength() {
    int count = 0;
    HashNode? itr = head;
    while (itr != null) {
      count++;
      itr = itr.next;
    }
    print(count);
  }

  void removekey(key) {
    if (key == head!.key) {
      head = head!.next;
    }
    HashNode? itr = head;
    while (itr != null) {
      if (itr.next?.key == key) {
        itr.next = itr.next!.next;
      }
      itr = itr.next;
    }
  }

  dynamic getValueof(key) {
    if (key == head!.key) {
      return (head!.value);
    } else if (key == tail!.key) {
      return (tail!.value);
    } else {
      HashNode? itr = head;
      while (itr != null) {
        if (itr.key == key) {
          return (itr.value);
        }
        itr = itr.next;
      }
      return ('Not Found');
    }
  }
}
