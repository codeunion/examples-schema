# Example Database Schemas

This repository contains a handful of example database schemas.  We want this
repository to do two things:

1.  Serve as a reference for common schema design patterns
2.  Give students more exposure to schema-level SQL, e.g.,
    `CREATE TABLE`, `CREATE UNIQUE INDEX`, and so on.

## Format of This Repository

Every schema is contained in its own directory.  For example, the
[blog_with_tags](blog_with_tags) directory contains a schema for a very basic
blog with support for tagging blog posts.  In this example, the schema itself is
contained in a file named

```text
blog_with_tags.postgres.sql
```

which contains raw SQL `CREATE TABLE` statements that define the various tables,
indexes, and associations that make up the database schema.

The file is named `.postgres.sql` because the SQL statements contained inside
follow PostgreSQL's dialect of SQL.  Every database engine has its own "dialect"
of SQL, whether the engine MySQL, SQLite3, Microsoft SQL Server, or Oracle.

We'll be adding examples in other dialects as time goes on.  If you want to
help the process along, [we welcome pull requests][pull-request-url]

## Schemas in This Repository

### Blog With Tags

The [blog_with_tags](blog_with_tags) schema models a basic blog where users can
publish articles and tag them with arbitrary tags.  It defines users, articles,
and tags.

### Blog With Likes

The [blog_with_likes](blog_with_likes) schema models a basic blog where users
can publish new articles or like already-published articles.  It defines users,
articles, and likes.

### Question and Answer

The [question_and_answer](question_and_answer) schema models a basic Q&A site
a la Stack Overflow or Yahoo! Answers.  It defines users, questions, answers,
and voting.

### Surveys

The [surveys](surveys) schema models a website where users can create surveys
for other users to fill out.  It defines users, surveys, survey choices, and
survey responses.

### Reddit

The [reddit](reddit) schema models a Reddit-like site where users submit links
for other to vote and comment on.  It defines users, link submissions, voting,
and nested commenting.

### Photo Gallery

The [photo_gallery](photo_gallery) schema models a basic photo gallery.  Users
can create albums and upload photos to a specific album.

### Hangman

The [hangman](hangman) schema models a player vs. computer version of
[letter-guessing game Hangman](http://en.wikipedia.org/wiki/Hangman_%28game%29).
It defines users, games, turns, and phrases.

### Tic Tac Toe

The [tic_tac_toe](tic_tac_toe) schema models a collection of tic-tac-toe games.
It defines users, games, and turns.

[pull-request-url]: https://github.com/codeunion/examples-schema/pulls
