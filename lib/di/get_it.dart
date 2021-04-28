import 'package:dsc_event/data/data_sources/remote_data_source.dart';
import 'package:dsc_event/data/repositories/app_repositories_impl.dart';
import 'package:dsc_event/domain/repositories/app_repositories.dart';
import 'package:dsc_event/domain/usecases/get_blog.dart';
import 'package:dsc_event/domain/usecases/get_blog_more.dart';
import 'package:dsc_event/domain/usecases/get_events.dart';
import 'package:dsc_event/domain/usecases/get_events_more.dart';
import 'package:dsc_event/presentation/blocs/blogList/blog_list_cubit.dart';
import 'package:dsc_event/presentation/blocs/eventsList/events_list_cubit.dart';
import 'package:dsc_event/presentation/blocs/loading/loading_cubit.dart';
import 'package:get_it/get_it.dart';

final getItInstance = GetIt.I;

Future init() async {
  ///data sources
  getItInstance
      .registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  getItInstance.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(
        getItInstance(),
      ));

  ///Use Cases
  getItInstance
      .registerLazySingleton<GetEvents>(() => GetEvents(getItInstance()));
  getItInstance.registerLazySingleton<GetMoreEvents>(
      () => GetMoreEvents(getItInstance()));

  getItInstance.registerLazySingleton<GetBlog>(() => GetBlog(getItInstance()));
  getItInstance
      .registerLazySingleton<GetMoreBlog>(() => GetMoreBlog(getItInstance()));

  ///Cubits
  getItInstance.registerSingleton<LoadingCubit>(LoadingCubit());

  getItInstance.registerFactory(
    () => EventsListCubit(
        loadingCubit: getItInstance(),
        getEvents: getItInstance(),
        getMoreEvents: getItInstance()),
  );

  getItInstance.registerFactory(
    () => BlogListCubit(getMoreBlog: getItInstance(), getBlog: getItInstance()),
  );
}
