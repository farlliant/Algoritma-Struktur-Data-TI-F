public class Main {
    public static void main(String[] args) {
        SLL list = new SLL();

        list.insertSorted(new Mahasiswa("M001", "Andi", 3.75));
        list.insertSorted(new Mahasiswa("M002", "Budi", 3.20));
        list.insertSorted(new Mahasiswa("M003", "Citra", 3.90));
        list.insertSorted(new Mahasiswa("M004", "Dina", 3.50));
        list.insertSorted(new Mahasiswa("M005", "Eka", 3.20));

        System.out.println("Data Mahasiswa Terurut Berdasarkan IPK:");
        list.tampil();
    }
}