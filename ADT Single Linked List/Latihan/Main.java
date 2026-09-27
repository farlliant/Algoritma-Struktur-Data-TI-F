public class Main {
    public static void main(String[] args) {
        SLL list = new SLL();

        list.addFirst(new Node("B"));
        list.addFirst(new Node("A"));
        list.addLast(new Node("D"));
        list.insertAfter("B", new Node("C"));

        System.out.print("Isi list: ");
        list.tampil();

        System.out.println("Jumlah data: " + list.size());
        System.out.println(
            "Cari C: " + (list.search("C") != null)
        );
        System.out.println(
            "Data index 2: " + list.get(2)
        );

        list.remove("B");

        System.out.print("Setelah B dihapus: ");
        list.tampil();
    }
}