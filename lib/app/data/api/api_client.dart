import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/http.dart';
import 'package:template/app/data/models/user.dart';

part 'api_client.g.dart'; // flutter pub run build_runner build

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/users')
  Future<List<User>> getAllUsers();

  @GET('/users/{id}')
  Future<User> getUser(@Path("id") String id);

  @PUT('/users/{id}')
  Future<User> updateUser(@Path("id") String id, @Body() User user);

  @PATCH('/users/{id}')
  Future<User> updateUserPart(@Path("id") String id, @Body() User user);

  @POST('/users')
  Future<User> createUser(@Body() User user);

  @DELETE('/users/{id}')
  Future<void> deleteUser(@Path("id") String id);
}