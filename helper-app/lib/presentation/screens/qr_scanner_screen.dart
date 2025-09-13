import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pizza_mizza_qr_code_scanner/cubits/cubit/take_order_cubit.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  String? scannedData;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TakeOrderCubit>();
    final tableController = TextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('QR Code Scanner'),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
        ),
        body: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 44,
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  child: TextFormField(
                    controller: tableController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      hintText: "Add table number",

                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  child: MobileScanner(
                    onDetect: (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      for (final barcode in barcodes) {
                        setState(() {
                          scannedData = barcode.rawValue;
                        });
                        log('Barcode found! Data: ${barcode.rawValue}');
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 30),
              BlocBuilder<TakeOrderCubit, TakeOrderState>(
                builder: (_, state) {
                  if (state is TakeOrderLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is TakeOrderSuccess) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            cubit.takeOrder(int.parse(tableController.text));
                          },
                          child: Text("Submit"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }
                  if (state is TakeOrderNetworkError) {
                    log("error: ${state.msg}");
                    return Text("error");
                  }
                  if (state is TakeOrderError) {
                    log("error: ${state.msg}");
                    return Text("error");
                  }
                  return SizedBox.shrink();
                },
              ),
              // if (scannedData != null)
              //   Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Text(
              //       'Scanned Data: $scannedData',
              //       style: TextStyle(fontSize: 18),
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
