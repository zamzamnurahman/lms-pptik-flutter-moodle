part of 'calendar.dart';

class DeleteEvent {
  final CalendarRepositoryImpl _calendarRepository;

  DeleteEvent(this._calendarRepository);

  Future<Either<Failure, bool>> execute(
      int eventId, bool deleteAllRepeated) async {
    return await _calendarRepository.deleteEvent(eventId, deleteAllRepeated);
  }
}
