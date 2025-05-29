import 'package:PDF_Flow/app/ui/files/delete_file.dart';
import 'package:PDF_Flow/app/ui/files/password_page.dart';
import 'package:PDF_Flow/app/ui/root/bottomnavigation_pages/convert.page.dart';
import 'package:PDF_Flow/app/ui/files/files.page.dart';
import 'package:PDF_Flow/app/ui/files/filled_file.page.dart';
import 'package:PDF_Flow/app/ui/files/searching_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:PDF_Flow/app/app.dart';
import 'package:PDF_Flow/app/ui/premium/widgets/premium_banner.dart';
import 'package:PDF_Flow/app/ui/settings/settings.page.dart';
import 'package:PDF_Flow/app/ui/statistic/widgets/week_stats.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';
import '../../../gen/assets.gen.dart';
import '../../../style/style.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


  class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


// Список страниц
  final List<Widget> _pages = [
    ConvertPage(),
    DeleteFilesPage(),
    //FilledFilesPage(), 
    // SearchView(),
    //PasswordPage(),
    SettingsPage(), 
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorStyles.Surface,
        currentIndex: 0,
        selectedItemColor: ColorStyles.Outline_red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Переключаем индекс
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.vectors.files1,
              width: 16, // можно задать размер и цвет, если нужно
              height: 20, // для неактивного состояния
            ),
            label: 'Convert',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Files'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _GridItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _GridItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104.w, // адаптивная ширина
      height: 80.h, // адаптивная высота
      child: Material(
        color: const Color(0xFFFFEBEB),
        borderRadius: BorderRadius.circular(12.r),
        child: InkWell(
          onTap: () {}, // обработчик нажатия
          borderRadius: BorderRadius.circular(12.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: ColorStyles.Outline_red, size: 24.r),
              SizedBox(height: 4.h),
              Text(
                label,
                style: TextStyle(
                  color: ColorStyles.Outline_red,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
