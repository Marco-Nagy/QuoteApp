import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/core/api/app_interceptor.dart';
import 'package:quotes/core/api/dio_consumer.dart';
import 'package:quotes/core/network/network_info.dart';
import 'package:quotes/data/datasource/lang_local_data_source.dart';
import 'package:quotes/data/datasource/quote_local_data_source.dart';
import 'package:quotes/data/datasource/quote_remote_data_source.dart';
import 'package:quotes/data/repositories/lang_repository_impl.dart';
import 'package:quotes/data/repositories/qute_repository_imp.dart';
import 'package:quotes/domain/repositories/lang_repository.dart';
import 'package:quotes/domain/repositories/quote_repository.dart';
import 'package:quotes/domain/usecases/get_random_quote.dart';
import 'package:quotes/domain/usecases/lang_useCases/change_local.dart';
import 'package:quotes/domain/usecases/lang_useCases/get_saved_lang.dart';
import 'package:quotes/presentation/cubit/locale/locale_cubit.dart';
import 'package:quotes/presentation/cubit/random_quote/random_quote_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  // * blocs
  sl.registerFactory<RandomQuoteCubit>(
      () => RandomQuoteCubit(getRandomQuoteUseCase: sl()));
  sl.registerFactory<LocaleCubit>(() => LocaleCubit(
        changeLangUseCase: sl(),
        getSavedLangUseCase: sl(),
      ));
  // * Use Cases
  sl.registerLazySingleton<GetRandomQuote>(
      () => GetRandomQuote(quoteRepository: sl()));
  sl.registerLazySingleton<ChangeLangUseCase>(
      () => ChangeLangUseCase(langRepository: sl()));
  sl.registerLazySingleton<GetSavedLangUseCase>(
      () => GetSavedLangUseCase(langRepository: sl()));
  // * Repository
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(
        networkInfo: sl(),
        randomQuoteRemoteDataSource: sl(),
        randomQuoteLocalDataSource: sl(),
      ));
  sl.registerLazySingleton<LangRepository>(() => LangRepositoryImpl(
        langLocalDataSource: sl(),
      ));
  // * Data Source
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<LangLocalDataSource>(
      () => LangLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(apiConsumer: sl()));
//! Core
  // * Networking
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

//! External
  // * Shared
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  // * ConnectionChecker
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
  // * Dio Interceptors
  sl.registerLazySingleton(() => AppInterceptor());
  sl.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));
}
