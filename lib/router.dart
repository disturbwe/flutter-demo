import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './FirstPage.dart';
import './SecondPage.dart';
import './ImagePickerWidget.dart';
import 'package:toast/toast.dart';

class PageLayout extends StatelessWidget {
  StatelessWidget page;
  String title;
  PageLayout(StatelessWidget page, String title) {
    this.title = title;
    this.page = page;
  }
  TextStyle bold24Roboto = new TextStyle(
    color: Colors.white,
    fontSize: 24.0,
    fontWeight: FontWeight.w900,
  );
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      //body占屏幕的大部分
      body: new SingleChildScrollView(
          child: new ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: 120.0,
              ),
              child: this.page)),

      floatingActionButton: new ActionButton(),
    );
  }
}

class ActionButton extends StatelessWidget {
  Widget build(BuildContext context) {
    void _open() {
      Toast.show("跳转", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
      Navigator.of(context).pushNamed("/camera", arguments: {});
    }

    return new FloatingActionButton(
      tooltip: 'Add', // used by assistive technologies
      child: new Icon(Icons.aspect_ratio),
      onPressed: _open,
    );
  }
}

class FirstRoute extends StatelessWidget {
  Widget build(BuildContext context) {
    return new PageLayout(new FirstPage(), '输入信息');
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new PageLayout(new SecondPage(), '二维码');
  }
}

final GlobalKey<SaveLocalDataPageState> key = GlobalKey();

var RoutePath = {
  "/info": (context) => FirstRoute(),
  "/code": (context) => SecondRoute(),
  "/camera": (context) => SaveLocalDataPage(
        key: key,
      )
};
