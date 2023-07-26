import 'package:lol/DSA/myhashmap.dart';
import 'package:lol/DSA/myhashset.dart';
import 'package:lol/DSA/que.dart';
import 'package:lol/DSA/singlylinkedlist.dart';

void main() {
  var newList = SinglyLinkedList();
  var newList2 = SinglyLinkedList();
  newList.push(0);
  newList.push(0);
  newList.push(1);
  newList.push(1);
  // newList.push(1);
  // newList.push(1);
  // newList.push(3);
  // newList.push(1);
  // newList2.push(14);
  // newList2.push(5);
  newList2.push(0);
  newList2.push(1);
  newList2.push(0);
  newList2.push(1);
  // newList2.push(0);
  // newList2.push(1);
  // newList2.push(2);
  // newList2.tail!.next = newList2.head!.next;
  // newList.insertAtEnd(4);
  // newList.insertAtIndex(-1, 3);
  // newList.removeAtIndex(3);
  // List ll = [1, 2,];
  // newList.insertValuesFromList(ll);
  // newList.insertAfterValue(8, 9);
  // newList.removeValue(5);
  // newList.tString();
  // print(newList.getLenght());
  // newList2.tString();
  // print(newList2.getLenght());
  // middleNode(newList).tString();
  // sorting(newList)?.tString();
  // removeDuplicate(newList).tString();
  // mergeSortedList(newList, newList2).tString();
  // print(linkedListCycle(newList2));
  // reversed(newList).tString();
  // print(palindrome(newList));
  // print(binaryToInteger(newList));
  // deleteElements(newList, 1).tString();
  // deleteNodes(newList, 2,1).tString();
  // intersection(newList,newList2);
  // print(ticket(newList));
  // print(sandwiches(newList, newList2));

  var newmap = MyHashmap();
  newmap.addValue("family", 6);
  // newmap.addValue("kk", 2);
  // newmap.addValue("emily", 3);
  // newmap.addValue("jj", 5);
  // // newmap.removekey('family');
  // print(newmap.getValueof('jj'));
  //
  //
  // newmap.getMap();
  // newmap.getLength();

  var newset = MyHashSet();
  newset.add(6);
  newset.add(5);
  newset.add(3);
  newset.add(7);
  // newset.add(3);
  // newset.add(7);
  // newset.add(5);
  // newset.add(6);

  // print(newset.tail?.value);
  // print(newset.head?.value);

  // newset.getset();

  var newQueue = Queue();
  newQueue.push(1);
  newQueue.push(4);
  newQueue.push(2);
  newQueue.push(3);
  // newQueue.printList();
  List<int> list = [4, 3, 2, 7, 8, 2, 3, 1];
  // print(containDuplicates(list));
  // print(missingNumber(list));
  // print(allMissingNumbers(list));
}
