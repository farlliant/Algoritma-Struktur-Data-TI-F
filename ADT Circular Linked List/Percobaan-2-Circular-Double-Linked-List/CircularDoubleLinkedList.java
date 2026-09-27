class NodeCDLL {
    Object data;
    NodeCDLL sebelum;
    NodeCDLL setelah;
}

public class CircularDoubleLinkedList {
    private NodeCDLL pAwal, pAkhir;
    private int jumlah;

    public CircularDoubleLinkedList() {
        pAwal = null;
        pAkhir = null;
        jumlah = -1;
    }

    public void SisipDataDiAwal(Object data) {
        NodeCDLL pBaru = new NodeCDLL();

        pBaru.data = data;
        pBaru.sebelum = pBaru;
        pBaru.setelah = pBaru;

        if (pAwal == null) {
            pAwal = pBaru;
            pAkhir = pBaru;
            jumlah = 0;
        } else {
            pBaru.sebelum = pAkhir;
            pBaru.setelah = pAwal;

            pAwal.sebelum = pBaru;
            pAkhir.setelah = pBaru;

            pAwal = pBaru;

            jumlah++;
        }
    }

    public void SisipDataDiAkhir(Object data) {
        // lengkapi bagian ini
    }

    public void hapusData(Object dtHapus) {
        // lengkapi bagian ini
    }

    public void cetak(String Komentar) {
        System.out.println(Komentar);

        NodeCDLL pCetak;
        pCetak = pAwal;

        int i = -1;

        while ((i < jumlah)) {
            System.out.print(pCetak.data + "->");
            pCetak = pCetak.setelah;
            i++;
        }

        System.out.println();
    }

    public static void main(String[] args) {
        CircularDoubleLinkedList cdll =
                new CircularDoubleLinkedList();

        cdll.SisipDataDiAwal(new Integer(50));
        cdll.SisipDataDiAwal(new Integer(60));
        cdll.SisipDataDiAwal(new Integer(70));
        cdll.SisipDataDiAwal(new Integer(8));
        cdll.SisipDataDiAwal(new Integer(9));
        cdll.SisipDataDiAwal(new Integer(90));
        cdll.SisipDataDiAwal(new Integer(19));

        cdll.cetak("cdll Asal");
    }
}