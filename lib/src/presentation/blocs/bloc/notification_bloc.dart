import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecase/notification/get_notifications.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

class GetNotificationsBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetNotifications _getNotification;
  GetNotificationsBloc(this._getNotification)
      : super(const NotificationState.initial()) {
    on<NotificationEvent>((event, emit) async {
      await event.whenOrNull(
        getNotifications: () async {
          emit(const NotificationState.loading());
          final notifications = await _getNotification.execute();
          notifications.fold(
            (failure) => emit(NotificationState.error(failure.message)),
            (notifications) => emit(NotificationState.loaded(notifications)),
          );
        },
      );
    });
  }
}
