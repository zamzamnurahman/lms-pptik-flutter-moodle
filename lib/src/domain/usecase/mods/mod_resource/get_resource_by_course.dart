part of 'mod_resource.dart';

class GetResourceByCourse {
  final ModResourceRepositoryImpl _resourceRepositoryImpl;

  GetResourceByCourse(this._resourceRepositoryImpl);

  Future<Either<Failure, List<ResourceModel>>> execute(int courseId) async {
    return await _resourceRepositoryImpl.getResourceByCourse(courseId);
  }
}
