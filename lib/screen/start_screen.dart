
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_details/services/remote_services.dart';
import 'package:country_details/model/post.dart';
import 'package:country_details/screen/countryDetail_screen.dart'; // Import the detail screen

class StartScreen extends StatefulWidget {
  const StartScreen(this.toggleMode, {super.key});
  final void Function() toggleMode;

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  List<Country> countries = [];
  bool isLoaded = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  fetchCountries() async {
    List<Country>? fetchedCountries = await RemoteService().getCountries();
    if (fetchedCountries != null) {
      setState(() {
        // Sort countries alphabetically
        countries = fetchedCountries..sort((a, b) => a.commonName.compareTo(b.commonName));
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var mode = Theme.of(context).brightness == Brightness.dark;
    final modeType = widget.toggleMode;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Explore',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(
                      mode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                    ),
                    onPressed: modeType,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Search Bar
              SearchBar(
                controller: _searchController,
                hintText: '              Search Country',
                leading: const Icon(Icons.search_outlined),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                  mode ? const Color.fromRGBO(152, 162, 179, 0.2) : const Color.fromRGBO(242, 244, 247, 1),
                ),
                shadowColor: WidgetStateProperty.all(Colors.transparent),
              ),
              const SizedBox(height: 10),

              // Language & Filter Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton.icon(
                    icon: const Icon(Icons.language_outlined),
                    onPressed: () {},
                    label: const Text(' EN'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: mode ? const Color.fromRGBO(242, 244, 247, 1) : Colors.black,
                      side: const BorderSide(
                        color: Color.fromARGB(169, 184, 212, 158),
                        width: 0.6,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.filter_alt_outlined),
                    onPressed: () {},
                    label: const Text(' Filter'),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color.fromARGB(169, 184, 212, 158),
                        width: 0.6,
                      ),
                      foregroundColor: mode ? const Color.fromRGBO(242, 244, 247, 1) : Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),

              // Country List with Alphabet Headers
              Expanded(
                child: ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (context, index) {
                    final country = countries[index];
                    final String countryName = country.commonName;
                    final String firstLetter = countryName[0].toUpperCase();

                    // Show the alphabet header only if it's the first item or a new letter starts
                    bool showHeader = index == 0 || firstLetter != countries[index - 1].commonName[0].toUpperCase();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Alphabet Header
                        if (showHeader)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
                            child: Text(
                              firstLetter,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: mode? Colors.white: Colors.black54,
                              ),
                            ),
                          ),

                        // Country Tile with Navigation
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              country.flagUrl,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            countryName,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            country.capital?.join(', ') ?? "No capital",
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          onTap: () {
                            // Navigate to the detail screen when tapped
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CountryDetailScreen(country: country),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
