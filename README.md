# dusk
dusk-network
@@ -1,2 +1,106 @@
#  senja-testnet
Tutorial testnet DUSK Insentif
#  Tutorial testnet DUSK Diberi insentif

<p style="font-size:14px" align="right">
<a href="https://t.me/bangpateng_airdrop" target="_blank">Gabung Telegram Bang Pateng<img src="https://user-images.githubusercontent.com/50621007/183283867-56b4d69f-bc6e- 4939-b00a-72aa019d1aea.png" width="30"/></a>
</p>

<p align="pusat">
  <img height="auto" width="auto" src="https://user-images.githubusercontent.com/38981255/202432156-50a53f84-3d5d-40da-950c-0d9e62c2e4b4.jpg">
</p>

##  Referensi

[ Dokumen resmi ](https://dusk.network/pages/incentivized-testnet#Wallet)

[ Minta Faucet ](https://docs.google.com/forms/d/e/1FAIpQLScxABRnszbBEaTZAIg2TwfJVIq0kRggy8QK2MRBTO7vuyP_Ug/viewform)

[ Server perselisihan ](https://discord.gg/dusknetwork)

##  Spesifikasi

###  Persyaratan perangkat keras

| Komponen | Spesifikasi minim |
|---------|------------------------|
|CPU|Intel Core 2|
|RAM|RAMDDR4 1GB|
|Penyimpanan|HDD 20 GB|

###  Persyaratan perangkat lunak

| Komponen | Spesifikasi minim |
|---------|------------------------|
|Sistem Operasi|Ubuntu 20.04|

| Komponen | Spesifikasi rekomendasi |
|---------|------------------------|
|Sistem Operasi|Ubuntu 20.04 atau lebih tinggi|

##  1. Instal CLI

<p align="pusat">
  <img height="auto" width="auto" src="https://user-images.githubusercontent.com/38981255/202432162-68e7828e-e917-4636-83a4-5c7969356313.png">
</p>

```
sudo apt-get pembaruan
```
```
wget -q https://github.com/dusk-network/wallet-cli/releases/download/v0.12.0/ruskwallet0.12.0-linux-x64.tar.gz
```
```
tar -xf ruskwallet0.12.0-linux-x64.tar.gz
```
```
rm -rf ruskwallet0.12.0-linux-x64.tar.gz
```
```
cd rusk-wallet0.12.0-linux-x64
```
```
./rusk-wallet
```

##  2. Buat Dompet

- Lalu Jika Muncul Tulisan `Create New Wallet` Klik Enter
- Masukkan Kata Sandi Bebas
- Masukkan Kata Sandi Lagi
- Copy dan Simpan Pharse Kalian
- Lalu Pilih `y` dan `Enter`
- Lalu Enter Lagi Alamat Nanti Muncul kalian Copy dan Simpan Juga

<p align="pusat">
  <img height="auto" width="auto" src="https://user-images.githubusercontent.com/38981255/202432143-2ca75493-230f-441a-9389-7165b80019f0.jpg">
</p>

- Gunakan Arah Bawah Pada Keyboard Pc kalian
- Arahkan ke `Export Provisioner Key-Pair` dan `Enter`
- Lalu Isi Dengan Perintah di Bawah Ini, Tergantung Penempatan Direktori anda Sendiri Kalo saya di Sini

```
/root/.dusk/rusk-wallet/
```
- Lalu `Enter` Anda Akan Melihat Gambar di Bawah Ini dan Jangan Lupa di Backup Juga Yang Ane Garis Kuning ngin

<p align="pusat">
  <img height="auto" width="auto" src="https://user-images.githubusercontent.com/38981255/202432152-3e5578a6-9b21-4cd2-adab-8b132fd111d4.PNG">
</p>

**Noted :** Seharusnya ada dua file sekarang, file .key dan file .cpk . Jaga kerahasiaan file .key , jangan bagikan dengan siapa pun. Kami akan membutuhkan file ini nanti untuk node kami. Anggap saja seperti kunci konteks Anda, yang Anda gunakan untuk memancing transaksi.

.cpk adalah kunci publik. Kami membutuhkan yang ini untuk memberi Anda akses ke testnet.


- Balik ke VPS Arah Bawah Pilih `Back` dan `Enter`
- Arah Bawah Lagi Pilih `Exit` dan `Enter`

##  3. Keran Minta

- Faucet Formulir Isi : https://docs.google.com/forms/d/e/1FAIpQLScxABRnszbBEaTZAIg2TwfJVIq0kRggy8QK2MRBTO7vuyP_Ug/viewform
- Paste Alamat Senja kalian
- Upload File.cpk kalian
- Alamat Hadiah, Isi Alamat ETH Metamask (Ini Untuk Menerima Reward Hadiah Testnet nya Nanti)
- Kirim Formulir
