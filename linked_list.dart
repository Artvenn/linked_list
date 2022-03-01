class LinkedList<T> {
  _Node? _head;
  int _length = 0;

  int get length => _length;

  void add(final T el) {
    if (_head == null) {
      _head = _Node(data: el); 
      _length++;
    } else {
      _Node? current = _head;

      while(true) {        
        if(current?.next == null) {
          current?.next = _Node(data: el);
          _length++;
          break;
        } else {
          current = current?.next;
        }
      }
    } 
  }

  void display() {
    _Node? current = _head;

    while (true) {
      print(current);

      if (current?.next != null) {
        current = current?.next;
      } else {
        break;
      }
    }
  }

  void insert(final int index, final T el) {
    _validateRange(index);
    if (index == 0) {
      _head = _Node(data: el, next: _head);
      return;
    }

    var tempPrev = _getLinkByIndex(index - 1);

    if (index == _length) {
      add(el);
    } else {
      final tempNext = tempPrev?.next;
      tempPrev?.next = _Node(data: el, next: tempNext); 
    }
  }  

  _Node operator [](final int index) {
    final current = _getLinkByIndex(index);
    return _Node(data: current?.data, next: current?.next);
  } 

  void replace(final int index, final T el) {
    _validateRange(index);
    var current = _getLinkByIndex(index - 1);
    final tempNext = current?.next?.next;
    current?.next = _Node(data: el, next: tempNext);   
  }

  void delete(final int index) {
    _validateRange(index);
    final tempPrev = _getLinkByIndex(index - 1);
    tempPrev?.next = tempPrev.next?.next;
  }

  _Node? _getLinkByIndex(final int index) {
    _validateRange(index);
    var current = _head;

    for (int i = 0; i < length; i++) {
      if (i == index) {
       return current; 
      } else {
        current = current?.next;
      }
    }
    return null;
  }

  void _validateRange(final int index) {
    if ((index >= _length + 1) || (index < 0)) {
      throw RangeError.range(index, 0, _length);
    } 
  }
}

class _Node<T> {
  final T data;
  _Node? next;

  _Node({required this.data, this.next});

  @override 
  String toString() {
    return '$data';
  }
}