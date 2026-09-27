public class Main {
    public static void main(String[] args) {
        DLL list = new DLL();

        list.addFirst(new Node("B"));
        list.addFirst(new Node("A"));
        list.addLast(new Node("D"));
        list.insertAfter("B", new Node("C"));

        System.out.print("Head -> Tail: ");
        list.tampilMaju();

        System.out.print("Tail -> Head: ");
        list.tampilMundur();

        System.out.println("Jumlah data: " + list.size());
        System.out.println(
            "Cari C: " + (list.search("C") != null)
        );
        System.out.println(
            "Data index 2: " + list.get(2)
        );

        list.remove("B");

        System.out.print("Setelah B dihapus: ");
        list.tampilMaju();
    }
}