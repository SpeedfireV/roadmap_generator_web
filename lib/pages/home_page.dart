
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadmap_generator_website/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 400.0),
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,

                children: [
                SelectableText("Choose Your Career", style: GoogleFonts.inriaSans(fontSize: 40),),
                TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.white)), hintText: "Your Career is..."),),
                   DropdownButtonFormField(decoration: InputDecoration(prefixIcon: Icon(Icons.star_outline),hintText: "Experience",border: OutlineInputBorder(), fillColor: buttonFillColor, filled: true),icon: Icon(Icons.arrow_drop_down, color: monoButtonTextColor,),dropdownColor: buttonFillColor,style: TextStyle(color: monoButtonTextColor),items: [DropdownMenuItem(value: 1, child: Text("Intermediate"),)], onChanged: (newValue) {},),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Additional Info..."),),

                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: mainActionColor),onPressed: () {debugPrint("Working");}, child: Text("Check Your Roadmap", style:TextStyle(color: monoButtonTextColor))),
              ],),
        ),
      ),
    )

    ;
  }
}
