public class SLL {
    Node head, tail;
    int size = 0;

    void inisialisasi() {
        head = null;
        tail = null;
        size = 0;
    }

    boolean isEmpty() {
        return size == 0;
    }

    int size() {
        return size;
    }

    void addFirst(Node input) {
        if (isEmpty()) {
            head = input;
            tail = input;
        } else {
            input.next = head;
            head = input;
        }

        size++;
    }

    void addLast(Node input) {
        if (isEmpty()) {
            head = input;
            tail = input;
        } else {
            tail.next = input;
            tail = input;
        }

        size++;
    }

    Node search(Object data) {
        Node current = head;

        while (current != null) {
            if (current.data.equals(data)) {
                return current;
            }

            current = current.next;
        }

        return null;
    }

    Object get(int index) {
        if (index < 0 || index >= size) {
            return null;
        }

        Node current = head;

        for (int i = 0; i < index; i++) {
            current = current.next;
        }

        return current.data;
    }

    boolean insertAfter(Object key, Node input) {
        Node current = search(key);

        if (current == null) {
            return false;
        }

        input.next = current.next;
        current.next = input;

        if (current == tail) {
            tail = input;
        }

        size++;
        return true;
    }

    boolean remove(Object data) {
        if (isEmpty()) {
            return false;
        }

        if (head.data.equals(data)) {
            head = head.next;
            size--;

            if (size == 0) {
                tail = null;
            }

            return true;
        }

        Node previous = head;
        Node current = head.next;

        while (current != null) {
            if (current.data.equals(data)) {
                previous.next = current.next;

                if (current == tail) {
                    tail = previous;
                }

                size--;
                return true;
            }

            previous = current;
            current = current.next;
        }

        return false;
    }

    void tampil() {
        Node current = head;

        while (current != null) {
            System.out.print(current.data);

            if (current.next != null) {
                System.out.print(" -> ");
            }

            current = current.next;
        }

        System.out.println();
    }
}