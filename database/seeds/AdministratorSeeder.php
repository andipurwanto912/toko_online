<?php

use Illuminate\Database\Seeder;

class AdministratorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $administrator = new \App\User;
        $administrator->username = "administrator";
        $administrator->name = "Site Administrator";
        $administrator->email = "admin@mail.com";
        $administrator->roles = json_encode(["ADMIN"]);
        $administrator->password = \Hash::make("admin");
        $administrator->avatar = "kosong.png";
        $administrator->phone = "0888888888";
        $administrator->address = "Lembarawa, Brebes, Jawa Tengah";

        $administrator->save();
        $this->command->info("User Admin berhasil diinsert");
    }
}
