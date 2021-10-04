<?php

require_once '../../vendor/autoload.php';
require_once '../../config/eloquent.php';
require_once '../../config/blade.php';

$data = [];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if(!isset($_POST['id'])) {
        \Hillel\Models\Post::create([
            'title' => $_POST['title'],
            'slug' => $_POST['slug'],
            'body' => $_POST['body'],
            'category_id' => $_POST['category_id'],
        ]);
    } else {
        $post = \Hillel\Models\Post::find($_POST['id']);
        $post->update([
            'title' => $_POST['title'],
            'slug' => $_POST['slug'],
            'body' => $_POST['body'],
            'category_id' => $_POST['category_id'],
        ]);
    }

    header('Location: /posts');
}

if (!empty($_GET['id'])) {
    $data['post'] = \Hillel\Models\Post::find($_GET['id']);
}

/** @var $blade \Illuminate\View\Factory */
echo $blade->make('posts.form', $data)->render();
