import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'appColors.dart';

class AppTextStyles{

  // Style para a frase da tela de login
  static final TextStyle text1 = GoogleFonts.notoSans(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w400
  );

  // Style para o botão de "Sign Up"
  static final TextStyle signup_text = GoogleFonts.notoSans(
      color: Colors.black,
      fontSize: 21,
      fontWeight: FontWeight.bold
  );

  // Style para os títulos
  static final TextStyle title = GoogleFonts.notoSans(
      color: Colors.black,
      fontSize: 40,
      fontWeight: FontWeight.bold
  );

  static final TextStyle heading15 = GoogleFonts.notoSans(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle bodyWhite = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle bodybold18 = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle body = GoogleFonts.notoSans(
    color: AppColors.grey,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle heading40 = GoogleFonts.notoSans(
    color: Colors.black,
    fontSize: 40,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle body20 = GoogleFonts.notoSans(
    color: AppColors.grey,
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );


}

