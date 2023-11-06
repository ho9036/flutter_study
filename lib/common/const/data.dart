import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const accessTokenKey = 'ACCESS_TOKEN';
const refreshTokenKey = 'REFRESH_TOKEN';

const String domain = 'http://112.151.207.96:7400';
const String loginUrl = '$domain/api/auth/login';

const storage = FlutterSecureStorage();
final dio = Dio();