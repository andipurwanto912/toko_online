Framework - Laravel 6.*

Run Project

- git clone https://github.com/Andip114/toko_online.git
- composer install
- cp .env.example .env (ganti nama database pada file .env sesuai db kalian)
- php artisan key:generate
- php artisan migrate --seed

run menggunakan (https://localhost/toko_online)

login -> gunakan email dan password pada  tabel users (email: admin@mail.com, pass: admin)