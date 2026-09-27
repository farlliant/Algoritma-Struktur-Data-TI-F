public class Main {
    public static void main(String[] args) {
        DLL list = new DLL();

        list.insertSorted(new Mahasiswa("M001", "Andi", 3.75));
        list.insertSorted(new Mahasiswa("M002", "Budi", 3.20));
        list.insertSorted(new Mahasiswa("M003", "Citra", 3.90));
        list.insertSorted(new Mahasiswa("M004", "Dina", 3.50));
        list.insertSorted(new Mahasiswa("M005", "Eka", 3.20));

        System.out.println("Data Mahasiswa Ascending Berdasarkan IPK:");
        list.tampilAscending();

        System.out.println();

        System.out.println("Data Mahasiswa Descending Berdasarkan IPK:");
        list.tampilDescending();
    }
}