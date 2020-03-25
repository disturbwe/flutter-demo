import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class SaveLocalDataPage extends StatefulWidget {
  SaveLocalDataPage({Key key}) : super(key: key);

  SaveLocalDataPageState createState() => SaveLocalDataPageState();
}

class SaveLocalDataPageState extends State<SaveLocalDataPage> {
  String _scanResultStr = "";

  //扫码
  Future _scan() async {
    //利用try-catch来进行异常处理
    try {
      //调起摄像头开始扫码
      String barcode = await BarcodeScanner.scan();
      setState(() {
        return this._scanResultStr = barcode;
      });
    } on PlatformException catch (e) {
      //如果没有调用摄像头的权限，则提醒
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          return this._scanResultStr =
              'The user did not grant the camera permission!';
        });
      } else {
        setState(() {
          return this._scanResultStr = 'Unknown error: $e';
        });
      }
    } on FormatException {
      setState(() => this._scanResultStr =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this._scanResultStr = 'Unknown error: $e');
    }
  }

  _openGallery() async {
    //实现识别二维码图片的功能，调用了免费接口
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//       FormData formData = new FormData.from({
//    "img_file": new UploadFileInfo(image)
// });
      // var url = "https://api.qzone.work/api/qr.decode";
      //向指定URL发送GET请求
      //var response = await http.post(url, body: fileList);
      //var repos = json.decode(response.body);
      // setState(() {
      //   print(repos['msg']);
      // });
    } catch (e) {
      print(e);
      Toast.show("检测到错误", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("扫码")),
        body: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      _openGallery();
                    },
                    child: Text("从相册中选择"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _scan();
                    },
                    child: Text("扫码"),
                  ),
                  Text(_scanResultStr),
                ],
              ),
            ),
            margin: const EdgeInsets.all(20)));
  }
}
