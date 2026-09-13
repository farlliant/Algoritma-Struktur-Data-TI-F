# Percobaan 3 — Pseudocode Menghitung Luas Persegi Panjang

Percobaan ini menunjukkan cara merepresentasikan proses menghitung luas persegi panjang menggunakan pseudocode.

---

## Permasalahan

Diberikan nilai panjang dan lebar sebuah persegi panjang.

Hitung:

```text
Luas = Panjang * Lebar
```

kemudian tampilkan hasilnya.

---

## Pseudocode

```text
Pseudocode MenghitungLuasPersegiPanjang

{ Menghitung luas persegi panjang berdasarkan
  nilai panjang dan lebar yang diberikan }

Deklarasi
    Panjang, Lebar, Luas

Deskripsi
    Cetak "Inputkan nilai panjang: "
    Input Panjang

    Cetak "Inputkan nilai lebar: "
    Input Lebar

    Luas <- Panjang * Lebar

    Cetak "Luasnya = ", Luas
```

---

## Struktur Pseudocode

### 1. Kepala Pseudocode

```text
Pseudocode MenghitungLuasPersegiPanjang
```

Bagian ini menunjukkan nama dan tujuan pseudocode.

---

### 2. Deklarasi

```text
Panjang, Lebar, Luas
```

Variabel yang digunakan:

- `Panjang` untuk menyimpan nilai panjang;
- `Lebar` untuk menyimpan nilai lebar;
- `Luas` untuk menyimpan hasil perhitungan.

---

### 3. Deskripsi

Bagian deskripsi menunjukkan urutan proses:

```text
Meminta nilai panjang
        |
        v
Membaca Panjang
        |
        v
Meminta nilai lebar
        |
        v
Membaca Lebar
        |
        v
Menghitung Luas
        |
        v
Menampilkan Luas
```

---

## Contoh

Input:

```text
Panjang = 8
Lebar   = 5
```

Proses:

```text
Luas <- Panjang * Lebar
Luas <- 8 * 5
Luas <- 40
```

Output:

```text
Luasnya = 40
```

---

## Catatan

Pada gambar pseudocode di modul terdapat penulisan:

```text
Luas = Panjang + Lebar
```

Namun deskripsi pseudocode dan flowchart pada percobaan sebelumnya menjelaskan bahwa luas persegi panjang merupakan hasil perkalian panjang dan lebar.

Oleh karena itu, implementasi pseudocode pada repository ini menggunakan:

```text
Luas <- Panjang * Lebar
```

agar sesuai dengan konsep luas persegi panjang yang benar.

---

## Kesimpulan

Pseudocode membantu menyusun logika program secara sistematis tanpa terikat oleh sintaks suatu bahasa pemrograman.

Dibandingkan flowchart, pseudocode lebih mendekati bentuk instruksi program sehingga dapat mempermudah proses implementasi selanjutnya.
