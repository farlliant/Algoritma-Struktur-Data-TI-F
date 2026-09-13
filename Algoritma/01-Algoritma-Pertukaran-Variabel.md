# Percobaan 1 — Algoritma Pertukaran Nilai Dua Variabel

Percobaan ini menunjukkan algoritma untuk menukar isi dua buah variabel dengan bantuan sebuah variabel sementara.

---

## Permasalahan

Misalkan terdapat dua variabel:

```text
A = 5
B = 10
```

Nilai keduanya ingin ditukar sehingga menjadi:

```text
A = 10
B = 5
```

Jika nilai `B` langsung dimasukkan ke `A`, nilai awal `A` akan hilang.

Oleh karena itu diperlukan variabel sementara.

---

## Algoritma

1. Tentukan isi variabel pertama.
2. Tentukan isi variabel kedua.
3. Buat variabel ketiga untuk menampung nilai sementara.
4. Masukkan isi variabel pertama ke variabel ketiga.
5. Masukkan isi variabel kedua ke variabel pertama.
6. Masukkan isi variabel ketiga ke variabel kedua.
7. Tampilkan kembali isi variabel pertama dan kedua.

---

## Proses

Kondisi awal:

```text
A = 5
B = 10
```

### Langkah 1

Simpan nilai `A`:

```text
temp = A
```

Keadaan:

```text
A    = 5
B    = 10
temp = 5
```

### Langkah 2

Masukkan nilai `B` ke `A`:

```text
A = B
```

Keadaan:

```text
A    = 10
B    = 10
temp = 5
```

### Langkah 3

Masukkan nilai `temp` ke `B`:

```text
B = temp
```

Keadaan akhir:

```text
A = 10
B = 5
```

---

## Visualisasi

```text
A = 5, B = 10
      |
      v
temp = A
      |
      v
A = B
      |
      v
B = temp
      |
      v
A = 10, B = 5
```

---

## Analisis

Variabel `temp` digunakan untuk menyimpan nilai awal dari `A` sebelum nilai tersebut ditimpa oleh nilai `B`.

Tanpa variabel sementara, nilai awal `A` akan hilang sebelum dapat dipindahkan ke `B`.

---

## Kesimpulan

Pertukaran dua nilai menunjukkan pentingnya urutan proses dalam sebuah algoritma.

Algoritma yang benar tidak hanya menghasilkan hasil akhir yang benar, tetapi juga memastikan setiap nilai yang masih diperlukan tetap tersedia selama proses berlangsung.
