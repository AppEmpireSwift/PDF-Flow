import 'package:PDF_Flow/app/ui/convert/widgets/appbar.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/convert_button.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/convert_format.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/selectable_file.dart';
import 'package:PDF_Flow/app/ui/settings/widgets/search_field.dart';
import 'package:PDF_Flow/style/color.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GalleryFirstPage extends StatelessWidget {
  const GalleryFirstPage({Key? key}) : super(key: key);

  void _onFormatSelected(String format) {
    print('Выбран формат: $format');
  }

  @override
  Widget build(BuildContext context) {
    final formats = [
      ConvertFormat(
        label: 'PDF',
        icon: Icons.picture_as_pdf,
        onTap: () => _onFormatSelected('PDF'),
      ),
      ConvertFormat(
        label: 'JPG',
        icon: Icons.image,
        onTap: () => _onFormatSelected('JPG'),
      ),
      ConvertFormat(
        label: 'PNG',
        icon: Icons.image_outlined,
        onTap: () => _onFormatSelected('PNG'),
      ),
      ConvertFormat(
        label: 'DOCX',
        icon: Icons.description,
        onTap: () => _onFormatSelected('DOCX'),
      ),
      ConvertFormat(
        label: 'TXT',
        icon: Icons.text_snippet,
        onTap: () => _onFormatSelected('TXT'),
      ),
    ];

    return Scaffold(
      appBar: const CustomAppBar(title: 'Мой экран'),
      body: Container(
        color: ColorStyles.Background,
        // child: Padding (margin
        child: Container(
          margin: EdgeInsets.all(10.r),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center, // ← Добавьте это
            children: [
              SelectableFileWidget(
                onTap: () {},
                head: 'Files',
                text: 'Click here for photo selection',
              ),
              ConvertOptionSelector(title: 'Convert to', formats: formats),
              ConvertButton(isEnabled: true, onPressed: () {}),
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: TextField(
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter your text here',
                    filled: true,
                    fillColor: ColorStyles.Surface,
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
