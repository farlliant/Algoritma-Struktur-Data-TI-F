# Live Coding ADT Single Linked List — Barisan Bebek Pak Dengklek

Soal ini digunakan untuk latihan/live coding materi **ADT Single Linked List** pada Praktikum Algoritma dan Struktur Data.

Fokus utama soal:

- Implementasi `Node`
- Pointer `next`
- Pointer `head` dan `tail`
- Penambahan node di depan
- Penambahan node di belakang
- Traversal Single Linked List
- Pencarian data
- Penghapusan node
- Pemeliharaan `size`
- Penanganan kondisi list kosong

---

## Deskripsi Soal

Pak Dengklek memiliki beberapa bebek yang sedang berlatih untuk mengikuti sebuah parade.

Setiap bebek memiliki **nomor identitas** berupa sebuah bilangan bulat.

Untuk mengatur barisan bebek, Pak Dengklek menggunakan sebuah **Single Linked List**.

Awalnya, barisan bebek dalam keadaan kosong. Pak Dengklek kemudian memberikan `N` buah perintah.

Terdapat tiga jenis perintah:

| Perintah | Keterangan |
|---|---|
| `DEPAN X` | Bebek bernomor `X` masuk ke bagian paling depan barisan |
| `BELAKANG X` | Bebek bernomor `X` masuk ke bagian paling belakang barisan |
| `PULANG X` | Hapus node pertama bernilai `X` yang ditemukan saat traversal dari `head` menuju `tail` |

Jika perintah `PULANG X` diberikan tetapi tidak terdapat node dengan nilai `X`, maka barisan tidak berubah dan perintah tersebut dianggap **gagal**.

Beberapa bebek boleh memiliki nomor yang sama.

Jika terdapat lebih dari satu node dengan nilai `X`, maka hanya **kemunculan pertama nilai `X` yang ditemukan saat traversal dari `head` menuju `tail`** yang dihapus.

Setelah seluruh perintah selesai dijalankan, tentukan kondisi akhir barisan bebek Pak Dengklek.

---

## Format Masukan

Baris pertama berisi:

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

### Batasan

```text
1 ≤ N ≤ 1000
-100000 ≤ X ≤ 100000
```

Nomor beberapa bebek boleh sama.

---

## Format Keluaran

Cetak tepat dua baris.

Baris pertama:

```text
jumlahBebek jumlahPerintahGagal
```

dengan:

- `jumlahBebek` adalah jumlah bebek yang masih berada di dalam barisan.
- `jumlahPerintahGagal` adalah banyaknya perintah `PULANG` yang gagal karena nilai `X` tidak ditemukan.

Baris kedua berisi seluruh nomor bebek dari **`head` menuju `tail`**, dipisahkan oleh satu spasi.

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

Perubahan barisan:

```text
Awal          -> KOSONG

BELAKANG 10   -> 10
BELAKANG 20   -> 10 20
DEPAN 5       -> 5 10 20
BELAKANG 30   -> 5 10 20 30
PULANG 20     -> 5 10 30
DEPAN 7       -> 7 5 10 30
PULANG 99     -> gagal
BELAKANG 40   -> 7 5 10 30 40
```

### Output

```text
5 1
7 5 10 30 40
```

---

## Ide Penyelesaian

Buat sebuah `Node` yang menyimpan:

```text
data
next
```

Kemudian buat struktur Single Linked List yang memiliki:

```text
head
tail
size
jumlahPerintahGagal
```

### 1. Perintah `DEPAN X`

Buat node baru.

Jika list masih kosong:

```text
head = nodeBaru
tail = nodeBaru
```

Jika list sudah memiliki node:

```text
nodeBaru.next = head
head = nodeBaru
```

Kemudian:

```text
size++
```

Contoh:

```text
Sebelum:

head
 |
 v
[10] -> [20] -> null


DEPAN 5


Sesudah:

head
 |
 v
[5] -> [10] -> [20] -> null
```

---

### 2. Perintah `BELAKANG X`

Buat node baru.

Jika list masih kosong:

```text
head = nodeBaru
tail = nodeBaru
```

Jika list sudah memiliki node:

```text
tail.next = nodeBaru
tail = nodeBaru
```

Kemudian:

```text
size++
```

Contoh:

```text
Sebelum:

head        tail
 |            |
 v            v
[10] -> [20] -> null


BELAKANG 30


Sesudah:

head                tail
 |                    |
 v                    v
[10] -> [20] -> [30] -> null
```

---

### 3. Perintah `PULANG X`

Lakukan pencarian dari `head` menuju `tail`.

Terdapat beberapa kondisi yang perlu diperhatikan.

#### List kosong

Jika list kosong, nilai `X` pasti tidak ditemukan.

```text
jumlahPerintahGagal++
```

#### Node `head` bernilai `X`

Jika:

```text
head.data == X
```

maka:

```text
head = head.next
size--
```

Jika setelah penghapusan list menjadi kosong:

```text
tail = null
```

#### Nilai `X` berada setelah `head`

Lakukan traversal sampai menemukan node yang `next`-nya memiliki nilai `X`.

Misalnya:

```text
head
 |
 v
[5] -> [10] -> [20] -> [30] -> null
```

Untuk:

```text
PULANG 20
```

node `10` ditemukan sebagai node sebelum `20`.

Kemudian hubungan:

```text
10 -> 20 -> 30
```

diubah menjadi:

```text
10 ------> 30
```

sehingga:

```text
[5] -> [10] -> [30] -> null
```

Jika node yang dihapus merupakan `tail`, maka `tail` harus dipindahkan ke node sebelumnya.

#### Nilai `X` tidak ditemukan

Jika traversal selesai dan tidak ditemukan node dengan nilai `X`:

```text
jumlahPerintahGagal++
```

---

## Contoh Data Duplikat

Misalkan barisan:

```text
head
 |
 v
[5] -> [7] -> [10] -> [7] -> [20] -> null
```

Kemudian diberikan:

```text
PULANG 7
```

Traversal dimulai dari `head`.

Node bernilai `7` yang pertama kali ditemukan adalah:

```text
[5] -> [7] -> ...
        ^
        |
     dihapus
```

Sehingga hasilnya:

```text
[5] -> [10] -> [7] -> [20] -> null
```

Node `7` yang kedua tetap berada di dalam barisan.

---

## Kompleksitas

### `DEPAN`

Karena node langsung ditambahkan menggunakan `head`:

```text
O(1)
```

### `BELAKANG`

Karena node langsung ditambahkan menggunakan `tail`:

```text
O(1)
```

### `PULANG`

Pada kasus terburuk, traversal dilakukan dari `head` hingga `tail`:

```text
O(N)
```

Untuk maksimal `N` perintah, kompleksitas keseluruhan pada kasus terburuk dapat mencapai:

```text
O(N²)
```

Sedangkan penggunaan memori:

```text
O(N)
```

karena setiap bebek yang berada di dalam barisan direpresentasikan oleh sebuah node.

---

## Implementasi

Solusi tersedia pada file:

```text
Solution.java
```

Struktur utama yang digunakan:

```text
Solution
│
├── Node
│   ├── data
│   └── next
│
└── SLL
    ├── head
    ├── tail
    ├── size
    ├── jumlahPerintahGagal
    ├── depan()
    ├── belakang()
    ├── pulang()
    └── cetak()
```

---

## Catatan

Penyelesaian **wajib menggunakan implementasi Single Linked List sendiri**.

Tidak diperbolehkan menggunakan struktur data bawaan Java seperti:

- `ArrayList`
- `LinkedList`
- `HashMap`
- `Set`

atau struktur data bawaan lainnya untuk menggantikan Single Linked List.

Nama file solusi harus:

```text
Solution.java
```