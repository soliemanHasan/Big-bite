import 'package:big_bite/modules/auth/data/data_source/auth_data_source.dart';
import 'package:big_bite/modules/auth/data/data_source/auth_remote_data_source_imp.dart';
import 'package:big_bite/modules/auth/data/repository/auth_repository_imp.dart';
import 'package:big_bite/modules/auth/domain/repository/auth_repository.dart';
import 'package:big_bite/modules/auth/presentation/blocs/login/login_bloc.dart';
import 'package:big_bite/modules/auth/presentation/blocs/register/register_bloc.dart';
import 'package:big_bite/modules/auth/presentation/blocs/verify/verify_bloc.dart';
import 'package:big_bite/modules/basket/data/data_source/basket_data_source.dart';
import 'package:big_bite/modules/basket/data/data_source/basket_remote_data_source_imp.dart';
import 'package:big_bite/modules/basket/data/repository/basket_repository_imp.dart';
import 'package:big_bite/modules/basket/domain/repository/basket_repository.dart';
import 'package:big_bite/modules/basket/presentation/blocs/basket_bloc.dart';
import 'package:big_bite/modules/home/data/data_source/home_remote_data_source.dart';
import 'package:big_bite/modules/home/data/data_source/home_data_source_imp.dart';
import 'package:big_bite/modules/home/data/repository/home_repository_imp.dart';
import 'package:big_bite/modules/home/domain/repository/home_repository.dart';
import 'package:big_bite/modules/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:big_bite/modules/home/presentation/blocs/show_news_bloc/show_news_bloc.dart';
import 'package:big_bite/modules/meals/data/data_source/meals_data_source.dart';
import 'package:big_bite/modules/meals/data/data_source/meals_remote_data_source_imp.dart';
import 'package:big_bite/modules/meals/data/repository/meal_repository_imp.dart';
import 'package:big_bite/modules/meals/domain/repository/meal_repository.dart';
import 'package:big_bite/modules/meals/presentation/blocs/meals_bloc/meal_bloc.dart';
import 'package:big_bite/modules/meals/presentation/blocs/show_meal_details_bloc/show_meal_details_bloc.dart';
import 'package:big_bite/modules/menu/data/data_source/menu_data_source.dart';
import 'package:big_bite/modules/menu/data/data_source/menu_remote_data_source_imp.dart';
import 'package:big_bite/modules/menu/data/repository/menu_repository_imp.dart';
import 'package:big_bite/modules/menu/domain/repository/menu_repository.dart';
import 'package:big_bite/modules/menu/presentation/blocs/category_menu_bloc.dart';
import 'package:big_bite/modules/setting/favorite/data/data_souce/favorite_data_source.dart';
import 'package:big_bite/modules/setting/favorite/data/data_souce/favorite_remote_data_source_imp.dart';
import 'package:big_bite/modules/setting/favorite/data/repository/favorite_repository_imp.dart';
import 'package:big_bite/modules/setting/favorite/domain/repository/favorite_repository.dart';
import 'package:big_bite/modules/setting/favorite/presentation/blocs/add_to_favorite_bloc.dart/add_to_favorite_bloc.dart';
import 'package:big_bite/modules/setting/favorite/presentation/blocs/show_favorite_bloc.dart/show_favorite_bloc.dart';
import 'package:big_bite/modules/setting/my_order/data/data_source/my_order_data_source_imp.dart';
import 'package:big_bite/modules/setting/my_order/data/data_source/my_order_remote_data_source.dart';
import 'package:big_bite/modules/setting/my_order/data/repository/my_order_repository_imp.dart';
import 'package:big_bite/modules/setting/my_order/domain/repository/my_order_repository.dart';
import 'package:big_bite/modules/setting/my_order/presentation/blocs/my_order_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final sl = GetIt.instance;
final Logger logger = Logger();

/// This class [ServicesLocator] is define to inject values and variables (Objects) into memory when the application is opened,
/// those values will remain stored and preserved for direct access in randomaccess memory according to the specified conditions
/// and situations.
///
/// The concept of injection depends on dependency injection, using the get_it library to provide this type of service,
///
/// it is necessary You have to call [ServicesLocator.init] in main.dart, main finction, before [runApp]
///
/// 1- to inject Your Bloc object use [registerFactory] function
///    Ex:   sl.registerFactory(() => YourBloc(sl()));
/// 2- to inject Your Repository, Data Source object use [registerLazySingleton] function
///    Ex:   sl.registerLazySingleton(() => YourDataSource());
///    Ex:   sl.registerLazySingleton(() => YourDataSource());
///
/// you can get any Object you inject by call [sl]
///    Ex: sl<YourBloc>();

// TODO: add (BLOCs , REPOSITORIES , DATA SOURCES)
class ServicesLocator {
  static ServicesLocator? _instance;
  ServicesLocator._();
  factory ServicesLocator() => _instance ??= ServicesLocator._();

  void init() {
    //// BLOCS
    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerFactory(() => RegisterBloc(sl()));
    sl.registerFactory(() => HomeBloc(sl()));
    sl.registerFactory(() => ShowNewsBloc(sl()));
    sl.registerFactory(() => CategoryMenuBloc(sl()));
    sl.registerFactory(() => VerifyBloc(sl()));
    sl.registerLazySingleton(() => BasketBloc(sl()));
    sl.registerLazySingleton(() => MealBloc(sl()));
    sl.registerLazySingleton(() => MyOrderBloc(sl()));

    sl.registerFactory(() => ShowMealDetailsBloc(sl()));
    sl.registerFactory(() => AddToFavoriteBloc(sl()));
    sl.registerLazySingleton(() => ShowFavoriteBloc(sl()));

    //// REPOSITORIES
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(sl()));
    sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImp(sl()));
    sl.registerLazySingleton<MenuRepository>(() => MenuRepositoryImp(sl()));
    sl.registerLazySingleton<MealRepository>(() => MealRepositoryImp(sl()));
    sl.registerLazySingleton<BasketRepository>(() => BasketRepositoryImp(sl()));
    sl.registerLazySingleton<MyOrderRepository>(
        () => MyOrderRepositoryImp(sl()));
    sl.registerLazySingleton<FavoriteRepository>(
        () => FavoriteRepositoryImp(sl()));

    //// DATA SOURCES
    sl.registerLazySingleton<AuthDataSource>(() => AuthRemoteDataSourceImp());
    sl.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImp());
    sl.registerLazySingleton<MenuDataSource>(() => MenuRemoteDataSourceImp());
    sl.registerLazySingleton<MealsDataSource>(() => MealsRemoteDataSourceImp());
    sl.registerLazySingleton<FavoriteDataSource>(
        () => FavoriteRemoteDataSourceImp());
    sl.registerLazySingleton<BasketDataSource>(
        () => BasketRemoteDataSourceImp());
    sl.registerLazySingleton<MyOrderRemoteDataSource>(
        () => MyOrderDataSourceImp());
  }
}
