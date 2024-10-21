import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';

class BookSearchDelegate extends SearchDelegate<String> {
  final List<BookModel> books;

  BookSearchDelegate({required this.books});

  


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear, color: Colors.white),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = books
        .where((book) => book.volumeInfo.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return Container(
      color: KPrimaryColor,
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: BookListViewItem(book: results[index]),
        )
        
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = books
        .where((book) => book.volumeInfo.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      color: KPrimaryColor,
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: BookListViewItem(book: suggestions[index]),
        ),
      ),
    );
  }
}