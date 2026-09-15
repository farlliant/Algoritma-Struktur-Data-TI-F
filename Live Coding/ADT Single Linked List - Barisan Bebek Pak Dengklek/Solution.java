import java.util.Scanner;
public class Solution{
    static class Node{
        Object data;
        Node next;
        Node(Object data){
            this.data = data;
        }
    }

    static class SLL{
        Node head, tail;
        int size, gagal;

        boolean isEmpty(){
            return(size == 0);
        }

        void depan(Object data){
            Node baru = new Node(data);
            if(isEmpty()){
                head = tail = baru;
            } else {
                baru.next = head;
                head = baru;
            }
            size++;
        }

        void belakang(Object data){
            Node baru = new Node(data);
            if(isEmpty()){
                head = tail = baru;
            } else {
                tail.next = baru;
                tail = baru;
            }
            size++;
        }
        
        void pulang(Object data){
            if(isEmpty()){
                gagal++;
                return;
            }
            if(head.data.equals(data)){
                head = head.next;
                if(head == null) tail = null;
                size--;
                return;
            }
            Node temp;
            for(temp = head; temp.next != null; temp = temp.next){
                if(temp.next.data.equals(data)){
                    if(temp.next == tail) tail = temp;
                    temp.next = temp.next.next;
                    size--;
                    return;
                }
            }
            gagal++;
        }

        void cetak(){
            Node temp = head;
            System.out.println(size + " " + gagal);
            if(isEmpty()){
                System.out.println("KOSONG");
            } else{
                while(temp != null){
                    System.out.print(temp.data + " ");
                    temp = temp.next;
                }
            }
        }
    }
    
    public static Scanner input = new Scanner(System.in);
    public static void main(String[] args){
        SLL sll = new SLL();
        int n = input.nextInt();
        for(int i = 0; i < n; i++){
            String perintah = input.next();
            int x = input.nextInt();
            if(perintah.equals("DEPAN")){
                sll.depan(x);
            } else if(perintah.equals("BELAKANG")){
                sll.belakang(x);
            } else if(perintah.equals("PULANG")){
                sll.pulang(x);
            }
        }
        sll.cetak();
        input.close();
    }
}