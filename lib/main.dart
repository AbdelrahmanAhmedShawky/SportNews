import 'package:flutter/material.dart';
import 'package:sport_news_app/di/injector.dart' as di;
import 'package:sport_news_app/ui/home.dart';
import 'package:sport_news_app/utility/const.dart';

import 'bloc/bloc_provider.dart';
import 'bloc/post_bloc.dart';
import 'di/injector.dart';

void main() async {
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      home: Directionality(
        // add this
        textDirection: TextDirection.rtl,
        child: BlocProvider<PostBloc>(
          bloc: getIt<PostBloc>(),
          child: Home(),
        ),
      ),
    );
  }
}
