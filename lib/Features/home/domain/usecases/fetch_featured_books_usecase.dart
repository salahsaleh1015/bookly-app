import 'package:bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/book_entity.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  HomeRepo homeRepo;
  FetchFeaturedBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    // check permission
    return await homeRepo.fetchFeaturedBooks();
  }
}
