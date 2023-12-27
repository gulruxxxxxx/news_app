import 'package:dio/dio.dart';
import 'package:news_tdd/core/exception/exception.dart';
import '../models/get_news_response/get_news_response.dart';

abstract class NewsRemoteDataSource{
  Future<GetNewsResponseModel> getNews();
  factory NewsRemoteDataSource() => _NewsRemoteDataSourceImpl();
}

class _NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  final dio = Dio(BaseOptions(baseUrl: ' https://newsapi.org/v2'));
  //https://newsapi.org/v2/everything?q=keyword&apiKey=38ea3b90702044ee88f5b6e5396cf1a5
  @override
  Future<GetNewsResponseModel> getNews() async{
try{
  final response = await dio.get('/everything?q=keyword&apiKey=38ea3b90702044ee88f5b6e5396cf1a5');
  if (response.statusCode! >= 200 && response.statusCode! < 300) {
    return GetNewsResponseModel.fromJson(response.data);
  }else {
    throw ServerException(errorMessage: response.statusMessage ?? '', errorCode: '${response.statusCode ?? ''}');
  }

} on ServerException{
  rethrow;
}
catch(error){
  throw  ServerException(errorMessage: "Something went wrong", errorCode: "141");
}
  }
}