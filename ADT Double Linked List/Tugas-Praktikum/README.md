# Tugas Praktikum — ADT Double Linked List

Tugas ini merupakan bagian dari materi **ADT Double Linked List**.

---

## Deskripsi Tugas

Lengkapi implementasi Double Linked List sehingga dapat menampung **sembarang object**.

Gunakan class `Mahasiswa` untuk menyimpan data pada Double Linked List.

Class `Mahasiswa` memiliki atribut:

```text
Mahasiswa
├── String nim
├── String nama
└── double ipk
```

Class tersebut memiliki:

```text
Constructor Mahasiswa
double getIpk()
String getNim()
String getNama()
```

---

## Penyisipan Data

Gunakan dan modifikasi method penyisipan sehingga data mahasiswa dapat langsung tersusun berdasarkan nilai:

```text
ipk
```

Setiap object `Mahasiswa` yang dimasukkan harus ditempatkan pada posisi yang sesuai sehingga Double Linked List selalu berada dalam kondisi terurut.

---

## Menampilkan Data

Lengkapi method pada Double Linked List agar seluruh data mahasiswa dapat ditampilkan berdasarkan nilai IPK dalam dua urutan:

```text
Ascending
Descending
```

Gunakan kemampuan traversal dua arah pada Double Linked List.

Traversal dari:

```text
head -> tail
```

dapat digunakan untuk salah satu arah.

Sedangkan:

```text
tail -> head
```

dapat digunakan untuk arah sebaliknya.

---

## Ketentuan

Implementasi harus menggunakan **Double Linked List**.

Setiap node harus memiliki:

```text
data
next
prev
```

Double Linked List menggunakan:

```text
head
tail
```

Data yang disimpan berupa object:

```text
Mahasiswa
```

---

## Target

Program harus mampu:

```text
1. Menyimpan object Mahasiswa.
2. Menyisipkan data berdasarkan IPK.
3. Menjaga data tetap terurut.
4. Menampilkan data secara ascending.
5. Menampilkan data secara descending.
```

---

## Penyelesaian

File penyelesaian tugas belum disertakan dan akan ditambahkan setelah tugas selesai dikerjakan.