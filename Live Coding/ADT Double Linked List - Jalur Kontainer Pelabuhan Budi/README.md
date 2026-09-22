# Live Coding ADT Double Linked List — Jalur Kontainer Pelabuhan Budi

Soal ini digunakan untuk latihan/live coding materi **ADT Double Linked List** pada Praktikum Algoritma dan Struktur Data.

Fokus utama:

```text
Node
next
prev
head
tail
penambahan dari dua sisi
traversal dua arah
pencarian
penghapusan
```

---

# Deskripsi Soal

Pelabuhan Budi memiliki sebuah jalur penyimpanan kontainer yang memanjang dari arah **Barat** menuju **Timur**.

Setiap kontainer memiliki nomor identitas berupa sebuah bilangan bulat.

Untuk mengatur posisi kontainer, sistem pelabuhan menggunakan sebuah **Double Linked List**.

Pointer:

```text
head
```

menunjuk kontainer paling Barat.

Sedangkan:

```text
tail
```

menunjuk kontainer paling Timur.

Awalnya jalur kontainer dalam keadaan kosong.

Sistem kemudian menerima `N` buah perintah.

---

## Perintah

| Perintah | Keterangan |
|---|---|
| `BARAT X` | Tambahkan kontainer bernomor `X` ke ujung Barat |
| `TIMUR X` | Tambahkan kontainer bernomor `X` ke ujung Timur |
| `AMBIL_BARAT X` | Cari dari `head` menuju `tail`, kemudian hapus node pertama bernilai `X` |
| `AMBIL_TIMUR X` | Cari dari `tail` menuju `head`, kemudian hapus node pertama bernilai `X` |

Beberapa kontainer boleh memiliki nomor yang sama.

Karena itu, arah pencarian menentukan node mana yang akan dihapus.

Jika `X` tidak ditemukan pada operasi:

```text
AMBIL_BARAT
```

atau:

```text
AMBIL_TIMUR
```

maka kondisi list tidak berubah dan perintah tersebut dianggap:

```text
gagal
```

---

# Contoh Data Duplikat

Misalkan:

```text
head
 ↓
[5] <-> [10] <-> [20] <-> [10] <-> [30]
                                    ↑
                                   tail
```

Jika:

```text
AMBIL_BARAT 10
```

maka pencarian dilakukan dari kiri:

```text
head -> tail
```

dan menghasilkan:

```text
5 20 10 30
```

Sedangkan:

```text
AMBIL_TIMUR 10
```

mencari dari kanan:

```text
tail -> head
```

dan menghasilkan:

```text
5 10 20 30
```

---

# Format Masukan

Baris pertama berisi:

```text
N
```

Kemudian terdapat `N` baris yang masing-masing berisi salah satu:

```text
BARAT X
TIMUR X
AMBIL_BARAT X
AMBIL_TIMUR X
```

---

## Batasan

```text
1 ≤ N ≤ 1000
-100000 ≤ X ≤ 100000
```

Beberapa kontainer boleh memiliki nomor yang sama.

---

# Format Keluaran

Cetak tepat tiga baris.

Baris pertama:

```text
jumlahKontainer jumlahPerintahGagal
```

Baris kedua mencetak seluruh kontainer dari:

```text
head -> tail
```

Baris ketiga mencetak seluruh kontainer dari:

```text
tail -> head
```

Setiap nilai dipisahkan satu spasi.

Jika Double Linked List kosong:

```text
KOSONG
KOSONG
```

---

# Contoh

## Input

```text
10
TIMUR 10
TIMUR 20
BARAT 5
TIMUR 10
AMBIL_TIMUR 10
BARAT 7
AMBIL_BARAT 10
AMBIL_TIMUR 99
TIMUR 30
AMBIL_BARAT 7
```

## Output

```text
3 1
5 20 30
30 20 5
```

---

# Penjelasan Contoh

```text
Awal
KOSONG
```

```text
TIMUR 10

10
```

```text
TIMUR 20

10 20
```

```text
BARAT 5

5 10 20
```

```text
TIMUR 10

5 10 20 10
```

```text
AMBIL_TIMUR 10

5 10 20
```

`10` yang paling dekat dengan `tail` dihapus.

```text
BARAT 7

7 5 10 20
```

```text
AMBIL_BARAT 10

7 5 20
```

```text
AMBIL_TIMUR 99
```

`99` tidak ditemukan sehingga:

```text
gagal = 1
```

```text
TIMUR 30

7 5 20 30
```

```text
AMBIL_BARAT 7

5 20 30
```

---

# Ketentuan

Penyelesaian wajib menggunakan implementasi **Double Linked List sendiri**.

Setiap node harus memiliki:

```text
data
next
prev
```

Gunakan:

```text
head
tail
```

Tidak diperbolehkan menggunakan:

```text
ArrayList
LinkedList
HashMap
Set
```

atau struktur data bawaan Java lainnya sebagai pengganti Double Linked List.

Nama file:

```text
Solution.java
```

---

# Penjelasan Solusi

## Struktur Node

Setiap node menyimpan:

```text
data
next
prev
```

Contoh:

```java
static class Node {
    Object data;
    Node next;
    Node prev;
}
```

---

## Struktur DLL

Double Linked List menggunakan:

```text
head
tail
size
gagal
```

`size` menyimpan jumlah node.

`gagal` menyimpan jumlah operasi pengambilan yang tidak menemukan data.

---

## `BARAT X`

Node baru ditambahkan sebelum `head`.

Jika list kosong:

```text
head = nodeBaru
tail = nodeBaru
```

Jika tidak:

```text
baru.next = head
head.prev = baru
head = baru
```

Kompleksitas:

```text
O(1)
```

---

## `TIMUR X`

Node baru ditambahkan setelah `tail`.

Jika list kosong:

```text
head = nodeBaru
tail = nodeBaru
```

Jika tidak:

```text
baru.prev = tail
tail.next = baru
tail = baru
```

Kompleksitas:

```text
O(1)
```

---

# `AMBIL_BARAT X`

Traversal dimulai dari:

```text
head
```

menggunakan:

```text
next
```

Arah pencarian:

```text
head -> ... -> tail
```

Begitu node dengan nilai `X` ditemukan, node tersebut langsung dihapus.

Karena pencarian berhenti pada kemunculan pertama, duplicate otomatis ditangani sesuai arah pencarian.

---

# `AMBIL_TIMUR X`

Traversal dimulai dari:

```text
tail
```

menggunakan:

```text
prev
```

Arah:

```text
tail -> ... -> head
```

Node pertama bernilai `X` yang ditemukan dari arah Timur dihapus.

---

# Penghapusan Node

Terdapat empat kondisi penting:

```text
1. Node merupakan satu-satunya node.
2. Node merupakan head.
3. Node merupakan tail.
4. Node berada di tengah.
```

## Satu-satunya node

```text
head = null
tail = null
```

## Menghapus `head`

```text
head = target.next
head.prev = null
```

## Menghapus `tail`

```text
tail = target.prev
tail.next = null
```

## Menghapus node tengah

Misalnya:

```text
A <-> B <-> C
```

Jika `B` dihapus:

```text
A <-> C
```

Hubungan diperbaiki dengan:

```java
target.prev.next = target.next;
target.next.prev = target.prev;
```

---

# Kompleksitas

| Operasi | Kompleksitas |
|---|:---:|
| `BARAT` | `O(1)` |
| `TIMUR` | `O(1)` |
| `AMBIL_BARAT` | `O(n)` |
| `AMBIL_TIMUR` | `O(n)` |
| Cetak | `O(n)` |

---

# Implementasi

Solusi lengkap tersedia pada:

👉 [`Solution.java`](./Solution.java)