
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:roadmap_generator_website/constants/colors.dart';
import 'package:roadmap_generator_website/constants/fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double horizontalPadding = 400;
  @override
  Widget build(BuildContext context) {
    // Responsive Sizes
    debugPrint(ResponsiveBreakpoints.of(context).screenWidth.toString());
    if (ResponsiveBreakpoints.of(context).isDesktop) {
      horizontalPadding = 200;
      debugPrint("Resized padding to 500");
    } else if (ResponsiveBreakpoints.of(context).isTablet) {
      horizontalPadding = 75;
      debugPrint("Resized padding to 300");
    }
    else if (ResponsiveBreakpoints.of(context).isPhone){
      horizontalPadding = 100;
      debugPrint("Resized padding to 100");
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,

                  children: [
                  SelectableText("Choose Your Career", style: GoogleFonts.inriaSans(fontSize: 40)),
                  SizedBox(height: 32),
                  CustomTextFormField(text: "Your Career is...", expandable: false),
                    SizedBox(height: 8),
                    CustomDropdownButtonFormField(hintText: "Experience", icon: Icon(Icons.star_outline), items: [DropdownMenuItem(value: 1, child: Text("Intermediate", style: TextStyle(fontWeight: FontWeight.w700, ),),)]),
                    SizedBox(height: 8),
                    CustomTextFormField(text: "Aditional Info...", expandable: true),
                  SizedBox(height: 24),
                 SubmitButton(textWidget: RichText(text: TextSpan(text: "Check ", style: TextStyle(color: monoButtonTextColor), children: [TextSpan(text: "Your", style: TextStyle(fontWeight: FontWeight.w700)), TextSpan(text:" Roadmap!")])),)],),
          ),
        ),
      ),
    )

    ;
  }
}




class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key, required this.text, required this.expandable});

  final String text;
  final bool expandable;


  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return  TextFormField(maxLines: widget.expandable ? null : 1,decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.white)),border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.white)),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.white)), hintText: widget.text, hintStyle: TextStyle(color: titleTextColor)),);
  }
}

class CustomDropdownButtonFormField extends StatefulWidget {
  const CustomDropdownButtonFormField({super.key, required this.hintText, required this.icon, required this.items});
  final String hintText;
  final Icon icon;
  final List<DropdownMenuItem> items;

  @override
  State<CustomDropdownButtonFormField> createState() => _CustomDropdownButtonFormFieldState();
}

class _CustomDropdownButtonFormFieldState extends State<CustomDropdownButtonFormField> {
  @override
  Widget build(BuildContext context) {
    return  DropdownButtonFormField(decoration: InputDecoration(prefixIcon: Icon(Icons.star_outline),hintText: "Experience",border: OutlineInputBorder(), fillColor: buttonFillColor, filled: true),icon: Icon(Icons.arrow_drop_down, color: monoButtonTextColor,),dropdownColor: buttonFillColor,style: TextStyle(color: monoButtonTextColor),items: [DropdownMenuItem(value: 1, child: Text("Intermediate", style: TextStyle(fontWeight: FontWeight.w700, ),),)], onChanged: (newValue) {});

  }
}

class SubmitButton extends StatefulWidget {
  const SubmitButton({super.key, required this.textWidget});
  final Widget textWidget;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: mainActionColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), minimumSize: Size(double.infinity, 60)),onPressed: () {debugPrint("Working");}, child: widget.textWidget);
  }
}



