import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:january6_staggered_grid_view/data/showcases.dart';
import 'package:january6_staggered_grid_view/data/tabs.dart';
import 'package:january6_staggered_grid_view/widget/header_widget.dart';
import 'package:january6_staggered_grid_view/widget/showcase_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appTitle = 'ScreenDesignChaellenge';
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primaryColor: Colors.white,
          dividerColor: Colors.black.withOpacity(0.8),
          primaryTextTheme:
              Theme.of(context).primaryTextTheme.apply(bodyColor: Colors.white),
          accentColor: Colors.blue, // needs to be MaterialColor
          unselectedWidgetColor: Colors.grey, // needs to be MaterialColor
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        home: MainPage(appTitle: appTitle),
      );
}

class MainPage extends StatefulWidget {
  final String appTitle;

  const MainPage({this.appTitle});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: tabs.length, vsync: this, initialIndex: tabs.length - 1);
    tabController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.appTitle,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        drawer: Drawer(child: Container()),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                HeaderWidget(),
                const SizedBox(height: 32),
                buildMainButton(),
                const SizedBox(height: 32),
                Text(
                  'Showcasing the finest food, drinks and travel, Recipes, healthy tips, food photography',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                Divider(),
                SizedBox(height: 32),
              ],
            ),
            StaggeredGridView.countBuilder(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(12),
              crossAxisCount: 4,
              mainAxisSpacing: 24,
              crossAxisSpacing: 12,
              itemCount: showcases.length,
              itemBuilder: (BuildContext context, int index) =>
                  ShowcaseWidget(showcase: showcases[index]),
              staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black.withOpacity(0.1), width: 1),
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: TabBar(
            controller: tabController,
            indicatorColor: Colors.transparent,
            labelColor: Theme.of(context).accentColor,
            unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
            tabs: tabs
                .map((icon) => icon == null
                    ? FlutterLogo(colors: getLogoColor())
                    : Icon(icon))
                .toList(),
          ),
        ),
      );

  Color getLogoColor() {
    final isFlutterLogoSelected = tabController.index + 1 == tabs.length;
    return isFlutterLogoSelected
        ? Theme.of(context).accentColor
        : Theme.of(context).unselectedWidgetColor;
  }

  Widget buildMainButton() => IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildButton(5, 'Followers'),
            VerticalDivider(),
            buildButton(38, 'Posts'),
          ],
        ),
      );

  Widget buildButton(int number, String text) => FlatButton(
        onPressed: () {},
        child: Column(
          children: <Widget>[
            Text(
              '$number',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ],
        ),
      );
}
