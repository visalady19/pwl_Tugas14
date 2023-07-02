<?php

namespace App\Controllers;

use App\Models\ProdukModel;

class Pages extends BaseController
{
    public function keranjang()
    {
        return view('Pages/keranjang');
    }

    public function produk()
    {
        $produkModel = new ProdukModel();
        $produk = $produkModel->findAll();
        $data['produks'] = $produk;

        return view('Pages/produk', $data);
    }
}
