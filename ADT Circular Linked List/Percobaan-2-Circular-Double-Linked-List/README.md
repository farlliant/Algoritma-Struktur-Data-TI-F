# Percobaan 2 — Circular Double Linked List

Percobaan ini merupakan bagian dari **Prosedur Praktikum ADT Circular Linked List**.

---

## Tujuan Percobaan

Percobaan ini digunakan untuk memahami implementasi dasar **Circular Double Linked List**.

Circular Double Linked List memiliki dua pointer pada setiap node:

```text
sebelum
setelah
```

Sehingga traversal dapat dilakukan dalam dua arah.

---

# Struktur Node

Node menggunakan:

```text
NodeCDLL
├── Object data
├── NodeCDLL sebelum
└── NodeCDLL setelah
```

Representasi node:

```text
+---------+--------+---------+
| sebelum |  data  | setelah |
+---------+--------+---------+
```

---

# Struktur Circular Double Linked List

List menggunakan:

```text
pAwal
pAkhir
jumlah
```

Visualisasi:

```text
        +--------------------------+
        |                          |
        v                          |
[A] <-> [B] <-> [C] <-> [D]
 ^                          |
 |                          |
 +--------------------------+
```

Hubungan circular yang harus dipertahankan:

```text
pAkhir.setelah = pAwal
pAwal.sebelum = pAkhir
```

---

# Kondisi Satu Node

Ketika hanya terdapat satu node:

```text
pAwal
  |
  v
 [A]
  ^
  |
pAkhir
```

kedua pointer node menunjuk ke dirinya sendiri:

```text
A.sebelum = A
A.setelah = A
```

dan:

```text
pAwal == pAkhir
```

---

# Class yang Digunakan

Percobaan menggunakan:

```text
NodeCDLL
CircularDoubleLinkedList
```

Atribut utama:

```java
private NodeCDLL pAwal, pAkhir;
private int jumlah;
```

---

# Operasi pada Percobaan

Method yang diperkenalkan:

```text
SisipDataDiAwal()
SisipDataDiAkhir()
hapusData()
cetak()
```

---

# `SisipDataDiAwal()`

Ketika list masih kosong:

```text
pAwal = pBaru
pAkhir = pBaru
```

dan:

```text
pBaru.sebelum = pBaru
pBaru.setelah = pBaru
```

Jika list sudah memiliki data:

```text
pBaru.sebelum = pAkhir
pBaru.setelah = pAwal

pAwal.sebelum = pBaru
pAkhir.setelah = pBaru

pAwal = pBaru
```

Dengan demikian hubungan circular dua arah tetap terjaga.

---

# Hubungan Pointer

Untuk Circular Double Linked List, hubungan berikut harus konsisten:

```text
pAwal.sebelum
```

menunjuk ke:

```text
pAkhir
```

dan:

```text
pAkhir.setelah
```

menunjuk ke:

```text
pAwal
```

Contoh:

```text
       +--------------------+
       |                    |
       v                    |
[A] <-> [B] <-> [C] <-> [D]
 ^                    |
 |                    |
 +--------------------+
```

---

# `cetak()`

Method:

```java
cetak(String Komentar)
```

digunakan untuk menampilkan seluruh data.

Traversal dimulai dari:

```text
pAwal
```

kemudian bergerak menggunakan:

```text
setelah
```

Jumlah iterasi dibatasi oleh:

```text
jumlah
```

karena Circular Linked List tidak mempunyai node akhir yang menunjuk ke `null`.

---

# Pengujian pada `main()`

Pada Percobaan, beberapa nilai dimasukkan menggunakan:

```java
SisipDataDiAwal()
```

kemudian struktur list dicetak menggunakan:

```java
cetak()
```

Tujuannya adalah melihat hubungan:

```text
pAwal
pAkhir
sebelum
setelah
```

ketika beberapa node telah berada pada Circular Double Linked List.

---

# Bagian yang Belum Lengkap

Pada source Percobaan terdapat:

```java
SisipDataDiAkhir()
```

dan:

```java
hapusData()
```

yang masih memiliki:

```java
// lengkapi bagian ini
```

Bagian tersebut **sengaja belum diimplementasikan pada folder Percobaan**.

Penyelesaiannya merupakan bagian dari:

👉 [Latihan](../Latihan)

---

# Source Code

Source Percobaan tersedia pada:

```text
CircularDoubleLinkedList.java
```

---

> [!IMPORTANT]
> Source pada folder Percobaan dipertahankan mengikuti source modul praktikum sedekat mungkin.
>
> Method yang masih memiliki:
>
> ```java
> // lengkapi bagian ini
> ```
>
> sengaja belum diselesaikan karena menjadi bagian dari Latihan.

> [!NOTE]
> Pada source modul terdapat beberapa typo atau inkonsistensi penulisan Java.
> Source di repository dapat melakukan normalisasi kecil yang diperlukan agar struktur class dapat dibaca sebagai source Java, tanpa mengubah tujuan Percobaan.