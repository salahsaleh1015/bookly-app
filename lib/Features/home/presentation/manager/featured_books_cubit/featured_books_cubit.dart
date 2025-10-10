

import 'package:bookly_app/Features/home/domain/usecases/fetch_featured_books_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitialState());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoadingState());
    var result = await featuredBooksUseCase.call();
    result.fold((failure) {
      emit(FeaturedBooksFailureState(failure.message));
    }, (books) {
      emit(FeaturedBooksSuccessState(books));
    });
  }
}
