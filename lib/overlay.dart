import 'package:flutter/material.dart';

import 'package:system_alert_window/system_alert_window.dart';

class OverlayService {
  OverlayService() {
    SystemAlertWindow.registerOnClickListener(callBack);
  }

  static void callBack(String tag) {
    WidgetsFlutterBinding.ensureInitialized();
    switch (tag) {
      case "close_action":
        SystemAlertWindow.closeSystemWindow(
            prefMode: SystemWindowPrefMode.OVERLAY);
        break;
      default:
        debugPrint("OnClick event of $tag");
    }
  }

  Future<void> requestPermissions() async {
    await SystemAlertWindow.requestPermissions(
        prefMode: SystemWindowPrefMode.OVERLAY);
  }

  void showOverlayWindow(String title, String message) {
    SystemWindowHeader header = SystemWindowHeader(
        title: SystemWindowText(
          text: "Overlay demo",
          fontSize: 10,
          textColor: Colors.black45,
        ),
        padding: SystemWindowPadding.setSymmetricPadding(12, 12));

    SystemWindowBody body = SystemWindowBody(
      rows: [
        EachRow(
          columns: [
            EachColumn(
              text: SystemWindowText(
                text: title,
                fontSize: 12,
                textColor: Colors.black45,
              ),
            ),
            EachColumn(
              text: SystemWindowText(
                text: message,
                fontSize: 12,
                textColor: Colors.black45,
              ),
            ),
          ],
          gravity: ContentGravity.CENTER,
        ),
      ],
      padding: SystemWindowPadding(
        left: 16,
        right: 16,
        bottom: 12,
        top: 12,
      ),
    );

    SystemWindowFooter footer = SystemWindowFooter(
        buttons: [
          SystemWindowButton(
            text: SystemWindowText(
              text: "Some Actions",
              fontSize: 12,
              textColor: Colors.black,
            ),
            tag: "some_actions",
            padding: SystemWindowPadding(
              left: 10,
              right: 10,
              bottom: 10,
              top: 10,
            ),
            width: 0,
            height: SystemWindowButton.WRAP_CONTENT,
            decoration: SystemWindowDecoration(
                startColor: Colors.white,
                endColor: Colors.white,
                borderWidth: 0,
                borderRadius: 0.0),
          ),
          SystemWindowButton(
            text: SystemWindowText(
              text: "Close Actions",
              fontSize: 12,
              textColor: Colors.black,
            ),
            tag: "close_action",
            padding: SystemWindowPadding(
              left: 10,
              right: 10,
              bottom: 10,
              top: 10,
            ),
            width: 0,
            height: SystemWindowButton.WRAP_CONTENT,
            decoration: SystemWindowDecoration(
                startColor: Colors.white,
                endColor: Colors.white,
                borderWidth: 0,
                borderRadius: 0.0),
          ),
        ],
        padding: SystemWindowPadding(left: 16, right: 16, bottom: 12),
        decoration: SystemWindowDecoration(startColor: Colors.white),
        buttonsPosition: ButtonPosition.CENTER);

    SystemAlertWindow.showSystemWindow(
        height: 230,
        header: header,
        body: body,
        footer: footer,
        margin: SystemWindowMargin(left: 8, right: 8, top: 200, bottom: 0),
        gravity: SystemWindowGravity.TOP,
        notificationTitle: title,
        notificationBody: message,
        prefMode: SystemWindowPrefMode.OVERLAY);
  }
}
