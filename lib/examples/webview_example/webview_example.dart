import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

void main() {
  runApp(const WebViewWrapperView());
}

class WebViewWrapperView extends StatefulWidget {
  const WebViewWrapperView({super.key});

  @override
  State<WebViewWrapperView> createState() => _WebViewWrapperViewState();
}

class _WebViewWrapperViewState extends State<WebViewWrapperView> {

  late WebViewController _controller;

  @override
  void initState() {
    super.initState();

    PlatformWebViewControllerCreationParams params;

    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    }
    else {
      params = const PlatformWebViewControllerCreationParams();
    }

    _controller = WebViewController.fromPlatformCreationParams(params);
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _controller.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      )
    );

    // _controller.loadRequest(Uri.parse('https://wala-land.com/'));

    // String webString = """
    // <style>body {font-size: 46px;}</style><p>K-CULTURAL LIFESTYLE PLATFORM, 왈라랜드는</p><p>매일 업데이트되는 셀럽들의 패션 콘텐츠와</p><p>AI기반 이미지 검색 서비스를 통해 지금까지 경험해 보지 못한</p><p>새로운 쇼핑 환경을 제공합니다. 럭셔리 · 스트릿 · 캐주얼을 아우르는 다양한 카테고리는 물론</p><p>국내·외 디자이너 브랜드 입점까지!</p><p>패션, 뷰티, 라이프스타일 전반에 걸친 다양한 상품을 확인해 보세요.</p> <p><br></p><p><br></p><p>[궁금한 점이 있다면 문의 주세요] </p><p>앱내 고객센터 ‘1:1문의’ 또는 전용 메일을 통해 문의해 주세요.</p><p>고객센터 E-mail cs@w-a-l-a.com</p>
    // """;

    String webString = """<p><img src="https://d2pw36ijlx16fz.cloudfront.net/editor/product/9861c34a-b9fb-476e-b5c1-bb30084f61a0.png"><img src="https://d2pw36ijlx16fz.cloudfront.net/editor/product/4994556b-c549-429b-8303-de053f204b3b.png"><img src="https://d2pw36ijlx16fz.cloudfront.net/editor/product/31dabce3-06bb-4848-a3ec-e8c5f960f080.png"></p>""";

    String content = """
      <!DOCTYPE html>
        <html>
          <head>
            <meta name="viewport" content="width=device-width" />
            <link rel="stylesheet" href="http://cdn.quilljs.com/1.3.6/quill.snow.css" />
          </head>
          <body>
             ${webString.replaceAll("src=\"//", "src=\"https://")}
          </body>
          <script>
            const myIframe = document.querySelector("iframe");
            const hasWebShare = "canShare" in navigator;
            if (hasWebShare) {
              myIframe.allow = "web-share";
            }
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
        </html>
      """;

    // _controller.loadHtmlString('');

    _controller.loadHtmlString(content);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: WebViewWidget(controller: _controller));
  }
}
