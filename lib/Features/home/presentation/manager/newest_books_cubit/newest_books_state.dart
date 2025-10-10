part of 'newest_books_cubit.dart';


abstract class NewestBooksStates {}

final class NewestBooksInitialState extends NewestBooksStates {}


final class NewestBooksLoadingState extends NewestBooksStates {}

final class NewestBooksSuccessState extends NewestBooksStates {
  final List<BookEntity> books;
  NewestBooksSuccessState(this.books);
}

final class NewestBooksFailureState extends NewestBooksStates {
  final String errMessage;
  NewestBooksFailureState(this.errMessage);
}
