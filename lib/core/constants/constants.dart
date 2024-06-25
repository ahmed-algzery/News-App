const String newsAPIBaseURL = 'https://newsapi.org/v2';
const String newsAPIKey = 'b899d5d5a4844bd49fdc24794c4a9748';
const String kDefaultImage =
    "https://mf.b37mrtl.ru/media/pics/static.ar/l/breaking_red.jpg";

const categories = [
  "business",
  "entertainment",
  "general",
  "health",
  "science",
  "sports",
  "technology"
];

const Map<String, String> categoryTranslations = {
  "business": "أعمال",
  "entertainment": "ترفيه",
  "general": "عام",
  "health": "صحة",
  "science": "علوم",
  "sports": "رياضة",
  "technology": "تكنولوجيا",
};