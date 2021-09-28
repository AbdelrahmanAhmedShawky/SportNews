import 'package:flutter/material.dart';
import 'package:sport_news_app/bloc/post_bloc.dart';
import 'package:sport_news_app/data/model/news_model.dart';
import 'package:sport_news_app/di/injector.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("posts app"),
      ),
      body: StreamBuilder(
        stream: getIt<PostBloc>().postSubject.stream,
        builder: (context, AsyncSnapshot<List<NewsDataModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              if (snapshot.data.length > 0)
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) =>
                        _buildRowItem(snapshot.data[index]));
              else
                return _noDataFound();
            } else {
              return _noDataFound();
            }
          } else if (snapshot.connectionState == ConnectionState.none) {
            return _noDataFound();
          } else {
            return _noDataFound();
          }
        },
      ),
    );
  }

  Widget _buildRowItem(NewsDataModel data) {
    return Card(
        child: Container(
            padding: EdgeInsets.all(12), child: Text("${data.first_name}")));
  }

  Widget _noDataFound() {
    return Container(
        child: Center(
      child: Text("No Data Found"),
    ));
  }
}
