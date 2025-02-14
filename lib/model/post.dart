import 'dart:convert';

// Convert JSON response to Dart List
List<Country> countryFromJson(String str) =>
    List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

class Country {
  final String commonName;
  final String officialName;
  final String cca2;
  final String cca3;
  final String region;
  final String subregion;
  final List<String>? capital;
  final int population;
  final String flagUrl;

  final String currencyName;
  final String currencySymbol;
  final List<String>? ethnicGroups;
  final List<String>? officialLanguages;
  final String? motto;
  final String? religion;
  final List<String>? timezones;
  final String? drivingSide;
  final List<String>? dialingCodes;
  final String? dateFormat;
  final double? area;
  final String? independence;
  final String? government;
  final String? gdp;

  Country({
    required this.commonName,
    required this.officialName,
    required this.cca2,
    required this.cca3,
    required this.region,
    required this.subregion,
    required this.capital,
    required this.population,
    required this.flagUrl,

    required this.currencyName,
    required this.currencySymbol,
    required this.timezones,
    required this.drivingSide,
    required this.dialingCodes,
    required this.ethnicGroups,
    required this.officialLanguages,
    required this.area,
    required this.independence,
    required this.dateFormat,
    required this.motto,
    required this.government,
    required this.gdp,
    required this.religion,
  });

  // Factory method to create a Country object from JSON
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      commonName: json["name"]["common"],
      officialName: json["name"]["official"],
      timezones: (json['timezones'] as List?)?.map((e) => e as String).toList(),
      drivingSide: json['car']?['side'] ?? 'Unknown',
      dialingCodes:
          (json['idd']?['root'] != null && json['idd']?['suffixes'] != null)
              ? (json['idd']['suffixes'] as List)
                  .map((suffix) => "${json['idd']['root']}$suffix")
                  .toList()
              : null,
      cca2: json["cca2"] ?? "",
      cca3: json["cca3"] ?? "",
      region: json["region"] ?? "Unknown",
      subregion: json["subregion"] ?? "Unknown",
      capital:
          json["capital"] != null ? List<String>.from(json["capital"]) : null,
      population: json["population"] ?? 0,
      flagUrl: json["flags"]["png"] ?? "",
    
      currencyName: json["currencies"] != null
          ? json["currencies"].values.first["name"]
          : "Unknown",
      currencySymbol: json["currencies"] != null
          ? json["currencies"].values.first["symbol"] ?? ""
          : "",
      motto: json['motto'] ?? 'No official motto',
      gdp: json['gdp'] ?? 'Unknown',
      ethnicGroups: (json['ethnic_groups'] as List?)?.map((e) => e as String).toList(),
      officialLanguages: (json['languages'] != null)
          ? (json['languages'] as Map).values.map((e) => e.toString()).toList()
          : null,
      dateFormat: json['date_format'] ?? 'dd/mm/yyyy',
      area: (json['area'] != null) ? (json['area'] as num).toDouble() : null,
      independence: json['independent'] == true ? 'Yes' : 'No',
      government: json['government'] ?? 'Unknown',
      religion: json['religion'] ?? 'Unknown',


    );
  }
}

// class Country {
//   final String commonName;
//   final String? flagUrl;
//   final List<String>? capital;
//   final Map<String, dynamic>? currencies;
//   final List<String>? timezones;
//   final String? drivingSide;
//   final List<String>? dialingCodes;
//   final String? dateFormat;
//   final double? area;
//   final String? independence;
//   final String? government;
//   final String? religion;
//   final List<String>? ethnicGroups;
//   final List<String>? officialLanguages;
//   final String? motto;

//   Country({
//     required this.commonName,
//     this.flagUrl,
//     this.capital,
//     this.currencies,
//     this.timezones,
//     this.drivingSide,
//     this.dialingCodes,
//     this.dateFormat,
//     this.area,
//     this.independence,
//     this.government,
//     this.religion,
//     this.ethnicGroups,
//     this.officialLanguages,
//     this.motto,
//   });

//   factory Country.fromJson(Map<String, dynamic> json) {
//     return Country(
//       commonName: json['name']['common'] ?? '',
//       flagUrl: json['flags']['png'] ?? '',
//       capital: (json['capital'] as List?)?.map((e) => e as String).toList(),
//       currencies: json['currencies'],
//       timezones: (json['timezones'] as List?)?.map((e) => e as String).toList(),
//       drivingSide: json['car']?['side'] ?? 'Unknown',
//       dialingCodes: (json['idd']?['root'] != null && json['idd']?['suffixes'] != null)
//           ? (json['idd']['suffixes'] as List)
//               .map((suffix) => "${json['idd']['root']}$suffix")
//               .toList()
//           : null,
//       dateFormat: json['date_format'] ?? 'dd/mm/yyyy',
//       area: (json['area'] != null) ? (json['area'] as num).toDouble() : null,
//       independence: json['independent'] == true ? 'Yes' : 'No',
//       government: json['government'] ?? 'Unknown',
//       religion: json['religion'] ?? 'Unknown',
//       ethnicGroups: (json['ethnic_groups'] as List?)?.map((e) => e as String).toList(),
//       officialLanguages: (json['languages'] != null)
//           ? (json['languages'] as Map).values.map((e) => e.toString()).toList()
//           : null,
//       motto: json['motto'] ?? 'No official motto',
//     );
//   }
// }
