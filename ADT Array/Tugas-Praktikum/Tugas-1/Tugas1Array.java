import java.util.Arrays;

public class Tugas1Array {

    static boolean isPrima(int nilai) {
        if (nilai < 2) {
            return false;
        }

        for (int i = 2; i * i <= nilai; i++) {
            if (nilai % i == 0) {
                return false;
            }
        }

        return true;
    }

    public static void main(String[] args) {
        int[] data = {
            30, 87, 90, 3, 1,
            50, 23, 4, 25, 23,
            40, 35, 47, 2, 33
        };

        Arrays.sort(data);

        System.out.println("Data terurut:");
        System.out.println(Arrays.toString(data));

        int total = 0;
        int minimum = data[0];
        int maksimum = data[0];

        for (int nilai : data) {
            total += nilai;

            if (nilai < minimum) {
                minimum = nilai;
            }

            if (nilai > maksimum) {
                maksimum = nilai;
            }
        }

        double rataRata = (double) total / data.length;

        System.out.printf("Rata-rata: %.2f%n", rataRata);
        System.out.println("Nilai minimum: " + minimum);
        System.out.println("Nilai maksimum: " + maksimum);

        System.out.print("Bilangan ganjil: ");

        boolean pertama = true;

        for (int nilai : data) {
            if (nilai % 2 != 0) {
                if (!pertama) {
                    System.out.print(" ");
                }

                System.out.print(nilai);
                pertama = false;
            }
        }

        System.out.println();

        System.out.print("Bilangan prima: ");

        pertama = true;

        for (int nilai : data) {
            if (isPrima(nilai)) {
                if (!pertama) {
                    System.out.print(" ");
                }

                System.out.print(nilai);
                pertama = false;
            }
        }

        System.out.println();

        int[][] data2D = new int[3][5];
        int index = 0;

        for (int i = 0; i < data2D.length; i++) {
            for (int j = 0; j < data2D[i].length; j++) {
                data2D[i][j] = data[index++];
            }
        }

        System.out.println("Array 2 dimensi 3 x 5:");

        for (int[] baris : data2D) {
            for (int j = 0; j < baris.length; j++) {
                System.out.print(baris[j]);

                if (j < baris.length - 1) {
                    System.out.print(" ");
                }
            }

            System.out.println();
        }
    }
}