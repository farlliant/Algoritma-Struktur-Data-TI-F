# Percobaan 1 — Circular Single Linked List

Percobaan ini merupakan bagian dari **Prosedur Praktikum ADT Circular Linked List**.

---

## Tujuan Percobaan

Percobaan ini digunakan untuk memahami implementasi dasar **Circular Single Linked List**.

Berbeda dengan Single Linked List biasa, node terakhir pada Circular Single Linked List tidak menunjuk ke:

```text
null
```

melainkan kembali menuju:

```text
pAwal
```

---

# Struktur Node

Node pada Circular Single Linked List memiliki:

```text
NodeCSLL
├── Object data
└── NodeCSLL setelah
```

Representasi sederhananya:

```text
+--------+---------+
|  data  | setelah |
+--------+---------+
              |
              v
        node berikutnya
```

---

# Struktur Circular Single Linked List

Implementasi menggunakan:

```text
pAwal
pAkhir
jumlah
```

Visualisasi:

```text
      +------------------------------+
      |                              |
      v                              |
[A] -> [B] -> [C] -> [D] -----------+
 ↑                       ↑
pAwal                  pAkhir
```

Hubungan utama yang harus dipertahankan:

```text
pAkhir.setelah = pAwal
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

maka:

```text
pAwal == pAkhir
```

dan pointer:

```text
A.setelah
```

menunjuk kembali ke dirinya sendiri.

```text
A.setelah = A
```

---

# Class yang Digunakan

Percobaan menggunakan:

```text
NodeCSLL
CircularSingleLinkedList
```

Atribut pada list:

```java
private NodeCSLL pAwal, pAkhir;
private int jumlah;
```

---

# Operasi pada Percobaan

Beberapa method yang diperkenalkan adalah:

```text
SisipDataDiAwal()
SisipDataDiAkhir()
hapusData()
hapusSatuDataDiAwal()
hapusSatuDataDiAkhir()
cetak()
```

---

# `SisipDataDiAwal()`

Method ini digunakan untuk memasukkan data pada bagian awal Circular Single Linked List.

Jika list masih kosong:

```text
pAwal = pBaru
pAkhir = pBaru
```

Node baru menunjuk ke dirinya sendiri:

```text
pBaru.setelah = pBaru
```

Jika list sudah memiliki data:

```text
pBaru.setelah = pAwal
pAkhir.setelah = pBaru
pAwal = pBaru
```

Contoh:

```text
Sebelum:

[A] -> [B] -> [C]
 ^             |
 |_____________|

Setelah SisipDataDiAwal(X):

[X] -> [A] -> [B] -> [C]
 ^                    |
 |____________________|
```

---

# `hapusData()`

Method:

```java
hapusData(Object dtHapus)
```

digunakan untuk mencari dan menghapus data tertentu dari Circular Single Linked List.

Traversal dimulai dari:

```text
pAwal
```

dan berjalan menggunakan:

```text
setelah
```

Pencarian dibatasi menggunakan variabel:

```text
jumlah
```

agar traversal tidak terus berulang tanpa akhir pada struktur circular.

---

# `cetak()`

Method:

```java
cetak(String Komentar)
```

digunakan untuk mencetak seluruh isi list.

Traversal dimulai dari:

```text
pAwal
```

dan bergerak menuju node berikutnya menggunakan:

```text
setelah
```

---

# Pengujian pada `main()`

Source Percobaan memasukkan beberapa nilai menggunakan:

```java
SisipDataDiAwal()
```

kemudian mencetak isi list.

Beberapa data juga dihapus menggunakan:

```java
hapusData()
```

untuk mengamati perubahan struktur Circular Single Linked List.

---

# Bagian yang Belum Lengkap

Pada source Percobaan terdapat beberapa method:

```java
SisipDataDiAkhir()
```

```java
hapusSatuDataDiAwal()
```

```java
hapusSatuDataDiAkhir()
```

yang masih memiliki:

```java
// lengkapi bagian ini
```

Bagian tersebut **sengaja tidak dilengkapi pada folder Percobaan**.

Method tersebut merupakan bagian yang akan diselesaikan pada:

👉 [Latihan](../Latihan)

---

# Source Code

Source Percobaan tersedia pada:

```text
CircularSingleLinkedList.java
```

---

> [!IMPORTANT]
> Source pada folder Percobaan dipertahankan mengikuti kode pada modul praktikum sedekat mungkin.
>
> Method yang masih memiliki komentar:
>
> ```java
> // lengkapi bagian ini
> ```
>
> sengaja tidak diselesaikan pada folder ini karena merupakan bagian dari Latihan.

> [!NOTE]
> Pada versi Java yang lebih baru, penggunaan:
>
> ```java
> new Integer(...)
> ```
>
> dapat menghasilkan warning karena constructor tersebut sudah deprecated.
> Penulisan tersebut tetap dipertahankan pada Percobaan agar mendekati source yang diberikan pada modul.