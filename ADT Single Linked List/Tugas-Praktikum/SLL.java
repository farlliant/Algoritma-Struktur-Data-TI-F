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

    void insertSorted(Mahasiswa mahasiswa) {
        Node input = new Node(mahasiswa);

        if (isEmpty()) {
            addFirst(input);
            return;
        }

        if (mahasiswa.getIpk() < ((Mahasiswa) head.data).getIpk()) {
            addFirst(input);
            return;
        }

        if (mahasiswa.getIpk() >= ((Mahasiswa) tail.data).getIpk()) {
            addLast(input);
            return;
        }

        Node current = head;

        while (current.next != null
                && ((Mahasiswa) current.next.data).getIpk() <= mahasiswa.getIpk()) {

            current = current.next;
        }

        input.next = current.next;
        current.next = input;
        size++;
    }

    void tampil() {
        Node current = head;

        while (current != null) {
            System.out.println(current.data);
            current = current.next;
        }
    }
}