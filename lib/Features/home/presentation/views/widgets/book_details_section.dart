import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'cutom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.2,
          ),
          child:  CustomBookImage(
            imageUrl: book.volumeInfo.imageLinks?.thumbnail?? defaultImageUrl,
            ),
        ),
        const SizedBox(
          height: 43,
        ),
         Text(
          book.volumeInfo.title!,
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo.authors![0],
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
         BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: book.volumeInfo.averageRating?? 0,
          count: book.volumeInfo.ratingsCount??0,
        ),
        const SizedBox(
          height: 37,
        ),
         BooksAction(book: book,),
      ],
    );
  }
}