import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/video/video_bloc.dart';
import '../dao/cource_model.dart';
import 'cource_detail_page.dart';

class CourceDetail extends StatefulWidget {
  static const routeName = 'cource_detail';
  const CourceDetail({
    Key? key,
    required this.courceModel,
  }) : super(key: key);
  static MaterialPageRoute route({required CourceModel courceModel}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocProvider<VideoBloc>(
        create: (context) => VideoBloc(),
        child: CourceDetail(courceModel: courceModel),
      ),
    );
  }

  final CourceModel courceModel;

  @override
  State<CourceDetail> createState() => _CourceDetailState();
}

class _CourceDetailState extends State<CourceDetail>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          BuildVideoView(),
        ],
      )),
    );
  }
}
