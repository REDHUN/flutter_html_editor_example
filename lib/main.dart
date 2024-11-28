import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HtmlEditorLivePreview(),
    );
  }
}

class HtmlEditorLivePreview extends StatefulWidget {
  @override
  _HtmlEditorLivePreviewState createState() => _HtmlEditorLivePreviewState();
}

class _HtmlEditorLivePreviewState extends State<HtmlEditorLivePreview> {
  // Controller to manage the HTML editor
  final HtmlEditorController controller = HtmlEditorController();

  // Variable to hold live HTML code
  String liveHtmlCode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTML Editor Live Preview'),
      ),
      body: Column(
        children: [
          // HTML Editor
          Expanded(
            child: HtmlEditor(
              controller: controller,
              htmlEditorOptions: HtmlEditorOptions(
                hint: "Type your HTML content here...",
                adjustHeightForKeyboard: true,
                autoAdjustHeight: true,
              ),
              htmlToolbarOptions: HtmlToolbarOptions(
                defaultToolbarButtons: [
                  StyleButtons(),
                  FontButtons(),
                  ListButtons(),
                  ParagraphButtons(),
                  InsertButtons(),
                ],
                toolbarPosition: ToolbarPosition.aboveEditor,
              ),
              callbacks: Callbacks(
                onChangeContent: (String? htmlContent) {
                  setState(() {
                    liveHtmlCode = htmlContent ?? ""; // Update live HTML code
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Display live HTML code
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.grey[200],
              child: SingleChildScrollView(
                child: Text(
                  liveHtmlCode,
                  style: const TextStyle(fontFamily: 'Monospace'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
