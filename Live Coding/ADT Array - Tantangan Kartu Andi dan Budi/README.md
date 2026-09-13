# Live Coding ADT Array — Tantangan Kartu Andi dan Budi

Soal ini digunakan untuk latihan/live coding materi **ADT Array** pada Praktikum Algoritma dan Struktur Data.

Fokus utama soal:

- Array satu dimensi
- Sorting dengan `Arrays.sort()`
- Traversal array
- Akses elemen berdasarkan indeks
- Perbandingan nilai
- Penyimpanan hasil sementara
- Pengolahan pasangan elemen bersebelahan

---

## Deskripsi Soal

Andi dan Budi sedang bermain menggunakan **N buah kartu angka**.

Setiap kartu memiliki sebuah bilangan bulat. Kartu-kartu tersebut berada dalam urutan acak.

Budi meminta Andi untuk:

1. Mengurutkan seluruh kartu dari nilai terkecil ke terbesar.
2. Menghitung selisih setiap dua kartu yang bersebelahan.
3. Menentukan selisih terkecil.
4. Menghitung banyak pasangan yang memiliki selisih terkecil.
5. Menentukan pasangan pertama dari kiri yang memiliki selisih terkecil.

Untuk dua kartu bersebelahan dengan nilai `A` dan `B`, selisih didefinisikan sebagai:

```text
B - A
```

---

## Format Masukan

Baris pertama:

```text
N
```

Baris kedua:

```text
A1 A2 A3 ... AN
```

### Batasan

```text
2 ≤ N ≤ 1000
-100000 ≤ Ai ≤ 100000
```

Nilai pada beberapa kartu boleh sama.

---

## Format Keluaran

Cetak tepat dua baris.

Baris pertama:

```text
selisihMinimum jumlahPasangan
```

Baris kedua:

```text
angkaPertama angkaKedua
```

`angkaPertama` dan `angkaKedua` adalah pasangan pertama dari kiri setelah array diurutkan yang memiliki selisih minimum.

---

## Contoh

### Input

```text
6
10 4 7 1 13 16
```

Setelah diurutkan:

```text
1 4 7 10 13 16
```

Selisih pasangan bersebelahan:

```text
1 dan 4   -> 3
4 dan 7   -> 3
7 dan 10  -> 3
10 dan 13 -> 3
13 dan 16 -> 3
```

### Output

```text
3 5
1 4
```

---

## Ide Penyelesaian

1. Urutkan array menggunakan:

```java
Arrays.sort(angka);
```

2. Telusuri pasangan:

```java
angka[i]
angka[i + 1]
```

3. Hitung selisih:

```java
int selisih = angka[i + 1] - angka[i];
```

4. Pasangan pertama digunakan sebagai minimum awal.

5. Jika ditemukan selisih yang lebih kecil:
   - perbarui minimum,
   - reset jumlah pasangan menjadi `1`,
   - simpan pasangan tersebut.

6. Jika selisih sama dengan minimum:
   - tambah jumlah pasangan,
   - pasangan pertama tidak diubah.

---

## Kompleksitas

Sorting:

```text
O(N log N)
```

Traversal:

```text
O(N)
```

Total:

```text
O(N log N)
```

---

## Implementasi

Solusi tersedia pada:

```text
Solution.java
```

Pendekatan hanya membutuhkan satu traversal setelah proses sorting.

---

## Catatan

Penyelesaian tidak membutuhkan struktur data tambahan seperti:

- `ArrayList`
- `HashMap`
- `Set`

Seluruh proses cukup menggunakan array, sorting, perulangan, dan percabangan.
