
import 'package:dio/dio.dart';
import 'package:server_dio/reqrest_resource/model/resource_model.dart';

abstract class IReqresService {
  IReqresService({
    required this.dio,
  });
  final Dio dio;

  Future<ResourceModel?>
      fetchResourceItem(); //Geriye cevap döndürecekse ve internete çıkacaksa future döndürürüüz
}

enum _ReqResPath { resource }

class ReqresService extends IReqresService {
  ReqresService({required super.dio});

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final response = await dio.get('/${_ReqResPath.resource.name}');

    if (response.statusCode == 200) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
