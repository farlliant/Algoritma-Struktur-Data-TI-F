# Tugas Praktikum — ADT Circular Linked List

Tugas ini merupakan bagian dari materi **ADT Circular Linked List**.

---

## Deskripsi Tugas

Gunakan program pada bagian **Latihan** sebagai dasar pengerjaan.

Terdapat dua implementasi Circular Linked List:

```text
CircularSingleLinkedList
CircularDoubleLinkedList
```

---

# Tugas 1 — Tanpa Variabel `jumlah`

Modifikasi program Latihan:

```text
CircularSingleLinkedList
CircularDoubleLinkedList
```

sehingga seluruh operasi dapat berjalan **tanpa menggunakan variabel**:

```java
jumlah
```

Pada implementasi awal, variabel:

```text
jumlah
```

digunakan untuk membantu:

```text
- mengetahui jumlah data
- menentukan kondisi berhenti traversal
- membatasi proses pencarian
- membantu proses pencetakan
```

Pada tugas ini, operasi tersebut harus tetap dapat berjalan tanpa bergantung pada variabel `jumlah`.

---

## Konsep yang Perlu Diperhatikan

Circular Linked List tidak memiliki node terakhir yang menunjuk:

```text
null
```

Node terakhir kembali menunjuk:

```text
pAwal
```

Karena itu, tanpa menggunakan `jumlah`, proses traversal membutuhkan kondisi berhenti berdasarkan hubungan pointer.

Contoh:

```text
mulai dari pAwal
        |
        v
bergerak ke node berikutnya
        |
        v
berhenti ketika kembali ke pAwal
```

---

# Tugas 2 — Tanpa Pointer `pAkhir`

Modifikasi program Latihan:

```text
CircularSingleLinkedList
CircularDoubleLinkedList
```

sehingga seluruh operasi dapat berjalan tanpa menggunakan pointer:

```java
pAkhir
```

Program hanya boleh mengandalkan pointer awal dan hubungan antar-node untuk menentukan posisi node akhir.

---

## Konsep yang Perlu Diperhatikan

Pada implementasi awal:

```text
pAwal
pAkhir
```

digunakan untuk mempermudah akses ke kedua ujung list.

Jika:

```text
pAkhir
```

dihilangkan, node akhir harus ditemukan melalui traversal.

Circular Single Linked List:

```text
node akhir
    |
    +--> setelah == pAwal
```

Circular Double Linked List memiliki hubungan dua arah, sehingga informasi:

```text
sebelum
setelah
```

dapat dimanfaatkan dalam proses pencarian dan perubahan hubungan antar-node.

---

# Struktur Pengerjaan

Pengerjaan tugas dapat dibuat menjadi dua versi:

```text
Tugas-Praktikum/
├── Tanpa-Jumlah/
│   ├── CircularSingleLinkedList.java
│   └── CircularDoubleLinkedList.java
│
└── Tanpa-PAkhir/
    ├── CircularSingleLinkedList.java
    └── CircularDoubleLinkedList.java
```

Struktur tersebut hanya merupakan saran organisasi file agar kedua requirement tugas tidak tercampur.

---

# Target

Program hasil modifikasi harus tetap mempertahankan karakteristik:

```text
Circular Single Linked List
Circular Double Linked List
```

dan operasi yang sebelumnya terdapat pada program Latihan harus tetap dapat digunakan.

---

# Penyelesaian

Penyelesaian tugas belum disertakan.

Folder ini untuk sementara hanya mendokumentasikan requirement Tugas Praktikum Modul 6.