import 'dart:io';

// import 'package:coin_analyzer/app/core/internal/ui.dart';
// import 'package:coin_analyzer/app/core/router/app_router.gr.dart';
// import 'package:coin_analyzer/app/data/models/coin.dart';
// import 'package:coin_analyzer/app/data/repository/coin_repo.dart';
// import 'package:coin_analyzer/app/data/repository/helpers.dart';
// import 'package:coin_analyzer/app/presentation/widgets/search_field.dart';
import 'package:PDF_Flow/app/ui/settings/widgets/search_field.dart';
import 'package:PDF_Flow/style/color.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorStyles.Surface,
          centerTitle: true,
          toolbarHeight: 93.h,
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            // onTap: () {
            //   context.read<CoinRepo>().searchString = '';
            //   AutoRouter.of(context).removeLast();
            // },
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/Arrow Left.svg',
                    width: 32.w,
                    height: 32.h,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Expanded(
             child: SearchField(
                autoFocus: true,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                updateText: true,
                // onChanged: (text) => context.read<CoinRepo>().searchString = text,
                // // text: context.watch<CoinRepo>().searchString,
                              text: '',
                width: double.infinity,
                    // context.read<Helpers>().isTablet
                    //     ? (context.read<Helpers>().isPortrait ? 759.w : 1100.w)
                    //     : 312.w,
                height: 36.h,
                prefix: SvgPicture.asset('assets/icons/search.svg'),
              ),
            ),
            SizedBox(width: 10.w),
          TextButton( // 4. Добавить кнопку Cancel
            onPressed: () {
              // Действие при нажатии (например, закрыть поиск)
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                color: ColorStyles.Red,
                fontSize: 16.sp,
              ),
            ),
          ),
          ],
        ),

        backgroundColor: ColorStyles.Background
      ),
    );
  }
}