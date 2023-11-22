# Tugas 9

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Yes, kita bisa mengambil data JSON tanpa model. namun, model membantu dalam validasi data. Jadi
tergantung kebutuhan.

## Fungsi CoookieRequest

CookieRequest berfungsi untuk menyimpan data cookies dari proyek django. CookieRequest harus dibagi
kedalam seluruh komponen, sehingga keseluruhan aplikasi flutter dapat konsisten dan bisa menjalankan
setiap fungsi aplikasi dengan baik.

## Mekanisme Pengambilan Data dari Django

Pada proyek Django saya terdapat sebuah halaman yang menampilkan data yang berupa JSON. Dengan
menggunakan URL halaman tersebut, kita bisa melakukan fetch data JSON dengan membuat model yang
sesuai dengan data dari Django, dan mengkonvert dari JSON ke class model yang dibuat tadi.

## Mekanisme Autentikasi

Dalam tugas ini, kita menggunakan CookieRequest yang dibuat oleh asods. Instance dari CookieRequest
yang telah dibuat dijadikan atribut widget. Kemudian setelah user menginput data username dan
password, program tersebut akan dieksekusi dan akan mengambil data dari Django. Django akan mengirim
data status dan sebagainya sebagai respon dari pemanggilan. Flutter proyek akan menampilkan widget
yang sesuai dengan respon yang diberikan.

## Widget yang Digunakan

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

Hal yang pertama kali saya lakukan adalah membuat app baru pada django yang bernama flutter service.
Isi dari flutter service adalah method method yang digunakan flutter agar dapat terintegrasi dengan
django app, antara lain adalah method login, create product, dan logout. Setelah membuat method2
tadi, saya beralih ke project flutter. Pada project flutter, hal yang pertama kali saya lakukan
adalah membuat halaman baru yaitu LoginScreen. LoginScreen berisikan Scaffold yang mereturn beberapa
TextField yang nantinya digunakan untuk mendapatkan informasi login. Setelah LoginScreen selesai
dibuat, kemudian saya mengubah halaman ItemList saya yang tadinya memuat data dari Provider menjadi
memuat data dari fetch django app. Terdapat 2 file baru yaitu ApiService yang digunakan untuk
melakukan method fetch json dan file ItemProvider yang digunakan untuk menyimpan hasil dari fetch
API. Setelah itu saya membuat halaman baru DetailScreen yang menerima data dari ItemCard yang ada di
ListItem. Saya juga sedikit mengubah file add_item dengan merubah onTap pada Elevated Button agar
data yang diinput dapat di POST ke server Django.Udah deh add push commit.

# Tugas 8

## Perbedaan antara Navigator.push() dan Navigator.pushReplacement() di Flutter:

- `Navigator.push()`: Metode ini digunakan untuk menambahkan rute lain ke atas tumpukan layar (
  stack) saat ini sehingga halaman baru ditampilkan di atas halaman sebelumnya. Misalnya, jika Anda
  berada di halaman A dan menerapkan `Navigator.push()` ke halaman B, maka Anda akan berpindah ke
  halaman B tetapi jika Anda menekan tombol kembali, Anda akan kembali ke halaman A.
- `Navigator.pushReplacement()`: Metode ini menghapus rute saat ini dengan menggantinya ke rute yang
  baru sehingga kita tidak dapat kembali ke halaman sebelumnya. Jadi, jika Anda berada di halaman A
  dan menerapkan `Navigator.pushReplacement()` ke halaman B, maka Anda akan berpindah ke halaman B
  tetapi jika Anda menekan tombol kembali, Anda tidak akan kembali ke halaman A, melainkan keluar
  dari aplikasi (jika tidak ada halaman lain dalam stack).

## Layout widget pada Flutter:

- `Container`: Widget ini digunakan untuk mengatur tata letak dan dekorasi widget lain.
- `Row` dan `Column`: Digunakan untuk mengatur widget secara horizontal (Row) atau vertikal (Column)
  . Misalnya, `Row` dapat digunakan untuk menampilkan serangkaian ikon dalam satu baris,
  sementara `Column` dapat digunakan untuk menampilkan teks dan gambar dalam satu kolom.
- `Center`: Widget layout untuk membuat widget ke tengah.
- `Expanded`: Widget yang memperluas child dari Row, Column, atau Flex.
- `Padding`: Widget yang memberikan padding pada childnya.
- `Stack`: Widget ini berguna jika Anda ingin menumpuk beberapa child dalam cara yang sederhana,
  misalnya untuk menumpuk text diatas container.

## Elemen input pada form di Flutter:

Elemen input yang digunakan untuk tugas ini adalah `TextFormField`. Elemen tersebut dipilih karena
memiliki sebuah parameter yang bernama validator. Parameter validator digunakan untuk memvalidasi
input text sesuai yang diminta aplikasi dan dapat menampilkan pesan error jika tidak sesuai.

## Penerapan clean architecture pada aplikasi Flutter:

Clean Architecture pada Flutter adalah arsitektur yang memisahkan kode program antara business
logic, presenter/UI, state management, eksternal datasources, dan repository. Tujuannya adalah
membuat kode menjadi lebih mudah diuji (testable) dan dapat dipelihara (maintainable). Misalnya,
sebuah proyek mungkin memiliki folder terpisah untuk model, layanan, dan tampilan, dan setiap bagian
kode Anda hanya berkomunikasi dengan bagian lain melalui interfaces, bukan langsung ke
implementasinya. Ini memungkinkan kita untuk, misalnya, mengubah database yang kita gunakan tanpa
harus mengubah kode di bagian lain dari aplikasi kita.

## Langkah2 Pembuatan

Hal yang pertama kali saya lakukan adalah membuat sebuah halaman baru yang bernama `add_item.dart`.
Pada file tersebut saya membuat sebuah stateless widget yang me-return Scaffold dan memiliki child
widget `Form`. Widget form memiliki child sebuah Column yang dimana memiliki children kumpulan
TextFormField dan ElevatedButton sebagai tombol submitnya. Saya menambahkan validator pada
TextFormField agar data yang diterima aplikasi sesuai dengan yang dibutuhkan. Ketika ElevatedButton
ditekan, maka aplikasi akan menyimpan data dari TextFormField tadi ke dalam list yang berada di
Provider. Selain halaman menambah item, saya juga membuat file `item_list.dart` yang digunakan untuk
menampilkan item2 yang terdapat di dalam Provider. Selanjutnya saya membuat sebuah drawer yang
memiliki beberapa tombol untuk mengakses halaman tambah item dan list item tadi. Saya juga mengubah
beberapa tampilan aplikasi dan juga saya menggunakan package `page_transition` untuk menambahkan
animasi transisi ketika berpindah halaman. Terakhir, saya me-refactor kode saya seperti memisahkan
class model, class provider, dan custom widget yang saya buat. Yaudah terus tinggal add commit push
git.

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