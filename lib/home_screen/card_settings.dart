import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/text_styles.dart';
import '../widgets/list_tile_widget.dart';

class CardSettings extends StatelessWidget {
  const CardSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.clear,
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Card Settings",
                style: headingTextStyle.copyWith(
                    fontWeight: FontWeight.w500, fontSize: 24)),
            SizedBox(height: 20),
            ListTileWidget(
              title: ("Add Money"),
              subtitle: ("Add money to your balance"),
              onTap: () {},
            ),
            const Divider(),
            ListTileWidget(
              title: ("Transfer money"),
              subtitle: ("Send funds to another user"),
              onTap: () {},
            ),
            const Divider(),
            Text("Card Settings".toUpperCase(),
                style: TextStyle(
                    letterSpacing: 3.5, fontWeight: FontWeight.bold)),
            const Divider(),
            ListTileWidget(
              title: ("Set PIN"),
              subtitle: ("Set a new PIN code for your card"),
              onTap: () {},
            ),
            const Divider(),
            ListTileWidget(
              title: ("Set a Secure Passcode"),
              subtitle: ("Set passcode used in online transactions"),
              onTap: () {},
            ),
            const Divider(),
            ListTileWidget(
              title: "Card Details",
              subtitle: "Show account number, EXP date, and CVV",
              onTap: () {},
            ),
            const Divider(),
            ListTileWidget(
              title: "Suspend Card",
              subtitle: "Temporarily block all card usage",
              onTap: () {},
            ),
            const Divider(),
            Text(
              "Help and Support".toUpperCase(),
              style: const TextStyle(
                  letterSpacing: 3.5, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            ListTileWidget(
              title: "Get help",
              subtitle: "Call for customer support",
              onTap: () {},
            ),
            const Divider(),
            ListTileWidget(
              title: "Email our Customer Support team",
              subtitle: "Contact Support",
              onTap: () {},
            ),
            const Divider(),
            ListTileWidget(
              title: "Report Lost or Stolen Card",
              subtitle: "Close your card and request a replacement",
              onTap: () {},
            ),
            const Divider(),
            ListTileWidget(
              title: "Monthly Statements",
              subtitle: "Download transactions info into a PDF",
              onTap: () {},
            ),
            const Divider(),
             Text("LEGAL".toUpperCase(),
                style: const TextStyle(
                    letterSpacing: 3.5, fontWeight: FontWeight.bold)),
            const Divider(),
            ListTileWidget(
              title: "Cardholder agreement",
              subtitle: "Download transactions info into a PDF",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
