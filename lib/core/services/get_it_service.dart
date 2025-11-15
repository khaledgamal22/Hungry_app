import 'package:get_it/get_it.dart';
import 'package:hungry/core/database/api/api_consumer.dart';
import 'package:hungry/core/database/api/dio_consumer.dart';
import 'package:hungry/core/database/api/dio_factory.dart';
import 'package:hungry/core/database/cache/cache_helper.dart';
import 'package:hungry/features/home/data/repos/get_categories_repo/get_categories_repo.dart';
import 'package:hungry/features/home/data/repos/get_categories_repo/get_categories_repo_impl.dart';
import 'package:hungry/features/home/data/repos/get_products_repo/get_products_repo.dart';
import 'package:hungry/features/home/data/repos/get_products_repo/get_products_repo_impl.dart';
import 'package:hungry/features/login/data/repos/login_repo.dart';
import 'package:hungry/features/login/data/repos/login_repo_impl.dart';
import 'package:hungry/features/product_details/data/repos/get_product_details_repo.dart';
import 'package:hungry/features/product_details/data/repos/get_product_details_repo_impl.dart';
import 'package:hungry/features/profile/data/repos/get_user_profile_repo.dart';
import 'package:hungry/features/profile/data/repos/get_user_profile_repo_impl.dart';
import 'package:hungry/features/register/data/repos/register_repo.dart';
import 'package:hungry/features/register/data/repos/register_repo_impl.dart';

final GetIt getIt = GetIt.instance;

void setupGetItService() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: DioFactory.getDio()),
  );
  getIt.registerLazySingleton<RegisterRepo>(
    () => RegisterRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<GetCategoriesRepo>(
    () => GetCategoriesRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<GetProductsRepo>(
    () => GetProductsRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<GetProductDetailsRepo>(
    () => GetProductDetailsRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<GetUserProfileRepo>(
    () => GetUserProfileRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
}
