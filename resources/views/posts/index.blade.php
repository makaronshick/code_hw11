@extends('layout')

@section('title', 'Посты')

@section('body')

    <a href="../index.php">Back to menu</a>

    <h2><a href="form.php">Add</a></h2>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Title</th>
            <th scope="col">Slug</th>
            <th scope="col">Body</th>
            <th scope="col">Category</th>
            <th scope="col">Tags</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        @foreach($posts as $post)
            <tr>
                <th scope="row">{{ $post->id }}</th>
                <td>{{ $post->title }}</td>
                <td>{{ $post->slug }}</td>
                <td>{{ $post->body }}</td>
                <td>{{ $post->category->title }}</td>
                <td>@foreach($post->tags as $tag)
                        {{ $tag->title }} <br>
                    @endforeach
                </td>
                <td>
                    <a href="form.php?id={{ $post->id }}">Edit</a> |
                    <a href="delete.php?id={{ $post->id }}">Delete</a>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
@endsection