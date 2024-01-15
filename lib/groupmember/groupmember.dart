import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramadhan_app/color.dart';

class GroupMember extends StatelessWidget {
  const GroupMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkgreen,
        appBar: AppBar(
          backgroundColor: green,
          title: Text(
            "Group Member",
            style: GoogleFonts.poppins(color: cream),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 80),
              Card(
                color: lightgreen,
                child: const Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("MUHAMMAD AIMAN BIN MAT ISA (2014243)"),
                        SizedBox(height: 10),
                        Text("MUHAMMAD AFIQ BIN KHARUL AZMAN (2011595)"),
                        SizedBox(height: 10),
                        Text("AMIRUL HAZIQ BIN RUSLI (2010243),"),
                        SizedBox(height: 10),
                        Text("MUHAMMAD FAZRIL BIN AZAM BUSRA (1917135)")
                      ]),
                ),
              ),
            ],
          ),
        ));
  }
}
