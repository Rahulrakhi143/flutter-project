class Node {
  String data;
  Node? next;

  Node(this.data);
}

class CircularLinkedList {
  Node? head;

  void insert(String data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
      head!.next = head; // Point to itself to make it circular
    } else {
      Node temp = head!;
      while (temp.next != head) {
        temp = temp.next!;
      }
      temp.next = newNode;
      newNode.next = head;
    }
  }

  void delete(String data) {
    if (head == null) return;

    Node? temp = head, prev = null;

    // If head needs to be removed
    if (head!.data == data) {
      if (head!.next == head) {
        head = null;
        return;
      }
      Node last = head!;
      while (last.next != head) {
        last = last.next!;
      }
      last.next = head!.next;
      head = head!.next;
      return;
    }

    do {
      prev = temp;
      temp = temp!.next;
      if (temp!.data == data) {
        prev!.next = temp.next;
        return;
      }
    } while (temp != head);
  }

  Node? findHead() {
    return head;
  }

  void display() {
    if (head == null) {
      print("Circular Linked List is empty");
      return;
    }
    Node temp = head!;
    do {
      print(temp.data);
      temp = temp.next!;
    } while (temp != head);
  }
}

// void main() {
//   CircularLinkedList cll = CircularLinkedList();
//   cll.insert("Shiva");
//   cll.insert("Doreamon");
//   cll.insert("BenTen");
//   cll.insert("Patlu");
//
//   print("Elements in Circular Linked List:");
//   cll.display();
//
//   cll.delete("BenTen");
//   print("After deleting BenTen:");
//   cll.display();
//
//   Node? headNode = cll.findHead();
//   if (headNode != null) {
//     print("Head Node: ${headNode.data}");
//   } else {
//     print("The list is empty.");
//   }
// }
