import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontView extends StatelessWidget {
  const FontView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Google Fonts Tutorial",
            style: GoogleFonts.angkor(fontSize: 20, color: Colors.white)),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "This is Google Fonts.",
              style: TextStyle(fontFamily: "Tilt Warp", fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text("This is Google Fonts.",
                style: GoogleFonts.angkor(fontSize: 20)),
            const SizedBox(height: 20),
            Text("This is Google Fonts.",
                style: GoogleFonts.adamina(fontSize: 20)),
            const SizedBox(height: 20),
            Text("This is Google Fonts.",
                style: GoogleFonts.allan(fontSize: 20)),
            const SizedBox(height: 20),
            Text("This is Google Fonts.",
                style: GoogleFonts.abel(fontSize: 20)),
            const SizedBox(height: 20),
            Text("This is Google Fonts.",
                style: GoogleFonts.abrilFatface(fontSize: 20)),
            const SizedBox(height: 20),
            Text("This is Google Fonts.",
                style: GoogleFonts.b612Mono(fontSize: 20)),
            const SizedBox(height: 20),
            Text("This is Google Fonts.",
                style: GoogleFonts.cabinCondensed(fontSize: 20)),
            const SizedBox(height: 20),
            Text("This is Google Fonts.",
                style: GoogleFonts.damion(fontSize: 20)),
            const SizedBox(height: 20),
            Text("This is Google Fonts.",
                style: GoogleFonts.eagleLake(fontSize: 20)),
            const SizedBox(height: 20),
            Text("This is Google Fonts.",
                style: GoogleFonts.radioCanada(fontSize: 20)),
            const SizedBox(height: 20),
            Text("This is Google Fonts.",
                style: GoogleFonts.gabriela(fontSize: 20)),
            const SizedBox(height: 20),
            Text("This is Google Fonts.",
                style: GoogleFonts.fahkwang(fontSize: 20)),
            const SizedBox(height: 20),
            Text("This is Google Fonts.",
                style: GoogleFonts.allertaStencil(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
