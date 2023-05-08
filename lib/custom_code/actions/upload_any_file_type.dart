// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future uploadAnyFileType(BuildContext context, List<String>? fileType) async {
  fileType = fileType ?? ['pdf'];
  final selectedFile = await selectFile();
  if (selectedFile != null) {
    FFAppState().update(() {
      FFAppState().isDataUploading = true;
    });
    FFUploadedFile? selectedUploadedFile;
    String? downloadUrl;
    try {
      selectedUploadedFile = FFUploadedFile(
        name: selectedFile.storagePath.split('/').last,
        bytes: Uint8List.fromList(selectedFile.bytes),
      );
      downloadUrl =
          await uploadData(selectedFile.storagePath, selectedFile.bytes);
    } finally {
      FFAppState().update(() {
        FFAppState().isDataUploading = false;
      });
    }
    if (selectedUploadedFile != null && downloadUrl != null) {
      FFAppState().update(() {
        FFAppState().isDataUploading = true;
      });
      // save url to local state
      FFAppState().update(() {
        FFAppState().filePath = downloadUrl!;
      });
    } else {
      return;
    }
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
