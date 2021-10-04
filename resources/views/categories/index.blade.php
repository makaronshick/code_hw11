@extends('layout')

@section('title', 'Категории')

@section('body')

    <a href="../index.php">Back  to menu</a>

    <h2><a href="form.php">Add</a></h2>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Title</th>
            <th scope="col">Slug</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        @foreach($categories as $category)
        <tr>
            <th scope="row">{{ $category->id }}</th>
            <td>{{ $category->title }}</td>
            <td>{{ $category->slug }}</td>
            <td>
                <a href="form.php?id={{ $category->id }}">Edit</a> |
                <a href="delete.php?id={{ $category->id }}">Delete</a>
            </td>
        </tr>
        @endforeach
        </tbody>
    </table>
@endsection