import 'package:flutter/material.dart';
import 'package:free_chat_app/ui/shared/app_colors.dart';
import 'package:free_chat_app/ui/views/message_list.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            // indicator: BoxDecoration(
            //   color: primaryColor,
            // ),
            controller: _tabController,
            indicatorColor: primaryColor,
            labelColor: Colors.grey,
            //labelPadding: EdgeInsets.only(right: 45),
            unselectedLabelColor: Colors.grey[850],
            tabs: const <Widget>[
              Tab(
                child: Text(
                  'Chat',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Tab(
                child: Center(
                  child: Text(
                    'Archived',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Calls',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 500,
          width: double.infinity,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const MessageList(),
                    ),
                  );
                },
                child: const ListTile(
                  leading: CircleAvatar(),
                  title: Text("name"),
                  subtitle: Text('message'),
                ),
              ),
              const Center(
                child: Text('Archived'),
              ),
              const Center(
                child: Text('Calls'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
