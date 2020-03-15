import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:rab_corona_virus_tracker/state/time_line_store.dart';
import 'package:rab_corona_virus_tracker/widgtes/circular_progress.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class TimelineTab extends StatefulWidget {
  @override
  _TimelineTabState createState() => _TimelineTabState();
}

class _TimelineTabState extends State<TimelineTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StateBuilder<TimelineStore>(
        models: [Injector.getAsReactive<TimelineStore>()],
        builder: (_, reactiveModel) {
          return reactiveModel.whenConnectionState(
            onIdle: () => onIdleWidget(),
            onWaiting: () => CircularLoader(),
            onData: (store) => onSuccessWidget(),
            onError: (_) => onErrorWidget("error"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
        child: Icon(
          FeatherIcons.feather,
          color: Colors.white,
        ),
      ),
    );
  }

  onIdleWidget() {
    print('on error called');

    return Center(
      child: Text("Nothing to do here"),
    );
  }

  onErrorWidget(String error) {
    print('on error called');

    return Center(
      child: Text(error),
    );
  }

  onSuccessWidget() {
    print('on success called');

    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return itemTimeline();
      },
    );
  }

  Widget itemTimeline() {
    return Container(
      child: Row(
        children: <Widget>[
          ClipOval(
            child: Image.asset(
              "assets/images/sample_profile_image.jpg",
              width: 40,
              height: 40,
            ),
          )
        ],
      ),
    );
  }
}
