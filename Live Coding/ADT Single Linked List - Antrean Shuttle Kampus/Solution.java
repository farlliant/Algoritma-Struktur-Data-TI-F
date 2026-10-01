import java.util.Scanner;

public class Solution {

    static class Node {
        Object data;
        Node next;

        Node(Object data) {
            this.data = data;
        }
    }

    static class SLL {
        Node head, tail;
        int size, gagal;

        boolean isEmpty() {
            return size == 0;
        }

        void naikDepan(Object data) {
            Node baru = new Node(data);

            if(isEmpty()){
                head = tail = baru;
            } else {
                baru.next = head;
                head = baru;
            }

            size++;
        }

        void naikBelakang(Object data) {
            Node baru = new Node(data);

            if(isEmpty()){
                head = tail = baru;
            } else {
                tail.next = baru;
                tail = baru;
            }

            size++;
        }

        void turun(Object data) {
            if(isEmpty()){
                gagal++;
                return;
            }

            if(head.data.equals(data)){
                head = head.next;
                size--;

                if(head == null){
                    tail = null;
                }

                return;
            }

            Node temp;

            for(temp = head; temp.next != null; temp = temp.next){
                if(temp.next.data.equals(data)){

                    if(temp.next == tail){
                        tail = temp;
                    }

                    temp.next = temp.next.next;
                    size--;

                    return;
                }
            }

            gagal++;
        }

        void cetak() {
            System.out.println(size + " " + gagal);

            if(isEmpty()){
                System.out.println("KOSONG");
                return;
            }

            Node temp = head;

            while(temp != null){
                System.out.print(temp.data);

                if(temp.next != null){
                    System.out.print(" ");
                }

                temp = temp.next;
            }

            System.out.println();
        }
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        SLL sll = new SLL();

        int n = input.nextInt();

        for(int i = 0; i < n; i++){
            String perintah = input.next();
            int x = input.nextInt();

            if(perintah.equals("NAIK_DEPAN")){
                sll.naikDepan(x);
            } else if(perintah.equals("NAIK_BELAKANG")){
                sll.naikBelakang(x);
            } else if(perintah.equals("TURUN")){
                sll.turun(x);
            }
        }

        sll.cetak();
        input.close();
    }
}
