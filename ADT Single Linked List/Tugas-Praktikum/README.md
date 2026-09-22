# Tugas Praktikum — ADT Single Linked List

Tugas ini merupakan bagian dari materi **ADT Single Linked List**.

---

## Deskripsi Tugas

Modifikasi implementasi Single Linked List sehingga dapat menampung **sembarang object**.

Untuk itu, buat class baru bernama:

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

Class `Mahasiswa` memiliki method:

```text
Constructor Mahasiswa
double getIpk()
String getNim()
String getNama()
```

Selain itu, tambahkan method penyisipan sehingga Single Linked List dapat terbentuk dalam kondisi **terurut sejak awal berdasarkan nilai IPK**.

---

# Struktur Program

Program terdiri dari empat class:

```text
Node
Mahasiswa
SLL
Main
```

Struktur folder:

```text
Tugas-Praktikum/
├── README.md
├── Node.java
├── Mahasiswa.java
├── SLL.java
└── Main.java
```

---

# 1. Class `Node`

Setiap node pada Single Linked List memiliki:

```text
data
next
```

Karena SLL harus dapat menyimpan sembarang object, maka tipe data yang digunakan adalah:

```java
Object data;
```

Struktur node:

```java
public class Node {
    Object data;
    Node next;
}
```

Dengan menggunakan `Object`, node dapat menyimpan berbagai jenis object.

Pada tugas ini, object yang disimpan adalah:

```text
Mahasiswa
```

---

# 2. Class `Mahasiswa`

Class `Mahasiswa` digunakan untuk menyimpan data:

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

Class ini memiliki:

```text
constructor
getNim()
getNama()
getIpk()
```

Method `getIpk()` digunakan saat menentukan posisi mahasiswa di dalam Single Linked List.

---

# 3. Class `SLL`

Single Linked List menggunakan:

```text
head
tail
size
```

Representasi:

```text
head
 |
 v
+----------+------+
|   data   | next |----+
+----------+------+    |
                      v
                 +----------+------+
                 |   data   | next |----+
                 +----------+------+    |
                                       v
                                  +----------+------+
                                  |   data   | null |
                                  +----------+------+
                                           ^
                                           |
                                          tail
```

---

# Operasi Dasar

Implementasi SLL memiliki beberapa operasi:

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
tampil()
```

---

## `inisialisasi()`

Mengembalikan list ke kondisi kosong.

```text
head = null
tail = null
size = 0
```

---

## `isEmpty()`

Digunakan untuk memeriksa apakah list kosong.

```java
boolean isEmpty() {
    return size == 0;
}
```

---

## `size()`

Mengembalikan jumlah node di dalam list.

---

# Penambahan Data

## `addFirst()`

Menambahkan node pada bagian awal list.

Sebelum:

```text
head
 |
 v
[A] -> [B] -> [C] -> null
```

Sesudah:

```text
addFirst(X)
```

menjadi:

```text
head
 |
 v
[X] -> [A] -> [B] -> [C] -> null
```

Jika list kosong:

```text
head = input
tail = input
```

Jika tidak:

```java
input.next = head;
head = input;
```

Kompleksitas:

```text
O(1)
```

---

## `addLast()`

Menambahkan node pada bagian akhir list.

Sebelum:

```text
[A] -> [B] -> [C] -> null
               ^
               |
              tail
```

Sesudah:

```text
[A] -> [B] -> [C] -> [X] -> null
                      ^
                      |
                     tail
```

Operasi utama:

```java
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

Pencarian dilakukan dari:

```text
head -> tail
```

Node diperiksa satu per satu sampai data ditemukan.

Jika ditemukan:

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

Digunakan untuk mengambil data berdasarkan posisi node.

Karena Single Linked List tidak memiliki random access seperti array, traversal harus dilakukan dari `head`.

Contoh:

```text
index 0 -> head
index 1 -> node kedua
index 2 -> node ketiga
```

Kompleksitas:

```text
O(n)
```

---

# Penyisipan

## `insertAfter()`

Method ini menyisipkan sebuah node setelah data tertentu.

Misalnya:

```text
A -> B -> C
```

Kemudian:

```text
insertAfter(B, X)
```

menjadi:

```text
A -> B -> X -> C
```

Jika node yang menjadi acuan adalah `tail`, maka `tail` harus diperbarui.

---

# Penghapusan

## `remove()`

Penghapusan harus menangani beberapa kondisi:

```text
1. List kosong
2. Menghapus head
3. Menghapus tail
4. Menghapus node tengah
5. Data tidak ditemukan
```

Misalnya:

```text
A -> B -> C
```

Jika `B` dihapus:

```text
A -> C
```

Hal ini dilakukan dengan mengubah:

```text
previous.next
```

agar langsung menunjuk ke node setelah node yang dihapus.

Kompleksitas:

```text
O(n)
```

---

# Penyisipan Terurut Berdasarkan IPK

Bagian utama tugas adalah membuat method:

```java
insertSorted(Mahasiswa mahasiswa)
```

Pada implementasi ini, data diurutkan secara:

```text
ascending
```

berdasarkan nilai IPK.

Contoh data:

```text
Andi  3.75
Budi  3.20
Citra 3.90
Dina  3.50
```

Setelah dimasukkan menggunakan `insertSorted()`:

```text
Budi  3.20
Dina  3.50
Andi  3.75
Citra 3.90
```

---

## Kasus 1 — List Kosong

Jika list kosong:

```text
head = node baru
tail = node baru
```

---

## Kasus 2 — IPK Lebih Kecil dari Head

Misalnya:

```text
3.20 -> 3.50 -> 3.75
```

Kemudian dimasukkan:

```text
3.00
```

maka:

```text
3.00 -> 3.20 -> 3.50 -> 3.75
```

Gunakan:

```text
addFirst()
```

---

## Kasus 3 — IPK Lebih Besar dari Tail

Jika:

```text
3.20 -> 3.50 -> 3.75
```

kemudian:

```text
3.90
```

maka:

```text
3.20 -> 3.50 -> 3.75 -> 3.90
```

Gunakan:

```text
addLast()
```

---

## Kasus 4 — IPK Berada di Tengah

Misalnya:

```text
3.20 -> 3.50 -> 3.90
```

akan dimasukkan:

```text
3.75
```

Traversal dilakukan sampai ditemukan posisi:

```text
3.50 <= 3.75 <= 3.90
```

Kemudian node dimasukkan:

```text
3.20 -> 3.50 -> 3.75 -> 3.90
```

---

# Contoh Program

Data yang digunakan:

```text
M001 | Andi  | 3.75
M002 | Budi  | 3.20
M003 | Citra | 3.90
M004 | Dina  | 3.50
M005 | Eka   | 3.20
```

Walaupun dimasukkan tidak berurutan, hasil akhir akan tetap terurut berdasarkan IPK.

---

# Contoh Output

```text
Data Mahasiswa Terurut Berdasarkan IPK:
M002 | Budi | 3.20
M005 | Eka | 3.20
M004 | Dina | 3.50
M001 | Andi | 3.75
M003 | Citra | 3.90
```

Jika terdapat IPK yang sama, implementasi ini mempertahankan urutan penyisipan di antara data dengan IPK tersebut.

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
| `tampil()` | `O(n)` |

---

# Penyelesaian

Source code penyelesaian tersedia pada:

```text
Node.java
Mahasiswa.java
SLL.java
Main.java
```