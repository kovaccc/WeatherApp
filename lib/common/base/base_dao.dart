import 'package:floor/floor.dart';

abstract class BaseDao<T> {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(T model);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertMultiple(List<T> models);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> update(T model);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<int> updateMultiple(List<T> models);

  @delete
  Future<void> deleteModel(T model);

  @delete
  Future<int> deleteMultiple(List<T> models);
}
