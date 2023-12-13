import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:voco_case/view/home_screen.dart';
import '../Utils/colors.dart';

class CustomStyle {
  static const TextStyle primaryTextStyle = TextStyle(
    fontSize: 16,
    color: thirdPrimaryColor,
    fontWeight: FontWeight.normal,
      fontFamily: 'Red Hat Display'
  );

  static const TextStyle secondTextStyle = TextStyle(
    fontSize: 16,
    color: primaryColor,
    fontWeight: FontWeight.normal,
      fontFamily: 'Red Hat Display'
  );

  static const TextStyle thirdTextStyle = TextStyle(
    fontSize: 16,
    color: cardColor,
    fontWeight: FontWeight.normal,
    fontFamily: 'lato'
  );

  static const TextStyle colorTextStyle = TextStyle(
      fontSize: 14,
      color: hold,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w600,
      fontFamily: 'Red Hat Display'
  );

  static const TextStyle priceTotalTextStyle = TextStyle(
      fontSize: 28,
      color: hold,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w600,
      fontFamily: 'Red Hat Display'
  );

  static BoxDecoration primaryBoxDecoration = BoxDecoration(
      border: Border.all(color: primaryColor),
      borderRadius: BorderRadius.circular(15)
  );

  static BoxDecoration secondBoxDecoration = BoxDecoration(
      color: secondaryPrimaryColor,
      border: Border.all(color: secondaryPrimaryColor),
      borderRadius: BorderRadius.circular(15)
  );

  static BoxDecoration correctBoxDecoration = BoxDecoration(
      color: primaryColor,
      border: Border.all(color: secondaryPrimaryColor),
      borderRadius: BorderRadius.circular(15)
  );

  static BoxDecoration cardBoxDecoration = BoxDecoration(
    color: cardColor,
    borderRadius: BorderRadius.circular(7),
    boxShadow:  [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  );

  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: secondaryPrimaryColor,
    padding: const EdgeInsets.symmetric(vertical: 18),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15), // <-- Radius
    ),
  );

  static ButtonStyle deletedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: pending,
    padding: const EdgeInsets.symmetric(vertical: 18),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15), // <-- Radius
    ),
  );
}

InputDecoration inputDecoration(TextStyle textStyle, String text) {
  return InputDecoration(
      labelText: text,
      labelStyle: textStyle,
      errorStyle: TextStyle(color: primaryColor, fontSize: 16.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: primaryColor,
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: primaryColor,
          )
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: primaryColor,
          )
      )
  );
}

const spinkit = SpinKitRipple(
  color: primaryColor,
  size: 35.0,
);

const spinkitSecondary = SpinKitRipple(
  color: thirdPrimaryColor,
  size: 40.0,
);

showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: primaryColor,
      fontSize: 14.0
  );
}
/*
void showAlertDialog(BuildContext context, String title, String message) {
  AlertDialog alertDialog = AlertDialog(
    title: Text(title),
    content: Text(message),
  );
  showDialog(context: context, builder: (_) => alertDialog);

}*/

void showExitDialog(BuildContext context, String title, String message) {
  Dialogs.materialDialog(
      msg: message,
      title: title,
      color: Colors.white,
      context: context,
      dialogWidth: kIsWeb ? 0.3 : null,
      onClose: (value) => print("returned value is '$value'"),
      actions: [
        IconsOutlineButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          text: 'Hayır',
          iconData: Icons.cancel_outlined,
          textStyle: const TextStyle(color: Colors.grey),
          iconColor: Colors.grey,
        ),
        IconsButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          text: "Evet",
          iconData: Icons.check_circle_outline,
          color: Colors.red,
          textStyle: const TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ]);
}

void showAlertDialog2(BuildContext context, String title, String message) {
  Dialogs.materialDialog(
      msg: message,
      title: title,
      color: Colors.white,
      context: context,
      dialogWidth: kIsWeb ? 0.3 : null,
      onClose: (value) => print("returned value is '$value'"),
      actions: [
        IconsButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          text: "Kapat",
          iconData: Icons.close,
          color: Colors.red,
          textStyle: const TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ]);
}

