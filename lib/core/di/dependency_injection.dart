import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mutqin/core/networking/api_service.dart';
import 'package:mutqin/core/networking/dio_factory.dart';
import 'package:mutqin/features/auth/data/repo/auth_repo.dart';
import 'package:mutqin/features/auth/logic/cubit/auth_cubit.dart';

final GetIt getIt = GetIt.instance;
Future <void> setupGetIt() async {
Dio dio =  DioFactory.getDio();
getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(apiService: getIt()));
getIt.registerSingleton<AuthCubit>(AuthCubit(getIt()));
}