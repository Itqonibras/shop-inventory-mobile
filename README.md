# Tugas 7

## Perbedaan Stateless dan Stateful Widget Flutter

Stateless widget adalah widget flutter yang tidak memiliki keadaan (state). Stateless digunakan
untuk menampilkan widget yang statis atau tidak perlu adanya perubahan nilai. Contoh kita ingin
menampilkan text "Hello World" menggunakan widget Text. Kita tidak perlu memperbarui nilai teks
tersebut karena teks tersebut tidak berubah. Stateful widget adalah widget yang memiliki state atau
yang dapat terjadi perubahan nilai. Contoh stateful widget adalah radio button yang dapat berubah
ketika nilai true atau false.

## Widget yang Saya Gunakan

- MaterialApp: Widget ini digunakan sebagai bungkus untuk beberapa widget yang menggunakan tema
  material design.
- Scaffold: Widget ini digunakan untuk membuat struktur dasar material design.
- AppBar: Widget ini digunakan untuk membuat AppBar.
- Padding: Widget ini digunakan untuk menambahkan padding pada widget lainnya.
- Column: Widget ini digunakan untuk menampilkan widget secara vertikal.
- Row: Widget ini digunakan untuk menampilkan widget secara horizontal.
- Icon: Widget ini digunakan untuk menampilkan ikon.
- ElevatedButton: Widget ini digunakan untuk membuat tombol dengan efek naik ketika ditekan.
- SnackBar: Widget ini digunakan untuk menampilkan pesan singkat yang muncul di bagian bawah layar.
- Inkwell: Widget ini digunakan untuk membuat area yang dapat di-tap.
- Card: Widget ini digunakan untuk membuat kartu.
- ListTile: Widget ini digunakan untuk membuat item dalam daftar.
- Text: Widget ini digunakan untuk menampilkan teks.

## Langkah2 Pembuatan

Yang pertama kali saya lakukan adalah membuat project flutter baru di Android Studio dengan nama
proyek shop_inventory_mobile. Langkah selanjutnya saya membuat fungsi main yang menjalankan fungsi
runApp(MyApp()). MyApp adalah stateless widget yang saya buat yang mereturn MaterialApp. Pada
MaterialApp saya mengisi atribut2 yang diperlukan seperti title, theme, debugshowcheckedmodebanner,
initialRoute, dan route. Selanjutnya saya membuat file dart baru bernama type_theme.dart yang
berisikan type scale yang saya dapatkan dari type scale generator Material2. type_theme.dart
memerlukan dependencies google_fonts, tentunya sudah saya tambahkan dengan melakukan
perintah `flutter pub add google_fonts`. Lalu saya menambahkan type theme saya kedalam theme
MaterialApp agar tampilan font pada aplikasi berubah sesuai type theme saya. Pada initial route,
saya set menjadi HomeScreen. HomeScreen adalah stateless widget yang mereturn Scaffold. Didalam
Scaffold, saya menambahkan appBar dengan nama aplikasi dan juga saya membuat tiga tombol, yaitu Add
Item, List Item, dan Logout. Tombol Logout menggunakan widget yang bernama ElevatedButton, sedangkan
dua tombol lainnya menggunakan widget CustomCard. CustomCard merupakan custom widget yang saya buat
yang terdiri dari berbagai widget seperti InkWell, Card, ListTile, dan masih banyak lagi. Ketiga
tombol tadi ketika ditekan akan menampilkan snackbar. Terakhir saya melakukan git add commit push.