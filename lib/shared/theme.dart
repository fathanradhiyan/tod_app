part of 'shared.dart';

const Color borderColor = Color(0xFFEBEBEB);
// const Color darcula = Color(0xFF3D3D3D);
const Color darcula = Color(0xFF2B2727);
const Color lightDarcula = Color(0xFF474444);
const Color cream = Color(0xFFFFF2D7);
const Color thirdColor = Color(0xFFf89b51);
const Color mainColor = Color(0xFF0062a0);
const Color secondaryColor = Color(0xFFfcda32);
const Color minorColor = Color(0xFF29c0d3);
const Color underlineColor = Color(0xFF00BAFF);
const Color blueTransparent = Color(0xFFD9EDFF);
const Color successColor = Color(0xFF00CA71);
const Color errorColor = Color(0xFFD9435E);
const Color maroon = Color(0xFF800000);
const Color borderGrey = Color(0xFFEFEFEF);
const Color backgroundColor = Color(0xFFFAFAFA);
const Color disableColor = Color(0xFFD7D7D7);
const Color card1Color = Color(0xFFF0F0F0);

Color blueBTN = const Color(0xFF0061A7);
Color blue2BTN = const Color(0xFF007FDA);
Color yellowBTN = const Color(0xFFFFDD00);
Color yellow2BTN = const Color(0xFFFFE433);
Color yellowButton = const Color(0xFFFDC000);

Color bluegrotto = const Color(0xFF00619C);
Color aquamarine = const Color(0xFF76A6B8);
Color marsala = const Color(0xFFC69A9E);
Color or4nge = const Color(0xFFFFB067);
Color selectedColorBlue = const Color(0xFFD9EDFF);

const ColorFilter colorFilter =
    ColorFilter.mode(secondaryColor, BlendMode.modulate);

TextStyle mainStyle = GoogleFonts.lato(color: darcula);
// const TextStyle titleTextFont = TextStyle(
//     fontFamily: 'Futura', color: darcula, fontWeight: FontWeight.normal);

// const Widget mainLoading = SpinKitFadingCircle(
//   size: 45,
//   color: mainColor,
// );
//
// const Widget signInLoading = SpinKitFadingCircle(
//   size: 45,
//   color: Colors.white,
// );

Map<int, Color> color = {
  50: const Color.fromRGBO(136, 14, 79, .1),
  100: const Color.fromRGBO(136, 14, 79, .2),
  200: const Color.fromRGBO(136, 14, 79, .3),
  300: const Color.fromRGBO(136, 14, 79, .4),
  400: const Color.fromRGBO(136, 14, 79, .5),
  500: const Color.fromRGBO(136, 14, 79, .6),
  600: const Color.fromRGBO(136, 14, 79, .7),
  700: const Color.fromRGBO(136, 14, 79, .8),
  800: const Color.fromRGBO(136, 14, 79, .9),
  900: const Color.fromRGBO(136, 14, 79, 1),
};
