public class Node {
    Object data;
    Node next;
    Node prev;

    public static void main(String[] args)
    {
        Node head = new Node();
        head.data = "A";

        System.out.println("data: " + head.data);
        System.out.println("pointer: " + head.next);
        System.out.println("pointer: " + head.prev);
    }
}