# Live Coding Susulan ADT Double Linked List — Gudang Paket Dua Pintu

Soal ini merupakan soal susulan untuk materi **ADT Double Linked List**.

Tingkat kesulitannya setara dengan soal utama, tetapi data yang disimpan berupa **kode paket bertipe String**.

---

# Deskripsi Soal

Sebuah gudang memiliki lorong penyimpanan paket dengan dua pintu:

```text
Pintu Kiri
Pintu Kanan
```

Setiap paket memiliki kode paket berupa sebuah string tanpa spasi.

Untuk mengatur posisi paket, sistem gudang menggunakan sebuah **Double Linked List**.

Pointer:

```text
head
```

menunjuk paket paling dekat dengan Pintu Kiri.

Pointer:

```text
tail
```

menunjuk paket paling dekat dengan Pintu Kanan.

Awalnya lorong dalam keadaan kosong.

Sistem menerima `N` buah perintah.

---

## Perintah

| Perintah | Keterangan |
|---|---|
| `MASUK_KIRI X` | Tambahkan paket `X` ke sisi kiri |
| `MASUK_KANAN X` | Tambahkan paket `X` ke sisi kanan |
| `KELUAR_KIRI X` | Cari dari `head` menuju `tail`, kemudian hapus kemunculan pertama `X` |
| `KELUAR_KANAN X` | Cari dari `tail` menuju `head`, kemudian hapus kemunculan pertama `X` |

Kode paket boleh duplikat.

Karena itu, arah pencarian menentukan paket mana yang keluar.

Jika paket tidak ditemukan:

```text
jumlahPerintahGagal++
```

dan kondisi list tidak berubah.

---

# Contoh Duplicate

Misalkan:

```text
head
 ↓
[A] <-> [B] <-> [C] <-> [B] <-> [D]
                                 ↑
                                tail
```

Jika:

```text
KELUAR_KIRI B
```

maka hasilnya:

```text
A C B D
```

karena pencarian dilakukan dari kiri.

Sedangkan:

```text
KELUAR_KANAN B
```

menghasilkan:

```text
A B C D
```

karena pencarian dilakukan dari kanan.

---

# Format Masukan

Baris pertama:

```text
N
```

Kemudian terdapat `N` baris yang masing-masing berisi:

```text
MASUK_KIRI X
MASUK_KANAN X
KELUAR_KIRI X
KELUAR_KANAN X
```

---

## Batasan

```text
1 ≤ N ≤ 1000
```

Kode paket:

```text
X
```

terdiri dari huruf kapital dan angka tanpa spasi.

Panjang maksimal:

```text
20 karakter
```

Beberapa paket boleh mempunyai kode yang sama.

---

# Format Keluaran

Cetak tiga baris.

Baris pertama:

```text
jumlahPaket jumlahPerintahGagal
```

Baris kedua:

```text
head -> tail
```

Baris ketiga:

```text
tail -> head
```

Setiap kode dipisahkan oleh satu spasi.

Jika list kosong:

```text
KOSONG
KOSONG
```

---

# Contoh

## Input

```text
10
MASUK_KANAN P1
MASUK_KANAN P2
MASUK_KIRI P0
MASUK_KANAN P1
KELUAR_KANAN P1
MASUK_KIRI P3
KELUAR_KIRI P2
KELUAR_KANAN PX
MASUK_KANAN P4
KELUAR_KIRI P3
```

## Output

```text
3 1
P0 P1 P4
P4 P1 P0
```

---

# Penjelasan Contoh

Awal:

```text
KOSONG
```

Setelah:

```text
MASUK_KANAN P1
```

menjadi:

```text
P1
```

Kemudian:

```text
MASUK_KANAN P2
```

menjadi:

```text
P1 P2
```

Kemudian:

```text
MASUK_KIRI P0
```

menjadi:

```text
P0 P1 P2
```

Kemudian:

```text
MASUK_KANAN P1
```

menjadi:

```text
P0 P1 P2 P1
```

Perintah:

```text
KELUAR_KANAN P1
```

mencari dari kanan sehingga `P1` paling kanan yang dihapus:

```text
P0 P1 P2
```

Selanjutnya:

```text
MASUK_KIRI P3
```

menjadi:

```text
P3 P0 P1 P2
```

Kemudian:

```text
KELUAR_KIRI P2
```

menjadi:

```text
P3 P0 P1
```

Perintah:

```text
KELUAR_KANAN PX
```

gagal karena `PX` tidak ditemukan.

Kemudian:

```text
MASUK_KANAN P4
```

menjadi:

```text
P3 P0 P1 P4
```

Terakhir:

```text
KELUAR_KIRI P3
```

menghasilkan:

```text
P0 P1 P4
```

---

# Ketentuan

Penyelesaian wajib menggunakan implementasi:

```text
Double Linked List
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

Tidak diperbolehkan menggunakan:

```text
ArrayList
LinkedList
HashMap
Set
```

atau struktur data bawaan Java lainnya sebagai pengganti DLL.

Nama file:

```text
Solution.java
```

---

# Penjelasan Solusi

Struktur DLL tetap sama seperti soal utama.

Setiap node menyimpan:

```text
data
next
prev
```

Perbedaannya adalah data sekarang berupa:

```text
String
```

bukan integer.

---

# `MASUK_KIRI X`

Node baru ditempatkan sebelum `head`.

```text
baru.next = head
head.prev = baru
head = baru
```

Jika list kosong:

```text
head = baru
tail = baru
```

Kompleksitas:

```text
O(1)
```

---

# `MASUK_KANAN X`

Node baru ditempatkan setelah `tail`.

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

# `KELUAR_KIRI X`

Traversal dilakukan:

```text
head -> tail
```

menggunakan:

```text
next
```

Karena data berupa String, perbandingan dilakukan menggunakan:

```java
current.data.equals(data)
```

bukan:

```java
current.data == data
```

Kemunculan pertama yang ditemukan dari arah kiri akan dihapus.

---

# `KELUAR_KANAN X`

Traversal dilakukan:

```text
tail -> head
```

menggunakan:

```text
prev
```

Kemunculan pertama dari arah kanan yang sesuai akan dihapus.

---

# Penghapusan

Terdapat empat kondisi:

```text
1. Satu-satunya node
2. Head
3. Tail
4. Node tengah
```

Jika node berada di tengah:

```java
target.prev.next = target.next;
target.next.prev = target.prev;
```

---

# Kompleksitas

| Operasi | Kompleksitas |
|---|:---:|
| `MASUK_KIRI` | `O(1)` |
| `MASUK_KANAN` | `O(1)` |
| `KELUAR_KIRI` | `O(n)` |
| `KELUAR_KANAN` | `O(n)` |
| Cetak | `O(n)` |

---

# Implementasi

Solusi lengkap tersedia pada:

👉 [`Solution.java`](./Solution.java)