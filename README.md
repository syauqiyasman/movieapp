# Movie App

Saya mengembangkan Simple Movie App, sebuah aplikasi yang menampilkan berbagai kategori film, seperti film yang sedang tayang (Now Playing), film terpopuler (Popular), film dengan rating tertinggi (Top Rated), dan film yang akan datang (Upcoming). Untuk meningkatkan pengalaman pengguna, saya juga menambahkan fitur pencarian, yang memungkinkan pengguna menemukan film berdasarkan kata kunci tertentu dengan cepat dan akurat.

Selain menampilkan informasi film, saya juga menyertakan fitur daftar favorit, di mana pengguna dapat menambahkan film yang mereka sukai ke dalam daftar favorit tanpa perlu melakukan login. Data favorit ini disimpan secara lokal menggunakan shared preferences, sehingga daftar tetap tersedia meskipun pengguna keluar dari aplikasi dan membukanya kembali di lain waktu.

Dalam pengembangan aplikasi ini, saya memanfaatkan beberapa packages dan third-party libraries untuk mengoptimalkan performa dan efisiensi kode, di antaranya:

- Provider: untuk mengelola state secara efisien dan memastikan data favorit serta daftar film dapat diakses oleh berbagai widget tanpa perlu meneruskan data secara manual.
- Shared Preferences: untuk menyimpan daftar film favorit secara lokal, sehingga pengguna tetap dapat mengaksesnya setelah aplikasi ditutup.
- HTTP: untuk melakukan request ke API TMDB, mengambil data film, dan menampilkannya dalam aplikasi.
- Shimmer: untuk memberikan efek loading animation, sehingga tampilan aplikasi tetap terlihat menarik dan tidak terasa kosong saat data sedang dimuat dari API.

Dengan menggabungkan teknologi ini, saya berhasil membangun aplikasi yang tidak hanya fungsional tetapi juga memberikan pengalaman pengguna yang lebih nyaman dan responsif.

## Lesson learned

Selama proses pengembangan aplikasi, saya memperoleh banyak pengetahuan tambahan terkait Flutter dan mobile development. Salah satu aspek yang paling menarik bagi saya adalah eksplorasi terhadap API TMDB (The Movie Database), yang menawarkan berbagai fitur untuk menampilkan informasi seputar film. Saya belajar bagaimana mengambil dan mengelola data dari API tersebut agar dapat ditampilkan secara dinamis dalam aplikasi.

Salah satu konsep terpenting yang saya pelajari adalah state management, yang saya implementasikan menggunakan Provider. Dalam proyek ini, saya membuat fitur favorit, di mana pengguna dapat menambahkan film ke daftar favorit mereka tanpa harus melakukan login terlebih dahulu. Untuk menyimpan data favorit ini, saya menggunakan state management dengan Provider, sehingga data tersebut dapat diakses oleh berbagai widget dalam aplikasi tanpa perlu meneruskan data secara manual.

Selain itu, saya juga menerapkan penyimpanan lokal agar pengalaman pengguna lebih optimal. Saya menyimpan data film favorit menggunakan shared preferences, sehingga meskipun pengguna keluar dari aplikasi dan membukanya kembali, daftar film favorit mereka tetap tersimpan seperti semula. Hal ini memberikan pengalaman yang lebih nyaman bagi pengguna.

Melalui proyek ini, saya semakin memahami pentingnya pengelolaan data yang efisien, baik melalui state management maupun penyimpanan lokal.

