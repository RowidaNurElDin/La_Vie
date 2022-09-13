// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:la_vie/Cubit/lavie_cubit.dart';
// import 'package:la_vie/Cubit/lavie_states.dart';
// import 'package:la_vie/white_borders_qr.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
//
// class QRScreen extends StatelessWidget {
//   Color? overlayColour;
//   final GlobalKey qKey = GlobalKey(debugLabel: 'QR');
//   MobileScannerController? controller = MobileScannerController();
//   bool screenOpened = false;
//   Barcode? thisBarcode;
//   void foundQR(Barcode barcode , MobileScannerArguments? args){
//     if(!screenOpened){
//
//       final String code = barcode.rawValue??"---";
//       thisBarcode = barcode;
//       print("QR code found $code");
//       screenOpened = true;
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit, LaVieStates>(
//         listener: (context, states) {},
//         builder: (context, states) {
//           return Scaffold(
//               body: SafeArea(
//                 child: Stack(
//                   children: [
//                     MobileScanner(
//                       allowDuplicates: true,
//                       controller: controller,
//                         onDetect: foundQR),
//
//
//
//                     QRScannerOverlay(
//                         overlayColour: Colors.black.withOpacity(0.5)),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: 550,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             width: 500,
//                             height: 80,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 color: Colors.grey),
//                             child: Center(
//                               child: thisBarcode!.rawValue != null
//                                   ? Text('${thisBarcode!.rawValue}')
//                                   : Text(
//                                 'Scan a code',
//                                 style: TextStyle(
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ));
//         });
//   }
// }




import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Cubit/lavie_cubit.dart';
import 'package:la_vie/Cubit/lavie_states.dart';
import 'package:la_vie/Screens/MobileApp/one_blog_screen.dart';
import 'package:la_vie/Screens/MobileApp/scanned_blog_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:la_vie/white_borders_qr.dart';
//import 'package:mobile_scanner/mobile_scanner.dart';

class QRScreen extends StatefulWidget {
  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  Color? overlayColour;

  final GlobalKey qKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;

  Barcode? result;

  void qr(QRViewController controller) {
    controller.resumeCamera();
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event;
      });
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
              body: SafeArea(
                child: Stack(
            children: [
                  QRView(
                  key: qKey,
                  onQRViewCreated: qr,
                  ),

                 QRScannerOverlay(
                    overlayColour: Colors.black.withOpacity(0.5)),
                 Column(
                  children: [
                    SizedBox(
                          height: 550,
                        ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 500,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.withOpacity(0.8)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: result== null ? Text("       ---------------")  :
                                  Text('Successfully Scanned!' , style: TextStyle(
                                    fontFamily: 'Poppins' ,
                                    fontWeight: FontWeight.bold,

                                  ), )),
                              ElevatedButton(
                                  onPressed: () {

                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (BuildContext context) =>  ScannedBlogScreen(
                                            plant: BlogCubit.get(context).findByID(result!.code!)
                                        )));
                                  },
                                  child: Center(
                                    child: Icon(
                                     result == null ? Icons.remove : Icons.arrow_forward_outlined,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(100.0),
                                              side: BorderSide(
                                                  color: Colors.green[500]!)))))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

            ],
          ),
              ));

  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }


}
