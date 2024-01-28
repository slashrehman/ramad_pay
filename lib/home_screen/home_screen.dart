import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_basics/app_routes.dart';
import '../utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false); // if true allow back else block it
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 140,
              centerTitle: false,
              pinned: true,
              leadingWidth: 0.0,
              flexibleSpace: FlexibleSpaceBar(titlePadding: EdgeInsets.only(left: 32, bottom: 16),
                title:  Text(
                  "USD\$18.0".toUpperCase(),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                expandedTitleScale: 1,
                centerTitle: false,
                collapseMode: CollapseMode.pin,
                background:  Padding(
                  padding: const EdgeInsets.only(top: 95.0, left: 32),
                  child: Text("Current Balance".toUpperCase(), style: TextStyle(color: Colors.black, fontSize: 12,  fontWeight: FontWeight.w600,letterSpacing: 1.3)),
                ),
              ),
              actions: [
                IconButton(onPressed: (){
                  // Get.toNamed(AppRoutes.accountSettings);
                }, icon: const Icon(Icons.edit)),
                IconButton(onPressed: (){
                  // Get.toNamed(AppRoutes.cardSettings);
                }, icon: const Icon(Icons.menu_sharp))
              ],
            ),
            // SliverToBoxAdapter(
            //   child: Column(
            //     children: [
            //       // CreditCardWidget(
            //       //   // backgroundImage: logoAzizCard,
            //       //   cardNumber: "52225 7890 0987 2311",
            //       //   cardBgColor: primaryColor,
            //       //   bankName: "Aziz Card",
            //       //   expiryDate: "03/25",
            //       //   cardHolderName: "ABDUL RAHMAN",
            //       //   cvvCode: "900",
            //       //   chipColor: Colors.brown,
            //       //   cardType: CardType.mastercard,
            //       //   customCardTypeIcons: [
            //       //     CustomCardTypeIcon(cardType: CardType.rupay, cardImage: Text(logoAzizCard))
            //       //   ],
            //       //   // showBackView: true,
            //       //   onCreditCardWidgetChange: (CreditCardBrand ) {
            //       //     print("Payment change called\n ${CreditCardBrand.brandName} ${CreditCardBrand}");
            //       // }, showBackView: false, //true when you want to show cvv(back) view
            //       // ),
            //     ],
            //   ),
            // ),
            SliverList(
                delegate: SliverChildBuilderDelegate(childCount: 20,
                    (BuildContext context, int index) {
              return  Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  "Transaction History",
                  textScaleFactor: 2,
                ),
              );
            })),
          ],
        ),
      ),
    );
  }
}
