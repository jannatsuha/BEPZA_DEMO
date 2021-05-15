import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tutorial/provider/localization_provider.dart';
import 'package:tutorial/provider/theme_provider.dart';
import 'package:tutorial/util/app_constant.dart';
import 'package:tutorial/util/color_resources.dart';
import 'package:tutorial/util/dimensions.dart';
import 'package:tutorial/util/styles.dart';
import 'package:tutorial/view/screen/details/device_info.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonExist;
  final Function onBackPressed;
  final double appBarSize;
  final bool isHomeScreen;
  final bool isProdctScreen;
  final bool isHomeScreenBepza;

  CustomAppBar(
      {@required this.title,
      this.isBackButtonExist = true,
      this.onBackPressed,
      this.appBarSize = 50,
      this.isHomeScreen = false,
        this.isHomeScreenBepza=false,
      this.isProdctScreen = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: Theme.of(context).textTheme.bodyText1.color)),
      centerTitle: true,
      leading: isBackButtonExist
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Theme.of(context).textTheme.bodyText1.color,
              onPressed: () => onBackPressed != null ? onBackPressed() : Navigator.pop(context),
            )
          : SizedBox(),
      backgroundColor: Theme.of(context).accentColor,
      elevation: 0,
      actions: [
        isHomeScreenBepza
            ? IconButton(
            icon: Icon(Icons.ad_units_outlined, color: ColorResources.getPrimaryColor(context)),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => DeviceInfo
                    ()));
            })
            : SizedBox.shrink(),
        isHomeScreen
            ? IconButton(
                icon: Icon(Icons.language, color: ColorResources.getPrimaryColor(context)),
                onPressed: () {
                  Provider.of<LocalizationProvider>(context, listen: false).locale.countryCode == 'US'
                      ? Provider.of<LocalizationProvider>(context, listen: false).setLanguage(Locale(
                          AppConstant.languages[1].languageCode,
                          AppConstant.languages[1].countryCode,
                        ))
                      : Provider.of<LocalizationProvider>(context, listen: false).setLanguage(Locale(
                          AppConstant.languages[0].languageCode,
                          AppConstant.languages[0].countryCode,
                        ));
                })
            : SizedBox.shrink(),
        isHomeScreen
            ? IconButton(
                icon: Icon(Icons.theater_comedy, color: ColorResources.getPrimaryColor(context)),
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                })
            : SizedBox.shrink(),
        isProdctScreen
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                Text(" A")
              )
            : SizedBox.shrink(),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, appBarSize);
}
