import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sport_news_app/bloc/post_bloc.dart';
import 'package:sport_news_app/data/model/news_model.dart';
import 'package:sport_news_app/di/injector.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
          body: Container(
        child: ListView(
          children: [
            buildHeaderText(context),
            SizedBox(height: 8.0),
            _buildNewList(context),
            SizedBox(height: 20.0),
          ],
        ),
      )),
    );
  }

  buildHeaderText(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 130.0,
      child: Image.asset(
        "images/Group544.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildNewList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder(
        stream: getIt<PostBloc>().postSubject.stream,
        builder: (context, AsyncSnapshot<List<NewsDataModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              if (snapshot.data.length > 0)
                return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) =>
                        _getPostWidgets(snapshot.data[index]));
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

  Widget _getPostWidgets(NewsDataModel data) {
    var post = data;
    return new GestureDetector(
      onTap: () {
        openDetailsUI(post);
      },
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: new Card(
          elevation: 3.0,
          child: new Row(
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    width: 150.0,
                    child: new Image.network(
                      post.avatar,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      height: 25,
                      width: 25,
                      child: Image.asset(
                        'Group 544.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: new Container(
                margin: new EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      post.first_name,
                      style: new TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      post.last_name,
                      style: new TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      post.email,
                      style: new TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  openDetailsUI(NewsDataModel data) {
    // The details UI will be opened here
  }

  Widget _noDataFound() {
    return Container(
        child: Center(
      child: Text("No Data Found"),
    ));
  }
}
