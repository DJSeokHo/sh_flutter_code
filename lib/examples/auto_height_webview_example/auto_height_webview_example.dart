import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../framework/debug/i_log.dart';

void main() {
  runApp(const MaterialApp(home: AutoHeightWebViewExample(),));
}

class AutoHeightWebViewExample extends StatefulWidget {
  const AutoHeightWebViewExample({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AutoHeightWebViewExampleState();
  }
}

class _AutoHeightWebViewExampleState extends State<AutoHeightWebViewExample> {

  double _height = 0;

  late final WebViewController _controller;

  final String _url = """
  <html lang="ko">
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"" />
      <link rel="stylesheet" href="http://cdn.quilljs.com/1.3.6/quill.snow.css" />
    </head>
    <body>
      <div>
        <p><p>set</p>\r\n\r\n<p><p>HAPPIESTNESS</p>\r\n\r\n<p><p>Carrie Oversized Pyjama SET Serenity ₩185,000</p>
      </div>
      <script>
        const resizeObserver = new ResizeObserver( entries =>
          Report.postMessage(document.scrollingElement.scrollHeight)
        )
        resizeObserver.observe(document.body)
      </script>
      <style>
        .body {
          margin: 0 auto;
          display: flex;
          flex-direction: column;
          overflow: hidden;
          height: auto;
          max-width: 800px;
          line-height: 1.2;
        }
        b {
          font-weight: bold;
        }
        i {
          font-style: italic;
        }
        iframe {
          width: 100%;
        }
        hr {
          width: 100%;
          height: 2px;
          background-color: #000;
        }
        .coupon-event {
          cursor: pointer;
        }
        h1 {
          display: inline-flex;
          margin: 0 auto;
          padding: 0;
        }
        .image_wrapper {
          display: flex;
          margin: 0;
          font-size: 0;
          line-height: 0px;
          padding: 0;
          margin-block-end: 0px;
          margin-block-start: 0px;
          margin-inline-end: 0px;
          margin-inline-start: 0px;
        }
        img {
          height: 100%;
          width: 100%;
          overflow: hidden;
          object-fit: cover;
        }
      </style>
    </body>
  </html>
  """.replaceAll("\\n", "").replaceAll("\\r", "").replaceAll("<p></p>", "");

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel("Report", onMessageReceived: (message) {
        ILog.debug("?????? from channel", message.message);
        if (_height != 0) {
          return;
        }
        setState(() {
          _height = double.parse(message.message) * 0.55;
        });
      },)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) async {
            // 需要等待runJavaScriptReturningResult的异步返回结果

            var s = await _controller.runJavaScriptReturningResult("document.documentElement.scrollHeight;");
            var o = await _controller.runJavaScriptReturningResult("document.documentElement.offsetHeight;");

            ILog.debug("?????? test", "$s ??? $o");

            var result = await _controller.runJavaScriptReturningResult("document.documentElement.scrollHeight;");

            // 解析结果，注意返回的是一个JavaScript对象（可能是String）
            ILog.debug("?????? from onPageFinished raw result", result);

            if (result is String) {
              // 将JavaScript返回的值转换为double类型
              double? height = double.tryParse(result);
              if (height != null) {
                setState(() {
                  _height = height * 0.55;
                });
              }
              ILog.debug("?????? from onPageFinished parsed height", height);
            }
            else if (result is num) {
              ILog.debug("?????? onPageFinished result is a num", result);
              setState(() {
                _height = result.toDouble() * 0.55;
              });
            }
            else {
              ILog.debug("?????? onPageFinished result is nothing", result);
            }
          },
        )
      )
      ..loadHtmlString(_url);

    ILog.debug("??????", _url);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: _height, child: WebViewWidget(controller: _controller),)
      ],
    );
  }
}