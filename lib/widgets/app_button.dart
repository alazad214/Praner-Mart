import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final bool? isBorder;
  final bool? isLoading;
  final loadingText;

  const AppButton({
    super.key,
    required this.text,
    this.onTap,
    this.isBorder,
    this.isLoading,
    this.loadingText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isBorder == true ? null : AppColor.yaleBlue,
          border:
              isBorder == true ? Border.all(color: AppColor.yaleBlue) : null,
          borderRadius: BorderRadius.circular(45),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: isLoading == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      loadingText ?? ' ',
                      style: GoogleFonts.poppins(
                          color: isBorder == true
                              ? AppColor.primary
                              : Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              : Center(
                  child: Text(
                    text,
                    style: GoogleFonts.poppins(
                        color:
                            isBorder == true ? AppColor.primary : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
        ),
      ),
    );
  }
}
