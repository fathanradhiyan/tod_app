part of 'widgets.dart';

Widget menuWidget (Size size, {required String title, required String image, required Color color, required VoidCallback onClick}){
  return Expanded(
    child: GestureDetector(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.all(8),
        height: size.height * 0.35,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10)
          ],
        ),
        child: Center(child: Column(
          children: [
            Expanded(flex: 3, child: LottieBuilder.asset(image)),
            Expanded(child: Text(title, style: GoogleFonts.bioRhyme(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20, letterSpacing: 2),)),
          ],
        )),
      ),
    ),
  );
}