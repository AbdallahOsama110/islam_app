import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:islam_app/gen/assets.gen.dart';

import '../../../../generated/l10n.dart';
import '../../data/model/button_data_model.dart';
import 'widget/others_list_view_buttons.dart';

class OthersView extends StatelessWidget {
  const OthersView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var buttonDataList = [
      ButtonDataModel(
        title: S.of(context).sebha,
        icon: const Icon(FlutterIslamicIcons.tasbihHand),
        route: '/tasbeh',
        imagePath: Assets.images.tasbeh.tasbeh.path,
      ),
      ButtonDataModel(
        title: S.of(context).azkar,
        icon: const Icon(FlutterIslamicIcons.prayer),
        route: '/azkarCategory',
        imagePath: Assets.images.azkar.azkar1.path,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(S.of(context).otherServices),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return OthersListViewButtons(
                        size: size, buttonData: buttonDataList[index]);
                  },
                  itemCount: buttonDataList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
