import java.util.Scanner;

public class Solution {

    static class Node {
        int data;
        Node next;
        Node prev;

        Node(int data) {
            this.data = data;
        }
    }

    static class CDLL {
        Node head;
        Node tail;
        int size;
        int gagal;

        boolean isEmpty() {
            return head == null;
        }

        void depan(int data) {
            Node baru = new Node(data);

            if (isEmpty()) {
                head = baru;
                tail = baru;

                baru.next = baru;
                baru.prev = baru;
            } else {
                baru.next = head;
                baru.prev = tail;

                head.prev = baru;
                tail.next = baru;

                head = baru;
            }

            size++;
        }

        void belakang(int data) {
            Node baru = new Node(data);

            if (isEmpty()) {
                head = baru;
                tail = baru;

                baru.next = baru;
                baru.prev = baru;
            } else {
                baru.prev = tail;
                baru.next = head;

                tail.next = baru;
                head.prev = baru;

                tail = baru;
            }

            size++;
        }

        void hapusNode(Node target) {
            if (size == 1) {
                head = null;
                tail = null;
            } else {
                target.prev.next = target.next;
                target.next.prev = target.prev;

                if (target == head) {
                    head = target.next;
                }

                if (target == tail) {
                    tail = target.prev;
                }
            }

            size--;
        }

        void hapusDepan(int data) {
            if (isEmpty()) {
                gagal++;
                return;
            }

            Node current = head;

            do {
                if (current.data == data) {
                    hapusNode(current);
                    return;
                }

                current = current.next;

            } while (current != head);

            gagal++;
        }

        void hapusBelakang(int data) {
            if (isEmpty()) {
                gagal++;
                return;
            }

            Node current = tail;

            do {
                if (current.data == data) {
                    hapusNode(current);
                    return;
                }

                current = current.prev;

            } while (current != tail);

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

            do {
                System.out.print(current.data);

                current = current.next;

                if (current != head) {
                    System.out.print(" ");
                }

            } while (current != head);

            System.out.println();

            current = tail;

            do {
                System.out.print(current.data);

                current = current.prev;

                if (current != tail) {
                    System.out.print(" ");
                }

            } while (current != tail);

            System.out.println();
        }
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        CDLL playlist = new CDLL();

        int n = input.nextInt();

        for (int i = 0; i < n; i++) {
            String perintah = input.next();
            int x = input.nextInt();

            if (perintah.equals("DEPAN")) {
                playlist.depan(x);

            } else if (perintah.equals("BELAKANG")) {
                playlist.belakang(x);

            } else if (perintah.equals("HAPUS_DEPAN")) {
                playlist.hapusDepan(x);

            } else if (perintah.equals("HAPUS_BELAKANG")) {
                playlist.hapusBelakang(x);
            }
        }

        playlist.cetak();
        input.close();
    }
}