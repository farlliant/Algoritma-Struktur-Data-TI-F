# Live Coding ADT Single Linked List — Barisan Bebek Pak Dengklek

Pak Dengklek memiliki beberapa bebek yang sedang berlatih untuk mengikuti sebuah parade. Setiap bebek memiliki **nomor identitas** berupa sebuah bilangan bulat.

Untuk mengatur barisan bebek, Pak Dengklek menggunakan sebuah **Single Linked List**.

Awalnya, barisan bebek dalam keadaan kosong. Pak Dengklek kemudian memberikan `N` buah perintah.

Terdapat tiga jenis perintah:

| Perintah | Keterangan |
|---|---|
| `DEPAN X` | Bebek bernomor `X` masuk ke **bagian paling depan** barisan |
| `BELAKANG X` | Bebek bernomor `X` masuk ke **bagian paling belakang** barisan |
| `PULANG X` | Bebek bernomor `X` yang ditemukan **pertama kali dari arah depan** keluar dari barisan |

Jika perintah `PULANG X` diberikan tetapi tidak terdapat bebek bernomor `X` di dalam barisan, maka:

- barisan tidak berubah;
- perintah tersebut dianggap **gagal**.

Beberapa bebek boleh memiliki nomor yang sama.

Jika terdapat beberapa bebek dengan nomor `X`, hanya bebek **pertama dari arah `head`** yang dikeluarkan.

Setelah seluruh perintah selesai dijalankan, tentukan kondisi akhir barisan bebek Pak Dengklek.

---

## Format Masukan

Baris pertama berisi sebuah bilangan bulat:

```text
N
```

yang menyatakan banyaknya perintah.

Kemudian terdapat `N` baris berikutnya. Setiap baris berisi salah satu dari tiga perintah:

```text
DEPAN X
BELAKANG X
PULANG X
```

---

## Batasan

```text
1 ≤ N ≤ 1000
-100000 ≤ X ≤ 100000
```

Nomor beberapa bebek boleh sama.

---

## Format Keluaran

Cetak tepat **dua baris**.

### Baris Pertama

```text
jumlahBebek jumlahPerintahGagal
```

dengan:

- `jumlahBebek` adalah jumlah bebek yang masih berada di dalam barisan;
- `jumlahPerintahGagal` adalah banyaknya perintah `PULANG` yang gagal karena nomor bebek tidak ditemukan.

### Baris Kedua

Cetak seluruh nomor bebek dari **`head` menuju `tail`**, dipisahkan oleh satu spasi.

Jika barisan kosong, cetak:

```text
KOSONG
```

---

## Contoh

### Input

```text
8
BELAKANG 10
BELAKANG 20
DEPAN 5
BELAKANG 30
PULANG 20
DEPAN 7
PULANG 99
BELAKANG 40
```

### Output

```text
5 1
7 5 10 30 40
```

---

## Penjelasan

Kondisi barisan berubah sebagai berikut:

```text
Awal          -> KOSONG

BELAKANG 10   -> 10
BELAKANG 20   -> 10 20
DEPAN 5       -> 5 10 20
BELAKANG 30   -> 5 10 20 30
PULANG 20     -> 5 10 30
DEPAN 7       -> 7 5 10 30
PULANG 99     -> gagal, karena 99 tidak ditemukan
BELAKANG 40   -> 7 5 10 30 40
```

Pada akhir proses:

```text
Jumlah bebek          = 5
Jumlah perintah gagal = 1
```

Sehingga output:

```text
5 1
7 5 10 30 40
```

---

## Ketentuan

Penyelesaian **wajib** menggunakan **Single Linked List**.

Gunakan `Node` yang menyimpan:

```text
data
next
```

Gunakan pointer:

```text
head
tail
```

Tidak diperbolehkan menggunakan struktur data bawaan Java berikut:

- `ArrayList`
- `LinkedList`
- `HashMap`
- `Set`
- atau struktur data bawaan lain untuk menggantikan implementasi Single Linked List.

Nama file solusi harus:

```text
Solution.java
```

---

## Konsep yang Diuji

Soal ini menguji pemahaman mengenai:

- pembuatan `Node`;
- penggunaan pointer `next`;
- penggunaan `head` dan `tail`;
- penambahan node di depan;
- penambahan node di belakang;
- traversal Single Linked List;
- pencarian node;
- penghapusan node;
- penghapusan `head`;
- penghapusan `tail`;
- penanganan list kosong;
- pemeliharaan ukuran linked list.

---

## Struktur yang Diharapkan

Secara umum Single Linked List dapat digambarkan sebagai:

```text
head
 |
 v
+------+------+
| data | next |----+
+------+------+    |
                  v
             +------+------+
             | data | next |----+
             +------+------+    |
                                v
                           +------+------+
                           | data | null |
                           +------+------+
                                   ^
                                   |
                                  tail
```

Operasi `DEPAN X` menambahkan node baru pada posisi `head`.

```text
Sebelum:

head
 |
 v
[A] -> [B] -> [C] -> null


DEPAN X


Sesudah:

head
 |
 v
[X] -> [A] -> [B] -> [C] -> null
```

Operasi `BELAKANG X` menambahkan node setelah `tail`.

```text
Sebelum:

head             tail
 |                 |
 v                 v
[A] -> [B] -> [C] -> null


BELAKANG X


Sesudah:

head                    tail
 |                        |
 v                        v
[A] -> [B] -> [C] -> [X] -> null
```

Sedangkan `PULANG X` melakukan traversal dari `head` dan menghapus node pertama dengan nilai `X`.

---