import java.util.Scanner;

public class Solution {

    static class Node {
        Object data;
        Node next;
        Node prev;

        Node(Object data) {
            this.data = data;
            this.next = null;
            this.prev = null;
        }
    }

    static class DLL {
        Node head;
        Node tail;
        int size = 0;
        int gagal = 0;

        boolean isEmpty() {
            return size == 0;
        }

        void masukKiri(Object data) {
            Node baru = new Node(data);

            if (isEmpty()) {
                head = tail = baru;
            } else {
                baru.next = head;
                head.prev = baru;
                head = baru;
            }

            size++;
        }

        void masukKanan(Object data) {
            Node baru = new Node(data);

            if (isEmpty()) {
                head = tail = baru;
            } else {
                baru.prev = tail;
                tail.next = baru;
                tail = baru;
            }

            size++;
        }

        void hapus(Node target) {
            if (target == head && target == tail) {
                head = tail = null;

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
        }

        void keluarKiri(Object data) {
            Node current = head;

            while (current != null) {
                if (current.data.equals(data)) {
                    hapus(current);
                    return;
                }

                current = current.next;
            }

            gagal++;
        }

        void keluarKanan(Object data) {
            Node current = tail;

            while (current != null) {
                if (current.data.equals(data)) {
                    hapus(current);
                    return;
                }

                current = current.prev;
            }

            gagal++;
        }

        void cetak() {
            System.out.println(size + " " + gagal);

            if (isEmpty()) {
                System.out.println("KOSONG");
                System.out.println("KOSONG");
                return;
            }

            Node current = head;

            while (current != null) {
                System.out.print(current.data);

                if (current.next != null) {
                    System.out.print(" ");
                }

                current = current.next;
            }

            System.out.println();

            current = tail;

            while (current != null) {
                System.out.print(current.data);

                if (current.prev != null) {
                    System.out.print(" ");
                }

                current = current.prev;
            }

            System.out.println();
        }
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        DLL list = new DLL();

        int n = input.nextInt();

        for (int i = 0; i < n; i++) {
            String perintah = input.next();
            String x = input.next();

            if (perintah.equals("MASUK_KIRI")) {
                list.masukKiri(x);

            } else if (perintah.equals("MASUK_KANAN")) {
                list.masukKanan(x);

            } else if (perintah.equals("KELUAR_KIRI")) {
                list.keluarKiri(x);

            } else if (perintah.equals("KELUAR_KANAN")) {
                list.keluarKanan(x);
            }
        }

        list.cetak();
        input.close();
    }
}