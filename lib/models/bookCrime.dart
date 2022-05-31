BookList booklist = BookList(books: [
  Book(
    index: 1,
    title: "Black Water Rising",
    cover:
        "https://assets-eu-01.kc-usercontent.com/bcd02f72-b50c-0179-8b4b-5e44f5340bd4/55c7e55b-4862-4da3-a6a5-c74e4751f0e8/81UNaTIZ9xL.jpg",
    age: "13+",
    author: "Attica Locke",
    authorImg:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxHuz-EHNbn2NMDDr6Em1G0y4R8o1oaDGbHw&usqp=CAU",
    franchise: true,
    chapter: 11,
    genre: "Crime | Fictional",
    language: "ENGLISH",
    rating: 4.2,
    price: 2,
    summary:
        "After saving a woman from drowning in the Houston bayou, lawyer Jay Porter finds himself entangled in a murder investigation that could cost him his practice – or even his life. But as he attempts to make sense of a dark mystery that threatens the hierarchies of corporate power, while confronting his own banished demons of the past.",
    wideImage:
        "https://assets-eu-01.kc-usercontent.com/bcd02f72-b50c-0179-8b4b-5e44f5340bd4/55c7e55b-4862-4da3-a6a5-c74e4751f0e8/81UNaTIZ9xL.jpg",
  ),
  Book(
    index: 2,
    title: "The Hiding Place",
    cover:
        "https://ik.imagekit.io/panmac/tr:q-75,di-placeholder_portrait_aMjPtD9YZ.jpg,w-350,pr-true,bl/edition/9781529040425.jpg",
    age: "13+",
    author: "Jenny Quintana",
    authorImg:
        "https://i0.wp.com/www.swirlandthread.com/wp-content/uploads/2018/01/Jenny-Quintana-75-credit-Alicia-Clarke-3.jpg?resize=400%2C600",
    franchise: true,
    chapter: 11,
    genre: "Crime | Fictional",
    language: "ENGLISH",
    rating: 4.2,
    price: 2,
    summary:
        "This tense mystery from Jenny Quintana is a must-read for crime fiction fans. Marina was adopted as a baby after she was found wrapped in a blue shawl in a shared house in London. The press nicknamed her Baby Blue, but the circumstances around her birth are still unknown.  Marina longs to uncover the truth about her birth, so when a flat in the house where she was found is put up for rent, she seizes her chance.  But what if it's not just the house hiding secrets? What if someone knows what happened that day,  and wants to make sure the truth never comes to light?",
    wideImage:
        "https://ik.imagekit.io/panmac/tr:q-75,di-placeholder_portrait_aMjPtD9YZ.jpg,w-350,pr-true,bl/edition/9781529040425.jpg",
  ),
  Book(
    index: 3,
    title: "The Silence of the Lambs",
    cover: "https://m.media-amazon.com/images/I/51cLnFHabhS.jpg",
    age: "13+",
    author: "Thomas Harris",
    authorImg:
        "https://i.guim.co.uk/img/media/5a9f154eec3abc282310e06c18d81ff62057b9c6/0_1394_4231_2537/master/4231.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=d790762af7caa1d060ba5148ede539c1",
    franchise: true,
    chapter: 11,
    genre: "Psychological, Horror, Mystery, Thriller",
    language: "ENGLISH",
    rating: 4.2,
    price: 2,
    summary:
        "The Silence of the Lambs is a psychological horror novel by Thomas Harris. First published in 1988, it is the sequel to Harris's 1981 novel Red Dragon. Both novels feature the cannibalistic serial killer Dr. Hannibal Lecter, this time pitted against FBI Special Agent Clarice Starling.",
    wideImage:
        "https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg",
  ),
  Book(
    index: 4,
    title: "Angels and demons",
    cover:
        "https://www.thoughtco.com/thmb/Ynb3L6z99wr_F2xFtRt4303_zJ4=/330x600/filters:fill(auto,1)/angels_demons-56a095a45f9b58eba4b1c6d9.JPG",
    age: "13+",
    author: "Dan Brown",
    authorImg:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxHuz-EHNbn2NMDDr6Em1G0y4R8o1oaDGbHw&usqp=CAU",
    franchise: true,
    chapter: 11,
    genre: "Crime | Fictional",
    language: "ENGLISH",
    rating: 4.2,
    price: 2,
    summary:
        "Angels & Demons is a 2000 bestselling mystery-thriller novel written by American author Dan Brown and published by Pocket Books and then by Corgi Books. The novel introduces the character Robert Langdon, who recurs as the protagonist of Brown's subsequent novels. Angels & Demons shares many stylistic literary elements with its sequels, such as conspiracies of secret societies, a single-day time frame, and the Catholic Church. Ancient history, architecture, and symbology are also heavily referenced throughout the book.",
    wideImage:
        "https://images-na.ssl-images-amazon.com/images/I/61ZnQqg8xzL.jpg",
  ),
  Book(
    index: 5,
    title: "A Scandal in Bohemia",
    cover: "https://m.media-amazon.com/images/I/514GAjvGPTL.jpg",
    age: "13+",
    author: "Arthur Conan Doyle",
    authorImg:
        "https://cdn.britannica.com/00/79800-050-46931F71/Arthur-Conan-Doyle.jpg",
    franchise: true,
    chapter: 11,
    genre: " Detective | Crime | Fictional",
    language: "ENGLISH",
    rating: 4.2,
    price: 2,
    summary:
        "A Scandal in Bohemia is the first short story, and the third overall work, featuring Arthur Conan Doyle's fictional detective Sherlock Holmes. It is the first of the 56 Holmes short stories written by Doyle and the first of 38 Sherlock Holmes works illustrated by Sidney Paget.",
    wideImage: "https://m.media-amazon.com/images/I/51ytUbZJK9L.jpg",
  ),
]);

class BookModel {
  String cover;
  String title;
  String genre;

  BookModel(this.cover, this.title, this.genre);
}

class BookList {
  List<Book> books;

  BookList({
    required this.books,
  });
}

class Book {
  String title;

  double price;
  String cover;
  String author;
  String genre;
  String language;
  String authorImg;
  bool franchise;
  String summary;
  String wideImage;
  String age;
  double rating;
  int chapter;
  int index;

  Book({
    required this.index,
    required this.title,
    required this.price,
    required this.cover,
    required this.author,
    required this.age,
    required this.authorImg,
    required this.franchise,
    required this.chapter,
    required this.genre,
    required this.language,
    required this.summary,
    required this.wideImage,
    required this.rating,
  });
}
