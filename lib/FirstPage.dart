import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new BodyWidget();
  }
}

class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(child: new Center(child: new List()));
  }
}

class List extends StatefulWidget {
  @override
  _SubmitForm createState() => new _SubmitForm();
}

class _SubmitForm extends State<List> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  var _subForm = {"stuNum": '', "name": '', "text": ''};
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your student number',
                  labelText: '学号 *',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return '请输入学号';
                  }
                  return null;
                },
                onSaved: (value) {
                  _subForm['stuNum'] = value;
                }),
            TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                  labelText: '姓名 *',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return '请输入姓名';
                  }
                  return null;
                },
                onSaved: (value) {
                  _subForm['name'] = value;
                }),
            TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your text',
                  labelText: '文本 *',
                ),
                onSaved: (value) {
                  _subForm['text'] = value;
                }),
            Container(
                child: Center(
                  child: RaisedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        String result = '';
                        _subForm.forEach((k, v) => result += v);
                        Navigator.of(context).pushNamed("/code", arguments: result);
                      }
                    },
                    child: Text('生成QR码'),
                  ),
                ),
                margin: const EdgeInsets.only(top: 16))
          ],
        ),
      ),
      width: 400,
      padding: const EdgeInsets.fromLTRB(20.0, .0, 20.0, 20.0),
    );
  }
}
