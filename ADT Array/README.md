# 02 — ADT Array

Materi ini membahas **Array** sebagai salah satu struktur data dasar yang digunakan untuk menyimpan sekumpulan data dalam satu variabel.

Setiap elemen pada array dapat diakses menggunakan **indeks**.

---

## Konsep Dasar

Misalkan terdapat array:

```java
int[] angka = new int[5];
```

Array tersebut memiliki 5 elemen dengan indeks:

```text
Indeks :  0   1   2   3   4
          |   |   |   |   |
Data   : [ ] [ ] [ ] [ ] [ ]
```

Indeks array selalu dimulai dari:

```text
0
```

Sehingga elemen terakhir berada pada:

```text
array.length - 1
```

---

## Deklarasi Array

Contoh deklarasi:

```java
int[] angka;
```

Kemudian array dapat dibuat menggunakan:

```java
angka = new int[10];
```

Atau langsung:

```java
int[] angka = new int[10];
```

---

## Inisialisasi Array

Nilai array dapat diberikan satu per satu:

```java
angka[0] = 10;
angka[1] = 20;
angka[2] = 30;
```

Atau langsung ketika deklarasi:

```java
int[] angka = {10, 20, 30};
```

---

## Nilai Default

Jika array dibuat tetapi belum diberikan nilai secara manual, Java akan memberikan nilai default.

| Tipe Data | Nilai Default |
|---|---:|
| `int` | `0` |
| `double` | `0.0` |
| `float` | `0.0` |
| `boolean` | `false` |
| Object / `String` | `null` |

---

## Panjang Array

Jumlah elemen array dapat diketahui menggunakan:

```java
array.length
```

Contoh:

```java
int[] angka = new int[10];

System.out.println(angka.length);
```

Output:

```text
10
```

---

# Array Satu Dimensi

Array satu dimensi dapat dibayangkan sebagai kumpulan data dalam satu baris.

```text
[10] [20] [30] [40] [50]
 0    1    2    3    4
```

Contoh akses:

```java
System.out.println(angka[2]);
```

akan mengakses elemen pada indeks `2`.

---

# Array Dua Dimensi

Array dua dimensi memiliki konsep **baris dan kolom**.

Contoh:

```java
int[][] data = new int[3][4];
```

Artinya:

```text
3 baris
4 kolom
```

Visualisasi:

```text
        Kolom
        0   1   2   3
      +---+---+---+---+
Baris0|   |   |   |   |
      +---+---+---+---+
Baris1|   |   |   |   |
      +---+---+---+---+
Baris2|   |   |   |   |
      +---+---+---+---+
```

Elemen diakses menggunakan:

```java
data[baris][kolom]
```

---

# Percobaan

## Percobaan 1 — Deklarasi, Inisialisasi, dan Akses Array

File:

👉 [Percobaan1.java](./Percobaan1.java)

Percobaan ini menunjukkan:

- pembuatan array;
- pemberian nilai pada setiap indeks;
- akses elemen berdasarkan indeks;
- penggunaan array bertipe `int`.

Contoh konsep:

```java
int[] anArray = new int[10];

anArray[0] = 10;
anArray[1] = 20;
```

---

## Percobaan 2 — Sorting, Searching, dan Penyisipan

File:

👉 [Percobaan2.java](./Percobaan2.java)

Percobaan ini menggunakan beberapa operasi dari `Arrays`, seperti:

```java
Arrays.sort(array);
Arrays.binarySearch(array, nilai);
```

Materi yang dipelajari:

- mengurutkan array;
- mencari posisi sebuah nilai;
- menentukan posisi penyisipan;
- membuat array baru;
- menyalin isi array dengan `System.arraycopy()`.

Alur penyisipan:

```text
Array Lama
    |
    v
Salin bagian depan
    |
    v
Masukkan elemen baru
    |
    v
Salin bagian belakang
    |
    v
Array Baru
```

---

## Percobaan 3 — Membandingkan Array

File:

👉 [Percobaan3.java](./Percobaan3.java)

Percobaan ini menggunakan:

```java
Arrays.equals(array1, array2);
```

Dua array dianggap sama apabila:

- panjangnya sama;
- urutan elemennya sama;
- setiap elemen memiliki nilai yang sama.

Contoh:

```text
[1, 2, 3] == [1, 2, 3]  -> true

[1, 2, 3] == [3, 2, 1]  -> false
```

---

## Percobaan 4 — Array Dua Dimensi

File:

👉 [Percobaan4.java](./Percobaan4.java)

Percobaan ini menggunakan array dua dimensi:

```java
int[][] a2 = new int[10][5];
```

Array memiliki:

```text
10 baris
5 kolom
```

Untuk mengakses seluruh elemen digunakan nested loop:

```java
for (...) {
    for (...) {
        ...
    }
}
```

---

## Percobaan 5 — Mengetahui Jumlah Baris dan Kolom

File:

👉 [Percobaan5.java](./Percobaan5.java)

Pada array dua dimensi:

```java
String[][] data = new String[4][5];
```

Jumlah baris:

```java
data.length
```

Jumlah kolom:

```java
data[0].length
```

Sehingga:

```text
Baris  = 4
Kolom  = 5
```

Total kapasitas:

```text
4 x 5 = 20 elemen
```

---

# ADT Matriks

File:

👉 [Matrik.java](./Matrik.java)

File ini digunakan sebagai implementasi awal ADT Matriks menggunakan array dua dimensi.

Beberapa operasi yang dibahas antara lain:

- penyimpanan elemen matriks;
- pengaksesan elemen;
- penjumlahan matriks;
- transpose matriks;
- pengambilan baris;
- pengambilan kolom;
- operasi vektor dan matriks;
- pencetakan matriks.

---

# Ringkasan

Konsep utama pada materi ADT Array:

```text
Array
  |
  +--> Indeks
  |
  +--> Array 1 Dimensi
  |
  +--> Array 2 Dimensi
  |
  +--> Traversal
  |
  +--> Sorting
  |
  +--> Searching
  |
  +--> Comparison
  |
  +--> Matrix
```

Array memberikan akses langsung terhadap elemen melalui indeks dan menjadi dasar bagi banyak struktur data lain yang akan dipelajari selanjutnya.
