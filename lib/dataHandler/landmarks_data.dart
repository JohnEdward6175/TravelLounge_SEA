import '../models/travel_models.dart';

const Map<String, List<Landmark>> countryLandmarksData = {
  // ... Philippines is already there ...

  "Brunei": [     //done
  Landmark(
    name: "Sultan Omar Ali Saifuddien Mosque",
    description: "oA landmark of Brunei’s capital, this mosque was completed in 1958 and named after the 28th Sultan. It exemplifies modern Islamic architecture with Italian marble, a golden dome, and an artificial lagoon making it one of Southeast Asia’s most beautiful mosques and a symbol of the nation’s faith and heritage ",
    images: [
      "images/Brunei/BNSOASM/BNSOASM1.jpg",
      "images/Brunei/BNSOASM/BNSOASM2.jpeg",
      "images/Brunei/BNSOASM/BNSOASM3.jpg",
    ],
  ),
  Landmark(
    name: "Jame’ Asr Hassanil Bolkiah Mosque",
    description: "oBuilt to celebrate the Silver Jubilee of Sultan Hassanal Bolkiah’s reign, this mosque was completed in 1994 and is the largest in Brunei. Its 29 golden domes represent each Sultan of Brunei, and its opulent design reflects Brunei’s royal and religious traditions.",
    // Note: Assuming BNJAHBM folder corresponds to this landmark
    images: [
      "images/Brunei/BNJAHBM/BNJAHBM1.jpg", 
      "images/Brunei/BNJAHBM/BNJAHBM2.jpg",
      "images/Brunei/BNJAHBM/BNJAHBM3.jpg",
    ],
  ),
  Landmark(
    name: "Kampong Ayer (Water Village)",
    description: "Known as the “Venice of the East,” Kampong Ayer is the world’s largest traditional water settlement. Built on stilts over the Brunei River, it has served as an essential community for locals for centuries and preserves the country’s cultural heritage and traditional lifestyle",
    images: [
      "images/Brunei/BNKA/BNKA1.jpg",
      "images/Brunei/BNKA/BNKA2.jpg",
      "images/Brunei/BNKA/BNKA3.jpg",
    ],
  ),
  Landmark(
    name: "Istana Nurul Iman",
    description: "oThis palace is the official residence of the Sultan of Brunei and holds the distinction of being one of the world’s largest residential palaces. While primarily a private royal palace, its grandeur and architecture make it a key national symbol, visible from afar",
    images: [
      "images/Brunei/BNINI/BNINI1.jpeg",
      "images/Brunei/BNINI/BNINI2.jpg",
      "images/Brunei/BNINI/BNINI3.jpg",
    ],
  ),
  Landmark(
    name: "Ulu Temburong National Park",
    description: "oA pristine rainforest reserve, this park protects Brunei’s rich biodiversity and offers nature‑based activities like canopy walks and trekking. It represents the country’s commitment to conservation and eco‑tourism.",
    images: [
      "images/Brunei/BNUTNP/BNUTNP1.jpg",
      "images/Brunei/BNUTNP/BNUTNP2.jpg",
      "images/Brunei/BNUTNP/BNUTNP3.jpeg",
    ],
  ),
  Landmark(
    name: "Tasek Lama Recreational Park",
    description: "A beloved urban green space in Bandar Seri Begawan, this park features walking trails, picnic areas, and a waterfall. It originated from a natural forest reserve and now offers locals and visitors a place to enjoy nature within the city.",
    images: [
      "images/Brunei/BNTLRP/BNTLRP1.png",
      "images/Brunei/BNTLRP/BNTLRP2.jpg",
      "images/Brunei/BNTLRP/BNTLRP3.jpg",
    ],
  ),
  Landmark(
    name: "Jerudong Park",
    description: "oA family‑friendly amusement park that has grown over decades into one of Brunei’s major recreational destinations, offering rides, fountains, and attractions suitable for all ages.",
    images: [
      "images/Brunei/BNJP/BNJP1.jpeg",
      "images/Brunei/BNJP/BNJP2.jpg",
      "images/Brunei/BNJP/BNJP3.jpg",
    ],
  ),
  Landmark(
    name: "Royal Regalia Museum",
    description: "Opened in 1992, this museum showcases the ceremonial regalia, gifts, and historical artifacts connected to Brunei’s monarchy. It offers insight into Brunei’s royal traditions, the Sultan’s coronation items, and diplomatic exchanges.",
    images: [
      "images/Brunei/BNRRM/BNRRM1.jpeg",
      "images/Brunei/BNRRM/BNRRM2.jpg",
      "images/Brunei/BNRRM/BNRRM3.jpg",
    ],
  ),
  Landmark(
    name: "Brunei Museum",
    description: "oAlthough the national museum has been under renovation in recent years, historically it was established to preserve the kingdom’s cultural, archaeological, and ethnographic heritage. It remains a recognized historical institution in Brunei’s cultural landscape.",
    images: [
      "images/Brunei/BNM/BNM1.jpg",
      "images/Brunei/BNM/BNM2.jpeg",
      "images/Brunei/BNM/BNM3.jpeg",
    ],
  ),
  Landmark(
    name: "Muara Beach",
    description: "A popular coastal area near Brunei’s main port, Muara Beach has long been a local leisure spot where families enjoy seaside activities and traditional Bruneian beach culture.",
    images: [
      "images/Brunei/BNMB/BNMB1.jpg",
      "images/Brunei/BNMB/BNMB2.jpg",
      "images/Brunei/BNMB/BNMB3.jpg",
    ],
  ),
],

  "Cambodia": [   //done
  Landmark(
    name: "Angkor Wat",
    description: "oA Buddhist temple complex and is the largest religious complex in the world. The sacred structure is located on a site measured on 162.6 hectares within the ancient capital of Angkor. Angkor Wat was constructed between 1113 and 1150 CE during the reign of the Khmer king Suryavarman II.",
    images: [
      "images/Cambodia/KHAW/KHAW1.jpg",
      "images/Cambodia/KHAW/KHAW2.jpg",
      "images/Cambodia/KHAW/KHAW3.jpg",
    ],
  ),
  Landmark(
    name: "Angkor Thom",
    description: "Once the capital city of the Khmer Empire built in the late 12th century under King Jayavarman VII. Angkor Thom is a fortified archeological site featuring the grand gates and famous Bayon Temple at its heart.",
    images: [
      "images/Cambodia/KHAT/KHAT1.jpg",
      "images/Cambodia/KHAT/KHAT2.jpg",
      "images/Cambodia/KHAT/KHAT3.jpg",
    ],
  ),
  Landmark(
    name: "Bayon Temple",
    description: "A Theravada Buddhist Temple of the Khmer Empire that is richly decorated built in the late 12th or early 13th century in Angkor, Cambodia. The temple was built as a state temple of King Jayavarman VII, it stands at the center of Jayavarman, Angkot Thom.",
    images: [
      "images/Cambodia/KHBT/KHBT1.jpg",
      "images/Cambodia/KHBT/KHBT2.jpg",
      "images/Cambodia/KHBT/KHBT3.jpg",
    ],
  ),
  Landmark(
    name: "Ta Prohm",
    description: "Built as a Buddhist monastery in the late 12th century, Ta Prohm is distinctive for its trees and roots growing through the ruins, creating a dramatic fusion of nature and ancient stone.",
    images: [
      "images/Cambodia/KHTP/KHTP1.jpg",
      "images/Cambodia/KHTP/KHTP2.jpg",
      "images/Cambodia/KHTP/KHTP3.jpg",
    ],
  ),
  Landmark(
    name: "Phnom Penh Royal Palace",
    description: "A complex building serving as the Royal Palace and official residence of the Cambodian King. It is located at Phnom Penh as is also known as Preah Barom Reacheaveang Chaktomuk Serey Mongkol. The complex was primarily constructed between 1866 and 1870 and was built after King Norodom relocated the capital from Oudong to Phom Penh.",
    images: [
      "images/Cambodia/KHPPRP/KHPPRP1.jpg",
      "images/Cambodia/KHPPRP/KHPPRP2.jpg",
      "images/Cambodia/KHPPRP/KHPPRP4.jpg",
    ],
  ),
  Landmark(
    name: "Silver Pagoda",
    description: "Located on the south side of the Royal Palace in Chey Chumneas, Phnom Pehn. The pagoda was originally constructed of wood who was said to be inspired by Bangkok's Wat Phra Kaew and was rebuilt in 1962. The official name of the pagoda is Wat Preah Keo Morokat.",
    images: [
      "images/Cambodia/KHSP/KHSP1.jpg",
      "images/Cambodia/KHSP/KHSP2.jpg",
      "images/Cambodia/KHSP/KHSP3.jpg",
    ],
  ),
  Landmark(
    name: "Tonlé Sap Lake",
    description: "Southeast Asia's largest freshwater lake. The lake seasonally changes water supporting the vibrant flow floating villages and rich biodiversity. This bod of water formed a central part of Cambodia's cultural and ecological life.",
    images: [
      "images/Cambodia/KHTSL/KHTSL1.webp",
      "images/Cambodia/KHTSL/KHTSL2.jpg",
      "images/Cambodia/KHTSL/KHTSL3.jpg",
    ],
  ),
  Landmark(
    name: "Bokor Hill Station",
    description: "A French colonial hilltop resort from the 1920s, Bokor Hill Station now offers ancient structure remains and picture-perfect views, reflecting a unique historical layer of Cambodia’s colonial era.",
    images: [
      "images/Cambodia/KHBHS/KHBHS1.webp",
      "images/Cambodia/KHBHS/KHBHS2.jpg",      
      "images/Cambodia/KHBHS/KHBHS3.webp",
    ],
  ),
  Landmark(
    name: "Preah Vihear Temple",
    description: "Perched atop the Dângrêk Mountains is an ancient Hindu temple celebrated for its majestic cliff‑top location and remarkable Khmer sandstone architecture. This historical landmark offers sweeping views and deep cultural significance for the locals.",
    // Note: If you don't have images for this specific one yet, you can leave it empty
    images: [
      "images/Cambodia/KHPVT/KHPVT1.avif",
      "images/Cambodia/KHPVT/KHPVT2.jpg",
      "images/Cambodia/KHPVT/KHPVT3.jpg",
    ],
  ),
  Landmark(
    name: "Phnom Kulen National Park",
    description: "A osacred site considered the cradle of the Khmer Empire, Phnom Kulen features forested landscape, waterfalls, and ancient carvings; it was where King Jayavarman II proclaimed independence in 802 AD, marking the beginning of the Khmer civilization.",
    images: [
      "images/Cambodia/KHPKNP/KHPKNP1.jpg",
      "images/Cambodia/KHPKNP/KHPKNP2.jpg",
      "images/Cambodia/KHPKNP/KHPKNP3.jpg",
    ],
  ),
],

  "Indonesia": [    //done
  Landmark(
    name: "Bali (Uluwatu & Tanah Lot)",
    description: "Uluwatu Temple is an important Hindu temple located on dramatic seaside cliffs, widely known as the best sunset spot in Bali.\n\nA sacred Hindu temple carefully placed on top of a coral rock formation makes Tanah Lot one of Bali’s most scenic places to see. Dedicated to the god of the sea, Baruna, only worshippers may enter the temple’s interior.", 
    images: [
      "images/Indonesia/IDBali/IDBali1.jpg",
      "images/Indonesia/IDBali/IDBali2.jpg",
      "images/Indonesia/IDBali/IDBali3.jpg",
    ],
  ),
  Landmark(
    name: "Borobudur Temple",
    description: "A 9th-century Buddhist monument in Central Java, is one of the most iconic and well-preserved ancient structures in the world. Famed for its intricate relief panels, stupas and statues, the temple provides a glimpse into Indonesia's rich history and culture. As the largest Buddhist temple in the world, Borobudur attracts many visitors from all over the world, cementing its status as a symbol of Indonesia.",
    images: [
      "images/Indonesia/IDBT/IDBT1.webp",
      "images/Indonesia/IDBT/IDBT2.webp",
      "images/Indonesia/IDBT/IDBT3.jpg",
    ],
  ),
  Landmark(
    name: "Prambanan Temple",
    description: "Located in Central Java, Prambanan Temple is a stunning 9th-century Hindu temple complex famous for its soaring towers and intricately carved stone reliefs. As one of the most remarkable historical sites in Indonesia, Prambanan rivals the fame of Borobudur Temple. Indonesia's largest Hindu temple complex is an important cultural landmark and a must-visit destination for travelers.",
    images: [
      "images/Indonesia/IDPT/IDPT1.jpeg",
      "images/Indonesia/IDPT/IDPT2.jpg",
      "images/Indonesia/IDPT/IDPT3.jpg",
    ],
  ),
  Landmark(
    name: "Mount Bromo",
    description: "Moount Bromo, located in East Java within the Bromo-Tengger-Semeru National Park, is one of Indonesia's most famous and active volcanoes. With an elevation of 2,329 meters, the mountain attracts hikers and photographers around the world with its stunning landscape, especially at sunrise",
    images: [
      "images/Indonesia/IDMB/IDMB1.jpeg",
      "images/Indonesia/IDMB/IDMB2.jpg",
      "images/Indonesia/IDMB/IDMB3.jpg",
    ],
  ),
  Landmark(
    name: "Komodo National Park",
    description: "KoKomodo National Park is famous for being home to Komodo dragons, the largest lizards in the world. The rugged terrain and diverse wildlife on the island make it an attractive tourist destination. The park features dramatic volcanic islands with steep, sunburnt hillsides, surrounded by vibrant coral reefs, mangrove forests and tropical beaches. \n\n Alongside the famous Komodo dragons, the park is also home to a variety of wildlife, including wild horses, birds, monkeys, fruit bats, wild boars, civets and snakes. It is a paradise for nature lovers, offering opportunities for wildlife viewing, trekking, swimming and diving.",
    images: [
      "images/Indonesia/IDKNP/IDKNP1.jpeg",
      "images/Indonesia/IDKNP/IDKNP2.jpg",
      "images/Indonesia/IDKNP/IDKNP3.jpg",
    ],
  ),
  Landmark(
    name: "Lake Toba",
    description: "Lake Toba, located in Sumatra, is the largest volcanic lake in the world, with an area of more than 1,145 square kilometers and a depth of 450 meters. Surrounded by beautiful scenery, traditional Batak villages and the picturesque Samosir Island, it is the largest lake in Southeast Asia and one of the deepest in the world.",
    images: [
      "images/Indonesia/IDLT/IDLT1.jpg",
      "images/Indonesia/IDLT/IDLT2.webp",
      "images/Indonesia/IDLT/IDLT3.avif",
    ],
  ),
  Landmark(
    name: "Raja Ampat",
    description: "Raoja Ampat is a famous mecca for divers. As an area with 75% of the world’s coral diversity, expect endless dive sites to see some of the world’s most enormous sea creatures and 360-degree schools of fish surrounding you. Joining a liveaboard is a popular activity at Raja Ampat.",
    images: [
      "images/Indonesia/IDRA/IDRA1.jpg",
      "images/Indonesia/IDRA/IDRA2.webp",
      "images/Indonesia/IDRA/IDRA3.jpg",
    ],
  ),
  Landmark(
    name: "Jakarta National Monument (Monas)",
    description: "Tohe Monas Monument is a national Indonesian monument located in the capital city of Indonesia, Jakarta. It was built to commemorate the struggle of the Indonesian people for independence. The monument is 132 meters tall and is topped with a flame that symbolizes the national ideology of Pancasila.",
    images: [
      "images/Indonesia/IDJNM/IDJNM1.jpg",
      "images/Indonesia/IDJNM/IDJNM2.jpg",
      "images/Indonesia/IDJNM/IDJNM3.jpg",
    ],
  ),
  Landmark(
    name: "Mount Rinjani",
    description: "Suorrounded by lush waterfalls and jungles, the second tallest mountain in Indonesia, Mount Rinjani, is an active volcano on the island of Lombok. \n\n A popular activity is to hike to the summit (3726m/12,224 ft), which takes two days with an overnight stop at one of the crater lakes. The top’s panoramic views are incredible; on a clear day, you can even see Mount Agung in Bali.",
    images: [
      "images/Indonesia/IDMR/IDMR1.webp",
      "images/Indonesia/IDMR/IDMR2.jpg",
      "images/Indonesia/IDMR/IDMR3.jpg",
    ],
  ),
  Landmark(
    name: "Tana Toraja",
    description: "Tana Toraja, beautiful and mystical, land of the greenest color and a blue sky. A place where your social status is measured by the number of sacrificed buffaloes at your funeral ceremony. Toraja traditional houses, Tongkonans, and the rice barns are exceptional and beautifully carved. This authentic region in Sulawesi (Indonesia) is famous for its unique culture, ancient traditions and incredible panorama. Its strong and complex cultural heritage is still visible and felt everywhere.",
    // Note: If you don't have images for this specific one yet, you can leave it empty
    images: [
      "images/Indonesia/IDTT/IDTT1.jpg",
      "images/Indonesia/IDTT/IDTT2.jpg",
      "images/Indonesia/IDTT/IDTT3.jpg",      
    ],
  ),
],

  "Laos": [   //done
  Landmark(
    name: "Pha That Luang",
    description: "Situated northwest of Vientiane, Pha That Luang is the most important national monument in the country and a symbol of Buddhism. It has undergone several reconstructions because of foreign invasions. The existing Pha That Luang is a complex of brick-built gold stupas. The main stupa comprises three levels, symbolizing the three realms in Buddhism, around which there are 30 small stupas.",
    images: [
      "images/Laos/LAPTL/LAPTL1.jpg",
      "images/Laos/LAPTL/LAPTL2.jpg",
      "images/Laos/LAPTL/LAPTL3.jpg",
    ],
  ),
  Landmark(
    name: "COPE Visitor Center",
    description: "Loaos has the dubious distinction of being the most bombed country on earth, and although the American War in neighboring Vietnam ended way back in 1975, unexploded ordnance (UXO) continues to wound and kill people. COPE (Cooperative Orthotic & Prosthetic Enterprise) is the main source of artificial limbs, walking aids and wheelchairs in Laos.",
    images: [
      "images/Laos/LACOPE/LACOPE1.jpg",
      "images/Laos/LACOPE/LACOPE2.jpg",
      "images/Laos/LACOPE/LACOPE3.jpg",
    ],
  ),
  Landmark(
    name: "Patuxai",
    description: "A  historical site in the center of Vientiane, Patuxai is a large war monument, 148 feet high and 79 feet wide. Originally, it was built to commemorate those who died in war, but it became a symbol of Laos’ liberation in 1975. The Patuxai Monument is similar to the Arch of Triumph in Paris with arched doors on all sides, while the top part features pyramid-shaped architecture and reliefs of mythological creatures and other exquisite carvings typical of Laotian culture.",
    images: [
      "images/Laos/LAP/LAP1.jfif",
      "images/Laos/LAP/LAP2.jpg",
      "images/Laos/LAP/LAP3.jpg",
    ],
  ),
  Landmark(
    name: "Buddha Park",
    description: "Tohe park was founded in 1958 by monk and sculpture artist, Bunleua Sulila; as he studied both Buddhism and Hinduism, you will find not only statues of Buddha, but also of Hindu gods, deities, demons, and animals from both beliefs. The statues are as impressive in size as they are in detail. Standouts here include a 130-foot reclining Buddha, a two-headed elephant, a four-armed deity riding a horse, and the Hindu god, Indra.",
    images: [
      "images/Laos/LABP/LABP1.jpeg",
      "images/Laos/LABP/LABP2.webp",
      "images/Laos/LABP/LABP3.jpeg",
    ],
  ),
  Landmark(
    name: "Wat Sisaket",
    description: "Wat Si Saket is the only temple in Laos that survived the Siamese occupation, which destroyed much of the capital in 1828. It features over 10,000 Buddha sculptures of varying sizes and styles. The temple also has beautiful architecture and layout, with a history that dates to 1818. Must-sees include its ornate five-tiered roof, a drum tower, a small library with a Burmese-style roof, and the floral ceiling of the Sim−ordination Hall. The hall holds 7,000 images made from wood, stone and bronze.",
    images: [
      "images/Laos/LAWS/LAWS1.jpg",
      "images/Laos/LAWS/LAWS2.jpg",
      "images/Laos/LAWS/LAWS3.jpg",
    ],
  ),
  Landmark(
    name: "Vat Phou",
    description: "On the West bank of the Mekong River south of Paske, the UNESCO World Heritage site of Vat Phou is an archaeological phenomenon. This impressive Khmer temple is reminiscent of a miniature version of Angkor Wat in Cambodia, although it was built in the late 10th to early 11th century, and is therefore older than Angkor Wat. The temple was originally dedicated to Shiva, one of the Gods of the Hindu Trimurti, but in the 13th century it was converted into a Buddhist monastery. Even today the temple is still a place of worship for local Buddhists.",
    images: [
      "images/Laos/LAVP/LAVP1.jpg",
      "images/Laos/LAVP/LAVP2.jpg",
      "images/Laos/LAVP/LAVP3.png",
    ],
  ),
  Landmark(
    name: "Luang Prabang Royal Palace",
    description: "A charming small city, Luang Prabang is one of the most popular tourist attractions in Laos. Until 1975, when the communists took over the country, it was the royal capital of Laos. The Royal Palace Museum here is a highlight and usually the first stop for travelers to Luang Prabang.",
    images: [
      "images/Laos/LALPand/LALPand1.jpg",
      "images/Laos/LALPand/LALPand2.jpg",
      "images/Laos/LALPand/LALPand3.jpg",
    ],
  ),
  Landmark(
    name: "Wat Xieng Thong",
    description: "The Golden City Temple, Wat Xieng Thong, is known as the most beautiful ancient temple in Luang Prabang. The most attractive mosaic here is the “tree of life” crafted from stained glass on the rear wall of the main hall. A rare reclining Buddha is displayed in the Red Chapel, and a not-to-be-missed exhibit is a 39-foot-high hearse in a funeral hall with a golden dragon head and a golden urn for containing royal ashes.",
    images: [
      "images/Laos/LAWXT/LAWXT1.jpg",
      "images/Laos/LAWXT/LAWXT2.jpg",
      "images/Laos/LAWXT/LAWXT3.png",
    ],
  ),
  Landmark(
    name: "Mount Phousi",
    description: "Mount Phousi is a holy mountain with the That Chomsi Stupa on its summit. Legend tells us that the immortals stood on the stupa to create Luang Prabang. The stupa is also the starting point for the Lao New Year procession when the Prabang Buddha is carried through the streets on a golden palanquin. You will see several temples along the way, and at the summit, you can enjoy a panoramic vista of Luang Prabang, which is especially beautiful at sunrise and sunset.",
    images: [
      "images/Laos/LAMP/LAMP1.webp",
      "images/Laos/LAMP/LAMP2.jpg",
      "images/Laos/LAMP/LAMP3.jpg",
    ],
  ),
  Landmark(
    name: "Luang Prabang Night Market",
    description: "The Night Market has countless tents selling everything and anything you can imagine, so be sure to spend a couple of hours here looking, buying, exploring, and getting lost. You will probably stumble upon something you like, whether it’s a handmade scarf, rice vodka (snake included!) or the local Laos coffee. You can then enjoy the evening here too, eating at one of the restaurants or food stalls close by.",
    images: [
      "images/Laos/LALPNM/LALPNM1.webp",
      "images/Laos/LALPNM/LALPNM2.webp",
      "images/Laos/LALPNM/LALPNM3.jpg",
    ],
  ),
],

  "Malaysia": [   //done
  Landmark(
    name: "Petronas Twin Towers",
    description: "Powering 451.9m meters above Kuala Lumpur’s skyline, the Petronas Towers is the tallest landmark in the city. It’s also the tallest twin tower globally. The towers were completed in 1998 and held the title as the world’s tallest building until 2004, when Taipei 101 surpassed it. Despite this, the towers remain a must-visit attraction on any Kuala Lumpur itinerary. \n\n The towers’ design was inspired by Islamic art, and since the facade consists mainly of steel and glass, the buildings always seem to be shimmering no matter which time of day you visit.",
    images: [
      "images/Malaysia/MYPTT/MYPTT1.jpg",
      "images/Malaysia/MYPTT/MYPTT2.jpg",
      "images/Malaysia/MYPTT/MYPTT3.jpg",
    ],
  ),
  Landmark(
    name: "Batu Caves",
    description: "Batu Caves is an important religious site attracting thousands of pilgrims every year. Besides its religious significance, Batu Caves is arguably the most photogenic spot in Malaysia. At the Cathedral Cave’s base, there’s a giant gold-painted sculpture of Murugan towering 42m high. From here, it’s a steep climb up on the 272-step rainbow-colored stairway. Along the way, you’ll enjoy breathtaking views and most definitely spot a few cheeky macaques who live here. Just a head’s up; the monkeys are notorious for snatching things. ",
    images: [
      "images/Malaysia/MYBC/batu.jpg",
      "images/Malaysia/MYBC/MYBC1.jpg",
      "images/Malaysia/MYBC/MYBC3.avif",
    ],
  ),
  Landmark(
    name: "Thean Hou Temple",
    description: "Thean Hou Temple was built in 1987 and sits atop Robinson Heights. Although it’s not the oldest temple in Kuala Lumpur, it’s arguably one of the most beautiful. The massive six-tiered temple integrates Buddhism, Taoism, and Confucianism. And as a result, several deities are worshipped here, with Mazu among the most famous.",
    images: [
      "images/Malaysia/MYTHT/MYTHT1.jpg",
      "images/Malaysia/MYTHT/MYTHT2.jpg",
      "images/Malaysia/MYTHT/MYTHT3.webp",
    ],
  ),
  Landmark(
    name: "George Town",
    description: "George Town is famous for many things, from food to culture to history, its street art makes it a must-visit destination in Malaysia. You can spot colorful murals all over the city, and as a result, it a great place to hunt for street art. Along the way, you’ll find everything from quirky cafes and colorful colonial-style architecture to heaps of museums and temples. Grab a street art map from the tourist office so that you can easily find all the best gems.",
    images: [
      "images/Malaysia/MYGT/MYGT1.avif",
      "images/Malaysia/MYGT/MYGT2.jpg",
      "images/Malaysia/MYGT/MYGT3.jpg",
    ],
  ),
  Landmark(
    name: "Mount Kinabalu",
    description: "Mount Kinabalu is a beautiful natural wonder of Malaysia and the highest mountain in the country. It’s popular for its stunning natural scenery, varying landscapes, and excellent hiking opportunities, with the Summit Trail among the most popular. \n\n It involves a 2-day trek, and while it’s not the easiest climb, the effort will be well worth it! From atop, you’ll enjoy incredible views over Sabah’s jungles and with a bit of luck see all the way to KK. Only a limited number of climbers can visit the mountain on any given day..",
    images: [
      "images/Malaysia/MYMK/MYMK1.jpg",
      "images/Malaysia/MYMK/MYMK2.jpg",
      "images/Malaysia/MYMK/MYMK3.jpg",
    ],
  ),
  Landmark(
    name: "Merdeka Square",
    description: "Merdeka Square is a large open area in Kuala Lumpur that is deeply tied to Malaysia’s independence. In 1957, Malaysia gained independence from British colonial rule, and Merdeka Square became the stage for this historical event. The lowering of the British flag and the raising of the new Malaysian flag was a symbolic moment that marked the dawn of a new era for the country. The square is often referred to as the birthplace of Malaysia’s sovereignty, making it an essential historical landmark.",
    images: [
      "images/Malaysia/MYMS/MYMS1.webp",
      "images/Malaysia/MYMS/MYMS2.jfif",
      "images/Malaysia/MYMS/MYMS3.jpg",
    ],
  ),
  Landmark(
    name: "The Melaka Straits Mosque",
    description: "oThe Melaka Straits Mosque is a beautiful white building situated on an artificial island in the waters of the Straits of Melaka, which is an important shipping channel. \n\n The mosque was officially completed in 2006 and features a golden dome, colorful stained-glass work on the archways, and a thirty-meter-high minaret that doubles as a lighthouse.",
    images: [
      "images/Malaysia/MYMSM/MYMSM1.webp",
      "images/Malaysia/MYMSM/MYMSM2.webp",
      "images/Malaysia/MYMSM/MYMSM3.jpg",
    ],
  ),
  Landmark(
    name: "Langkawi Sky Bridge",
    description: "Langkawi Island is a wonderful place. Whether you go for fun, thrill-seeking activities, or pure relaxation, Langkawi has it all. One place that is a Langkawi must-visit is the Langkawi Sky Bridge. Not only are the views from the bridge magnificent the ride to get there is also spectacular.",
    images: [
      "images/Malaysia/MYLSB/MYLSB1.jpg",
      "images/Malaysia/MYLSB/MYLSB2.webp",
      "images/Malaysia/MYLSB/MYLSB3.jpg",
    ],
  ),
  Landmark(
    name: "Cameron Highlands",
    description: "The Cameron Highlands is one of the most famous landmarks in Malaysia. They are located about 200 kilometers north of Kuala Lumpur, at an altitude of 1,500 meters. As a result, it’s one of the most beautiful highland areas in the country. Especially locals, but also international tourists love the landscape, and the pleasant cool climate of this region, because during the day, it never exceeds 25 degrees. \n\n However, the Cameron Highlands are famous for their numerous green tea plantations, which have been planted on the hills of the landscape and take a charming picture.",
    images: [
      "images/Malaysia/MYCH/MYCH1.jpg",
      "images/Malaysia/MYCH/MYCH2.jpg",
      "images/Malaysia/MYCH/MYCH3.jpg",
    ],
  ),
  Landmark(
    name: "Sipadan Island",
    description: "oSipadan island in Borneo, Malaysia, is famous for the amazing marine life surrounding the island. This underwater wonder was described by famous ocean explorer Jacques Cousteau as one of the most beautiful reefs to dive in the world. \n\n The Malaysian government decided to protect Sipadan for future generations in an unprecedented step forcing all resorts to leave the island. Today, only a limited number of divers can visit this natural wonder of Malaysia each day.",
    images: [
      "images/Malaysia/MYSI/MYSI1.jpg",
      "images/Malaysia/MYSI/MYSI2.jpg",
      "images/Malaysia/MYSI/MYSI3.jpg",
    ],
  ),
],

  "Myanmar": [    //done
  Landmark(
    name: "Shwedagon Pagoda",
    description: "Another famous landmark in Myanmar is Shwedagon Pagoda, a religious site perched atop Singuttara Hill in the city of Yangon. The sacred site is believed to enshrine relics of four Buddhas, including strands of Gautama Buddha’s hair ",
    images: [
      "images/Myanmar/MMSP/MMSP1.JPG",
      "images/Myanmar/MMSP/MMSP2.jpeg",
      "images/Myanmar/MMSP/MMSP3.jpg",
    ],
  ),
  Landmark(
    name: "Bagan Archaeological Zone",
    description: "The banks of the Irrawaddy River are home to one of the most famous landmarks in Burma: Bagan. This ancient city is a mesmerizing archaeological site, renowned for its vast expanse of over 2,500 well-preserved Buddhist temples, stupas, and the 9th century old Bagan used to be the center of the Pagan Kingdom and a prosperous center of Buddhism. It is currently regarded as the place with the highest number of Buddhist monuments across the world. ",
    images: [
      "images/Myanmar/MMB/MMB1.jpg",
      "images/Myanmar/MMB/MMB2.jpeg",
      "images/Myanmar/MMB/MMB3.jpg",
    ],
  ),
  Landmark(
    name: "Inle Lake",
    description: "Inle Lake is one of the most remarkable natural landmarks in Myanmar. The large mountain lake is located within the Shan Hills at an elevation of 880 meters above sea level, and it measures around 22 km in length. The lake is one of Myanmar’s two UNESCO Biosphere Reserves and is home to a remarkable number of endemic species including nine species of fish, and over twenty species of snails that can’t be found anywhere else in the world. ",
    images: [
      "images/Myanmar/MMIL/MMIL1.jpg",
      "images/Myanmar/MMIL/MMIL2.webp",
      "images/Myanmar/MMIL/MMIL3.jpg",
    ],
  ),
  Landmark(
    name: "Kyaiktiyo Pagoda (Golden Rock)",
    description: "Perched majestically atop Mount Kyaiktiyo in Myanmar, the Golden Rock stands as one of Myanmar’s most famous landmarks and is steeped in mystique and religious significance. To reach the awe-inspiring Golden Rock, travelers must traverse through winding country roads from Yangon, before ascending the mountain by a combination of foot and truck. ",
    images: [
      "images/Myanmar/MMKP/MMKP1.jpg",
      "images/Myanmar/MMKP/MMKP2.jpg",
      "images/Myanmar/MMKP/MMKP3.jpg",
    ],
  ),
  Landmark(
    name: "Mandalay Palace (Minun)",
    description: "Mingun is another one of Myanmar’s fascinating landmarks. This large pagoda can be found 10 km north of Mandalay, and the site is known as the largest unfinished pagoda in the world. Once intended to be the largest stupa in the world, a myriad of factors meant it was left incomplete; the most famous of which being a prophecy that the king would die if construction was finished. Today, the unfinished pagoda stands as a reminder of the grand aspirations of King Bodawpaya in the late 18th century. ",
    images: [
      "images/Myanmar/MMMP/MMMP1.jpg",
      "images/Myanmar/MMMP/MMMP2.jpg",
      "images/Myanmar/MMMP/MMMP3.jpeg",
    ],
  ),
  Landmark(
    name: "Ananda Temple",
    description: "Ananda Temple, or Ananda Phaya, is one of the most beautiful and significant temples in Bagan, Myanmar. The Jewel of Bagan: Hailed as the absolute pinnacle of Bagan's Buddhist art, its architecture is a flawless blend of Mon and Indian styles. ",
    images: [
      "images/Myanmar/MMMA/MMMA1.jpg",
      "images/Myanmar/MMMA/MMMA2.jpg",
      "images/Myanmar/MMMA/MMMA3.jpg",
    ],
  ),
  Landmark(
    name: "Mount Popa",
    description: "Among the most incredible aspects of the most the diversity of pagodas in Myanmar is significant for instance, Mount Popa is unlikely to be like anything you've ever seen in Myanmar or overseas. By itself, Mount Popa is not a pagoda. Rather, it's a 1500- meter-tall extinct volcano. That is stunning, but what really stands out is the magnificent gold monastery, which makes it very outstanding.",
    images: [
      "images/Myanmar/MMGV/MMGV1.jpg",
      "images/Myanmar/MMGV/MMGV2.jpg",
      "images/Myanmar/MMGV/MMGV3.jpg",
    ],
  ),
  Landmark(
    name: "U Bein Bridge",
    description: "the world’s longest teak bridge, which offers stunning views of Taungthaman Lake. Additionally, they can also explore the former royal palace complex of Maha Ganayon Kyaung Monastery, where monks still gather for their daily alms.",
    images: [
      "images/Myanmar/MMMing/MMMing1.jpg",
      "images/Myanmar/MMMing/MMMing2.jpg",
      "images/Myanmar/MMMing/MMMing3.jpg",
    ],
  ),
  Landmark(
    name: "Hsinbyume Pagoda",
    description: "Also located in Mingun, this striking, stark-white pagoda is designed to resemble the mythological Mount Meru. Its wavy, terraced levels create a brilliantly photogenic structure that stands in stark contrast to Myanmar's many golden stupas.",
    images: [
      "images/Myanmar/MMHA/MMHA1.jpg",
      "images/Myanmar/MMHA/MMHA2.jpg",
      "images/Myanmar/MMHA/MMHA3.jpg",
    ],
  ),
  Landmark(
    name: "Pindaya Caves",
    description: "A vast limestone cave system housing thousands of Buddha images of various styles.",
    images: [
      "images/Myanmar/MMTACAA/MMTACAA1.jpg",
      "images/Myanmar/MMTACAA/MMTACAA2.jpg",
      "images/Myanmar/MMTACAA/MMTACAA3.webp",
    ],
  ),
],

  "Philippines": [    //done
  Landmark(
    name: "Boracay White Beach",
    description: "Boracay Beach is renowned for its powdery white sand and vibrant nightlife. It is regularly featured among the world’s best beaches. The island attracts millions of tourists annually for water activities such as diving, kite surfing, and snorkeling. Despite the tourism boom, ongoing efforts focus on sustainable management to preserve the island’s natural beauty.",
    images: [
      "images/Philippines/PHBB/PHBB1.jpg",
      "images/Philippines/PHBB/PHBB2.webp",
      "images/Philippines/PHBB/PHBB3.jpg",
    ],
  ),
  Landmark(
    name: "Vigan Historic Town",
    description: "Vigan City is a UNESCO World Heritage Site known for its preserved Spanish colonial and Asian architecture. The city features cobblestone streets and historic buildings that illustrate the blend of cultures. Vigan is also famous for its culinary delights, making it a cultural and gastronomical destination. Efforts from the local government support heritage conservation, maintaining Vigan’s charm into the future.",
    images: [
      "images/Philippines/PHVC/PHVC1.jpg",
      "images/Philippines/PHVC/PHVC2.jpg",
      "images/Philippines/PHVC/PHVC3.webp",
    ],
  ),
  Landmark(
    name: "Chocolate Hills",
    description: "The Chocolate Hills, located in Bohol, consist of more than 1,200 cone-shaped hills that turn brown in the dry season, resembling chocolate mounds. These geological formations are recognized as a National Geological Monument. They serve as an important tourist attraction, drawing visitors for their unique and picturesque scenery. The hills are also included in the list of the Philippines’ New 7 Wonders of Nature.",
    images: [
      "images/Philippines/PHCH/PHCH1.jpg", // Note: Ensure your mapping matches folder structure
      "images/Philippines/PHCH/PHCH2.webp",
      "images/Philippines/PHCH/PHCH3.png",
    ],
  ),
  Landmark(
    name: "Banaue Rice Terraces",
    description: "The Banaue Rice Terraces are frequently referred to as the “Eighth Wonder of the World.” These terraces were handcrafted over 2,000 years ago by the Ifugao people for rice cultivation. They showcase remarkable agricultural engineering, demonstrating sustainable farming practices. UNESCO recognizes the terraces as a World Heritage Site, which highlights their cultural significance.",
    images: [
      "images/Philippines/PHBRT/PHBRT1.avif",
      "images/Philippines/PHBRT/PHBRT2.jpg",
      "images/Philippines/PHBRT/PHBRT3.jpg",
    ],
  ),
  Landmark(
    name: "Mayon Volcano",
    description: "Mayon Volcano is famous for its near-perfect cone shape. Located in Albay, it stands at 2,462 meters tall and is an active volcano. The volcano’s picturesque profile and surrounding landscape are ideal for sightseeing and photography. However, its activity poses risks, leading to periodic evacuations and studies on volcanic behavior by the Philippine Institute of Volcanology and Seismology (PHIVOLCS).",
    images: [
      "images/Philippines/PHMV/PHMV1.png",
      "images/Philippines/PHMV/PHMV2.jpg",
      "images/Philippines/PHMV/PHMV3.avif",
    ],
  ),
  Landmark(
    name: "Intramuros",
    description: "Intramuros represents the historical heart of Manila. This walled city was built during the Spanish colonial period and showcases Spanish architecture and colonial history. Visitors can explore Fort Santiago, Manila Cathedral, and other historic structures within its walls. The site offers a unique glimpse into the Philippines’ colonial past, illustrating how it shaped modern Filipino culture.",
    images: [
      "images/Philippines/PHI/PHI1.png",
      "images/Philippines/PHI/PHI2.jpg",
      "images/Philippines/PHI/PHI3.jpg",
    ],
  ),
  Landmark(
    name: "Rizal Park (Luneta)",
    description: "Rizal Park actively serves as a key historical site and a symbol of Philippine freedom. The park commemorates Dr. José Rizal, a national hero, who played a crucial role in the fight for independence from Spanish rule. It covers 58 hectares and features gardens, monuments, and museums, making it a central gathering place for Filipino citizens. According to the National Parks Development Committee, Rizal Park attracts millions of visitors each year, highlighting its importance in the country’s history.",
    images: [
      "images/Philippines/PHRP/PHRP1.png",
      "images/Philippines/PHRP/PHRP2.jpg",
      "images/Philippines/PHRP/PHRP3.jpg",
    ],
  ),
  Landmark(
    name: "Fort Santiago",
    description: "Fort Santiago is a key historical site within Intramuros. It served as a military fortress during Spanish colonization. Fort Santiago is significant for its role in the Filipino revolution against Spanish rule. The site houses several museums and monuments that commemorate the heroes of Philippine history, making it essential for understanding the nation’s struggle for independence.",
    images: [
      "images/Philippines/PHFS/PHFS1.jpg",
      "images/Philippines/PHFS/PHFS2.jpeg",
      "images/Philippines/PHFS/PHFS3.jpg",
    ],
  ),
  Landmark(
    name: "Taal Volcano",
    description: "Taal Volcano is unique as it is a lake within a volcano, often called a “volcanic caldera.” Its beauty lies in the stunning views and serenity provided by Taal Lake. Taal is one of the most active volcanoes in the Philippines, drawing considerable attention from both scientists and tourists. The most recent eruption in January 2020 reminded visitors of the powerful forces at work beneath the surface.",
    images: [
      "images/Philippines/PHTV/PHTV1.jpg",
      "images/Philippines/PHTV/PHTV2.jpg",
      "images/Philippines/PHTV/PHTV3.jpeg",
    ],
  ),
  Landmark(
    name: "San Agustin Church",
    description: "San Agustin Church is the oldest stone church in the Philippines and a UNESCO World Heritage Site. Constructed in the late 16th century, the church has withstood natural calamities and is a prime example of baroque architecture. Its intricate interiors and historical artifacts tell the story of the Catholic Church’s influence in the Philippines during the colonial era.",
    images: [
      "images/Philippines/PHSAC/PHSAC1.jpg",
      "images/Philippines/PHSAC/PHSAC2.jpg",
      "images/Philippines/PHSAC/PHSAC3.jpg",
    ],
  ),
],

  "Singapore": [    //done
  Landmark(
    name: "Supertree Grove",
    description: "This famous landmark in Singapore is one of the most photographed places in the country. A billion-dollar mechanized Eden, the Supertree Grove located within Gardens by the Bay was designed to be a living work of art that integrates technology and greenery.",
    images: [
      "images/Singapore/SGSG/SGSG1.jpg",
      "images/Singapore/SGSG/SGSG2.jpg",
      "images/Singapore/SGSG/SGSG3.jpg",
    ],
  ),
  Landmark(
    name: "Merlion Park",
    description: "The statue depicts the mythical Merlion, a creature with the head of a lion and the body of a fish. According to legend, a prince from the Srivijayan empire (1183-1377) named Sang Nila Utama was sailing across the seas when he discovered a spot of land.",
    images: [
      "images/Singapore/SGMP/SGMP1.jpg",
      "images/Singapore/SGMP/SGMP2.jpg",
      "images/Singapore/SGMP/SGMP3.jpg",
    ],
  ),
  Landmark(
    name: "Gardens by the Bay",
    description: "This famous landmark in Singapore is one of the most photographed places in the country. A billion-dollar mechanized Eden, the Supertree Grove located within Gardens by the Bay was designed to be a living work of art that integrates technology and greenery. \n\n There are 18 “Supertrees” in total, and each one unique in height and design, with some reaching up to 50 meters. You can take an elevator up these tremendous tree trunks to walk across suspended bridges that twist around the towering skeletal structures.",
    images: [
      "images/Singapore/SGGbyB/SGGbyB1.jpg",
      "images/Singapore/SGGbyB/SGGbyB2.jpg",
      "images/Singapore/SGGbyB/SGGbyB3.jpg",
    ],
  ),
  Landmark(
    name: "Henderson Waves",
    description: "Singapore loves to go big. This is a country that doesn’t do anything halfway, and Henderson Waves joins a long list of words that end with ‘est’ in Singapore. Henderson Waves has earned the accolade for being the tallest footbridge in Singapore, sitting 36 meters above Mount Faber Park to Telok Blangah Hill Park. \n\n The walkway is free to access and is popular among joggers, birdwatchers, and families who can take advantage of the walkway’s shaded alcoves. This is quickly becoming a new landmark in Singapore thanks to the panoramic views afforded from the bridge’s unique vantage point.",
    images: [
      "images/Singapore/SGHW/SGHW1.jpg",
      "images/Singapore/SGHW/SGHW2.jpg",
      "images/Singapore/SGHW/SGHW3.jpg",
    ],
  ),
  Landmark(
    name: "Sentosa Island",
    description: "All this in a place that needs no introduction is Universal Studios Singapore. Southeast Asia’s first and only Universal Studios theme park is a huge draw for visitors from across the globe. It’s also the most famous landmark in Singapore for movie and roller coaster buffs.",
    images: [
      "images/Singapore/SGSS/SGSS1.jpg",
      "images/Singapore/SGSS/SGSS2.avif",
      "images/Singapore/SGSS/SGSS3.jpg",
    ],
  ),
  Landmark(
    name: "Kranji War Memorial",
    description: "In 1942, the Empire of Japan – one of the Axis powers – invaded the Malayan Peninsula in a battle known as the Fall of Singapore. It resulted in the Japanese capture of Singapore and the largest British surrender in history, which Winston Churchill dubbed the “worst disaster in British military history”. \n\n The Kranji War Memorial is a dedicated to the bloody conflicts during this tumultuous period, specifically the battle at the Kranji River, resulting in a victory for Japan. This intergovernmental graveyard is a poignant place that is dedicated to the men and women from the United Kingdom, Australia, Canada, Sri Lanka, India, Malaya, the Netherlands, and New Zealand who died defending Singapore and Malaya against the invading Japanese forces.",
    images: [
      "images/Singapore/SGKWM/SGKWM1.jpg",
      "images/Singapore/SGKWM/SGKWM2.jpg",
      "images/Singapore/SGKWM/SGKWM3.jpg",
    ],
  ),
  Landmark(
    name: "Raffles Hotel",
    description: "The man whose name is plastered across roads, hotels, and statues is Sir Stamford Raffles, Lieutenant-Governor of the Dutch East Indies and founder of modern-day Singapore. He is credited with transforming Singapore from an obscure fishing village to a strategic seaport and is thus commemorated throughout the city.",
    images: [
      "images/Singapore/SGRLS/SGRLS1.jpg",
      "images/Singapore/SGRLS/SGRLS2.jpg",
      "images/Singapore/SGRLS/SGRLS3.jpg",
    ],
  ),
  Landmark(
    name: "Clarke Quay",
    description: "The Clarke Quay is a popular riverside quay in Singapore flanked by stylish restaurants, and high-end boutiques. Also lined up along the river are buzzing nightclubs, river cruise bumboats and floating cafes that make the place Singapore's major wining and dining area.",
    images: [
      "images/Singapore/SGCQ/SGCQ1.jpg",
      "images/Singapore/SGCQ/SGCQ2.avif",
      "images/Singapore/SGCQ/SGCQ3.avif",
    ],
  ),
  Landmark(
    name: "Sultan Mosque",
    description: "Founded in 1824, the Sultan Mosque opened to worshippers two years later and currently serves up to 5,000 people for prayers. Its board of trustees represents six ethnic groups from across Southeast Asia and India and was declared a preserved historical structure in 1975.",
    images: [
      "images/Singapore/SGSM/SGSM1.jpg",
      "images/Singapore/SGSM/SGSM2.jpeg",
      "images/Singapore/SGSM/SGSM3.jpg",
    ],
  ),
  Landmark(
    name: "Singapore Botanic Gardens",
    description: "The Singapore Botanic Gardens hold a special place in the city’s heart. As Singapore’s first UNESCO World Heritage Site. In this tropical paradise, rare plants flourish under the watchful eye of passionate botanists. Delicate orchid displays, a ginger garden, as well as themed gardens by scent, healing properties, and seeds are accessible to tour with a guide or explore on your own.",
    images: [
      "images/Singapore/SGSBG/SGSBG1.jpg",
      "images/Singapore/SGSBG/SGSBG2.jpg",
      "images/Singapore/SGSBG/SGSBG3.webp",
    ],
  ),
],

  "Thailand": [   //done
  Landmark(
    name: "Grand Palace (Bangkok)",
    description: "The palace was built in 1782 and served as the home of the Thai King for 150 years. It also housed the Royal Court and the administrative seat of government. Along with its historical significance, the palace is a very impressive piece of architecture. The Grand Palace consists of three separate courts: the outer court, the inner court, and the central court.",
    images: [
      "images/Thailand/THGP/THGP1.jpg",
      "images/Thailand/THGP/THGP2.jpg",
      "images/Thailand/THGP/THGP3.jpg",
    ],
  ),
  Landmark(
    name: "Wat Arun",
    description: "Wat Arun makes the list of 'famous buildings in Thailand' due to its cultural significance. It symbolizes the national identity of the Thai people. The temple looks imposing: it reaches about 70 meters in height. It's an architectural complex with a central prang and four companion towers. \n\n One of the capital's key attractions is called the 'Temple of Dawn.' That's because it looks magical against the rising sun. The first rays hit the porcelain spires, creating a fascinating play of light.",
    images: [
      "images/Thailand/THWA/THWA1.jpg",
      "images/Thailand/THWA/THWA2.jpeg",
      "images/Thailand/THWA/THWA3.jpg",
    ],
  ),
  Landmark(
    name: "Wat Pho",
    description: "Adjacent to the Grand Palace, Wat Pho is one of Bangkok’s oldest historical sites. Originally built as a monastery in the 16th century, it was transformed by King Rama I in the late 1700s into a public university and cultural heritage center. \n\n At this unmissable Bangkok sight, explore its beautiful gardens, colorful carved stupas, and the impressive Reclining Buddha, a 150-foot (46-meter) golden statue. Wat Pho is also the national hub for traditional Thai medicine, offering visitors the chance to experience Thai massage or learn basic techniques through courses",
    images: [
      "images/Thailand/THWP/THWP1.jpeg",
      "images/Thailand/THWP/THWP2.jpg",
      "images/Thailand/THWP/THWP3.jpg",
    ],
  ),
  Landmark(
    name: "Ayutthaya Historical Park",
    description: "One of the top UNESCO heritage sites in Thailand, Ayutthaya lies just an hour north of Bangkok, making it perfect for a day trip from Bangkok. Founded in the 14th century, where three rivers meet, this krung kao (ancient capital) ruled Siam for over 400 years.",
    images: [
      "images/Thailand/THAHP/THAHP1.jpg",
      "images/Thailand/THAHP/THAHP2.jpg",
      "images/Thailand/THAHP/THAHP3.jpeg",
    ],
  ),
  Landmark(
    name: "Phuket Beaches",
    description: "Phuket stands as the most popular destination in the Andaman Sea as it offers a wide range of experiences from the tranquil beaches, calm waters, picturesque landscapes, thrilling water activities, first-class restaurants, to vibrant nightlife in the bustling city.",
    images: [
      "images/Thailand/THPB/THPB1.jpeg",
      "images/Thailand/THPB/THPB2.jpg",
      "images/Thailand/THPB/THPB3.jpg",
    ],
  ),
  Landmark(
    name: "Chiang Mai Old City",
    description: "Chiang Mai is one of the premier cultural sites in Thailand. With so many historical buildings, the entire “Old City” is on a tentative list to become a UNESCO World Heritage site. Founded in 1296 and once the capital of the Lanna Kingdom for over 500 years, Chiang Mai still dazzles visitors with its medieval walls, imposing gates, narrow canals, and ornate temples. Cultural highlights include the towering Wat Chedi Luang, once home to the Emerald Buddha, and the seven Indian-style spires of Wat Jed Yod.",
    images: [
      "images/Thailand/THCMOC/THCMOC1.png",
      "images/Thailand/THCMOC/THCMOC2.jpg",
      "images/Thailand/THCMOC/THCMOC3.jpg",
    ],
  ),
  Landmark(
    name: "Phi Phi Islands",
    description: "Phi Phi Don and Phi Phi Leh are the largest islands in the chain. The limestone formations boast crystal-clear waters, vibrant coral reefs, and picturesque beaches. Popular activities include snorkeling, diving, and exploring Maya Bay, which was featured in the famous film, 'The Beach.'",
    images: [
      "images/Thailand/THGP/THGP1.jpg",
      "images/Thailand/THGP/THGP2.jpg",
      "images/Thailand/THGP/THGP3.jpg",
    ],
  ),
  Landmark(
    name: "Doi Inthanon",
    description: "Doi Inthanon is one of the most cherished national parks in Thailand. It is found on Thailand's tallest mountain in the north of the country, Mount Doi Inthanon, and it is well known for its incredible viewpoints, waterfalls and gardens, and surrounding remote villages. The peak stands at 2,565 meters (8,415 feet) above sea level. \n\n The park was previously known as Doi Luang but was renamed to Doi Inthanon to honor King Inthawichayanon after he passed away. The park was also used as the burial ground for the late king. ",
    images: [
      "images/Thailand/THDI/THDI1.jpg",
      "images/Thailand/THDI/THDI2.jpg",
      "images/Thailand/THDI/THDI3.jpg",
    ],
  ),
  Landmark(
    name: "Railay Beach",
    description: "Railay Beach is found between Ao Nang and Krabi. Due to its location between tall limestone cliffs, visitors must take a boat to access the beach. This tranquil beach is the perfect place to relax. You can hang out on the sandy beaches or swim and kayak. There is also a selection of beach cafes to stop at for a drink and snack.",
    images: [
      "images/Thailand/THRB/THRB1.jpg",
      "images/Thailand/THRB/THRB2.webp",
      "images/Thailand/THRB/THRB3.jpg",
    ],
  ),
  Landmark(
    name: "Bridge Over the River Kwai",
    description: "This bridge is part of the notorious Death Railway, built during World War II by the Japanese to link Thailand and Burma. Around 100,000 Allied prisoners of war lost their lives during its construction due to malnutrition and disease. Today, visitors can walk across the bridge and learn about this poignant chapter of history at the nearby World War II Museum.",
    images: [
    "images/Thailand/THBORK/THBORK1.webp",
    "images/Thailand/THBORK/THBORK2.webp",
    "images/Thailand/THBORK/THBORK3.webp",
    ],
  ),
],

  "Vietnam": [    //done
  Landmark(
    name: "Hoi An Ancient Town",
    description: "Hoi An Ancient Town, a UNESCO World Heritage site, is a well-preserved example of a Southeast Asian trading port dating from the 15th to the 19th century. The town’s unique blend of indigenous and foreign influences is evident in its architecture, which includes traditional wooden houses, the iconic Japanese Bridge, and French colonial buildings. \n\n Hoi An is also famous for its lantern festivals, where the town is illuminated with thousands of colorful lanterns. Efforts to preserve its heritage have made Hoi A living museum, offering visitors a glimpse into Vietnam’s rich history and culture. ",
    images: [
      "images/Vietnam/VNHAAT/VNHAAT1.jpg",
      "images/Vietnam/VNHAAT/VNHAAT2.jpg",
      "images/Vietnam/VNHAAT/VNHAAT3.jpg",
    ],
  ),
  Landmark(
    name: "Hue Imperial City",
    description: "Hue, the former imperial capital of Vietnam, is home to the Hue Imperial City, a vast complex of palaces, temples, walls, and gates. This UNESCO World Heritage site reflects the grandeur of the Nguyen Dynasty, which ruled from the early 19th century until 1945. Key attractions include the Imperial Citadel, the Forbidden Purple City, and the royal tombs. \n\n The architecture and layout of Hue reflect traditional Vietnamese design principles and the influence of Chinese culture. Visitors can explore the historical and cultural richness of this ancient capital, gaining insights into Vietnam’s royal heritage. ",
    images: [
      "images/Vietnam/VNHIC/VNHIC1.jpg",
      "images/Vietnam/VNHIC/VNHIC2.jpg",
      "images/Vietnam/VNHIC/VNHIC3.webp",
    ],
  ),
  Landmark(
    name: "Cu Chi Tunnels",
    description: "The Cu Chi Tunnels, located near Ho Chi Minh City, are a vast network of underground tunnels used by the Viet Cong during the Vietnam War. These tunnels played a crucial role in the war, providing hiding spots, supply routes, and living quarters for soldiers. Visitors can explore parts of the tunnel system, gaining a firsthand understanding of the conditions faced by the Viet Cong. The Cu Chi Tunnels offer a powerful insight into Vietnam’s wartime history and the resilience of its people, making it a poignant and educational experience.",
    images: [
      "images/Vietnam/VNCCT/VNCCT1.jpg",
      "images/Vietnam/VNCCT/VNCCT2.jpg",
      "images/Vietnam/VNCCT/VNCCT3.jpg",
    ],
  ),
  Landmark(
    name: "My Son Sanctuary",
    description: "My Son Sanctuary, a cluster of abandoned and partially ruined Hindu temples constructed between the 4th and 14th centuries by the Champa civilization, is one of Vietnam’s most important archaeological sites. Located near the city of Da Nang, this UNESCO World Heritage site reflects the cultural and architectural influences of Indian Hinduism. The temples, dedicated to the god Shiva, are built in a lush valley surrounded by mountains. Efforts to preserve and restore My Son have made it a significant cultural and historical landmark, offering visitors a glimpse into the ancient Cham culture.",
    images: [
      "images/Vietnam/VNMSS/VNMSS1.jpg",
      "images/Vietnam/VNMSS/VNMSS2.jpg",
      "images/Vietnam/VNMSS/VNMSS3.jpg",
    ],
  ),
  Landmark(
    name: "Sapa Rice Terraces",
    description: "Sapa, located in the northern highlands of Vietnam, is famous for its breathtaking terraced rice fields and ethnic diversity. The region is home to several ethnic minority groups, including the Hmong, Dao, and Tay, each with their unique cultural practices and traditional dress. The terraced fields, particularly during the harvest season, create a stunning landscape that attracts photographers and trekkers from around the world. Popular trekking routes offer opportunities to explore remote villages, interact with local communities, and experience the natural beauty of the region. Sapa is a must-visit destination for those seeking cultural immersion and outdoor adventure.",
    images: [
      "images/Vietnam/VNSRT/VNSRT1.jpg",
      "images/Vietnam/VNSRT/VNSRT2.jpg",
      "images/Vietnam/VNSRT/VNSRT3.jpg",
    ],
  ),
  Landmark(
    name: "Hoan Kiem Lake",
    description: "Hoan Kiem Lake, situated in the heart of Hanoi, is a symbol of the city’s cultural and historical heritage. The lake is associated with the legend of King Le Loi and the magical sword, which he returned to the Golden Turtle God. Ngoc Son Temple, located on an island in the lake, is dedicated to General Tran Hung Dao and other national heroes. The lake and temple are popular spots for both locals and tourists, offering a serene escape from the bustling city. Activities around the lake include morning tai chi sessions, leisurely walks, and visits to the temple.",
    images: [
      "images/Vietnam/VNHKL/VNHKL1.jpg",
      "images/Vietnam/VNHKL/VNHKL2.jpg",
      "images/Vietnam/VNHKL/VNHKL3.webp",
    ],
  ),
  Landmark(
    name: "War Remnants Museum",
    description: "The War Remnants Museum in Ho Chi Minh City provides a sobering and educational perspective on the Vietnam War. The museum’s exhibits include photographs, documents, and artifacts that illustrate the harsh realities of the war and its impact on the Vietnamese people. Key exhibits feature the effects of Agent Orange, the My Lai Massacre, and the war’s impact on civilians.",
    images: [
      "images/Vietnam/VNWRM/VNWRM1.jpg",
      "images/Vietnam/VNWRM/VNWRM2.jpg",
      "images/Vietnam/VNWRM/VNWRM3.webp",
    ],
  ),
  Landmark(
    name: "Mekong Delta",
    description: "The Mekong Delta, often referred to as the “Rice Bowl of Vietnam,” is a region of immense agricultural importance and natural beauty. Its vast network of rivers, swamps, and islands supports a rich biodiversity and vibrant local culture. Key attractions in the Mekong Delta include floating markets like Cai Rang and Phong Dien, where traders sell fresh produce from their boats. River cruises offer a unique way to explore the delta, visiting traditional villages and experiencing the local way of life. The Mekong Delta is not only a critical economic region but also a cultural treasure of Vietnam.",
    images: [
      "images/Vietnam/VNMD/VNMD1.jpg",
      "images/Vietnam/VNMD/VNMD2.jpg",
      "images/Vietnam/VNMD/VNMD3.jpg",
    ],
  ),
  Landmark(   //QUESTIONABLE VNBH
    name: "Ba Na Hills (Golden Bridge)",
    description: "Ba Na Hills, located near Da Nang, is a mountain resort complex known for its scenic beauty and attractions. The Golden Bridge, a pedestrian bridge held up by giant stone hands, is one of the most iconic landmarks in the area. The French Village offers a taste of European architecture and culture, complete with cobblestone streets and charming buildings. Visitors can take a cable car ride to enjoy panoramic views of the surrounding mountains and lush landscapes. Ba Na Hills combines natural beauty with cultural and recreational experiences, making it a popular destination for tourists.",
    images: [
      "images/Vietnam/VNBNS/VNBNS1.jpg",
      "images/Vietnam/VNBNS/VNBNS2.jpg",
      "images/Vietnam/VNBNS/VNBNS3.jpg",
    ],
  ),
  Landmark(
    name: "Ninh Binh",
    description: "Ninh Binh, often referred to as “Ha Long Bay on land,” is famous for its scenic karst landscapes and cultural heritage. Key attractions include Tam Coc, where boat rides through rice paddies and limestone caves offer stunning views, and Trang An, a UNESCO World Heritage site known for its complex network of rivers and caves. Bai Dinh Pagoda, the largest pagoda in Vietnam, is another significant site, attracting pilgrims and tourists alike. Ninh Binh’s natural and historical sites provide a tranquil escape and a deep dive into Vietnam’s rich cultural heritage.",
    images: [
      "images/Vietnam/VNNB/VNNB1.jpg",
      "images/Vietnam/VNNB/VNNB2.jpg",
      "images/Vietnam/VNNB/VNNB3.jpg",
    ],
  ),
],

  "Timor-Leste": [    //done
  Landmark(
    name: "Cristo Rei of Dili",
    description: "Dili is East Timor’s largest city where you’ll find new restaurants, textile shops, produce markets, and seafood stands amongst thatch roofed homes. On the beaches of Dili, you can enjoy freshly cooked seafood, drink a coconut, and watch whales swim along the coastline during migration season. Scuba diving in Dili is known to be great all year and is home to a variety of corals, blue moray eels, trevally, scorpion fish reef sharks, and more.",
    images: [
      "images/Timor-Leste/TLCRD/TLCRD1.jpg",
      "images/Timor-Leste/TLCRD/TLCRD2.jpg",
      "images/Timor-Leste/TLCRD/TLCRD3.webp",
    ],
  ),
  Landmark(
    name: "Atauro Island",
    description: "Thirty kilometers from the beaches of Dili is Atauro Island, accessible only via boat ride. Here, you’ll find world-class diving, walking paths, and are likely to catch a glimpse of the resident pod of dolphins. Atauro means “goat” in the local language, so expect to see many there too.",
    images: [
      "images/Timor-Leste/TLAS/TLAS1.jpg",
      "images/Timor-Leste/TLAS/TLAS2.jpeg",
      "images/Timor-Leste/TLAS/TLAS3.jpg",
    ],
  ),
  Landmark(
    name: "Jaco Island",
    description: "Jaco Island is an offbeat oasis of white sand and an active marine life of reef sharks, sea turtles, dolphins, and technicolor fish. Since Jaco Island is sacred, it is largely uninhabited. There is only a small guesthouse and camping area for those who want to spend the night.",
    images: [
      "images/Timor-Leste/TLJI/TLJI1.jpg",
      "images/Timor-Leste/TLJI/TLJI2.webp",
      "images/Timor-Leste/TLJI/TLJI3.webp",
    ],
  ),
  Landmark(
    name: "Mount Ramelau",
    description: "Hikers must visit Mt. Ramelau, where you can stay at the base in the town of Hatubuilico. The hike from bottom to top takes around six hours, with most hikers leaving before sunrise. After three hours of hiking, you’ll be greeted by a statue of the Virgin Mary, another one of the country’s famous religious icons.",
    images: [
      "images/Timor-Leste/TLMR/TLMR1.jpg",
      "images/Timor-Leste/TLMR/TLMR2.jpg",
      "images/Timor-Leste/TLMR/TLMR3.jpg",
    ],
  ),
  Landmark(
    name: "Nino Konis Santana National Park",
    description: "Home to over 250 species of birds, wildlife, trekking trails, and more, this lowland rainforest is perfect for adventure seekers obsessed with nature. Keep an eye out for the Yellow-crested Cockatoo, a beautiful and intelligent bird that is critically endangered.",
    images: [
      "images/Timor-Leste/TLNKSNP/TLNKSNP1.jpg",
      "images/Timor-Leste/TLNKSNP/TLNKSNP2.jpg",
      "images/Timor-Leste/TLNKSNP/TLNKSNP3.jpg",
    ],
  ),
  Landmark(
    name: "Santa Cruz Cemetery",
    description: "Santa Cruz Cemetery is a poignant historical site in Dili that bears witness to the Santa Cruz Massacre that occurred on November 12, 1991, where over 250 Timorese protestors were shot and killed by Indonesian forces. This event marked a turning point in Timor-Leste's pursuit of independence, as it captured international attention and led to increased global support for their cause.",
    images: [
      "images/Timor-Leste/TLSCC/TLSCC1.jpg",
      "images/Timor-Leste/TLSCC/TLSCC2.jpg",
      "images/Timor-Leste/TLSCC/TLSCC3.jpg",
    ],
  ),
  Landmark(
    name: "Resistance Museum",
    description: "The Resistance Museum is an institution dedicated to documenting and preserving the history of Timor-Leste's struggle for independence from Indonesian occupation. It lies in the heart of Dili and offers visitors a deep and somber understanding of the sacrifices and resilience of the Timorese people.",
    images: [
      "images/Timor-Leste/TLRM/TLRM1.webp",
      "images/Timor-Leste/TLRM/TLRM2.jpg",
      "images/Timor-Leste/TLRM/TLRM3.avif",
    ],
  ),
  Landmark(
    name: "Areia Branca Beach",
    description: "Areia Branca Beach is one of Dili's most popular local spots, known for its fine white sand and clear waters. The beachfront offers a relaxing ambiance and is the perfect place to unwind, with a range of seaside restaurants and bars providing visitors with options for refreshments and dining with an ocean view.",
    images: [
      "images/Timor-Leste/TLABB/TLABB1.jpg",
      "images/Timor-Leste/TLABB/TLABB2.jpg",
      "images/Timor-Leste/TLABB/TLABB3.webp",
    ],
  ),
  Landmark(
    name: "Valu Beach",
    description: "Valu Beach is the rare place where the “remote paradise” cliché is underselling it: the surprising bit is that, unlike many hyped Southeast Asian beaches, you’ll often share this one with more goats than people. It sits at the far eastern tip of Timor-Leste, near Tutuala, facing Jaco Island.",
    images: [
      "images/Timor-Leste/TLVB/TLVB1.jpg",
      "images/Timor-Leste/TLVB/TLVB2.jpg",
      "images/Timor-Leste/TLVB/TLVB3.jpg",
    ],
  ),
  Landmark(
    name: "Baucau",
    description: "Baucau almost seems as if it could be two separate cities. In Old Town, you’ll find Portuguese colonial architecture while New Town hosts new buildings with an Indonesian influence. Stop by the bright yellow government building, formerly the town’s community market.",
    images: [
      "images/Timor-Leste/TLB/TLB1.webp",
      "images/Timor-Leste/TLB/TLB2.jpg",
      "images/Timor-Leste/TLB/TLB2.webp",
    ],
  ),
],

};