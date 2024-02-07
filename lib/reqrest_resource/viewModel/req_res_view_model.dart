import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:server_dio/product/service/project_dio.dart';
import 'package:server_dio/reqrest_resource/model/resource_model.dart';
import 'package:server_dio/reqrest_resource/service/reqres_service.dart';
import 'package:server_dio/reqrest_resource/view/req_res_view.dart';

abstract class ReqresViewModel extends State<ReqResView> with ProjectDioMixin {
  late final IReqresService reqresService;

  List<Data> resources = [];

  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(dio: service);
    _fetch();
  }

  // Future<void> _fetch() async {
  //   resources = (await reqresService.fetchResourceItem())?.data ?? [];
  // }
  Future<void> _fetch() async {
    final fetchedResources = await reqresService.fetchResourceItem();
    if (fetchedResources != null) {
      setState(() {
        resources = fetchedResources.data ?? [];
      });
    }
  }
}
