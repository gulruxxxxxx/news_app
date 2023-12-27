import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../entities/news.dart';

abstract class  NewsRepository{
  Future<Either<ServerFailure, List<NewsEntity>>> getNews();
}