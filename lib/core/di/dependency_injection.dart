import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mutqin/core/networking/api_service.dart';
import 'package:mutqin/core/networking/dio_factory.dart';
import 'package:mutqin/features/auth/data/repo/auth_repo.dart';
import 'package:mutqin/features/auth/logic/cubit/auth_cubit.dart';
import 'package:mutqin/features/notification/data/repo/notification_repo.dart';
import 'package:mutqin/features/notification/logic/cubit/notification_cubit.dart';
import 'package:mutqin/features/profile/data/repo/profile_repo.dart';
import 'package:mutqin/features/profile/logic/cubit/profile_cubit.dart';

import '../helper/shared_pref_helper.dart';

final GetIt getIt = GetIt.instance;
Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  await SharedPrefHelper.init();
  getIt.registerSingleton<SharedPrefHelper>(SharedPrefHelper());
  
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(apiService: getIt()));
  getIt.registerSingleton<AuthCubit>(AuthCubit(getIt()));
  getIt.registerLazySingleton<NotificationRepo>(
    () => NotificationRepo(apiService: getIt()),
  );
  getIt.registerLazySingleton<NotificationCubit>(
    () => NotificationCubit(getIt()),
  );

  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepo(apiService: getIt()),
  );
  getIt.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit( getIt()),
  );
}
