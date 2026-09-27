<div align="center">
 
# 🚀 Algoritma & Struktur Data — TI-F

<p align="center">
  <img src="https://img.shields.io/badge/LANGUAGE-JAVA-F89820?style=for-the-badge&labelColor=555555" alt="Java">
  <img src="https://img.shields.io/badge/CLASS-TI--F%202026-00A6ED?style=for-the-badge&labelColor=555555" alt="TI-F 2026">
  <img src="https://img.shields.io/badge/STATUS-LEARNING-55C900?style=for-the-badge&labelColor=555555" alt="Learning">
</p>

---

## 👋 Selamat Datang!

Selamat datang di repository **Algoritma & Struktur Data TI-F** 🚀

Repository ini digunakan sebagai dokumentasi materi, percobaan, implementasi, dan live coding selama kegiatan **Praktikum Algoritma dan Struktur Data**.

Setiap materi disusun berdasarkan topik praktikum dan ditempatkan pada folder masing-masing agar mudah dipelajari, dijalankan, dan digunakan kembali sebagai referensi.

</div>

---

## ⚠️ Catatan Implementasi

Source code pada bagian **Percobaan** disusun mengikuti kode yang tercantum pada modul praktikum sedekat mungkin.

Beberapa source pada modul dapat berupa skeleton atau implementasi yang belum lengkap. Oleh karena itu, source pada bagian Percobaan dapat memiliki:

- method yang masih harus dilengkapi;
- dependency yang belum tersedia;
- implementasi yang belum menangani seluruh edge case;
- warning ketika dijalankan menggunakan versi Java yang lebih baru.

Kondisi tersebut sengaja tidak selalu diperbaiki agar source pada bagian Percobaan tetap merepresentasikan alur yang diberikan pada modul praktikum.

Apabila suatu source Percobaan gagal dikompilasi atau belum dapat dijalankan secara penuh, periksa kembali instruksi pada modul karena source tersebut dapat merupakan bagian yang memang harus dilengkapi pada **Latihan** atau **Tugas Praktikum**.

Folder **Latihan**, **Tugas Praktikum**, dan **Live Coding** dapat memuat implementasi tambahan yang dibuat untuk menyelesaikan requirement praktikum dan bukan merupakan source solution resmi yang disediakan oleh modul.

---

## ▶️ Menjalankan Repository

Repository ini terdiri dari beberapa program Java independen.

Beberapa materi menggunakan nama class yang sama seperti:

```text
Node
Main
Solution
SLL
DLL
```

Hal tersebut normal karena setiap **Percobaan**, **Latihan**,
**Tugas Praktikum**, dan **Live Coding** merupakan program yang
berdiri sendiri.

Untuk menghindari konflik antar-class ketika repository dibuka
menggunakan VS Code, repository menyediakan multi-root workspace:

```text
Algoritma-Struktur-Data-TI-F.code-workspace
```

Buka repository menggunakan:

```powershell
code ".\Algoritma-Struktur-Data-TI-F.code-workspace"
```

### Requirement

```text
JDK 17+
```

Repository tidak memerlukan Maven, Gradle, maupun dependency eksternal.

Periksa Java:

```powershell
java -version
javac -version
```

### Verifikasi Seluruh Source

Untuk memastikan seluruh source Java dapat dikompilasi:

```powershell
.\verify.ps1
```

Jika seluruh program berhasil:

```text
ALL MODULES COMPILED SUCCESSFULLY
```

Setiap folder dikompilasi secara independen sehingga nama class
yang sama pada materi lain tidak saling bertabrakan.

### Menjalankan Program

Repository menyediakan script:

```text
run.ps1
```

Contoh:

```powershell
.\run.ps1 array-latihan
```

```powershell
.\run.ps1 array-tugas1
```

```powershell
.\run.ps1 array-tugas2
```

```powershell
.\run.ps1 sll-latihan
```

```powershell
.\run.ps1 dll-latihan
```

```powershell
.\run.ps1 circular-single
```

Live Coding juga dapat dijalankan dengan:

```powershell
.\run.ps1 lc-array
```

```powershell
.\run.ps1 lc-sll
```

Program Live Coding yang menggunakan `Scanner` membutuhkan input
melalui terminal.

---
## 📚 Daftar Materi

| BAB | Topik Pembahasan | Status |
|:---:|---|:---:|
| **01** | [Algoritma](./Algoritma) | ✅ |
| **02** | [ADT Array](./ADT%20Array) | ✅ |
| **03** | [ADT Single Linked List](./ADT%20Single%20Linked%20List) | ✅ |
| **04** | [ADT Double Linked List](./ADT%20Double%20Linked%20List) | ✅ |
| **05** | [ADT Circular Linked List](./ADT%20Circular%20Linked%20List) | ✅ |
| **06** | ADT Stack | ⏳ |
| **07** | ADT Queue | ⏳ |
| **08** | ADT Binary Tree | ⏳ |
| **09** | ADT AVL Tree | ⏳ |
| **10** | ADT Graf | ⏳ |
| **11** | Sorting | ⏳ |

> ✅ Materi tersedia  
> ⏳ Materi belum ditambahkan

---

## 💻 Live Coding

Kumpulan soal dan pembahasan live coding dapat ditemukan pada folder:

👉 **[Live Coding](./Live%20Coding)**

---

## 🗂️ Struktur Repository

```text
Algoritma & Struktur Data - TI-F/
│
├── Algoritma/
│   ├── README.md
│   └── ...
│
├── ADT Array/
│   ├── README.md
│   ├── Latihan/
│   ├── Tugas-Praktikum/
│   └── ...
│
├── ADT Single Linked List/
│   ├── README.md
│   ├── Latihan/
│   ├── Tugas-Praktikum/
│   └── ...
│
├── ADT Double Linked List/
│   ├── README.md
│   ├── Latihan/
│   ├── Tugas-Praktikum/
│   └── ...
│
├── ADT Circular Linked List/
│   ├── README.md
│   ├── Percobaan-1-Circular-Single-Linked-List/
│   ├── Percobaan-2-Circular-Double-Linked-List/
│   ├── Latihan/
│   └── Tugas-Praktikum/
│
├── Live Coding/
│   └── ...
│
└── README.md
```

Setiap folder materi memiliki `README.md` masing-masing yang berisi penjelasan konsep, percobaan, latihan, tugas, atau implementasi terkait materi tersebut.

---

<div align="center">

## ⭐ Happy Coding & Keep Learning! ⭐

*"The more I learn, the more I realize how much I don't know."*

</div>