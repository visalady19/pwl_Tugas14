<?php

namespace App\Controllers;

use App\Models\userModel;

class AuthController extends BaseController
{
    protected $user;

    function __construct()
    {
        helper('form');
        $this->user = new userModel();
    }

    public function login()
    {
        if ($this->request->getPost()) {
            $username = $this->request->getVar('username');
            $password = $this->request->getVar('password');
    
            $dataUser = $this->user->where(['username' => $username])->first();
            if ($dataUser) {
                if (password_verify($password, $dataUser['password'])) {
                    if ($dataUser['is_aktif'] === 'true') { // Tambahkan kondisi untuk is_aktif
                        session()->set([
                            'username' => $dataUser['username'],
                            'role' => $dataUser['role'],
                            'isLoggedIn' => true
                        ]);
    
                        return redirect()->to(base_url('/'));
                    } else {
                        session()->setFlashdata('failed', 'Akun tidak aktif. Harap hubungi admin.');
                        return redirect()->back();
                    }
                } else {
                    session()->setFlashdata('failed', 'Username & Password Salah');
                    return redirect()->back();
                }
            } else {
                session()->setFlashdata('failed', 'Username Tidak Ditemukan');
                return redirect()->back();
            }
        } else {
            return view('Pages/login');
        }
    }
    public function logout()
    {
        session()->destroy();
        return redirect()->to('login');
    }
}
