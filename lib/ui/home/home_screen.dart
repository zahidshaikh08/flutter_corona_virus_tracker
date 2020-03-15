import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rab_corona_virus_tracker/ui/home/messages_tab/messages_tab.dart';
import 'package:rab_corona_virus_tracker/ui/home/notification_tab/notification_tab.dart';
import 'package:rab_corona_virus_tracker/ui/home/search_tab/search_tab.dart';
import 'package:rab_corona_virus_tracker/ui/home/timeline_tab/timeline_tab.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class DrawerItem {
  String itemName = "Home";
  IconData icon;
  int value;

  DrawerItem(String itemName, IconData icon, int value) {
    this.itemName = itemName;
    this.icon = icon;
    this.value = value;
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    TimelineTab(),
    SearchTab(),
    NotificationTab(),
    MessagesTab(),
  ];

  static List<DrawerItem> menuList = [
    DrawerItem("Profile", FeatherIcons.user, 0),
    DrawerItem("List", FontAwesomeIcons.list, 1),
    DrawerItem("Topics", FeatherIcons.messageSquare, 2),
    DrawerItem("Bookmarks", FontAwesomeIcons.bookmark, 3),
    DrawerItem("Moments", FeatherIcons.book, 5),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          appBar: getAppBar(),
          drawer: getNavigationDrawer(),
          body: _children[_currentIndex],
          bottomNavigationBar: getBottomNavigationBar()),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  getBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).backgroundColor,
      type: BottomNavigationBarType.fixed,
      onTap: onTabTapped,
      // new
      currentIndex: _currentIndex,
      // new
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Visibility(
            visible: false,
            child: Text('Home'),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Visibility(
            visible: false,
            child: Text('Home'),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          title: Visibility(
            visible: false,
            child: Text('Home'),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(FeatherIcons.mail),
          title: Visibility(
            visible: false,
            child: Text('Home'),
          ),
        ),
      ],
    );
  }

  getAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      centerTitle: true,
      elevation: 0.5,
      leading: GestureDetector(
        onTap: () {
          _scaffoldKey.currentState.openDrawer();
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipOval(
            child: Image.asset(
              "assets/images/sample_profile_image.jpg",
              width: 15,
              height: 15,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Icon(
        FontAwesomeIcons.twitter,
        color: Theme.of(context).primaryColor,
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.ac_unit),
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  getNavigationDrawer() {
    var showList = true;

    return StatefulBuilder(
      builder: (context, innerState) {
        return Drawer(
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: Column(
              // Important: Remove any padding from the ListView.
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    border: Border(
                      bottom: BorderSide(
                        width: 0.5,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset(
                          "assets/images/sample_profile_image.jpg",
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Zahid Shaikh',
                            style: Theme.of(context).textTheme.body2.copyWith(
                                fontWeight: FontWeight.w800, fontSize: 17),
                          ),
                          InkWell(
                            onTap: () {
                              showList = !showList;
                              innerState(() {});
                            },
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        ],
                      ),
                      Text(
                        '@zaidali08',
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              print('following clicked');
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '533',
                                    style: Theme.of(context)
                                        .textTheme
                                        .body2
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    ' Following',
                                    style: Theme.of(context).textTheme.subtitle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              print('following clicked');
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '47',
                                    style: Theme.of(context)
                                        .textTheme
                                        .body2
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    ' Followers',
                                    style: Theme.of(context).textTheme.subtitle,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                showList
                    ? Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: menuList.length,
                              itemBuilder: (BuildContext context, int index) {
                                DrawerItem item = menuList[index];

                                return InkWell(
                                  onTap: () {
                                    print('item name ==>> ${item.itemName}');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 12,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Icon(
                                            item.icon,
                                            size: 22,
                                            color:
                                                Theme.of(context).accentColor,
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Expanded(
                                          child: Text(
                                            item.itemName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .body2
                                                .copyWith(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 10),
                            Divider(
                                height: 0.3,
                                color: Theme.of(context).accentColor),
                            SizedBox(height: 10),
                            ListTile(
                              onTap: () {
                                print('settings clicked');
                              },
                              title: Text(
                                "Settings and privacy",
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                print('help clicked');
                              },
                              title: Text(
                                "Help center",
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: <Widget>[
                          ListTile(
                            onTap: () {
                              print('Create a new account clicked');
                            },
                            title: Text(
                              "Create a new account",
                              style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              print('Add an existing account clicked');
                            },
                            title: Text(
                              "Add an existing account",
                              style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                showList
                    ? Container(
                        height: 50,
                        child: Column(
                          children: <Widget>[
                            Divider(
                              height: 0.3,
                              color: Theme.of(context).accentColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.move_to_inbox,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(
                                    FeatherIcons.mail,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
