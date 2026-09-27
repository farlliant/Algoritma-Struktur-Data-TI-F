public class Matrik {
    private int nBaris, nKolom;
    private double[][] itemDt;

    public Matrik(int nBrs, int nKlm) {
        nBaris = nBrs;
        nKolom = nKlm;
        itemDt = new double[nBaris][nKolom];
    }

    public Matrik(double[][] A) {
        this(A.length, A[0].length);

        for (int i = 0; i < nBaris; i++) {
            for (int j = 0; j < nKolom; j++) {
                itemDt[i][j] = A[i][j];
            }
        }
    }

    public int getNBaris() {
        return nBaris;
    }

    public int getNKolom() {
        return nKolom;
    }

    public double getItem(int idB, int idK) {
        return itemDt[idB][idK];
    }

    public void setItem(int idB, int idK, double dt) {
        itemDt[idB][idK] = dt;
    }

    public static Matrik tambah(Matrik A, Matrik B) {
        if (A.getNBaris() != B.getNBaris()
                || A.getNKolom() != B.getNKolom()) {

            return null;
        }

        Matrik hasil =
            new Matrik(A.getNBaris(), A.getNKolom());

        for (int i = 0; i < A.getNBaris(); i++) {
            for (int j = 0; j < A.getNKolom(); j++) {
                hasil.setItem(
                    i,
                    j,
                    A.getItem(i, j) + B.getItem(i, j)
                );
            }
        }

        return hasil;
    }

    public static Larik VektorKaliMatrik(
            Larik L,
            Matrik M) {

        Larik lHasil = null;

        if (L.getSize() == M.getNBaris()) {
            lHasil = new Larik(M.getNKolom());

            for (int i = 0; i < M.getNKolom(); i++) {
                Larik lKolom = M.getKolom(i);

                double hasil =
                    Larik.LarikKaliLarik(L, lKolom);

                lHasil.isiItem(i, hasil);
            }
        }

        return lHasil;
    }

    public static Matrik tranpos(Matrik A) {
        Matrik hasil =
            new Matrik(A.getNKolom(), A.getNBaris());

        for (int i = 0; i < A.getNBaris(); i++) {
            for (int j = 0; j < A.getNKolom(); j++) {
                hasil.setItem(
                    j,
                    i,
                    A.getItem(i, j)
                );
            }
        }

        return hasil;
    }

    public Larik getBaris(int idBaris) {
        Larik l = new Larik(nKolom);

        for (int i = 0; i < nKolom; i++) {
            l.isiItem(
                i,
                getItem(idBaris, i)
            );
        }

        return l;
    }

    public Larik getKolom(int idKolom) {
        Larik l = new Larik(nBaris);

        for (int i = 0; i < nBaris; i++) {
            l.isiItem(
                i,
                getItem(i, idKolom)
            );
        }

        return l;
    }

    public void cetak(String kom) {
        System.out.println(kom);

        for (int i = 0; i < nBaris; i++) {
            for (int j = 0; j < nKolom; j++) {
                System.out.printf(
                    "%.2f ",
                    itemDt[i][j]
                );
            }

            System.out.println();
        }
    }
}