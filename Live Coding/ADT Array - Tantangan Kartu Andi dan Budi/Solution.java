import java.util.Arrays;
import java.util.Scanner;

public class Solution {

    public static int[] analisisKartu(int[] angka) {
        Arrays.sort(angka);

        int selisihMinimum = 0;
        int jumlahPasangan = 0;
        int pasanganPertama = 0;
        int pasanganKedua = 0;

        for (int i = 0; i + 1 < angka.length; i++) {
            int selisih = angka[i + 1] - angka[i];

            if (i == 0 || selisih < selisihMinimum) {
                selisihMinimum = selisih;
                jumlahPasangan = 1;

                pasanganPertama = angka[i];
                pasanganKedua = angka[i + 1];

            } else if (selisih == selisihMinimum) {
                jumlahPasangan++;
            }
        }

        return new int[] {
            selisihMinimum,
            jumlahPasangan,
            pasanganPertama,
            pasanganKedua
        };
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        int n = input.nextInt();
        int[] angka = new int[n];

        for (int i = 0; i < n; i++) {
            angka[i] = input.nextInt();
        }

        int[] hasil = analisisKartu(angka);

        System.out.println(hasil[0] + " " + hasil[1]);
        System.out.println(hasil[2] + " " + hasil[3]);

        input.close();
    }
}
