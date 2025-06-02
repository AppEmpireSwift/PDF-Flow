import 'package:PDF_Flow/app/ui/convert/widgets/appbar.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/convert_button.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/convert_format.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
       // crossAxisAlignment: CrossAxisAlignment.center, // ← Добавьте это

        children: [
          ConvertOptionSelector(title: 'Convert to', formats: formats),
          ConvertButton(isEnabled: true, onPressed: (){} ),        
          ],
      ),
    );
  }
}
