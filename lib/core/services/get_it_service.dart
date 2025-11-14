import 'package:get_it/get_it.dart';
import 'package:hungry/core/database/api/api_consumer.dart';
import 'package:hungry/core/database/api/dio_consumer.dart';
import 'package:hungry/core/database/api/dio_factory.dart';
import 'package:hungry/core/database/cache/cache_helper.dart';
import 'package:hungry/features/login/data/repos/login_repo.dart';
import 'package:hungry/features/login/data/repos/login_repo_impl.dart';
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
}
