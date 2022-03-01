
import 'linked_list.dart';

void main() {
  final link = LinkedList<String>();
  link.add('list String');
  link.add('String list');
  link.add('String list12');

  link.insert(0, 'die');

  link.display();
}
