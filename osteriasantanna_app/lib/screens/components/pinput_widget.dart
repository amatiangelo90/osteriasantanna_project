
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../../utils/costants.dart';
import '../../databundle/databundleprovider.dart';
import '../menu/home_screen.dart';

class PinputWidget extends StatefulWidget {
  const PinputWidget({Key? key}) : super(key: key);

  @override
  State<PinputWidget> createState() => _PinputWidgetState();
}

class _PinputWidgetState extends State<PinputWidget> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Consumer<DataBundleNotifier>(
      builder: (child, data, _){
        return Directionality(
          // Specify direction if desired
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Pinput(
              controller: pinController,
              focusNode: focusNode,
              androidSmsAutofillMethod:
              AndroidSmsAutofillMethod.smsUserConsentApi,
              defaultPinTheme: defaultPinTheme,
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                if(pin == CURRENT_PASSWORD){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.green,
                        content: Text('Modalità gestione attiva!'),
                      )
                  );
                  data.turnManagerAccess();
                  Navigator.pushNamed(context, HomeScreen.id);

                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.redAccent,
                        duration: Duration(seconds: 2),
                        content: Text('Password errata'),
                      )
                  );
                  Navigator.of(context).pop();
                }
              },

              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}