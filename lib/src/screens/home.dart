import 'package:flutter/material.dart';
import '../blocs/navigation_provider.dart';

class Home extends StatelessWidget {
  final bloc = NavigationBloc();

  Widget buildCircle(
      BuildContext context, double height, Widget child, String place) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 9.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0, bottom: 5.0),
            height: height * 0.78,
            width: height * 0.78,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: child,
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: Text(
              place,
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      )),
    );
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 7;
    var circlesList = List<Widget>();
    circlesList.add(
      SizedBox(
        width: 10.0,
      ),
    );

    circlesList.add(
        buildCircle(
          context,
          height,
          Icon(
            Icons.my_location,
            size: 48,
            color: Colors.black,
          ),
          "Nearby",
        ),
      );

    for (int i = 0; i < 10; i++) {
      circlesList.add(
        buildCircle(
          context,
          height,
          Icon(
            Icons.security,
            size: 48.0,
            color: Colors.black,
          ),
          "Place $i",
        ),
      );
    }
    return StreamBuilder(
      stream: bloc.currentIndex,
      builder: (context, snapshot) {
        return Scaffold(
          //appBar: buildAppBar(),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (integer) {
              bloc.changeIndex(integer);
            },
            type: BottomNavigationBarType.fixed,
            fixedColor: Color(0xff214489),
            currentIndex: snapshot.hasData ? snapshot.data : 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text("Search"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                title: Text('Alerts'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
            ],
          ),
          backgroundColor: Color(0xffcad8e4),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Color(0xff214489),
                  title: Text(
                    "TITLE",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                  expandedHeight:
                      (MediaQuery.of(context).size.height / 2) * (3 / 4),
                  //pinned: true,
                  forceElevated: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Image.network(
                      "http://onehdwallpaper.com/wp-content/uploads/2015/07/Beautiful-Scenery-HD-Wallpapers-Pictures-7.jpg",
                      fit: BoxFit.cover,
                      colorBlendMode: BlendMode.darken,
                      filterQuality: FilterQuality.low,
                    ),
                  ),
                ),
              ];
            },
            body: Column(
              children: <Widget>[
                SizedBox(
                  height: 0.3,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5.0),
                  height: MediaQuery.of(context).size.height / 5.8,
                  color: Color(0xff214489),
                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: circlesList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Center(child: circlesList[index]);
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  color: Colors.white,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        "Home",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
