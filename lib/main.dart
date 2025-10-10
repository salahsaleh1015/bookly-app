import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/usecases/fetch_featured_books_usecase.dart';
import 'package:bookly_app/Features/home/domain/usecases/fetch_newest_books_usecase.dart';
import 'package:bookly_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/core/functions/service_locator_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'Features/home/data/repos/home_repo_impl.dart';
import 'Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/simble_bloc_observer.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kNewestBox);
  await Hive.openBox<BookEntity>(kFeaturedBox);
  serviceLocatorSetup();
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => FeaturedBooksCubit(
                FetchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()),
              ),
        ),
        BlocProvider(
          create:
              (context) => NewestBooksCubit(
                FetchNewestBooksUseCase(getIt.get<HomeRepoImpl>()),
              ),
        ),
      ],

      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
