# Tugas Praktikum — ADT Array

Tugas ini merupakan bagian dari materi **ADT Array**.

Terdapat dua tugas utama:

```text
Tugas 1 — Pengolahan data array
Tugas 2 — Implementasi ADT Matrik
```

---

# Tugas 1 — Pengolahan Array

Gunakan data:

```text
30, 87, 90, 3, 1, 50, 23, 4, 25, 23, 40, 35, 47, 2, 33
```

Kerjakan:

```text
1. Urutkan data.
2. Hitung rata-rata.
3. Hitung nilai maksimum dan minimum.
4. Tampilkan bilangan ganjil.
5. Tampilkan bilangan prima.
6. Bentuk data menjadi array dua dimensi 3 baris × 5 kolom.
```

---

## Struktur

```text
Tugas-1/
└── Tugas1Array.java
```

---

## Penyelesaian Tugas 1

Data diurutkan menggunakan:

```java
Arrays.sort(data);
```

Rata-rata dihitung dengan:

```text
jumlah seluruh elemen / jumlah elemen
```

Bilangan prima diperiksa menggunakan pembagian mulai dari `2` sampai akar nilai.

Setelah diurutkan:

```text
1 2 3 4 23 23 25 30 33 35 40 47 50 87 90
```

Nilai:

```text
Rata-rata = 32.87
Minimum   = 1
Maksimum  = 90
```

Array kemudian dibentuk menjadi:

```text
1   2   3   4  23
23 25  30  33  35
40 47  50  87  90
```

---

# Tugas 2 — ADT Matrik

Tugas kedua menggunakan class:

```text
Matrik
Larik
```

Beberapa operasi yang diperlukan:

```text
penjumlahan matriks
transpose matriks
mengambil baris
mengambil kolom
perkalian larik dengan matriks
pencetakan
```

---

## Struktur

```text
Tugas-2/
├── Larik.java
├── Matrik.java
└── Main.java
```

---

## Data Pengujian

```text
A =
1 2 3
3 4 7

B =
4 5 1
6 1 9
```

Penjumlahan:

```text
C = A + B

5 7 4
9 5 16
```

Transpose:

```text
5 9
7 5
4 16
```

Baris ke-1 dari C:

```text
9 5 16
```

Hasil perkalian larik tersebut dengan transpose C:

```text
144 362
```

---

# Penyelesaian

Source solution tersedia pada:

```text
Tugas-1/Tugas1Array.java

Tugas-2/Larik.java
Tugas-2/Matrik.java
Tugas-2/Main.java
```