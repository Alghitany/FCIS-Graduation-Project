// import 'package:flutter/material.dart';
// import 'package:project/widgets/Customized/custom_button.dart';
// import 'package:project/widgets/Shared/shared_back_arrow.dart';

// class DeveloperViewCertificationScreen extends StatelessWidget {
//   const DeveloperViewCertificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//               vertical: size.height * 0.02, horizontal: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 18.0, left: 8, bottom: 36),
//                 child: Row(
//                   children: [
//                     sharedBackArrow(width, context),
//                     SizedBox(
//                       width: 84,
//                     ),
//                     Text(
//                       'My Certification',
//                       style:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
//                     )
//                   ],
//                 ),
//               ),
//               Text(
//                 'Congrats Certification is  Done',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Container(
//                 width: double.infinity,
//                 height: 406,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage('assets/images/certificate.png'))),
//               ),
//               SizedBox(
//                 height: 48,
//               ),
//               CustomButton(
//                 text: 'Download',
//                 onPressed: () {},
//               ),
//               SizedBox(
//                 height: 24,
//               ),
//               ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       side: BorderSide(color: Color(0xff465697)),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     minimumSize: Size(width * 0.85, 53),
//                   ),
//                   child: Text(
//                     'Update CV',
//                     style: const TextStyle(
//                       color: Color(0xff7D8AC3),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w700,
//                       fontFamily: "Poppins",
//                     ),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:typed_data';
import 'package:flutter/foundation.dart'; // Import for kIsWeb
import 'package:flutter/material.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:html' as html; // Only works for web

class DeveloperViewCertificationScreen extends StatelessWidget {
  const DeveloperViewCertificationScreen({super.key});

  Future<void> _downloadCertificate(BuildContext context) async {
    if (kIsWeb) {
      // Handle web download
      try {
        String assetPath = 'assets/images/certificate.png';

        // Load asset file
        final ByteData data =
            await DefaultAssetBundle.of(context).load(assetPath);
        final Uint8List bytes = data.buffer.asUint8List();

        // Create a blob and trigger download
        final blob = html.Blob([bytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..setAttribute("download", "certificate.png")
          ..click();
        html.Url.revokeObjectUrl(url);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Certificate downloaded successfully!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to download certificate: $e')),
        );
      }
    } else {
      // Handle mobile (Android/iOS) download
      var status = await Permission.storage.request();
      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text('Storage permission is required to download the file.')),
        );
        return;
      }

      try {
        final directory = Platform.isAndroid
            ? await getExternalStorageDirectory()
            : await getApplicationDocumentsDirectory();

        String filePath = '${directory!.path}/certificate.png';
        String assetPath = 'assets/images/certificate.png';

        // Load asset file and write to storage
        final ByteData data =
            await DefaultAssetBundle.of(context).load(assetPath);
        final buffer = data.buffer;

        await File(filePath).writeAsBytes(buffer.asUint8List());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Certificate downloaded to $filePath')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to download certificate: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.02, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 8, bottom: 36),
                child: Row(
                  children: [
                    sharedBackArrow(width, context),
                    const SizedBox(width: 84),
                    const Text(
                      'My Certification',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              const Text(
                'Congrats Certification is Done',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                height: 406,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/certificate.png'))),
              ),
              const SizedBox(height: 48),
              CustomButton(
                text: 'Download',
                onPressed: () => _downloadCertificate(context),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xff465697)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(width * 0.85, 53),
                  ),
                  child: const Text(
                    'Update CV',
                    style: TextStyle(
                      color: Color(0xff7D8AC3),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins",
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
