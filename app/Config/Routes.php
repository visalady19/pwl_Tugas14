<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
// The Auto Routing (Legacy) is very dangerous. It is easy to create vulnerable apps
// where controller filters or CSRF protection are bypassed.
// If you don't want to define all routes, please use the Auto Routing (Improved).
// Set `$autoRoutesImproved` to true in `app/Config/Feature.php` and set the following to true.
// $routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
// $routes->get('/produk', 'Pages::produk');
$routes->get('/', 'Home::index', ['filter' => 'auth']);

$routes->get('/login', 'AuthController::login');
$routes->add('/login', 'AuthController::login');
$routes->get('/logout', 'AuthController::logout');
$routes->get('/register', 'RegisterController::index');
$routes->post('/register', 'RegisterController::register');

// $routes->get('/keranjang', 'Pages::keranjang', ['filter' => 'auth']);
// 
$routes->get('/users', 'UserController::index');
$routes->get('users/update/(:num)', 'UserController::update/$1');

$routes->get('/keranjang', 'TransaksiController::cart_show', ['filter' => 'auth']);
$routes->add('/keranjang', 'TransaksiController::cart_add', ['filter' => 'auth']);
$routes->add('/keranjang/edit', 'TransaksiController::cart_edit', ['filter' => 'auth']);
$routes->add('/keranjang/delete/(:any)', 'TransaksiController::cart_delete/$1', ['filter' => 'auth']);
$routes->add('/keranjang/clear', 'TransaksiController::cart_clear', ['filter' => 'auth']);
$routes->get('/keranjang/getcity', 'TransaksiController::getcity', ['filter' => 'auth']);
$routes->get('/keranjang/getcost', 'TransaksiController::getcost', ['filter' => 'auth']);
$routes->add('/keranjang/buy', 'TransaksiController::buy', ['filter' => 'auth']);
$routes->add('/keranjang/checkout', 'TransaksiController::checkout', ['filter' => 'auth']);

// $routes->get('/produk', 'Pages::produk', ['filter' => 'auth']);
// $routes->add('/produk', 'Pages::produk', ['filter' => 'auth']);
$routes->get('/produk', 'ProdukController::index');
$routes->add('/produk', 'ProdukController::create');
$routes->add('/produk/edit/(:any)', 'ProdukController::edit/$1', ['filter' => 'auth']);
$routes->get('/produk/delete/(:any)', 'ProdukController::delete/$1', ['filter' => 'auth']);

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (is_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
