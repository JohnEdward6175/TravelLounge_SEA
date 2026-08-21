// lib/dataHandler/travel_requirements.dart

class TravelInfo {
  final String countryCode;
  final List<String> requirements;
  final List<String> whatToBring;
  final double usdRate; // currency rate to USD

  const TravelInfo({
    required this.countryCode,
    required this.requirements,
    required this.whatToBring,
    required this.usdRate,
  });
}

const List<TravelInfo> travelInfoData = [
  TravelInfo(
    countryCode: "SG",
    requirements: ["Passport", "Visa (if required)", "Travel Insurance"],
    whatToBring: ["Umbrella", "Comfortable Shoes", "Power Adapter"],
    usdRate: 1.35,
  ),
  TravelInfo(
    countryCode: "TH",
    requirements: ["Passport", "Visa on Arrival", "Travel Insurance"],
    whatToBring: ["Sunscreen", "Light Clothing", "Reusable Bottle"],
    usdRate: 34.5,
  ),
  TravelInfo(
    countryCode: "VN",
    requirements: ["Passport", "E-Visa", "Vaccination Certificate"],
    whatToBring: ["Hat", "Comfortable Shoes", "Travel Guide"],
    usdRate: 24.0,
  ),
  TravelInfo(
    countryCode: "ID",
    requirements: ["Passport", "Visa on Arrival", "Travel Insurance"],
    whatToBring: ["Swimwear", "Mosquito Repellent", "Sunscreen"],
    usdRate: 15_000, // Indonesian Rupiah
  ),
  TravelInfo(
    countryCode: "MY",
    requirements: ["Passport", "Visa-Free (for many countries)", "Travel Insurance"],
    whatToBring: ["Light Clothing", "Water Bottle", "Sunscreen"],
    usdRate: 4.5,
  ),
  TravelInfo(
    countryCode: "PH",
    requirements: ["Passport", "Visa-Free (for many countries)", "Return Ticket"],
    whatToBring: ["Swimwear", "Umbrella", "Sunscreen"],
    usdRate: 56.0,
  ),
  TravelInfo(
    countryCode: "MM",
    requirements: ["Passport", "E-Visa", "Travel Insurance"],
    whatToBring: ["Light Clothing", "Mosquito Repellent", "Travel Guide"],
    usdRate: 2100.0,
  ),
  TravelInfo(
    countryCode: "KH",
    requirements: ["Passport", "Visa on Arrival", "Travel Insurance"],
    whatToBring: ["Light Clothing", "Hat", "Sunscreen"],
    usdRate: 4100.0,
  ),
  TravelInfo(
    countryCode: "LA",
    requirements: ["Passport", "Visa on Arrival", "Travel Insurance"],
    whatToBring: ["Hat", "Comfortable Shoes", "Water Bottle"],
    usdRate: 18_000.0,
  ),
  TravelInfo(
    countryCode: "BN",
    requirements: ["Passport", "Visa-Free (for many countries)", "Travel Insurance"],
    whatToBring: ["Light Clothing", "Travel Guide", "Sunscreen"],
    usdRate: 1.36,
  ),
  TravelInfo(
    countryCode: "TL",
    requirements: ["Passport", "Visa on Arrival", "Travel Insurance"],
    whatToBring: ["Hat", "Comfortable Shoes", "Water Bottle"],
    usdRate: 1.0,
  ),
];
