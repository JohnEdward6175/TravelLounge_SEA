import '../models/travel_models.dart';
import 'country_history.dart';
import 'airports_data.dart';
import 'country_rules.dart';
import 'dishes_data.dart';
import 'landmarks_data.dart';

List<Country> southeastAsianCountries = [
  Country(
    name: "Brunei",
    code: "BN",
    mapImage: "BR.jpg", // Fixed from bn.jpg
    weather: Weather(temperature: 28, condition: "Humid", humidity: 80, windSpeed: 10),
    details: countryHistoryData["Brunei"] ?? "",
    internationalAirports: countryAirportsData["Brunei"]?["International"] ?? [],
    localAirports: countryAirportsData["Brunei"]?["Local"] ?? [],
    rules: countryRulesData["Brunei"] ?? [],
    dishes: countryDishesData["Brunei"] ?? [],
    landmarks: countryLandmarksData["Brunei"] ?? [],
  ),
  Country(
    name: "Cambodia",
    code: "KH",
    mapImage: "Cam.jpg", // Fixed from kh.jpg
    weather: Weather(temperature: 30, condition: "Sunny", humidity: 75, windSpeed: 12),
    details: countryHistoryData["Cambodia"] ?? "",
    internationalAirports: countryAirportsData["Cambodia"]?["International"] ?? [],
    localAirports: countryAirportsData["Cambodia"]?["Local"] ?? [],
    rules: countryRulesData["Cambodia"] ?? [],
    dishes: countryDishesData["Cambodia"] ?? [],
    landmarks: countryLandmarksData["Cambodia"] ?? [],
  ),
  Country(
    name: "Indonesia",
    code: "ID",
    mapImage: "Indo.jpg", // Fixed from id.jpg
    weather: Weather(temperature: 29, condition: "Partly Cloudy", humidity: 85, windSpeed: 15),
    details: countryHistoryData["Indonesia"] ?? "",
    internationalAirports: countryAirportsData["Indonesia"]?["International"] ?? [],
    localAirports: countryAirportsData["Indonesia"]?["Local"] ?? [],
    rules: countryRulesData["Indonesia"] ?? [],
    dishes: countryDishesData["Indonesia"] ?? [],
    landmarks: countryLandmarksData["Indonesia"] ?? [],
  ),
  Country(
    name: "Laos",
    code: "LA",
    mapImage: "Laos.jpg", // Fixed from la.jpg
    weather: Weather(temperature: 27, condition: "Clear", humidity: 65, windSpeed: 8),
    details: countryHistoryData["Laos"] ?? "",
    internationalAirports: countryAirportsData["Laos"]?["International"] ?? [],
    localAirports: countryAirportsData["Laos"]?["Local"] ?? [],
    rules: countryRulesData["Laos"] ?? [],
    dishes: countryDishesData["Laos"] ?? [],
    landmarks: countryLandmarksData["Laos"] ?? [],
  ),
  Country(
    name: "Malaysia",
    code: "MY",
    mapImage: "Malay.png", // Fixed from my.jpg (and changed to .png)
    weather: Weather(temperature: 30, condition: "Thunderstorms", humidity: 82, windSpeed: 14),
    details: countryHistoryData["Malaysia"] ?? "",
    internationalAirports: countryAirportsData["Malaysia"]?["International"] ?? [],
    localAirports: countryAirportsData["Malaysia"]?["Local"] ?? [],
    rules: countryRulesData["Malaysia"] ?? [],
    dishes: countryDishesData["Malaysia"] ?? [],
    landmarks: countryLandmarksData["Malaysia"] ?? [],
  ),
  Country(
    name: "Myanmar",
    code: "MM",
    mapImage: "Myan.jpg", // Fixed from mm.jpg
    weather: Weather(temperature: 32, condition: "Hot", humidity: 60, windSpeed: 11),
    details: countryHistoryData["Myanmar"] ?? "",
    internationalAirports: countryAirportsData["Myanmar"]?["International"] ?? [],
    localAirports: countryAirportsData["Myanmar"]?["Local"] ?? [],
    rules: countryRulesData["Myanmar"] ?? [],
    dishes: countryDishesData["Myanmar"] ?? [],
    landmarks: countryLandmarksData["Myanmar"] ?? [],
  ),
  Country(
    name: "Philippines",
    code: "PH",
    mapImage: "ph.jpg", // Matches
    weather: Weather(temperature: 31, condition: "Sunny", humidity: 70, windSpeed: 18),
    details: countryHistoryData["Philippines"] ?? "",
    internationalAirports: countryAirportsData["Philippines"]?["International"] ?? [],
    localAirports: countryAirportsData["Philippines"]?["Local"] ?? [],
    rules: countryRulesData["Philippines"] ?? [],
    dishes: countryDishesData["Philippines"] ?? [],
    landmarks: countryLandmarksData["Philippines"] ?? [],
  ),
  Country(
    name: "Singapore",
    code: "SG",
    mapImage: "SG.jpg", // Fixed from sg.jpg (Uppercase)
    weather: Weather(temperature: 29, condition: "Rainy", humidity: 88, windSpeed: 20),
    details: countryHistoryData["Singapore"] ?? "",
    internationalAirports: countryAirportsData["Singapore"]?["International"] ?? [],
    localAirports: countryAirportsData["Singapore"]?["Local"] ?? [],
    rules: countryRulesData["Singapore"] ?? [],
    dishes: countryDishesData["Singapore"] ?? [],
    landmarks: countryLandmarksData["Singapore"] ?? [],
  ),
  Country(
    name: "Thailand",
    code: "TH",
    mapImage: "Thai.jpg", // Fixed from th.jpg
    weather: Weather(temperature: 33, condition: "Very Hot", humidity: 68, windSpeed: 13),
    details: countryHistoryData["Thailand"] ?? "",
    internationalAirports: countryAirportsData["Thailand"]?["International"] ?? [],
    localAirports: countryAirportsData["Thailand"]?["Local"] ?? [],
    rules: countryRulesData["Thailand"] ?? [],
    dishes: countryDishesData["Thailand"] ?? [],
    landmarks: countryLandmarksData["Thailand"] ?? [],
  ),
  Country(
    name: "Vietnam",
    code: "VN",
    mapImage: "Viet.jpg", // Fixed from vn.jpg
    weather: Weather(temperature: 26, condition: "Cloudy", humidity: 78, windSpeed: 16),
    details: countryHistoryData["Vietnam"] ?? "",
    internationalAirports: countryAirportsData["Vietnam"]?["International"] ?? [],
    localAirports: countryAirportsData["Vietnam"]?["Local"] ?? [],
    rules: countryRulesData["Vietnam"] ?? [],
    dishes: countryDishesData["Vietnam"] ?? [],
    landmarks: countryLandmarksData["Vietnam"] ?? [],
  ),
  Country(
    name: "Timor-Leste",
    code: "TL",
    mapImage: "TL.jpg", // Fixed from tl.jpg (Uppercase)
    weather: Weather(temperature: 28, condition: "Sunny", humidity: 72, windSpeed: 9),
    details: countryHistoryData["Timor-Leste"] ?? "",
    internationalAirports: countryAirportsData["Timor-Leste"]?["International"] ?? [],
    localAirports: countryAirportsData["Timor-Leste"]?["Local"] ?? [],
    rules: countryRulesData["Timor-Leste"] ?? [],
    dishes: countryDishesData["Timor-Leste"] ?? [],
    landmarks: countryLandmarksData["Timor-Leste"] ?? [],
  ),
];