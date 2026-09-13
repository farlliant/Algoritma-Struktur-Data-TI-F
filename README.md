# Algoritma & Struktur Data — TI-F

Repository ini berisi kode percobaan dan implementasi materi **Praktikum Algoritma dan Struktur Data TI-F**.

Materi disusun mengikuti urutan pembelajaran praktikum pada **Semester Ganjil 2026/2027** dan diimplementasikan menggunakan **Java**.

---

## 📚 Daftar Materi

| Pertemuan | Materi | Status |
|:---:|---|:---:|
| 01 | Algoritma | ⏳ |
| 02 | [ADT Array](./ADT%20Array) | ✅ |
| 03 | [ADT Single Linked List](./ADT%20Single%20Linked%20List) | ✅ |
| 04 | ADT Double Linked List | ⏳ |
| 05 | ADT Circular Linked List | ⏳ |
| 06 | ADT Stack | ⏳ |
| 07 | ADT Queue | ⏳ |
| 08 | ADT Binary Tree | ⏳ |
| 09 | ADT AVL Tree | ⏳ |
| 10 | ADT Graf | ⏳ |
| 11 | Sorting | ⏳ |

> ✅ Materi sudah tersedia  
> ⏳ Materi akan ditambahkan

---

## 🗂️ Struktur Repository

```text
Algoritam-Struktur-Data-TI-F/
│
├── ADT Array/
│   ├── Percobaan1.java
│   ├── Percobaan2.java
│   ├── Percobaan3.java
│   ├── Percobaan4.java
│   ├── Percobaan5.java
│   └── Matrik.java
│
├── ADT Single Linked List/
│   └── ...
│
└── README.md
```

Struktur repository akan terus bertambah mengikuti materi praktikum setiap pertemuan.

---

## 01 — Algoritma

Materi awal membahas dasar penyelesaian masalah dalam pemrograman sebelum masuk ke implementasi struktur data.

Pokok bahasan:

- Algoritma pemrograman
- Flowchart
- Pseudocode
- Input, proses, dan output
- Percabangan
- Perulangan

---

## 02 — ADT Array

Array digunakan untuk menyimpan sekumpulan data dengan tipe yang sama dan mengaksesnya menggunakan indeks.

Materi yang dipelajari meliputi:

- Array satu dimensi
- Deklarasi dan inisialisasi array
- Akses elemen menggunakan indeks
- Traversal array
- Sorting array
- Penyisipan data
- Perbandingan array
- Array dua dimensi
- Baris dan kolom pada array

📂 **[Buka materi ADT Array](./ADT%20Array)**

---

## 03 — ADT Single Linked List

Single Linked List merupakan struktur data yang terdiri dari kumpulan **node** yang saling terhubung dalam satu arah.

Setiap node pada dasarnya memiliki:

```text
┌────────┬────────┐
│  Data  │  Next  │
└────────┴────────┘
              │
              ▼
        Node berikutnya
```

Materi yang dipelajari meliputi:

- Node
- Pointer `next`
- `head`
- `tail`
- `size`
- Pengecekan linked list kosong
- Penambahan node di awal
- Penambahan node di akhir
- Traversal Single Linked List
- Operasi dasar Single Linked List

📂 **[Buka materi ADT Single Linked List](./ADT%20Single%20Linked%20List)**

---

## 04 — ADT Double Linked List

Materi membahas linked list yang memiliki hubungan dua arah melalui pointer menuju node sebelumnya dan node berikutnya.

```text
NULL ← [prev | data | next] ⇄ [prev | data | next] → NULL
```

---

## 05 — ADT Circular Linked List

Materi membahas linked list di mana node terakhir kembali terhubung dengan node pertama.

```text
head → Node → Node → Node
  ↑                   │
  └───────────────────┘
```

---

## 06 — ADT Stack

Stack menggunakan konsep **LIFO (Last In, First Out)**.

Operasi utama:

- `push`
- `pop`
- `peek`
- `isEmpty`

---

## 07 — ADT Queue

Queue menggunakan konsep **FIFO (First In, First Out)**.

Operasi utama:

- `enqueue`
- `dequeue`
- `front`
- `isEmpty`

---

## 08 — ADT Binary Tree

Binary Tree merupakan struktur data tree di mana setiap node dapat mempunyai maksimal dua child.

---

## 09 — ADT AVL Tree

AVL Tree merupakan **self-balancing Binary Search Tree** yang menjaga keseimbangan tinggi subtree.

Pokok bahasan:

- Balance factor
- Rotasi kiri
- Rotasi kanan
- Rotasi ganda
- Menjaga keseimbangan tree

---

## 10 — ADT Graf

Materi membahas representasi hubungan antar-vertex menggunakan graf.

Pokok bahasan:

- Vertex
- Edge
- Adjacency
- Representasi graf
- Traversal graf

---

## 11 — Sorting

Materi membahas proses pengurutan data menggunakan algoritma sorting.

Fokus pembelajaran:

- Mekanisme pengurutan data
- Perbandingan elemen
- Pertukaran elemen
- Analisis proses sorting

---

## 💻 Menjalankan Program

Pastikan **Java Development Kit (JDK)** sudah terpasang.

Compile program:

```bash
javac NamaFile.java
```

Jalankan program:

```bash
java NamaFile
```

Contoh:

```bash
javac Percobaan1.java
java Percobaan1
```

---

## 🛠️ Teknologi

- **Language:** Java
- **Version Control:** Git
- **Repository:** GitHub

---

## 📌 Catatan

Repository ini digunakan sebagai dokumentasi kode percobaan dan materi Praktikum Algoritma dan Struktur Data TI-F.

Implementasi pada setiap folder mengikuti materi yang dipelajari pada pertemuan terkait.

Repository akan diperbarui secara bertahap selama praktikum berlangsung.

---

## 👤 Author

**Farrel Brilliant**

GitHub: [@farlliant](https://github.com/farlliant)
