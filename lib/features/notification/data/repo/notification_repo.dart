// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mutqin/core/networking/api_result.dart';

import '../../../../core/networking/api_service.dart';
import '../model/notification_model.dart';

class NotificationRepo {
  ApiService apiService;
  NotificationRepo({required this.apiService});
  Future <ApiResult<List<Message>>> getNotificationAll(String id) async{
    try{
      final response = await apiService.getNotificationsAll(id);
      return ApiResult.success(response);
    
    }catch(e){
            return ApiResult.failure(e.toString());

    }
  }
  
  Future <ApiResult<List<Message>>> getNotificationUnread(String id) async{
    try{
      final response = await apiService.getNotificationsUnread(id);
      return ApiResult.success(response);
    
    }catch(e){
            return ApiResult.failure(e.toString());

    }
  }
  Future <ApiResult<void>> readNotificaiton(String notiId) async{
    try{
      final response = await apiService.readNotification(notiId);
      return ApiResult.success(response);
    
    }catch(e){
            return ApiResult.success("نحن نواجه مشكلة حاليا");

    }
  }
}
