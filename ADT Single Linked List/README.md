# 03 — ADT Single Linked List

Materi ini membahas **Single Linked List**, yaitu struktur data yang terdiri dari kumpulan node yang saling terhubung secara satu arah.

Berbeda dengan array yang menggunakan indeks, setiap elemen pada linked list dihubungkan menggunakan sebuah referensi menuju node berikutnya.

---

# Konsep Dasar

Sebuah node pada Single Linked List memiliki dua bagian utama:

```text
+--------+--------+
|  Data  |  Next  |
+--------+--------+
              |
              v
        Node berikutnya
```

- `data` menyimpan nilai atau objek.
- `next` menyimpan referensi menuju node berikutnya.

Contoh:

```java
class Node {
    Object data;
    Node next;
}
```

---

# Struktur Single Linked List

Single Linked List dapat digambarkan seperti:

```text
head
 |
 v
+------+------+
|  A   | next |----+
+------+------+    |
                  v
             +------+------+
             |  B   | next |----+
             +------+------+    |
                               v
                          +------+------+
                          |  C   | null |
                          +------+------+
                                  ^
                                  |
                                 tail
```

Node terakhir memiliki:

```text
next = null
```

---

## Head

`head` menyimpan referensi menuju node pertama.

```text
head -> node pertama
```

Jika linked list kosong:

```text
head = null
```

---

## Tail

`tail` menyimpan referensi menuju node terakhir.

```text
tail -> node terakhir
```

Penggunaan `tail` membuat penambahan node di akhir list dapat dilakukan tanpa harus melakukan traversal dari `head`.

---

## Size

`size` digunakan untuk menyimpan jumlah node yang terdapat pada linked list.

Contoh:

```java
int size = 0;
```

Ketika node ditambahkan:

```java
size++;
```

---

# Operasi Dasar

## `isEmpty()`

Digunakan untuk memeriksa apakah linked list masih kosong.

Contoh:

```java
boolean isEmpty() {
    return (size == 0);
}
```

Jika:

```text
size = 0
```

maka list kosong.

---

## `size()`

Mengembalikan jumlah node pada linked list.

```java
int size() {
    return size;
}
```

---

# Penambahan Node

## `addFirst()`

Digunakan untuk menambahkan node pada bagian awal linked list.

Misalkan kondisi awal:

```text
head
 |
 v
[A] -> [B] -> [C] -> null
```

Kemudian ditambahkan `X` dengan `addFirst()`:

```text
head
 |
 v
[X] -> [A] -> [B] -> [C] -> null
```

Konsep utama:

```java
input.next = head;
head = input;
```

Jika list sebelumnya kosong, `head` dan `tail` akan menunjuk node yang sama.

---

## `addLast()`

Digunakan untuk menambahkan node pada bagian akhir linked list.

Sebelum:

```text
[A] -> [B] -> [C] -> null
               ^
               |
              tail
```

Setelah menambahkan `X`:

```text
[A] -> [B] -> [C] -> [X] -> null
                      ^
                      |
                     tail
```

Konsep utama:

```java
tail.next = input;
tail = input;
```

---

# Percobaan

## Percobaan 1 — Node

Folder:

👉 [Percobaan-1](./Percobaan-1)

Percobaan pertama membahas struktur dasar sebuah `Node`.

Node memiliki:

```java
Object data;
Node next;
```

Kemudian dibuat sebuah objek node:

```java
Node head = new Node();
```

Data dapat diberikan menggunakan:

```java
head.data = "A";
```

Ketika `next` belum menunjuk node lain:

```text
next = null
```

Percobaan ini memperkenalkan hubungan antara:

```text
Object Node
    |
    +--> data
    |
    +--> next
```

---

## Percobaan 2 — Tahap 1

Folder:

👉 [Percobaan-2-Tahap-1](./Percobaan-2-Tahap-1)

Tahap ini membahas implementasi class `SLL` dengan atribut:

```java
Node head, tail;
int size;
```

dan operasi:

```text
inisialisasi()
isEmpty()
size()
addFirst()
addLast()
```

Percobaan dilakukan menggunakan kombinasi:

```text
addFirst()
addFirst()
addLast()
```

Tujuannya adalah melihat perubahan referensi `head` dan `tail` ketika node ditambahkan dari awal maupun akhir.

---

## Percobaan 2 — Tahap 2

Folder:

👉 [Percobaan-2-Tahap-2](./Percobaan-2-Tahap-2)

Tahap kedua menggunakan struktur SLL yang sama, tetapi pengujian dilakukan dengan beberapa operasi:

```text
addLast()
addLast()
addLast()
```

Tujuannya adalah mengamati bagaimana `tail` terus berpindah menuju node terakhir sementara `head` tetap menunjuk node pertama.

---

# Perubahan Head dan Tail

## Node Pertama

Ketika list masih kosong:

```text
head = null
tail = null
```

Setelah satu node ditambahkan:

```text
head
 |
 v
[A] -> null
 ^
 |
tail
```

Artinya:

```text
head == tail
```

---

## Setelah `addFirst()`

```text
Sebelum:

head
 |
 v
[A] -> [B] -> null
        ^
        |
       tail


Sesudah addFirst(X):

head
 |
 v
[X] -> [A] -> [B] -> null
               ^
               |
              tail
```

Yang berubah terutama adalah:

```text
head
```

---

## Setelah `addLast()`

```text
Sebelum:

head
 |
 v
[A] -> [B] -> null
        ^
        |
       tail


Sesudah addLast(X):

head
 |
 v
[A] -> [B] -> [X] -> null
               ^
               |
              tail
```

Yang berubah terutama adalah:

```text
tail
```

---

# Instansiasi

Deklarasi class:

```java
class SLL {
    ...
}
```

belum membuat objek.

Objek baru dibuat ketika menggunakan:

```java
SLL list = new SLL();
```

Pada pernyataan tersebut:

```text
SLL
 |
 +--> nama class

list
 |
 +--> reference variable

new SLL()
 |
 +--> proses instansiasi object
```

Hal yang sama berlaku untuk:

```java
Node node = new Node();
```

---

# Kompleksitas Operasi Dasar

Karena implementasi menyimpan referensi `head` dan `tail`:

| Operasi | Kompleksitas |
|---|:---:|
| Cek kosong | `O(1)` |
| Mendapatkan size | `O(1)` |
| `addFirst()` | `O(1)` |
| `addLast()` | `O(1)` |

Tidak diperlukan traversal untuk menambahkan node di depan maupun di belakang.

---

# Ringkasan

Konsep utama Single Linked List:

```text
Single Linked List
        |
        +--> Node
        |     |
        |     +--> data
        |     +--> next
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

Single Linked List membangun struktur data secara dinamis menggunakan node dan referensi antar-node, sehingga ukuran list dapat berkembang sesuai kebutuhan.
