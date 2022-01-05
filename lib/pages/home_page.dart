import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notification/alarm.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Alarm> alarmList = [
      Alarm(alarmTime: DateTime.now(), isAvtive: false),
    ];

    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              backgroundColor: Colors.black,
              largeTitle: Text(
                'アラーム',
                style: TextStyle(color: Colors.white),
              ),
              trailing: GestureDetector(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onTap: () {},
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  Alarm alarm = alarmList[index];
                  return Column(
                    children: [
                      if (index == 0)
                        Divider(
                          color: Colors.grey,
                          height: 0,
                        ),
                      ListTile(
                        title: Text(
                          DateFormat('H:mm').format(alarm.alarmTime!),
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                        trailing: CupertinoSwitch(
                          value: alarm.isAvtive!,
                          onChanged: (newValue) {
                            print(newValue);
                            print(alarm.isAvtive);
                            alarm.isAvtive = newValue;
                            print(alarm.isAvtive);
                            setState(() {});
                            print(alarm.isAvtive);
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 0,
                      ),
                    ],
                  );
                },
                childCount: alarmList.length,
              ),
            ),
          ],
        ));
  }
}
