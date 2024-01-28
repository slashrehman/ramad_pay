import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ramad_pay/app_basics/colors.dart';

class NoInterNetConnectionView extends StatefulWidget {
  final VoidCallback callback;

  const NoInterNetConnectionView({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  _NoInterNetConnectionViewState createState() =>
      _NoInterNetConnectionViewState();
}

class _NoInterNetConnectionViewState extends State<NoInterNetConnectionView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      decoration: const BoxDecoration(
          color: Color(0xff151B22),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 27),
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/icons/no_wifi.svg',
                  ),
                ),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: InkWell(
                //     onTap: (() {
                //       Navigator.pop(context);
                //     }),
                //     child: const Icon(
                //       Icons.cancel,
                //       color: Colors.white,
                //       size: 30,
                //     ),
                //   ),
                // )
              ],
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'You are not connected to the internet.\nPlease check your connection and\n try again.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                  height: 1.30,
                ),
              ),
            ),
            const SizedBox(height: 24),
            MaterialButton(
              onPressed: () {
                widget.callback();

                // IinvsetManager.isConnectingInternet == false
                Navigator.of(context).pop();
                // : const SizedBox();
              },
              minWidth: double.infinity,
              height: 48,
              color: const Color(0xffF85149),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    Text(
                      'Try Again',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}