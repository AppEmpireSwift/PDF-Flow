import 'package:PDF_Flow/app/ui/convert/widgets/appbar.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/conversion_success.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/convert_button.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/convert_format.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/dropdownlist.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/loading_overlay.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/selectable_file.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/text_field.dart';
import 'package:PDF_Flow/style/color.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinkPage extends StatefulWidget {
  const LinkPage({Key? key}) : super(key: key);

  @override
  State<LinkPage> createState() => _GalleryFirstPageState();
}

class _GalleryFirstPageState extends State<LinkPage> {
  bool isLoading = false;
  bool showSuccess = false;

  void _onFormatSelected(String format) {
    print('Выбран формат: $format');
  }

  void _startConversion() {
    setState(() {
      isLoading = true;
    });

    // Для примера — симуляция загрузки
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
        showSuccess = true;
      });

      // тут можно переходить к следующему состоянию
      // например, показывать ConversionSuccess или snackbar
    });
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

    // return LoadingOverlay(
    //   isLoading: isLoading,
    //   child: Scaffold(
    //     appBar: const CustomAppBar(
    //       title: 'Convert link',
    //       backgroundColor: ColorStyles.Background,
    //     ),
    //     body: Container(
    //       color: ColorStyles.Background,
    //       child: Container(
    //         margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.w),
    //         child: showSuccess
    //             ? const ConversionSuccess()
    //             : Column(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   TextInputWidget(head: 'Link', text: 'Enter link here'),
    //                   ConvertOptionSelector(
    //                     title: 'Convert to',
    //                     initialFormats: formats,
    //                   ),
    //                   const Spacer(),
    //                   Align(
    //                     alignment: Alignment.bottomCenter,
    //                     child: ConvertButton(
    //                       isEnabled: true,
    //                       onPressed: _startConversion,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //       ),
    //     ),
    //   ),
    // );

    return LoadingOverlay(
  isLoading: isLoading,
  child: Scaffold(
    backgroundColor: ColorStyles.Background,
    appBar: const CustomAppBar(
      title: 'Convert link',
      backgroundColor: ColorStyles.Background,
    ),
    body: LayoutBuilder( // ← Добавьте LayoutBuilder
      builder: (context, constraints) {
        return SingleChildScrollView( // ← И SingleChildScrollView
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight( // ← Сохраняет естественную высоту
              child: Container(
                color: ColorStyles.Background,
                child: Container(
                  margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.w),
                  child: showSuccess
                      ? const ConversionSuccess(text: 'Conversion completed',)
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextInputWidget(head: 'Link', text: 'Enter link here'),
                            ConvertOptionSelector(
                              title: 'Convert to',
                              initialFormats: formats,
                            ),
                            Spacer(), // ← Будет работать с IntrinsicHeight
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ConvertButton(
                                isEnabled: true,
                                onPressed: _startConversion,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        );
      },
    ),
  ),
);
  }
}
