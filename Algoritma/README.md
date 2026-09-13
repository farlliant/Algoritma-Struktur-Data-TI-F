# 01 — Algoritma

Materi ini merupakan pengantar logika pemrograman sebelum masuk ke implementasi struktur data menggunakan bahasa pemrograman.

Pada materi ini, penyelesaian masalah direpresentasikan menggunakan tiga bentuk utama:

1. Algoritma Pemrograman
2. Flowchart
3. Pseudocode

---

## Tujuan Pembelajaran

Setelah mempelajari materi ini, mahasiswa diharapkan mampu:

- Mengetahui dan membuat algoritma serta memahami langkah-langkah penyusunan algoritma.
- Mengetahui simbol-simbol flowchart dan menggunakannya untuk menyelesaikan permasalahan pemrograman.
- Mengetahui bagian-bagian pseudocode dan menggunakannya untuk merepresentasikan penyelesaian masalah pemrograman.

---

# Dasar Teori

## 1. Logika Pemrograman

Logika pemrograman merupakan cara berpikir terstruktur yang digunakan untuk menyelesaikan suatu permasalahan sebelum solusi tersebut diimplementasikan ke dalam program.

Satu permasalahan dapat memiliki lebih dari satu cara penyelesaian.

Pemilihan metode yang baik bergantung pada tujuan program, kemampuan analisis, dan pengalaman dalam menyelesaikan permasalahan.

Secara sederhana:

```text
Permasalahan
     ↓
Analisis
     ↓
Langkah Penyelesaian
     ↓
Algoritma / Flowchart / Pseudocode
     ↓
Implementasi Program
```

---

## 2. Algoritma

Algoritma merupakan serangkaian langkah yang terstruktur dan ditulis secara sistematis untuk menyelesaikan suatu masalah.

Sebelum membuat algoritma, kita perlu:

```text
Memahami masalah
        ↓
Menentukan tujuan
        ↓
Menentukan langkah penyelesaian
        ↓
Menyusun langkah secara sistematis
```

---

## 3. Algoritma Pemrograman

Algoritma pemrograman adalah algoritma yang digunakan untuk menyelesaikan permasalahan dalam pembuatan program.

Algoritma pemrograman yang baik harus:

- jelas,
- terstruktur,
- mudah dipahami,
- mudah diimplementasikan ke dalam bahasa pemrograman.

Secara umum alurnya adalah:

```text
Input / Nilai Awal
        ↓
      Proses
        ↓
      Output
        ↓
 Proses Berikutnya
        ↓
      Selesai
```

---

# Flowchart

## 4. Diagram Alir

Flowchart merupakan representasi alur penyelesaian masalah menggunakan simbol atau bagan yang saling berhubungan.

Flowchart digunakan agar urutan proses suatu program dapat dilihat secara visual.

---

## 5. Program Flowchart

Program flowchart digunakan untuk menggambarkan penyelesaian permasalahan dalam pembuatan program.

Beberapa simbol yang digunakan:

| Simbol | Fungsi |
|---|---|
| Process | Menunjukkan proses, perhitungan, atau perubahan nilai variabel |
| Input / Output | Menunjukkan proses menerima input atau menghasilkan output |
| Preparation | Menunjukkan persiapan atau pemberian nilai awal |
| Decision | Menunjukkan keputusan atau percabangan |
| Terminal | Menunjukkan awal dan akhir flowchart |
| Connector | Menghubungkan bagian flowchart dalam satu halaman |
| Off-page Connector | Menghubungkan flowchart pada halaman yang berbeda |
| Module | Menunjukkan prosedur, fungsi, atau subproses |
| Arrow | Menunjukkan arah jalannya proses |

---

## 6. Aturan Penyusunan Flowchart

Dalam membuat program flowchart:

1. Gunakan simbol sesuai dengan fungsi masing-masing.
2. Susun proses secara singkat tetapi tetap mudah dipahami.
3. Hindari langkah yang tidak diperlukan atau terlalu berbelit.
4. Gunakan connector jika alur tidak dapat digambarkan secara sederhana.
5. Gunakan mekanisme pengulangan untuk proses yang berulang.
6. Gunakan module apabila terdapat prosedur atau proses yang sering digunakan.
7. Susun flowchart dari atas ke bawah dan dari kiri ke kanan.
8. Gunakan panah untuk menunjukkan hubungan antara proses.
9. Flowchart dimulai dengan `Mulai` dan diakhiri dengan `Selesai`.

---

# Pseudocode

## 7. Pengertian Pseudocode

Pseudocode merupakan urutan langkah penyelesaian masalah yang ditulis secara sistematis dengan bentuk yang mendekati instruksi dalam bahasa pemrograman.

Pseudocode tidak memiliki aturan sintaks yang benar-benar baku.

Tujuan utamanya adalah agar logika penyelesaian masalah mudah dibaca dan dipahami sebelum diimplementasikan menjadi program.

---

## 8. Struktur Pseudocode

Secara umum pseudocode terdiri dari tiga bagian.

### Kepala Pseudocode

Berisi:

- nama pseudocode,
- penjelasan atau spesifikasi,
- informasi tambahan jika diperlukan.

Contoh:

```text
Pseudocode MenghitungLuasSegiempat
```

### Deklarasi

Berisi nama-nama yang digunakan seperti:

- variabel,
- konstanta,
- tipe data,
- prosedur,
- fungsi.

Contoh:

```text
Panjang, Lebar, Luas
```

### Deskripsi

Bagian utama yang menjelaskan langkah-langkah penyelesaian masalah.

Bagian ini dapat berisi:

- input,
- output,
- proses,
- keputusan,
- perulangan.

---

# Percobaan

## Percobaan 1 — Algoritma Pertukaran Nilai Variabel

Percobaan pertama membahas proses menukar nilai dua variabel menggunakan variabel sementara.

📄 [Buka Algoritma Pertukaran Variabel](./01-Algoritma-Pertukaran-Variabel.md)

---

## Percobaan 2 — Flowchart Luas Persegi Panjang

Percobaan kedua menggunakan flowchart untuk menerima nilai panjang dan lebar, menghitung luas, kemudian menampilkan hasilnya.

📄 [Buka Flowchart Luas Persegi Panjang](./02-Flowchart-Luas-Persegi-Panjang.md)

---

## Percobaan 3 — Pseudocode Menghitung Luas Segiempat

Percobaan ketiga menunjukkan struktur pseudocode yang terdiri dari kepala pseudocode, deklarasi, dan deskripsi.

📄 [Buka Pseudocode Luas Persegi Panjang](./03-Pseudocode-Luas-Persegi-Panjang.md)

---

# Latihan

Pada modul terdapat latihan membuat **Algoritma Pemrograman, Flowchart, dan Pseudocode** untuk:

### A. Menghitung luas bidang datar

Mahasiswa menyusun langkah penyelesaian untuk menghitung luas suatu bidang datar.

### B. Perhitungan aritmetika dua bilangan

Mahasiswa menyusun algoritma, flowchart, dan pseudocode untuk melakukan operasi aritmetika terhadap dua buah bilangan.

---

# Tugas

Tugas pada materi Algoritma meliputi:

1. Membuat algoritma pemrograman untuk mencari 5 bilangan kuadrat pertama.
2. Membuat algoritma pemrograman untuk menghitung jumlah 10 bilangan ganjil pertama.
3. Membuat pseudocode untuk menukar nilai dua variabel.
4. Membuat flowchart untuk menjumlahkan 5 bilangan pertama.
5. Membuat pseudocode untuk menjumlahkan 5 bilangan kuadrat pertama.
6. Membuat flowchart untuk menghitung pangkat tiga dari sebuah bilangan.

> Bagian tugas hanya dicantumkan sebagai referensi materi. Jawaban tugas tidak disediakan pada repository ini.

---

# Struktur Folder

```text
Algoritma/
├── README.md
├── Algoritma-Pertukaran-Variabel.md
├── Flowchart-Luas-Persegi-Panjang.md
└── Pseudocode-Luas-Segiempat.md
```

---

# Ringkasan

Tiga bentuk representasi utama pada materi ini adalah:

```text
Algoritma
    ↓
Menjelaskan langkah penyelesaian secara sistematis

Flowchart
    ↓
Menggambarkan langkah penyelesaian secara visual

Pseudocode
    ↓
Menuliskan langkah penyelesaian dengan bentuk
yang mendekati bahasa pemrograman
```

Ketiganya digunakan untuk membantu menyusun logika program sebelum masuk ke tahap implementasi menggunakan bahasa pemrograman.


