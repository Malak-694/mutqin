import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mutqin/core/networking/api_service.dart';
import 'package:mutqin/core/networking/dio_factory.dart';

final GetIt getIt = GetIt.instance;
Future <void> setupGetIt() async {
Dio dio = DioFactory.initDio();
getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
}