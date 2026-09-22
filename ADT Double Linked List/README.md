# 04 — ADT Double Linked List

Materi ini membahas **Double Linked List (DLL)**, yaitu linked list yang setiap node-nya memiliki dua referensi: `next` menuju node berikutnya dan `prev` menuju node sebelumnya.

---

## Konsep Dasar

```text
+--------+--------+--------+
|  prev  |  data  |  next  |
+--------+--------+--------+
```

Double Linked List dapat ditelusuri dari dua arah:

```text
head                    tail
 ↓                       ↓
[A] <-> [B] <-> [C] <-> [D]
```

- `head` menunjuk node pertama.
- `tail` menunjuk node terakhir.
- `next` menunjuk node berikutnya.
- `prev` menunjuk node sebelumnya.

Pada node pertama:

```text
prev = null
```

Sedangkan pada node terakhir:

```text
next = null
```

---

## Struktur Double Linked List

Implementasi dasar menggunakan:

```java
Node head, tail;
int size = 0;
```

Operasi dasar yang digunakan:

```text
inisialisasi()
isEmpty()
size()
addFirst()
addLast()
```

---

## `isEmpty()`

Digunakan untuk memeriksa apakah Double Linked List masih kosong.

```java
boolean isEmpty(){
    return (size == 0);
}
```

Jika:

```text
size = 0
```

maka list dalam keadaan kosong.

---

## `size()`

Digunakan untuk mengetahui jumlah node yang terdapat di dalam list.

```java
int size(){
    return size;
}
```

---

# Penambahan Node

## `addFirst()`

Digunakan untuk menambahkan node pada bagian awal list.

Kondisi awal:

```text
head
 ↓
[A] <-> [B] <-> [C]
```

Setelah:

```text
addFirst(X)
```

menjadi:

```text
head
 ↓
[X] <-> [A] <-> [B] <-> [C]
```

Pada Double Linked List, hubungan harus diperbarui dari dua arah.

```java
input.next = head;
head.prev = input;
head = input;
```

Jika list sebelumnya kosong:

```text
head = input
tail = input
```

---

## `addLast()`

Digunakan untuk menambahkan node pada bagian akhir list.

Sebelum:

```text
head            tail
 ↓               ↓
[A] <-> [B] <-> [C]
```

Setelah:

```text
addLast(X)
```

menjadi:

```text
head                    tail
 ↓                       ↓
[A] <-> [B] <-> [C] <-> [X]
```

Hubungan yang diperbarui:

```java
input.prev = tail;
tail.next = input;
tail = input;
```

---

# Percobaan

## Percobaan 1 — Node

Folder:

👉 [Percobaan-1](./Percobaan-1)

Percobaan pertama memperkenalkan struktur dasar node pada Double Linked List.

Node memiliki:

```java
Object data;
Node next;
Node prev;
```

Ketika sebuah node baru dibuat dan belum terhubung dengan node lain:

```text
next = null
prev = null
```

Struktur sederhananya:

```text
       data
        |
        v
+------+------+
| prev | data | next
+------+------+
```

---

## Percobaan 2 — Tahap 1

Folder:

👉 [Percobaan-2-Tahap-1](./Percobaan-2-Tahap-1)

Pada tahap ini digunakan class `DLL` dengan:

```java
Node head, tail;
int size;
```

Operasi yang diuji:

```text
addFirst()
addFirst()
addLast()
```

Tujuannya adalah mengamati perubahan:

```text
head
tail
next
prev
```

ketika node dimasukkan dari dua sisi.

---

## Percobaan 2 — Tahap 2

Folder:

👉 [Percobaan-2-Tahap-2](./Percobaan-2-Tahap-2)

Pada tahap kedua digunakan:

```text
addLast()
addLast()
addLast()
```

Pada operasi ini:

```text
head
```

tetap menunjuk node pertama.

Sedangkan:

```text
tail
```

terus berpindah menuju node terakhir yang baru ditambahkan.

---

# Perbedaan dengan Single Linked List

Single Linked List:

```text
[A] -> [B] -> [C] -> null
```

Setiap node hanya mempunyai:

```text
data
next
```

Double Linked List:

```text
null <- [A] <-> [B] <-> [C] -> null
```

Setiap node mempunyai:

```text
data
next
prev
```

Sehingga traversal dapat dilakukan:

```text
head -> tail
```

maupun:

```text
tail -> head
```

---

# Perubahan Head dan Tail

## Satu Node

Jika hanya terdapat satu node:

```text
head
 ↓
[A]
 ↑
tail
```

Maka:

```text
head == tail
```

dan:

```text
A.prev = null
A.next = null
```

---

## Setelah `addFirst()`

Sebelum:

```text
head            tail
 ↓               ↓
[A] <-> [B] <-> [C]
```

Setelah:

```text
addFirst(X)
```

menjadi:

```text
head                    tail
 ↓                       ↓
[X] <-> [A] <-> [B] <-> [C]
```

Pointer yang terutama berubah adalah:

```text
head
```

---

## Setelah `addLast()`

Sebelum:

```text
head            tail
 ↓               ↓
[A] <-> [B] <-> [C]
```

Setelah:

```text
addLast(X)
```

menjadi:

```text
head                    tail
 ↓                       ↓
[A] <-> [B] <-> [C] <-> [X]
```

Pointer yang terutama berubah adalah:

```text
tail
```

---

# Latihan

Pada latihan, implementasi Double Linked List dikembangkan agar memiliki operasi:

```text
1. Inisialisasi
2. isEmpty
3. size
4. Penambahan
5. Penghapusan
6. Penyisipan
7. Pencarian
8. Pengaksesan
```

---

# Tugas Praktikum

Soal tugas tersedia pada:

👉 [Tugas Praktikum](./Tugas-Praktikum)

Penyelesaian tugas belum disertakan.

---

# Live Coding

Terdapat dua latihan live coding:

1. [Jalur Kontainer Pelabuhan Budi](../Live%20Coding/ADT%20Double%20Linked%20List%20-%20Jalur%20Kontainer%20Pelabuhan%20Budi)
2. [Gudang Paket Dua Pintu](../Live%20Coding/ADT%20Double%20Linked%20List%20-%20Gudang%20Paket%20Dua%20Pintu)

---

# Kompleksitas Dasar

| Operasi | Kompleksitas |
|---|:---:|
| `isEmpty()` | `O(1)` |
| `size()` | `O(1)` |
| `addFirst()` | `O(1)` |
| `addLast()` | `O(1)` |

Karena terdapat `head` dan `tail`, penambahan node pada kedua ujung tidak membutuhkan traversal.

---

# Ringkasan

```text
Double Linked List
        |
        +--> Node
        |     |
        |     +--> data
        |     +--> next
        |     +--> prev
        |
        +--> head
        |
        +--> tail
        |
        +--> size
        |
        +--> addFirst()
        |
        +--> addLast()
```

Kunci utama Double Linked List adalah menjaga hubungan:

```text
next
```

dan:

```text
prev
```

tetap konsisten setiap kali struktur list berubah.
