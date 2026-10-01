# Live Coding ADT Single Linked List — Antrean Shuttle Kampus

Soal ini digunakan untuk latihan/live coding susulan materi **ADT Single Linked List** pada Praktikum Algoritma dan Struktur Data.

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

Sebuah shuttle kampus memiliki beberapa penumpang yang sedang menunggu untuk naik.

Setiap penumpang memiliki **nomor identitas** berupa sebuah bilangan bulat.

Untuk mengatur antrean penumpang, digunakan sebuah **Single Linked List**.

Awalnya, antrean penumpang dalam keadaan kosong. Sistem kemudian menerima `N` buah perintah.

Terdapat tiga jenis perintah:

| Perintah | Keterangan |
|---|---|
| `NAIK_DEPAN X` | Penumpang bernomor `X` masuk ke bagian paling depan antrean |
| `NAIK_BELAKANG X` | Penumpang bernomor `X` masuk ke bagian paling belakang antrean |
| `TURUN X` | Hapus penumpang pertama bernomor `X` yang ditemukan dari `head` menuju `tail` |

Jika perintah `TURUN X` diberikan tetapi tidak terdapat penumpang bernomor `X`, maka antrean tidak berubah dan perintah tersebut dianggap **gagal**.

Beberapa penumpang boleh memiliki nomor yang sama.

Jika terdapat lebih dari satu penumpang bernomor `X`, maka hanya **kemunculan pertama nilai `X` yang ditemukan saat traversal dari `head` menuju `tail`** yang dihapus.

Setelah seluruh perintah selesai dijalankan, tentukan kondisi akhir antrean penumpang shuttle.

---

## Format Masukan

Baris pertama berisi:

```text
N
```

yang menyatakan banyaknya perintah.

Kemudian terdapat `N` baris berikutnya. Setiap baris berisi salah satu dari:

```text
NAIK_DEPAN X
NAIK_BELAKANG X
TURUN X
```

### Batasan

```text
1 ≤ N ≤ 1000
-100000 ≤ X ≤ 100000
```

Nomor beberapa penumpang boleh sama.

---

## Format Keluaran

Cetak tepat dua baris.

Baris pertama:

```text
jumlahPenumpang jumlahPerintahGagal
```

dengan:

- `jumlahPenumpang` adalah jumlah penumpang yang masih berada di dalam antrean.
- `jumlahPerintahGagal` adalah banyaknya perintah `TURUN` yang gagal karena nomor penumpang tidak ditemukan.

Baris kedua berisi seluruh nomor penumpang dari **`head` menuju `tail`**, dipisahkan oleh satu spasi.

Jika antrean kosong, cetak:

```text
KOSONG
```

---

## Contoh

### Input

```text
10
NAIK_BELAKANG 12
NAIK_BELAKANG 25
NAIK_DEPAN 8
NAIK_BELAKANG 12
TURUN 12
NAIK_DEPAN 5
TURUN 99
NAIK_BELAKANG 30
TURUN 5
TURUN 30
```

Perubahan antrean:

```text
Awal              -> KOSONG

NAIK_BELAKANG 12  -> 12
NAIK_BELAKANG 25  -> 12 25
NAIK_DEPAN 8      -> 8 12 25
NAIK_BELAKANG 12  -> 8 12 25 12
TURUN 12          -> 8 25 12
NAIK_DEPAN 5      -> 5 8 25 12
TURUN 99          -> gagal
NAIK_BELAKANG 30  -> 5 8 25 12 30
TURUN 5           -> 8 25 12 30
TURUN 30          -> 8 25 12
```

### Output

```text
3 1
8 25 12
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

### 1. Perintah `NAIK_DEPAN X`

Buat node baru.

Jika list masih kosong:

```text
head = nodeBaru
tail = nodeBaru
```

Jika list sudah berisi:

```text
nodeBaru.next = head
head = nodeBaru
```

Kemudian:

```text
size++
```

---

### 2. Perintah `NAIK_BELAKANG X`

Buat node baru.

Jika list masih kosong:

```text
head = nodeBaru
tail = nodeBaru
```

Jika list sudah berisi:

```text
tail.next = nodeBaru
tail = nodeBaru
```

Kemudian:

```text
size++
```

---

### 3. Perintah `TURUN X`

Lakukan pencarian dari `head` menuju `tail`.

Beberapa kondisi yang perlu diperhatikan:

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

Hubungkan node sebelum target langsung dengan node setelah target.

Jika node yang dihapus merupakan `tail`, maka `tail` harus dipindahkan ke node sebelumnya.

#### Nilai `X` tidak ditemukan

Jika traversal selesai dan nilai `X` tidak ditemukan:

```text
jumlahPerintahGagal++
```

---

## Contoh Data Duplikat

Misalkan antrean:

```text
head
 |
 v
[5] -> [7] -> [10] -> [7] -> [20] -> null
```

Kemudian diberikan:

```text
TURUN 7
```

Traversal dimulai dari `head`.

Node bernilai `7` yang pertama ditemukan akan dihapus, sehingga:

```text
[5] -> [10] -> [7] -> [20] -> null
```

Node `7` yang kedua tetap berada di dalam antrean.

---

## Kompleksitas

### `NAIK_DEPAN`

```text
O(1)
```

### `NAIK_BELAKANG`

```text
O(1)
```

### `TURUN`

Pada kasus terburuk:

```text
O(N)
```

Untuk maksimal `N` perintah, kompleksitas keseluruhan pada kasus terburuk dapat mencapai:

```text
O(N²)
```

Penggunaan memori:

```text
O(N)
```

---

## Implementasi

Solusi tersedia pada:

```text
Solution.java
```

Struktur utama:

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
    ├── gagal
    ├── naikDepan()
    ├── naikBelakang()
    ├── turun()
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

---

## Public Test

Repository menyediakan automated public smoke test pada:

👉 [`test.ps1`](./test.ps1)

Test tersebut hanya menggunakan contoh publik yang sudah tersedia pada README untuk memastikan `Solution.java` dapat dikompilasi dan menghasilkan output contoh yang benar.

Public test ini **bukan hidden testcase ELING** dan tidak digunakan sebagai pengganti testcase penilaian.
