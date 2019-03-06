import 'package:flutter/material.dart';
import '../blocs/navigation_provider.dart';

class Home extends StatelessWidget {
  final bloc = NavigationBloc();
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.currentIndex,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: buildAppBar(),
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
