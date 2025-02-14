import 'package:flutter/material.dart';
import 'package:country_details/model/post.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryDetailScreen extends StatelessWidget {
  final Country country;

  const CountryDetailScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(253, 255, 255, 255),
      appBar: AppBar(title: Text(country.commonName,
      
      style:GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600  
      ),)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              
            child:   ClipRRect(
                 borderRadius: BorderRadius.circular(8),
              child: Image.network(
                country.flagUrl,
                width: 380,
                height: 200,
                fit: BoxFit.cover,
              ),
              ),
            ),
            const SizedBox(height: 16),      
             Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                
                children: [
                 RichText(
                          text:  TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black,), // Default style
                          children: [
                           TextSpan(
                           text: 'Population: ',
               style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
                // Bold style for label
               ),
                TextSpan(
                       text: country.population.toString(),
                       style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 16), // Normal style for value
                     ),
                   ],
                 ),
               ),
            const   SizedBox(height: 6),

               RichText(
                          text:  TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black), // Default style
                          children: [
                           TextSpan(
                           text: 'Religion: ',
               style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16), // Bold style for label
               ),
                TextSpan(
                       text: country.religion,
                       style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 16), // Normal style for value
                     ),
                   ],
                 ),
               ),
               const   SizedBox(height: 6),
               RichText(
                          text:  TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black), // Default style
                          children: [
                           TextSpan(
                           text: 'Capital: ',
               style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16), // Bold style for label
               ),
                TextSpan(
                       text:   country.capital?.join(', ') ?? "No capital",
                       style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 16), // Normal style for value
                     ),
                   ],
                 ),
               ),
                const   SizedBox(height: 6),
               RichText(
                          text:  TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black), // Default style
                          children: [
                           TextSpan(
                           text: 'Motto: ',
               style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16), // Bold style for label
               ),
                TextSpan(
                       text: country.motto,
                       style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 16), // Normal style for value
                     ),
                   ],
                 ),
               )
                ],
               ),
             ),
              const SizedBox(height: 24),      
             Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                
                children: [
                 RichText(
                          text:  TextSpan(
                          style: GoogleFonts.poppins(fontSize: 16, color: Colors.black,), // Default style
                          children: [
                           TextSpan(
                           text: 'Official Language: ',
               style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
                // Bold style for label
               ),
                TextSpan(
                       text: country.officialLanguages?.join(', ') ?? "No language",
                       style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 16), // Normal style for value
                     ),
                   ],
                 ),
               ),
            const   SizedBox(height: 6),

               RichText(
                          text:  TextSpan(
                          style: GoogleFonts.poppins(fontSize: 16, color: Colors.black), // Default style
                          children: [
                           TextSpan(
                           text: 'Ethnic group  ',
               style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16), // Bold style for label
               ),
                TextSpan(
                       text: country.ethnicGroups.toString(),
                       style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 16), // Normal style for value
                     ),
                   ],
                 ),
               ),
               const   SizedBox(height: 6),
               RichText(
                          text:  TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black), // Default style
                          children: [
                           TextSpan(
                           text: 'Religion: ',
               style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16), // Bold style for label
               ),
                TextSpan(
                       text:   country.religion,
                       style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 16), // Normal style for value
                     ),
                   ],
                 ),
               ),
                const   SizedBox(height: 6),
               RichText(
                          text:  TextSpan(
                          style: GoogleFonts.poppins(fontSize: 16, color: Colors.black), // Default style
                          children: [
                           TextSpan(
                           text: 'Government: ',
               style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16), // Bold style for label
               ),
                TextSpan(
                       text: country.government,
                       style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 16), // Normal style for value
                     ),
                   ],
                 ),
               )
                ],
               ),
             ),
              const SizedBox(height: 24),      
             Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                
                children: [
                 RichText(
                          text:  TextSpan(
                          style: GoogleFonts.poppins(fontSize: 16, color: Colors.black,), // Default style
                          children: [
                           TextSpan(
                           text: 'Indepedence: ',
               style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
                // Bold style for label
               ),
                TextSpan(
                       text: country.independence,
                       style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 16), // Normal style for value
                     ),
                   ],
                 ),
               ),
            const   SizedBox(height: 6),

               RichText(
                          text:  TextSpan(
                          style: GoogleFonts.poppins(fontSize: 16, color: Colors.black), // Default style
                          children: [
                           TextSpan(
                           text: 'Area: ',
               style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16), // Bold style for label
               ),
                TextSpan(
                       text: country.area.toString(),
                       style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 16), // Normal style for value
                     ),
                   ],
                 ),
               ),
               const   SizedBox(height: 6),
               RichText(
                          text:  TextSpan(
                          style: GoogleFonts.poppins(fontSize: 16, color: Colors.black), // Default style
                          children: [
                           TextSpan(
                           text: 'Currency: ',
               style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16), // Bold style for label
               ),
                TextSpan(
                       text:   country.currencyName,
                       style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 16), // Normal style for value
                     ),
                   ],
                 ),
               ),
                const   SizedBox(height: 6),
               RichText(
                          text:  TextSpan(
                          style: GoogleFonts.poppins(fontSize: 16, color: Colors.black), // Default style
                          children: [
                           TextSpan(
                           text: 'GDP: ',
               style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16), // Bold style for label
               ),
                TextSpan(
                       text: country.gdp,
                       style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 16), // Normal style for value
                     ),
                   ],
                 ),
               )
                ],
               ),
             ),
             const SizedBox(height: 24),      
             Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                
                children: [
                 RichText(
                          text:  TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black,), // Default style
                          children: [
                           TextSpan(
                           text: 'Time zone: ',
               style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
                // Bold style for label
               ),
                TextSpan(
                       text: country.timezones?.join(', ') ,
                       style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 16), // Normal style for value
                     ),
                   ],
                 ),
               ),
            const   SizedBox(height: 6),

               RichText(
                          text:  TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black), // Default style
                          children: [
                           TextSpan(
                           text: 'Date format: ',
               style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16), // Bold style for label
               ),
                TextSpan(
                       text: country.dateFormat,
                       style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 16), // Normal style for value
                     ),
                   ],
                 ),
               ),
               const   SizedBox(height: 6),
               RichText(
                          text:  TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black), // Default style
                          children: [
                           TextSpan(
                           text: 'Dialing code: ',
               style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16), // Bold style for label
               ),
                TextSpan(
                       text:   country.dialingCodes.toString(),
                       style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 16), // Normal style for value
                     ),
                   ],
                 ),
               ),
                const   SizedBox(height: 6),
               RichText(
                          text:  TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black), // Default style
                          children: [
                           TextSpan(
                           text: 'Driving side: ',
               style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16), // Bold style for label
               ),
                TextSpan(
                       text: country.drivingSide.toString(),
                       style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 16), // Normal style for value
                     ),
                   ],
                 ),
               )
                ],
               ),
             ),

             

         
          ],
        ),
      ),
    );
  }
}
