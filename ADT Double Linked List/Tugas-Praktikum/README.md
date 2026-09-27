# Tugas Praktikum — ADT Double Linked List

Tugas ini merupakan bagian dari materi **ADT Double Linked List**.

---

## Deskripsi Tugas

Modifikasi implementasi Double Linked List sehingga dapat menampung **sembarang object**.

Gunakan class:

```text
Mahasiswa
```

dengan data:

```text
Mahasiswa
├── String nim
├── String nama
└── double ipk
```

Class `Mahasiswa` memiliki:

```text
Constructor Mahasiswa
double getIpk()
String getNim()
String getNama()
```

Selain itu, gunakan dan modifikasi method penyisipan data sehingga Double Linked List dapat terbentuk dalam kondisi **terurut sejak awal berdasarkan IPK**.

Program juga harus dapat menampilkan data mahasiswa secara:

```text
Ascending
Descending
```

berdasarkan nilai IPK.

---

# Struktur Program

Program terdiri dari empat class:

```text
Node
Mahasiswa
DLL
Main
```

Struktur folder:

```text
Tugas-Praktikum/
├── README.md
├── Node.java
├── Mahasiswa.java
├── DLL.java
└── Main.java
```

---

# 1. Class `Node`

Setiap node pada Double Linked List memiliki:

```text
data
next
prev
```

Karena DLL harus dapat menampung sembarang object, data disimpan menggunakan:

```java
Object data;
```

Struktur node:

```java
public class Node {
    Object data;
    Node next;
    Node prev;
}
```

Pointer:

```text
next
```

digunakan untuk menunjuk node berikutnya.

Pointer:

```text
prev
```

digunakan untuk menunjuk node sebelumnya.

---

# 2. Class `Mahasiswa`

Class `Mahasiswa` digunakan untuk menyimpan:

```text
nim
nama
ipk
```

Struktur:

```java
private String nim;
private String nama;
private double ipk;
```

Class menyediakan:

```text
getNim()
getNama()
getIpk()
```

Nilai dari:

```text
getIpk()
```

digunakan untuk menentukan posisi mahasiswa pada Double Linked List.

---

# 3. Class `DLL`

Double Linked List menggunakan:

```text
head
tail
size
```

Representasi:

```text
null <- [A] <-> [B] <-> [C] -> null
        ↑                   ↑
       head                tail
```

Traversal dapat dilakukan:

```text
head -> tail
```

maupun:

```text
tail -> head
```

---

# Operasi Dasar

Implementasi DLL memiliki:

```text
inisialisasi()
isEmpty()
size()
addFirst()
addLast()
search()
get()
insertAfter()
remove()
insertSorted()
tampilAscending()
tampilDescending()
```

---

# `addFirst()`

Menambahkan node ke bagian awal list.

Sebelum:

```text
[A] <-> [B] <-> [C]
```

Setelah:

```text
addFirst(X)
```

menjadi:

```text
[X] <-> [A] <-> [B] <-> [C]
```

Hubungan yang diperbarui:

```java
input.next = head;
head.prev = input;
head = input;
```

Kompleksitas:

```text
O(1)
```

---

# `addLast()`

Menambahkan node ke bagian akhir list.

Sebelum:

```text
[A] <-> [B] <-> [C]
```

Sesudah:

```text
[A] <-> [B] <-> [C] <-> [X]
```

Hubungan:

```java
input.prev = tail;
tail.next = input;
tail = input;
```

Kompleksitas:

```text
O(1)
```

---

# Pencarian

## `search()`

Pencarian dilakukan mulai dari:

```text
head
```

menuju:

```text
tail
```

Jika data ditemukan:

```text
return node
```

Jika tidak:

```text
return null
```

Kompleksitas:

```text
O(n)
```

---

# Pengaksesan

## `get(index)`

Data dapat diakses berdasarkan indeks.

Karena Double Linked List mempunyai dua arah traversal, pencarian node dapat dimulai dari:

```text
head
```

untuk indeks yang dekat bagian awal, atau:

```text
tail
```

untuk indeks yang dekat bagian akhir.

Kompleksitas terburuk:

```text
O(n)
```

---

# Penyisipan

## `insertAfter()`

Misalnya:

```text
A <-> B <-> C
```

kemudian:

```text
insertAfter(B, X)
```

menjadi:

```text
A <-> B <-> X <-> C
```

Pada DLL, kedua arah pointer harus diperbarui:

```text
next
prev
```

---

# Penghapusan

## `remove()`

Penghapusan harus menangani:

```text
1. List kosong
2. Satu-satunya node
3. Head
4. Tail
5. Node tengah
6. Data tidak ditemukan
```

Misalnya:

```text
A <-> B <-> C
```

Jika:

```text
B
```

dihapus:

```text
A <-> C
```

Hubungannya diperbaiki menggunakan:

```java
target.prev.next = target.next;
target.next.prev = target.prev;
```

---

# Penyisipan Terurut Berdasarkan IPK

Method utama tugas:

```java
insertSorted(Mahasiswa mahasiswa)
```

Pada implementasi ini, struktur internal DLL disimpan secara:

```text
ascending
```

berdasarkan IPK.

Contoh:

```text
Andi  3.75
Budi  3.20
Citra 3.90
Dina  3.50
```

Setelah dimasukkan:

```text
Budi  3.20
Dina  3.50
Andi  3.75
Citra 3.90
```

---

## List Kosong

Jika belum ada node:

```text
head = node baru
tail = node baru
```

---

## Data Lebih Kecil dari Head

```text
3.20 <-> 3.50 <-> 3.75
```

masukkan:

```text
3.00
```

hasil:

```text
3.00 <-> 3.20 <-> 3.50 <-> 3.75
```

Gunakan:

```text
addFirst()
```

---

## Data Lebih Besar dari Tail

```text
3.20 <-> 3.50 <-> 3.75
```

masukkan:

```text
3.90
```

hasil:

```text
3.20 <-> 3.50 <-> 3.75 <-> 3.90
```

Gunakan:

```text
addLast()
```

---

## Data di Tengah

Jika:

```text
3.20 <-> 3.50 <-> 3.90
```

dimasukkan:

```text
3.75
```

maka:

```text
3.20 <-> 3.50 <-> 3.75 <-> 3.90
```

Pointer yang harus dijaga:

```text
next
prev
```

---

# Ascending dan Descending

Karena list disimpan ascending berdasarkan IPK:

```text
head -> tail
```

menghasilkan:

```text
ascending
```

Sedangkan:

```text
tail -> head
```

menghasilkan:

```text
descending
```

Inilah keuntungan penggunaan Double Linked List untuk tugas ini.

---

# Contoh Program

Data:

```text
M001 | Andi  | 3.75
M002 | Budi  | 3.20
M003 | Citra | 3.90
M004 | Dina  | 3.50
M005 | Eka   | 3.20
```

---

# Contoh Output

```text
Data Mahasiswa Ascending Berdasarkan IPK:
M002 | Budi | 3.20
M005 | Eka | 3.20
M004 | Dina | 3.50
M001 | Andi | 3.75
M003 | Citra | 3.90

Data Mahasiswa Descending Berdasarkan IPK:
M003 | Citra | 3.90
M001 | Andi | 3.75
M004 | Dina | 3.50
M005 | Eka | 3.20
M002 | Budi | 3.20
```

---

# Kompleksitas

| Operasi | Kompleksitas |
|---|:---:|
| `isEmpty()` | `O(1)` |
| `size()` | `O(1)` |
| `addFirst()` | `O(1)` |
| `addLast()` | `O(1)` |
| `search()` | `O(n)` |
| `get()` | `O(n)` |
| `insertAfter()` | `O(n)` |
| `remove()` | `O(n)` |
| `insertSorted()` | `O(n)` |
| `tampilAscending()` | `O(n)` |
| `tampilDescending()` | `O(n)` |

---

# Penyelesaian

Source code penyelesaian tersedia pada:

```text
Node.java
Mahasiswa.java
DLL.java
Main.java
```