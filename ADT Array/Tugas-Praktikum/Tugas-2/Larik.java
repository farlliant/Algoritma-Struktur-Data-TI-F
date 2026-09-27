public class Larik {
    private double[] itemDt;

    public Larik(int size) {
        itemDt = new double[size];
    }

    public int getSize() {
        return itemDt.length;
    }

    public double getItem(int index) {
        return itemDt[index];
    }

    public void isiItem(int index, double data) {
        itemDt[index] = data;
    }

    public static double LarikKaliLarik(Larik A, Larik B) {
        if (A.getSize() != B.getSize()) {
            throw new IllegalArgumentException(
                "Ukuran larik harus sama"
            );
        }

        double hasil = 0;

        for (int i = 0; i < A.getSize(); i++) {
            hasil += A.getItem(i) * B.getItem(i);
        }

        return hasil;
    }

    public void cetak(String komentar) {
        System.out.println(komentar);

        for (double item : itemDt) {
            System.out.printf("%.2f ", item);
        }

        System.out.println();
    }
}