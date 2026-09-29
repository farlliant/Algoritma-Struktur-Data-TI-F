# Live Coding ADT Circular Double Linked List — Playlist Musik Berputar Raka

Soal ini digunakan untuk latihan/live coding materi **ADT Circular Double Linked List** pada Praktikum Algoritma dan Struktur Data.

Fokus utama:

```text
Node
next
prev
head
tail
hubungan circular
penambahan dari dua sisi
traversal dua arah
pencarian
penghapusan
data duplikat
```

---

# Deskripsi Soal

Raka sedang mengembangkan sebuah aplikasi pemutar musik.

Aplikasi tersebut menyimpan lagu-lagu dalam sebuah **Circular Doubly Linked List**.

Setiap lagu memiliki **ID** berupa bilangan bulat.

Setiap node memiliki dua pointer:

```text
next
prev
```

Pointer:

```text
next
```

menunjuk ke lagu berikutnya.

Sedangkan:

```text
prev
```

menunjuk ke lagu sebelumnya.

Karena playlist bersifat **circular**, lagu terakhir terhubung kembali ke lagu pertama, begitu pula lagu pertama terhubung kembali ke lagu terakhir.

Jika playlist berisi:

```text
5 <-> 8 <-> 3 <-> 10
```

maka hubungan antar-node sebenarnya adalah:

```text
        +-----------------------+
        |                       |
        v                       |
      [5] <-> [8] <-> [3] <-> [10]
        ^                       |
        |                       |
        +-----------------------+
```

Pointer:

```text
head
```

menunjuk lagu pertama.

Pointer:

```text
tail
```

menunjuk lagu terakhir.

Jika playlist tidak kosong, hubungan circular berikut harus selalu terjaga:

```text
head.prev == tail
tail.next == head
```

Awalnya playlist dalam keadaan kosong.

Sistem kemudian menerima `N` buah perintah.

---

## Perintah

| Perintah | Keterangan |
|---|---|
| `DEPAN X` | Tambahkan lagu dengan ID `X` ke posisi paling depan dan jadikan sebagai `head` baru |
| `BELAKANG X` | Tambahkan lagu dengan ID `X` ke posisi paling belakang dan jadikan sebagai `tail` baru |
| `HAPUS_DEPAN X` | Cari dari `head` menuju `tail` menggunakan `next`, kemudian hapus node pertama bernilai `X` |
| `HAPUS_BELAKANG X` | Cari dari `tail` menuju `head` menggunakan `prev`, kemudian hapus node pertama bernilai `X` |

Beberapa lagu boleh memiliki ID yang sama.

Karena itu, arah pencarian menentukan node mana yang akan dihapus.

Jika `X` tidak ditemukan pada operasi:

```text
HAPUS_DEPAN
```

atau:

```text
HAPUS_BELAKANG
```

maka kondisi playlist tidak berubah dan perintah tersebut dianggap:

```text
gagal
```

---

# Contoh Data Duplikat

Misalkan playlist:

```text
head
 ↓
[5] <-> [8] <-> [3] <-> [8] <-> [10]
                                  ↑
                                 tail
```

Jika:

```text
HAPUS_DEPAN 8
```

maka pencarian dilakukan dari:

```text
head -> tail
```

menggunakan `next`.

Node `8` pertama dari arah `head` yang dihapus sehingga hasilnya:

```text
5 3 8 10
```

Sedangkan jika:

```text
HAPUS_BELAKANG 8
```

maka pencarian dilakukan dari:

```text
tail -> head
```

menggunakan `prev`.

Node `8` pertama dari arah `tail` yang dihapus sehingga hasilnya:

```text
5 8 3 10
```

---

# Format Masukan

Baris pertama berisi:

```text
N
```

yang menyatakan banyaknya perintah.

Kemudian terdapat `N` baris yang masing-masing berisi salah satu:

```text
DEPAN X
BELAKANG X
HAPUS_DEPAN X
HAPUS_BELAKANG X
```

`X` merupakan ID lagu berupa bilangan bulat.

---

## Batasan

```text
1 ≤ N ≤ 1000
-100000 ≤ X ≤ 100000
```

Beberapa lagu boleh memiliki ID yang sama.

Playlist dapat menjadi kosong selama proses berlangsung.

---

# Format Keluaran

Cetak tepat tiga baris.

Baris pertama:

```text
jumlahLagu jumlahPerintahGagal
```

`jumlahLagu` adalah jumlah lagu yang masih berada di dalam playlist.

`jumlahPerintahGagal` adalah banyaknya perintah:

```text
HAPUS_DEPAN
HAPUS_BELAKANG
```

yang gagal karena ID lagu tidak ditemukan.

Baris kedua mencetak seluruh lagu dari:

```text
head -> tail
```

menggunakan pointer:

```text
next
```

Baris ketiga mencetak seluruh lagu dari:

```text
tail -> head
```

menggunakan pointer:

```text
prev
```

Setiap nilai dipisahkan satu spasi.

Karena list bersifat circular, traversal berhenti setelah kembali ke node awal traversal.

Jika playlist kosong:

```text
KOSONG
KOSONG
```

---

# Contoh

## Input

```text
10
BELAKANG 10
BELAKANG 20
DEPAN 5
BELAKANG 10
HAPUS_BELAKANG 10
DEPAN 7
HAPUS_DEPAN 10
HAPUS_BELAKANG 99
BELAKANG 30
HAPUS_DEPAN 7
```

## Output

```text
3 1
5 20 30
30 20 5
```

---

# Penjelasan Contoh

Awal:

```text
KOSONG
```

Setelah:

```text
BELAKANG 10
```

menjadi:

```text
10
```

Kemudian:

```text
BELAKANG 20
```

menjadi:

```text
10 20
```

Kemudian:

```text
DEPAN 5
```

menjadi:

```text
5 10 20
```

Kemudian:

```text
BELAKANG 10
```

menjadi:

```text
5 10 20 10
```

Perintah:

```text
HAPUS_BELAKANG 10
```

mencari dari `tail`, sehingga `10` paling belakang yang dihapus:

```text
5 10 20
```

Kemudian:

```text
DEPAN 7
```

menjadi:

```text
7 5 10 20
```

Perintah:

```text
HAPUS_DEPAN 10
```

mencari dari `head`, sehingga menghasilkan:

```text
7 5 20
```

Perintah:

```text
HAPUS_BELAKANG 99
```

gagal karena `99` tidak ditemukan.

Sehingga:

```text
jumlahPerintahGagal = 1
```

Kemudian:

```text
BELAKANG 30
```

menjadi:

```text
7 5 20 30
```

Terakhir:

```text
HAPUS_DEPAN 7
```

menghasilkan:

```text
5 20 30
```

Traversal dari `head` menuju `tail`:

```text
5 20 30
```

Traversal dari `tail` menuju `head`:

```text
30 20 5
```

---

# Ketentuan

Penyelesaian wajib menggunakan implementasi:

```text
Circular Doubly Linked List
```

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

Jika playlist tidak kosong, hubungan circular harus selalu terjaga:

```text
head.prev == tail
tail.next == head
```

`HAPUS_DEPAN` melakukan pencarian dari:

```text
head
```

menggunakan:

```text
next
```

`HAPUS_BELAKANG` melakukan pencarian dari:

```text
tail
```

menggunakan:

```text
prev
```

Tidak diperbolehkan menggunakan:

```text
ArrayList
LinkedList
HashMap
Set
```

atau struktur data bawaan Java lainnya sebagai pengganti Circular Doubly Linked List.

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

Implementasi:

```java
static class Node {
    int data;
    Node next;
    Node prev;

    Node(int data) {
        this.data = data;
    }
}
```

---

## Struktur CDLL

Circular Doubly Linked List menggunakan:

```text
head
tail
size
gagal
```

`head` menunjuk node pertama.

`tail` menunjuk node terakhir.

`size` menyimpan jumlah node.

`gagal` menyimpan jumlah operasi penghapusan yang tidak menemukan data.

---

# `DEPAN X`

Node baru ditempatkan sebelum `head`.

Jika list kosong:

```text
head = baru
tail = baru
```

Node satu-satunya harus menunjuk kembali ke dirinya sendiri:

```text
baru.next = baru
baru.prev = baru
```

Jika list sudah memiliki node:

```text
baru.next = head
baru.prev = tail

head.prev = baru
tail.next = baru

head = baru
```

Kompleksitas:

```text
O(1)
```

---

# `BELAKANG X`

Node baru ditempatkan setelah `tail`.

Jika list kosong:

```text
head = baru
tail = baru
```

dengan:

```text
baru.next = baru
baru.prev = baru
```

Jika list sudah memiliki node:

```text
baru.prev = tail
baru.next = head

tail.next = baru
head.prev = baru

tail = baru
```

Kompleksitas:

```text
O(1)
```

---

# `HAPUS_DEPAN X`

Traversal dilakukan:

```text
head -> tail
```

menggunakan:

```text
next
```

Karena list bersifat circular, traversal tidak berhenti pada:

```text
null
```

Traversal berhenti ketika pointer kembali ke:

```text
head
```

Kemunculan pertama nilai `X` dari arah `head` akan dihapus.

Jika nilai tidak ditemukan:

```text
gagal++
```

Kompleksitas:

```text
O(n)
```

---

# `HAPUS_BELAKANG X`

Traversal dilakukan:

```text
tail -> head
```

menggunakan:

```text
prev
```

Traversal berhenti ketika pointer kembali ke:

```text
tail
```

Kemunculan pertama nilai `X` dari arah `tail` akan dihapus.

Jika nilai tidak ditemukan:

```text
gagal++
```

Kompleksitas:

```text
O(n)
```

---

# Penghapusan Node

Terdapat empat kondisi penting:

```text
1. Node merupakan satu-satunya node.
2. Node merupakan head.
3. Node merupakan tail.
4. Node berada di tengah.
```

## Satu-satunya Node

Jika hanya terdapat satu node:

```text
head = null
tail = null
```

---

## Menghapus `head`

Misalnya:

```text
[A] <-> [B] <-> [C]
 ^
head
```

Setelah `A` dihapus:

```text
[B] <-> [C]
 ^
head
```

`head` dipindahkan ke:

```text
target.next
```

---

## Menghapus `tail`

Misalnya:

```text
[A] <-> [B] <-> [C]
                 ^
                tail
```

Setelah `C` dihapus:

```text
[A] <-> [B]
         ^
        tail
```

`tail` dipindahkan ke:

```text
target.prev
```

---

## Menghapus Node Tengah

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

Pada Circular Doubly Linked List, hubungan tersebut sekaligus harus tetap mempertahankan:

```text
head.prev == tail
tail.next == head
```

---

# Traversal

Traversal maju dilakukan dari:

```text
head
```

menggunakan:

```text
next
```

dan berhenti setelah kembali ke `head`.

Traversal mundur dilakukan dari:

```text
tail
```

menggunakan:

```text
prev
```

dan berhenti setelah kembali ke `tail`.

Karena itu traversal dapat menggunakan pola:

```java
do {
    ...
} while (current != awal);
```

---

# Kompleksitas

| Operasi | Kompleksitas |
|---|:---:|
| `DEPAN` | `O(1)` |
| `BELAKANG` | `O(1)` |
| `HAPUS_DEPAN` | `O(n)` |
| `HAPUS_BELAKANG` | `O(n)` |
| Cetak `head -> tail` | `O(n)` |
| Cetak `tail -> head` | `O(n)` |

Penggunaan memori:

```text
O(n)
```

---

# Implementasi

Solusi lengkap tersedia pada:

👉 [`Solution.java`](./Solution.java)

Automated test tersedia pada:

👉 [`test.ps1`](./test.ps1)
---

## Public Test

Repository menyediakan automated public smoke test pada:

👉 [`test.ps1`](./test.ps1)

Test tersebut hanya menggunakan contoh publik yang sudah tersedia pada README untuk memastikan `Solution.java` dapat dikompilasi dan menghasilkan output contoh yang benar.

Public test ini **bukan hidden testcase ELING** dan tidak digunakan sebagai pengganti testcase penilaian.
