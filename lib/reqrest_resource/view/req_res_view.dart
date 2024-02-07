import 'package:flutter/material.dart';
import 'package:server_dio/reqrest_resource/viewModel/req_res_view_model.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

class _ReqResViewState extends ReqresViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [Text(resources[index].color ?? ''), Container()],
          );
        },
      ),
    );
  }
}
