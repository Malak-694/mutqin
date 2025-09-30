import 'package:bloc/bloc.dart';
import 'package:mutqin/core/helper/shared_key.dart';
import 'package:mutqin/core/helper/shared_pref_helper.dart';
import 'package:mutqin/core/networking/api_result.dart';
import 'package:mutqin/features/notification/data/repo/notification_repo.dart';

import 'package:mutqin/features/notification/logic/cubit/notification_state.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../data/model/notification_model.dart';


class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepo repo;
  final SharedPrefHelper prefs = getIt<SharedPrefHelper>();

  List<Message>? notifications;
  String? userId; // nullable until loaded

  NotificationCubit(this.repo) : super(NotificationState.loading()) {
    _init();
  }

  Future<void> _init() async {
    userId = await prefs.getData(SharedPrefKey.id) as String?;
    if (userId != null) {
      await getNotificationUnread();
    } else {
      emit(const NotificationState.fail("لم يتم العثور على المستخدم"));
    }
  }

  Future<void> getNotificationAll() async {
    emit(const NotificationState.loading());

    if (userId == null) {
      emit(const NotificationState.fail("User ID not available"));
      return;
    }

    final ApiResult<List<Message>> result = await repo.getNotificationAll(
      userId!,
    );

    result.when(
      success: (data) {
        notifications = data;
        emit(NotificationState.success(data));
      },
      failure: (error) {
        emit(const NotificationState.fail("نحن نواجه مشكلة ونعمل على حلها"));
      },
    );
  }

  Future<void> getNotificationUnread() async {
    emit(const NotificationState.loading());

    if (userId == null) {
      emit(const NotificationState.fail("User ID not available"));
      return;
    }

    final ApiResult<List<Message>> result = await repo.getNotificationUnread(
      userId!,
    );

    result.when(
      success: (data) async {
        notifications = data;
        emit(NotificationState.success(data));

        // mark all as read
        for (final msg in data) {
          await repo.readNotificaiton(msg.id);
        }
      },
      failure: (error) {
        emit(const NotificationState.fail("نحن نواجه مشكلة ونعمل على حلها"));
      },
    );
  }
}
