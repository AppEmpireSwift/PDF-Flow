import 'package:PDF_Flow/app/ui/convert/widgets/appbar.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/conversion_success.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/convert_button.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/convert_format.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/loading_overlay.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/text_field.dart';
import 'package:PDF_Flow/style/color.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextConvertPage extends StatefulWidget {
  const TextConvertPage({Key? key}) : super(key: key);

  @override
  State<TextConvertPage> createState() => _TextConvertPageState();
}

class _TextConvertPageState extends State<TextConvertPage> {
  bool isLoading = false;
  bool showSuccess = false;

  void _onFormatSelected(String format) {
    print('Выбран формат: $format');
  }

  void _startConversion() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
        showSuccess = true;
      });
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

    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        backgroundColor: ColorStyles.Background,
        appBar: const CustomAppBar(
          title: 'Convert text',
          backgroundColor: ColorStyles.Background,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Container(
                    color: ColorStyles.Background,
                    padding: EdgeInsets.all(10.w),
                    child:
                        showSuccess
                            ? const ConversionSuccess()
                            : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextInputWidget(
                                    head: 'Text',
                                    text: 'Enter text here',
                                    expands: true,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                ConvertOptionSelector(
                                  title: 'Convert to',
                                  initialFormats: formats,
                                  hasExtendedSettings: true,
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 20.h),
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
            );
          },
        ),
      ),
    );
  }
}
