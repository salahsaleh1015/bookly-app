

import 'package:bookly_app/Features/home/domain/usecases/fetch_featured_books_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/usecases/fetch_newest_books_usecase.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitialState());

  FetchNewestBooksUseCase fetchNewestBooksUseCase ;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoadingState());
    var result = await fetchNewestBooksUseCase.call();
    result.fold((failure) {
      emit(NewestBooksFailureState(failure.message));
    }, (books) {
      emit(NewestBooksSuccessState(books));
    });
  }
}
