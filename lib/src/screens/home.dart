import 'package:flutter/material.dart';
import '../blocs/navigation_provider.dart';

class Home extends StatelessWidget {
  final bloc = NavigationBloc();
  Widget build(BuildContext context) {
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
                  title: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    color: Colors.white,
                    child: Text(
                      "TITLE",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                  expandedHeight:
                      (MediaQuery.of(context).size.height / 2) * (3 / 4),
                  pinned: true,
                  forceElevated: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Image.network(
                      "http://onehdwallpaper.com/wp-content/uploads/2015/07/Beautiful-Scenery-HD-Wallpapers-Pictures-7.jpg",
                      fit:BoxFit.cover,
                      filterQuality: FilterQuality.low,
                    ),
                  ),
                ),
              ];
            },
            body: Container(
              child: Center(
                child: Text("You are Home!"),
              ),
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
