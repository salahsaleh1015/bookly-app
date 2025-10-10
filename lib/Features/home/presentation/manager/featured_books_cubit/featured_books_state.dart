part of 'featured_books_cubit.dart';

abstract class FeaturedBooksStates {}

final class FeaturedBooksInitialState extends FeaturedBooksStates {}

final class FeaturedBooksLoadingState extends FeaturedBooksStates {}

final class FeaturedBooksSuccessState extends FeaturedBooksStates {
  final List<BookEntity> books;
  FeaturedBooksSuccessState(this.books);
}

final class FeaturedBooksFailureState extends FeaturedBooksStates {
  final String errMessage;
  FeaturedBooksFailureState(this.errMessage);
}
