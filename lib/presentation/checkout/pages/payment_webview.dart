// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_android/webview_flutter_android.dart';
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

// class PaymentWebView extends StatefulWidget {
//   final String checkoutUrl;

//   const PaymentWebView({super.key, required this.checkoutUrl});

//   @override
//   State<PaymentWebView> createState() => _PaymentWebViewState();
// }

// class _PaymentWebViewState extends State<PaymentWebView> {
//   late final WebViewController _controller;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();

//     // ✅ Choose platform-specific parameters
//     late final PlatformWebViewControllerCreationParams params;

//     if (WebViewPlatform.instance is WebKitWebViewPlatform) {
//       // iOS setup
//       params = WebKitWebViewControllerCreationParams(
//         allowsInlineMediaPlayback: true,
//         mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
//       );
//     } else {
//       // Android setup
//       params = const PlatformWebViewControllerCreationParams();
//     }

//     final controller = WebViewController.fromPlatformCreationParams(params);

//     controller
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(Colors.white)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageStarted: (url) {
//             debugPrint("🌍 Page started loading: $url");
//             setState(() => isLoading = true);
//           },
//           onPageFinished: (url) {
//             debugPrint("✅ Page finished loading: $url");
//             setState(() => isLoading = false);
//           },
//           onNavigationRequest: (request) {
//             debugPrint("➡️ Navigating to: ${request.url}");

//             // ✅ Detect successful payment redirect
//             if (request.url.contains("redirectCallback")) {
//               debugPrint("💰 Payment callback detected, closing WebView...");
//               Navigator.pop(context, true);
//               return NavigationDecision.prevent;
//             }

//             // ✅ Detect failed or cancelled payment
//             if (request.url.contains("cancel") ||
//                 request.url.contains("failed")) {
//               debugPrint("❌ Payment cancelled or failed, closing WebView...");
//               Navigator.pop(context, false);
//               return NavigationDecision.prevent;
//             }

//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(widget.checkoutUrl));

//     // ✅ Android-specific configuration
//     if (controller.platform is AndroidWebViewController) {
//       AndroidWebViewController.enableDebugging(true);
//       (controller.platform as AndroidWebViewController)
//           .setMediaPlaybackRequiresUserGesture(false);
//     }

//     _controller = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Complete Payment"),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Stack(
//         children: [
//           WebViewWidget(controller: _controller),
//           if (isLoading) const Center(child: CircularProgressIndicator()),
//         ],
//       ),
//     );
//   }
// }
