import 'package:bookly_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/book_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        return TextField(
          onTap: (() {
            if(state is FeaturedBooksSuccess){
                showSearch(
                          context: context,
                          delegate: BookSearchDelegate(
                            books: state.books,
                          ),
                        );
                }
          }),
          decoration: InputDecoration(
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            hintText: "Search",
            suffixIcon: IconButton(
              onPressed:() {},
              icon:const Opacity(
                opacity: 0.8,
                child:  Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      size: 22,
                    ),
              )),
        
          ),
        );
      },
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white),
        );
  }
}

