import 'package:app/navkeys.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ci.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

AppBar customAppBar() {
  return AppBar(
      leading: InkWell(
        onTap: () => Navigation.mainNavigation.currentState!.pop(),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: const Iconify(
            MaterialSymbols.arrow_back_ios_rounded,
            color: Colors.white,
            size: 44,
          ),
        ),
      ),
      backgroundColor: const Color(0xff181818),
      elevation: 0,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: const Iconify(
            Ci.menu_alt_02,
            color: Colors.white,
            size: 44,
          ),
        )
      ]);
}
