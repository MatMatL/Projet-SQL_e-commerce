<?php

require 'vendor/autoload.php';
$faker = Faker\Factory::create('fr_FR'); // Génère des données en français

// Connexion à la base de données
$pdo = new PDO('mysql:host=localhost;dbname=e-commerce', 'root', '');

// Fonction pour insérer des utilisateurs
function insertUsers($pdo, $faker, $count = 10) {
    $stmt = $pdo->prepare("INSERT INTO users (email, password_hash, first_name, last_name, phone_number, created_at) VALUES (?, ?, ?, ?, ?, ?)");
    for ($i = 0; $i < $count; $i++) {
        $stmt->execute([
            $faker->unique()->email,
            password_hash($faker->password, PASSWORD_BCRYPT),
            $faker->firstName,
            $faker->lastName,
            $faker->unique()->phoneNumber,
            $faker->dateTimeThisYear()->format('Y-m-d H:i:s')
        ]);
    }
}

// Fonction pour insérer des adresses
function insertAddresses($pdo, $faker, $count = 10) {
    $stmt = $pdo->prepare("INSERT INTO address (user_id, address, city, postal_code, country) VALUES (?, ?, ?, ?, ?)");
    for ($i = 1; $i <= $count; $i++) {
        $stmt->execute([
            $i,
            $faker->streetAddress,
            $faker->city,
            $faker->postcode,
            $faker->country
        ]);
    }
}

// Fonction pour insérer des produits 
function insertProducts($pdo, $faker, $count = 20) {
    $stmt = $pdo->prepare("INSERT INTO product (name, description, price, stock_quantity) VALUES (?, ?, ?, ?)");
    for ($i = 0; $i < $count; $i++) {
        $stmt->execute([
            $faker->unique()->word,
            $faker->sentence,
            $faker->randomFloat(2, 5, 100), 
            $faker->numberBetween(0, 100)
        ]);
    }
}

// Fonction pour insérer des paniers
function insertCarts($pdo, $count = 10) {
    $stmt = $pdo->prepare("INSERT INTO cart (user_id, created_at) VALUES (?, ?)");
    for ($i = 1; $i <= $count; $i++) {
        $stmt->execute([
            $i,
            (new DateTime())->format('Y-m-d H:i:s')
        ]);
    }
}

// Fonction pour insérer des articles dans le panier
function insertCartItems($pdo, $faker, $count = 10) {
    $stmt = $pdo->prepare("INSERT INTO cart_item (cart_id, product_id, quantity) VALUES (?, ?, ?)");
    for ($i = 1; $i <= $count; $i++) {
        $stmt->execute([
            $faker->numberBetween(1, 10),
            $faker->numberBetween(1, 50),
            $faker->numberBetween(1, 5)
        ]);
    }
}

// Fonction pour insérer des informations de paiement
function insertPayments($pdo, $faker, $count = 10) {
    $stmt = $pdo->prepare("INSERT INTO payment (user_id, iban, first_name, last_name) VALUES (?, ?, ?, ?)");
    for ($i = 1; $i <= $count; $i++) {
        $stmt->execute([
            $i,
            $faker->iban('FR'),
            $faker->firstName,
            $faker->lastName
        ]);
    }
}

// Fonction pour insérer des factures
function insertInvoices($pdo, $faker, $count = 10) {
    $stmt = $pdo->prepare("INSERT INTO invoice (cart_id, total) VALUES (?, ?)");
    for ($i = 1; $i <= $count; $i++) {
        $stmt->execute([
            $i,
            $faker->randomFloat(2, 10, 500)
        ]);
    }
}

// Exécution des fonctions
insertProducts($pdo, $faker);
insertCarts($pdo);
insertCartItems($pdo);
insertPayments($pdo, $faker);
insertInvoices($pdo, $faker);

echo "Base de données remplie avec succès!";
