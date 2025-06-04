import 'package:PDF_Flow/app/ui/convert/widgets/appbar.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/conversion_success.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/convert_button.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/convert_format.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/selectable_file.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/text_field.dart';
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
      appBar: const CustomAppBar(
        title: 'Convert from gallery',
        backgroundColor: ColorStyles.Background,
      ),
      body: Container(
        color: ColorStyles.Background,
        // child: Padding (margin
        child: Container(
          margin: EdgeInsets.all(10.r),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // ← Добавьте это
            children: [
              SelectableFileWidget(
                onTap: (){},
                head: 'Files',
                text: 'Click here for photo selection',
              ),
              ConvertOptionSelector(
                title: 'Convert to',
                initialFormats: formats,
              ),
              Spacer(), // ← Добавьте это

              Align(
                alignment: Alignment.bottomCenter,
                child: ConvertButton(isEnabled: true, onPressed: () {}),
              ),
              // TextInputWidget(onTap: (){},  head: 'Text', text: 'Enter your text here')
              // ConversionSuccess(),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
