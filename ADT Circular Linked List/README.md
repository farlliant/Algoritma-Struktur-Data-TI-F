# 05 — ADT Circular Linked List

Materi ini membahas **Circular Linked List**, yaitu varian Linked List di mana node terakhir kembali terhubung dengan node awal.

Terdapat dua jenis:

```text
Circular Single Linked List
Circular Double Linked List
```

---

# Circular Single Linked List

Pada Circular Single Linked List, setiap node memiliki:

```text
data
setelah
```

Node terakhir tidak menunjuk:

```text
null
```

melainkan kembali ke:

```text
pAwal
```

Visualisasi:

```text
      +---------------------------+
      |                           |
      v                           |
[A] -> [B] -> [C] -> [D] --------+
 ↑                       ↑
pAwal                  pAkhir
```

Jika hanya ada satu node:

```text
pAwal
  ↓
 [A]
  ↑
pAkhir
```

dan:

```text
A.setelah = A
```

---

# ADT Circular Single Linked List

Struktur yang digunakan pada modul:

```text
NodeCSLL
├── Object data
└── NodeCSLL setelah
```

Sedangkan list menggunakan:

```text
pAwal
pAkhir
jumlah
```

Operasi yang diperkenalkan:

```text
SisipDataDiAwal()
SisipDataDiAkhir()
hapusData()
hapusSatuDataDiAwal()
hapusSatuDataDiAkhir()
cetak()
```

---

# Circular Double Linked List

Pada Circular Double Linked List, setiap node memiliki:

```text
data
sebelum
setelah
```

Tidak hanya node akhir yang kembali menuju node awal, tetapi node awal juga mempunyai pointer ke node akhir.

```text
        +--------------------------+
        |                          |
        v                          |
[A] <-> [B] <-> [C] <-> [D]
 ^                          |
 |                          |
 +--------------------------+
```

Hubungan circular:

```text
pAkhir.setelah = pAwal
pAwal.sebelum = pAkhir
```

---

# ADT Circular Double Linked List

Node:

```text
NodeCDLL
├── Object data
├── NodeCDLL sebelum
└── NodeCDLL setelah
```

List:

```text
pAwal
pAkhir
jumlah
```

Operasi utama:

```text
SisipDataDiAwal()
SisipDataDiAkhir()
hapusData()
cetak()
```

---

# Percobaan

## Percobaan 1 — Circular Single Linked List

Folder:

👉 [Percobaan-1-Circular-Single-Linked-List](./Percobaan-1-Circular-Single-Linked-List)

Percobaan pertama mempelajari:

```text
NodeCSLL
pAwal
pAkhir
jumlah
SisipDataDiAwal()
hapusData()
cetak()
```

Beberapa method pada modul masih berupa skeleton dan akan dilengkapi pada bagian Latihan.

---

## Percobaan 2 — Circular Double Linked List

Folder:

👉 [Percobaan-2-Circular-Double-Linked-List](./Percobaan-2-Circular-Double-Linked-List)

Percobaan kedua memperkenalkan:

```text
NodeCDLL
sebelum
setelah
pAwal
pAkhir
jumlah
```

Pada node baru:

```text
sebelum -> dirinya sendiri
setelah -> dirinya sendiri
```

Kemudian ketika list memiliki banyak node, kedua pointer digunakan untuk mempertahankan hubungan circular dua arah.

---

# Latihan

Folder:

👉 [Latihan](./Latihan)

Latihan meminta melengkapi method yang pada kode modul masih diberi komentar:

```text
// lengkapi bagian ini
```

Circular Single Linked List:

```text
SisipDataDiAkhir()
hapusSatuDataDiAwal()
hapusSatuDataDiAkhir()
```

Circular Double Linked List:

```text
SisipDataDiAkhir()
hapusData()
```

Selain itu, method tersebut dijalankan melalui `main()` untuk memeriksa hasil implementasi.

---

# Tugas Praktikum

Soal tugas tersedia pada:

👉 [Tugas Praktikum](./Tugas-Praktikum)

Penyelesaian tugas belum disertakan.

---

# Ringkasan

```text
Circular Linked List
        |
        +--> Circular Single Linked List
        |       |
        |       +--> data
        |       +--> setelah
        |       +--> pAwal
        |       +--> pAkhir
        |
        +--> Circular Double Linked List
                |
                +--> data
                +--> sebelum
                +--> setelah
                +--> pAwal
                +--> pAkhir
```

Perbedaan utama dengan Linked List biasa adalah tidak adanya pointer akhir yang menunjuk ke `null`.

Sebaliknya, hubungan node dibuat:

```text
circular
```

sehingga traversal harus memiliki kondisi berhenti yang jelas agar tidak berjalan tanpa akhir.