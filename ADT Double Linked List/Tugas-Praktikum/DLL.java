public class DLL {
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
            head.prev = input;
            head = input;
        }

        size++;
    }

    void addLast(Node input) {
        if (isEmpty()) {
            head = input;
            tail = input;
        } else {
            input.prev = tail;
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

        Node current;

        if (index < size / 2) {
            current = head;

            for (int i = 0; i < index; i++) {
                current = current.next;
            }
        } else {
            current = tail;

            for (int i = size - 1; i > index; i--) {
                current = current.prev;
            }
        }

        return current.data;
    }

    boolean insertAfter(Object key, Node input) {
        Node current = search(key);

        if (current == null) {
            return false;
        }

        if (current == tail) {
            addLast(input);
            return true;
        }

        input.next = current.next;
        input.prev = current;

        current.next.prev = input;
        current.next = input;

        size++;

        return true;
    }

    boolean remove(Object data) {
        Node target = search(data);

        if (target == null) {
            return false;
        }

        if (target == head && target == tail) {
            head = null;
            tail = null;

        } else if (target == head) {
            head = target.next;
            head.prev = null;

        } else if (target == tail) {
            tail = target.prev;
            tail.next = null;

        } else {
            target.prev.next = target.next;
            target.next.prev = target.prev;
        }

        size--;

        return true;
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
                && ((Mahasiswa) current.next.data).getIpk()
                <= mahasiswa.getIpk()) {

            current = current.next;
        }

        input.next = current.next;
        input.prev = current;

        current.next.prev = input;
        current.next = input;

        size++;
    }

    void tampilAscending() {
        Node current = head;

        while (current != null) {
            System.out.println(current.data);
            current = current.next;
        }
    }

    void tampilDescending() {
        Node current = tail;

        while (current != null) {
            System.out.println(current.data);
            current = current.prev;
        }
    }
}