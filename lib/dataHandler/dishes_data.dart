import '../models/travel_models.dart';

const Map<String, List<Dish>> countryDishesData = {
  "Brunei": [
    Dish(
      name: "Ambuyat",
      description:
          "A traditional translucent, sticky, glue‑like paste made from sago starch. It has a neutral taste and is eaten by twirling it with a 'candas' and dipping it into savory or spicy sauces.",
      history:
          "A long-standing staple for indigenous communities in Borneo. It became a critical primary food source during WWII when rice was scarce under Japanese occupation.",
      regionOrigin: "Brunei Darussalam and parts of East Malaysia",
      images: [
        "images/dishes/Brunei/BNAmbuyat/BNAmbuyat1.jpg",
        "images/dishes/Brunei/BNAmbuyat/BNAmbuyat2.jpeg",
        "images/dishes/Brunei/BNAmbuyat/BNAmbuyat3.jpg",
      ],
    ),
    Dish(
      name: "Serunding",
      description:
          "A dry, spiced meat floss made from shredded beef or chicken cooked with coconut and aromatic spices until crispy.",
      history:
          "Originated as a traditional method of preserving meat using spices and slow cooking, commonly prepared during festivals.",
      regionOrigin: "Brunei",
      images: [
        "images/dishes/Brunei/BNSerunding/BNSerunding1.jpg",
        "images/dishes/Brunei/BNSerunding/BNSerunding2.jpg",
        "images/dishes/Brunei/BNSerunding/BNSerunding3.jpg",
      ],
    ),
    Dish(
      name: "Hati Buyah",
      description:
          "Thinly sliced beef or chicken liver cooked with spices, resulting in a savory and slightly sweet flavor profile.",
      history:
          "A home-style Malay dish influenced by traditional spice-based cooking, commonly prepared for family meals.",
      regionOrigin: "Kampong Ayer, Bandar Seri Begawan",
      images: [
        "images/dishes/Brunei/BNHatiB/BNHatiB1.jpg",
        "images/dishes/Brunei/BNHatiB/BNHatiB2.jpg",
        "images/dishes/Brunei/BNHatiB/BNHatiB3.jpg",
      ],
    ),
    Dish(
      name: "Nasi Katok",
      description:
          "A simple, popular meal consisting of steamed white rice, fried chicken, and spicy sambal, usually served in a small packet.",
      history:
          "Became a staple as an affordable, quick meal sold by roadside vendors, particularly popular with students and workers.",
      regionOrigin: "Bandar Seri Begawan, Brunei",
      images: [
        "images/dishes/Brunei/BNNasiK/BNNasiK1.jpg",
        "images/dishes/Brunei/BNNasiK/BNNasiK2.jpg",
        "images/dishes/Brunei/BNNasiK/BNNasiK3.jpg",
      ],
    ),
    Dish(
      name: "Ayam Penyet",
      description:
          "Fried chicken that is lightly smashed to tenderize the meat, served with sambal, rice, tofu, and fresh vegetables.",
      history:
          "Originally from Indonesia, this dish was adapted to local Bruneian tastes and became widely popular through local food stalls.",
      regionOrigin: "Bandar Seri Begawan, Brunei",
      images: [
        "images/dishes/Brunei/BNAyamP/BNAyamP1.jpg",
        "images/dishes/Brunei/BNAyamP/BNAyamP2.jpg",
        "images/dishes/Brunei/BNAyamP/BNAyamP3.jpg",
      ],
    ),
    Dish(
      name: "Soto Brunei",
      description:
          "A traditional soup made with a flavorful broth, shredded meat, and rice cakes, garnished with fresh herbs.",
      history:
          "A local variation of Malay soto, specifically adapted to Bruneian preferences for family gatherings and special occasions.",
      regionOrigin: "Bandar Seri Begawan, Brunei",
      images: [
        "images/dishes/Brunei/BNSoto/BNSoto1.jpg",
        "images/dishes/Brunei/BNSoto/BNSoto2.jpg",
        "images/dishes/Brunei/BNSoto/BNSoto3.jpg",
      ],
    ),
    Dish(
      name: "Pulut Panggang",
      description:
          "Grilled glutinous rice filled with seasoned shrimp or coconut, wrapped in banana leaves and cooked over charcoal.",
      history:
          "A traditional Malay delicacy sold in local markets, reflecting the nation's rich heritage of rice-based snacks.",
      regionOrigin: "Bandar Seri Begawan, Brunei",
      images: [
        "images/dishes/Brunei/BNPulutP/BNPulutP1.jpg",
        "images/dishes/Brunei/BNPulutP/BNPulutP2.jpg",
        "images/dishes/Brunei/BNPulutP/BNPulutP3.jpg",
      ],
    ),
    Dish(
      name: "Kelupis",
      description:
          "A chewy snack made from glutinous rice, coconut milk, and pandan, steamed inside nyirik leaves.",
      history:
          "Historically prepared in large batches for weddings and cultural celebrations, symbolizing local hospitality.",
      regionOrigin: "Bandar Seri Begawan, Brunei",
      images: [
        "images/dishes/Brunei/BNKelupis/BNKelupis1.jpg",
        "images/dishes/Brunei/BNKelupis/BNKelupis2.jpg",
        "images/dishes/Brunei/BNKelupis/BNKelupis3.jpg",
      ],
    ),
    Dish(
      name: "Daging Masak Hitam",
      description:
          "A rich, slow-cooked beef dish with a thick, dark, glossy gravy made from sweet soy sauce and aromatics.",
      history:
          "A generational Malay recipe where slow cooking tenderizes the beef and develops deep, complex flavors.",
      regionOrigin: "Bandar Seri Begawan, Brunei",
      images: [
        "images/dishes/Brunei/BNDMH/BNDMH1.jpg",
        "images/dishes/Brunei/BNDMH/BNDMH2.jpg",
        "images/dishes/Brunei/BNDMH/BNDMH3.jpg",
      ],
    ),
    Dish(
      name: "Wajid",
      description:
          "A sweet, dense, and sticky treat made from glutinous rice, coconut milk, and palm sugar, often wrapped in leaves.",
      history:
          "Passed down through generations, specifically in Temburong, using local 'beras Jawa' rice and traditional wrapping techniques.",
      regionOrigin: "Temburong District, Brunei",
      images: [
        "images/dishes/Brunei/BNWajid/BNWajid1.jpg",
        "images/dishes/Brunei/BNWajid/BNWajid2.jpg",
        "images/dishes/Brunei/BNWajid/BNWajid3.jpg",
      ],
    ),
  ],

  "Cambodia": [
    Dish(
      name: "Amok Trey",
      description:
          "Freshwater fish marinated in kroeung paste and coconut milk, steamed in banana leaves to a custard-like texture.",
      history:
          "Traces back to the royal kitchens of the ancient Khmer Empire (9th–15th century) before becoming a national staple.",
      regionOrigin: "Regions around the Tonlé Sap and Mekong waterways",
      images: [
        "images/dishes/Cambodia/KHAmokT/KHAmokT1.jpg",
        "images/dishes/Cambodia/KHAmokT/KHAmokT2.jpg",
        "images/dishes/Cambodia/KHAmokT/KHAmokT3.jpg",
      ],
    ),
    Dish(
      name: "Lok Lak",
      description:
          "Stir-fried beef slices marinated in soy, oyster sauce, and black pepper, served with a lime-pepper dipping sauce.",
      history:
          "Emerged in the 20th century, influenced by French and Chinese techniques, becoming a recognized Cambodian comfort food.",
      regionOrigin: "Phnom Penh, Cambodia",
      images: [
        "images/dishes/Cambodia/KHLokLak/KHLokLak1.png",
        "images/dishes/Cambodia/KHLokLak/KHLokLak2.jpg",
        "images/dishes/Cambodia/KHLokLak/KHLokLak3.jpg",
      ],
    ),
    Dish(
      name: "Khmer Red Curry",
      description:
          "A mildly spiced coconut milk curry with meat and vegetables, focusing on a rich, slightly sweet aroma rather than heat.",
      history:
          "Reflects the long-standing Khmer tradition of balancing aromatic spices, historically served at ceremonial occasions.",
      regionOrigin: "Phnom Penh and central Cambodia",
      images: [
        "images/dishes/Cambodia/KHKhmerRC/KHKhmerRC1.jpg",
        "images/dishes/Cambodia/KHKhmerRC/KHKhmerRC2.jpg",
        "images/dishes/Cambodia/KHKhmerRC/KHKhmerRC3.jpg",
      ],
    ),
    Dish(
      name: "Bai Sach Chrouk",
      description:
          "Grilled pork marinated in garlic and coconut milk, served over steamed rice with pickled vegetables and broth.",
      history:
          "Originated as a convenient, affordable street-food breakfast favorite for families in urban areas.",
      regionOrigin: "Phnom Penh, Cambodia",
      images: [
        "images/dishes/Cambodia/KHBSC/KHBSC1.jpg",
        "images/dishes/Cambodia/KHBSC/KHBSC2.jpg",
        "images/dishes/Cambodia/KHBSC/KHBSC3.jpg",
      ],
    ),
    Dish(
      name: "Nom Banh Chok",
      description:
          "Rice noodles topped with a fish-based green curry sauce and an abundance of fresh, raw herbs and vegetables.",
      history:
          "A centuries-old staple of Cambodian cuisine, often associated with communal dining and local markets.",
      regionOrigin: "Siem Reap and northern Cambodia",
      images: [
        "images/dishes/Cambodia/KHNBC/KHNBC1.jpg",
        "images/dishes/Cambodia/KHNBC/KHNBC2.jpg",
        "images/dishes/Cambodia/KHNBC/KHNBC3.jpg",
      ],
    ),
    Dish(
      name: "Kuy Teav",
      description:
          "A light and flavorful noodle soup made from pork or beef broth, served with rice noodles, herbs, and fried garlic.",
      history:
          "Popularized in urban centers as an affordable street-food staple that emphasizes the balance of fresh herbs.",
      regionOrigin: "Phnom Penh, Cambodia",
      images: [
        "images/dishes/Cambodia/KHKuyT/KHKuyT1.jpg",
        "images/dishes/Cambodia/KHKuyT/KHKuyT2.jpg",
        "images/dishes/Cambodia/KHKuyT/KHKuyT3.jpg",
      ],
    ),
    Dish(
      name: "Prahok",
      description:
          "A pungent, fermented fish paste used as a central seasoning or condiment to add depth and umami to dishes.",
      history:
          "Used for centuries in rural communities as a vital way to preserve fish and flavor meals before refrigeration.",
      regionOrigin: "Rural lowland regions along the Mekong River",
      images: [
        "images/dishes/Cambodia/KHPrahok/KHPrahok1.jpg",
        "images/dishes/Cambodia/KHPrahok/KHPrahok2.jpg",
        "images/dishes/Cambodia/KHPrahok/KHPrahok3.jpg",
      ],
    ),
    Dish(
      name: "Cha Kroeung Sach Ko",
      description:
          "Stir-fried beef cooked with 'kroeung' (lemongrass, galangal, turmeric, and kaffir lime) for a highly aromatic finish.",
      history:
          "Reflects traditional Khmer cooking where complex spice pastes are essential for flavoring meats.",
      regionOrigin: "Central Cambodia",
      images: [
        "images/dishes/Cambodia/KHCKSK/KHCKSK1.jpg",
        "images/dishes/Cambodia/KHCKSK/KHCKSK2.jpg",
        "images/dishes/Cambodia/KHCKSK/KHCKSK3.jpg",
      ],
    ),
    Dish(
      name: "Samlor Machu",
      description:
          "A refreshing sour soup typically prepared with fish or pork, tamarind, pineapple, and tomatoes.",
      history:
          "A traditional family dish favored for its light and appetizing qualities, used to balance richer foods during meals.",
      regionOrigin: "Tonle Sap region",
      images: [
        "images/dishes/Cambodia/KHSamlorMM/KHSamlorM1.jpg",
        "images/dishes/Cambodia/KHSamlorM/KHSamlorM2.jpg",
        "images/dishes/Cambodia/KHSamlorM/KHSamlorM3.jpg",
      ],
    ),
    Dish(
      name: "Num Ansom",
      description:
          "Sticky rice cakes filled with banana, mung bean, or pork, wrapped in banana leaves and steamed.",
      history:
          "Symbolizes prosperity and unity; traditionally prepared for weddings and the Khmer New Year.",
      regionOrigin: "Central Cambodia and the Tonlé Sap basin",
      images: [
        "images/dishes/Cambodia/KHNumA/KHNumA1.jpg",
        "images/dishes/Cambodia/KHNumA/KHNumA2.jpg",
        "images/dishes/Cambodia/KHNumA/KHNumA3.jpg",
      ],
    ),
  ],

  "Indonesia": [
    Dish(
      name: "Nasi Goreng",
      description:
          "Indonesian fried rice stir-fried with kecap manis (sweet soy sauce), garlic, shallots, and chili.",
      history:
          "Reflects the fusion of indigenous tastes with Chinese culinary influences, becoming prominent during the Dutch colonial era.",
      regionOrigin: "Throughout Indonesia (strong Javanese roots)",
      images: [
        "images/dishes/Indonesia/IDNGoreng/IDNGoreng1.jpg",
        "images/dishes/Indonesia/IDNGoreng/IDNGoreng2.jpg",
        "images/dishes/Indonesia/IDNGoreng/IDNGoreng3.jpg",
      ],
    ),
    Dish(
      name: "Rendang",
      description:
          "A slow-cooked beef dish braised in coconut milk and spices until the liquid evaporates, leaving tender, dry-fried meat.",
      history:
          "Developed by the Minangkabau people as a ceremonial dish for weddings and Eid celebrations.",
      regionOrigin: "West Sumatra (Minangkabau communities)",
      images: [
        "images/dishes/Indonesia/IDRendang/IDRendang1.jpg",
        "images/dishes/Indonesia/IDRendang/IDRendang2.jpg",
        "images/dishes/Indonesia/IDRendang/IDRendang3.jpg",
      ],
    ),
    Dish(
      name: "Satay",
      description:
          "Skewered, marinated meat grilled over charcoal and served with a rich, savory peanut sauce.",
      history:
          "Originated in Java with influences from Indian kebabs, evolving into a widespread street food staple.",
      regionOrigin: "Java, Indonesia",
      images: [
        "images/dishes/Indonesia/IDSatay/IDSatay1.jpg",
        "images/dishes/Indonesia/IDSatay/IDSatay2.jpg",
        "images/dishes/Indonesia/IDSatay/IDSatay3.jpg",
      ],
    ),
    Dish(
      name: "Gado-Gado",
      description:
          "A composed salad of boiled vegetables, tofu, and tempeh, topped with a distinctive peanut dressing.",
      history:
          "Its name means 'mix-mix,' signifying resourcefulness; it is recognized as one of Indonesia's national dishes.",
      regionOrigin: "Jakarta and West Java",
      images: [
        "images/dishes/Indonesia/IDGado/IDGado1.jpg",
        "images/dishes/Indonesia/IDGado/IDGado2.jpg",
        "images/dishes/Indonesia/IDGado/IDGado3.jpg",
      ],
    ),
    Dish(
      name: "Soto Ayam",
      description:
          "A turmeric-spiced chicken soup with vermicelli, boiled eggs, and fried shallots in an aromatic broth.",
      history:
          "Deep Javanese roots; evolved from a home-cooked meal to a popular, nourishing, and affordable street food.",
      regionOrigin: "Central and East Java",
      images: [
        "images/dishes/Indonesia/IDSotoA/IDSotoA1.jpg",
        "images/dishes/Indonesia/IDSotoA/IDSotoA2.jpg",
        "images/dishes/Indonesia/IDSotoA/IDSotoA3.jpg",
      ],
    ),
    Dish(
      name: "Bakso",
      description:
          "Chewy meatballs made from ground beef and tapioca, served in a clear savory broth with noodles and tofu.",
      history:
          "Influenced by Chinese meatball recipes and adapted over centuries into a ubiquitous urban street food.",
      regionOrigin: "Jakarta and Surabaya, Java",
      images: [
        "images/dishes/Indonesia/IDBakso/IDBakso1.jpg",
        "images/dishes/Indonesia/IDBakso/IDBakso2.jpg",
        "images/dishes/Indonesia/IDBakso/IDBakso3.jpg",
      ],
    ),
    Dish(
      name: "Nasi Padang",
      description:
          "Steamed rice served with a variety of pre-cooked Minangkabau dishes presented in the 'hidang' (buffet) style.",
      history:
          "Reflects the hospitality of the Minangkabau people, traditionally served for communal and festive gatherings.",
      regionOrigin: "West Sumatra",
      images: [
        "images/dishes/Indonesia/IDNPadang/IDNPadang1.jpg",
        "images/dishes/Indonesia/IDNPadang/IDNPadang2.jpg",
        "images/dishes/Indonesia/IDNPadang/IDNPadang3.jpg",
      ],
    ),
    Dish(
      name: "Pempek",
      description:
          "Fish cakes made from ground fish and tapioca, served with 'cuko,' a tangy-sweet palm sugar sauce.",
      history:
          "Originating in Palembang, it reflects Chinese influence in fish processing adapted to local river fish.",
      regionOrigin: "Palembang, South Sumatra",
      images: [
        "images/dishes/Indonesia/IDPempek/IDPempek1.jpg",
        "images/dishes/Indonesia/IDPempek/IDPempek2.jpg",
        "images/dishes/Indonesia/IDPempek/IDPempek3.jpg",
      ],
    ),
    Dish(
      name: "Ayam Goreng",
      description:
          "Indonesian-style fried chicken marinated in turmeric and galangal, then deep-fried until crisp without batter.",
      history:
          "Evolved from traditional marination methods where deep spice infusion is the priority over coating.",
      regionOrigin: "Central and East Java",
      images: [
        "images/dishes/Indonesia/IDAyamG/IDAyamG1.jpg",
        "images/dishes/Indonesia/IDAyamG/IDAyamG2.jpg",
        "images/dishes/Indonesia/IDAyamG/IDAyamG3.jpg",
      ],
    ),
    Dish(
      name: "Rawon",
      description:
          "A beef soup with a dark broth flavored by 'keluak' nuts, giving it an earthy, nutty, and aromatic taste.",
      history:
          "An East Javanese culinary icon that utilizes indigenous nuts to create a unique color and flavor profile.",
      regionOrigin: "East Java, Indonesia",
      images: [
        "images/dishes/Indonesia/IDRawon/IDRawon1.jpg",
        "images/dishes/Indonesia/IDRawon/IDRawon2.jpg",
        "images/dishes/Indonesia/IDRawon/IDRawon3.jpeg",
      ],
    ),
  ],

  "Laos": [
    Dish(
      name: "Laap",
      description:
          "A minced meat salad seasoned with lime, fish sauce, herbs, and roasted ground rice.",
      history:
          "The national dish of Laos, symbolizing prosperity; historically prepared for major ceremonies and celebrations.",
      regionOrigin: "Central Laos, Vientiane",
      images: [
        "images/dishes/Laos/LALaap/LALaap1.jpg",
        "images/dishes/Laos/LALaap/LALaap2.jpg",
        "images/dishes/Laos/LALaap/LALaap3.webp",
      ],
    ),
    Dish(
      name: "Sticky Rice (Khao Niew)",
      description:
          "A staple glutinous rice that is steamed in a bamboo basket and eaten by hand.",
      history:
          "The foundation of Lao dietary culture for centuries; Laos has the highest per-capita consumption of it in the world.",
      regionOrigin: "Widely cultivated throughout Laos",
      images: [
        "images/dishes/Laos/LAStickyR/LAStickyR1.jpg",
        "images/dishes/Laos/LAStickyR/LAStickyR2.jpg",
        "images/dishes/Laos/LAStickyR/LAStickyR3.jpg",
      ],
    ),
    Dish(
      name: "Tam Mak Hoong",
      description:
          "Spicy green papaya salad made with 'padaek' (fermented fish sauce), lime, and chili.",
      history:
          "A distinct Lao identity of papaya salad that uses strong fermented flavors; a staple of rural and street-food life.",
      regionOrigin: "Central Laos, Vientiane",
      images: [
        "images/dishes/Laos/LATamMH/LATamMH1.jpg",
        "images/dishes/Laos/LATamMH/LATamMH2.jpg",
        "images/dishes/Laos/LATamMH/LATamMH3.jpg",
      ],
    ),
    Dish(
      name: "Khao Piak Sen",
      description:
          "Handmade chewy rice noodles in a rich chicken or pork broth, garnished with fried garlic and herbs.",
      history:
          "Reflects noodle-making exchanges with Vietnam and China, evolving into a unique Lao comfort breakfast.",
      regionOrigin: "Northern Laos (Luang Prabang)",
      images: [
        "images/dishes/Laos/LAKhaoPS/LAKhaoPS1.jpg",
        "images/dishes/Laos/LAKhaoPS/LAKhaoPS2.webp",
        "images/dishes/Laos/LAKhaoPS/LAKhaoPS3.webp",
      ],
    ),
    Dish(
      name: "Or Lam",
      description:
          "A rustic stew with meat and vegetables, flavored with 'sakhan' (spicy bitter vine) and forest herbs.",
      history:
          "Originated in northern communities using locally sourced forest ingredients and game meats.",
      regionOrigin: "Luang Prabang, Northern Laos",
      images: [
        "images/dishes/Laos/LAOrLam/LAOrLam1.jpg",
        "images/dishes/Laos/LAOrLam/LAOrLam2.jpg",
        "images/dishes/Laos/LAOrLam/LAOrLam3.jpg",
      ],
    ),
    Dish(
      name: "Sai Oua",
      description:
          "A fragrant grilled pork sausage packed with lemongrass, kaffir lime, and galangal.",
      history:
          "Reflects the tradition of flavoring and preserving meat with local herbs, common in markets and festivals.",
      regionOrigin: "Northern Laos (Luang Prabang)",
      images: [
        "images/dishes/Laos/LASaiOua/LASaiOua1.jpg",
        "images/dishes/Laos/LASaiOua/LASaiOua2.png",
        "images/dishes/Laos/LASaiOua/LASaiOua3.jpg",
      ],
    ),
    Dish(
      name: "Mok Pa",
      description:
          "Freshwater fish marinated in herbs and steamed inside a banana leaf packet.",
      history:
          "Developed by riverside communities along the Mekong using traditional leaf-steaming to lock in moisture.",
      regionOrigin: "Central Laos (Mekong River basin)",
      images: [
        "images/dishes/Laos/LAMokPa/LAMokPa1.jpg",
        "images/dishes/Laos/LAMokPa/LAMokPa2.jpg",
        "images/dishes/Laos/LAMokPa/LAMokPa3.jpg",
      ],
    ),
    Dish(
      name: "Jeow Bong",
      description:
          "A sweet and spicy chili paste made with dried chilies and often shredded buffalo skin.",
      history:
          "A traditional preserved condiment used to enhance flavor in daily meals, especially in the north.",
      regionOrigin: "Luang Prabang, Northern Laos",
      images: [
        "images/dishes/Laos/LAJeowB/LAJeowB1.jpg",
        "images/dishes/Laos/LAJeowB/LAJeowB2.jpg",
        "images/dishes/Laos/LAJeowB/LAJeowB3.jpg",
      ],
    ),
    Dish(
      name: "Khao Soi Lao",
      description:
          "Flat rice noodles in a savory pork and tomato-based broth, typically served without coconut milk.",
      history:
          "A regional variation of the noodle dish that maintains a unique Lao identity through its herb-heavy, clear broth.",
      regionOrigin: "Northern Laos (Luang Prabang)",
      images: [
        "images/dishes/Laos/LAKhaoSL/LAKhaoSL1.jpg",
        "images/dishes/Laos/LAKhaoSL/LAKhaoSL2.jpg",
        "images/dishes/Laos/LAKhaoSL/LAKhaoSL3.jpg",
      ],
    ),
    Dish(
      name: "Ping Kai",
      description:
          "Charcoal-grilled chicken marinated deeply in garlic, fish sauce, and coriander roots.",
      history:
          "Evolved from open-fire cooking practices in rural villages; a staple pair for sticky rice and papaya salad.",
      regionOrigin: "Central and Northern Laos",
      images: [
        "images/dishes/Laos/LAPingKa/LAPingKa1.jpg",
        "images/dishes/Laos/LAPingKa/LAPingKa2.jpg",
        "images/dishes/Laos/LAPingKa/LAPingKa3.jpg",
      ],
    ),
  ],

  "Malaysia": [
    Dish(
      name: "Nasi Lemak",
      description:
          "Widely regarded as Malaysia’s national dish, consisting of rice cooked in coconut milk and pandan leaves, served with sambal, anchovies, peanuts, and egg.",
      history:
          "Originally a portable breakfast for rural Malay communities wrapped in banana leaves; it evolved into a national culinary symbol eaten all day.",
      regionOrigin: "Peninsular Malaysia",
      images: [
        "images/dishes/Malaysia/MYNLemak/MYNLemak1.jpg",
        "images/dishes/Malaysia/MYNLemak/MYNLemak2.jpg",
        "images/dishes/Malaysia/MYNLemak/MYNLemak3.jpg",
      ],
    ),
    Dish(
      name: "Char Kway Teow",
      description:
          "Flat rice noodles stir-fried over intense heat (wok hei) with prawns, cockles, Chinese sausage, bean sprouts, and egg.",
      history:
          "Traced to Chinese immigrant communities (Hokkien and Teochew). Once a humble laborer's meal, it is now an iconic hawker specialty.",
      regionOrigin: "Penang, Malaysia",
      images: [
        "images/dishes/Malaysia/MYCharKT/MYCharKT1.jpg",
        "images/dishes/Malaysia/MYCharKT/MYCharKT2.jpg",
        "images/dishes/Malaysia/MYCharKT/MYCharKT3.jpg",
      ],
    ),
    Dish(
      name: "Satay",
      description:
          "Meat skewers (chicken or beef) marinated in turmeric and spices, grilled over charcoal and served with a thick peanut sauce and ketupat.",
      history:
          "Developed through cultural exchanges between Malay and Indonesian traditions, becoming a staple of night markets and festivals.",
      regionOrigin: "Johor, Malaysia",
      images: [
        "images/dishes/Malaysia/MYSatay/MYSatay1.jpg",
        "images/dishes/Malaysia/MYSatay/MYSatay2.jpg",
        "images/dishes/Malaysia/MYSatay/MYSatay3.jpg",
      ],
    ),
    Dish(
      name: "Roti Canai",
      description:
          "A flaky, layered flatbread stretched and griddled until crisp, typically served with dhal or meat curry.",
      history:
          "Introduced by Indian Muslim migrants and popularized in 'mamak' stalls, reflecting Malaysia's multicultural landscape.",
      regionOrigin: "Peninsular Malaysia (Urban Centers)",
      images: [
        "images/dishes/Malaysia/MYRotiC/MYRotiC1.jpg",
        "images/dishes/Malaysia/MYRotiC/MYRotiC2.jpg",
        "images/dishes/Malaysia/MYRotiC/MYRotiC3.jpg",
      ],
    ),
    Dish(
      name: "Laksa",
      description:
          "A spicy noodle soup that varies by region, featuring either a coconut curry broth or a tangy fish-based tamarind broth.",
      history:
          "Reflects the blending of Malay and Chinese Peranakan influences, with famous versions like Asam Laksa and Curry Laksa.",
      regionOrigin: "Penang, Malaysia",
      images: [
        "images/dishes/Malaysia/MYLaksa/MYLaksa1.jpg",
        "images/dishes/Malaysia/MYLaksa/MYLaksa2.jpg",
        "images/dishes/Malaysia/MYLaksa/MYLaksa3.jpg",
      ],
    ),
    Dish(
      name: "Rendang",
      description:
          "Slow-cooked beef or chicken simmered in coconut milk and aromatic spices until the sauce is thick and intensely flavored.",
      history:
          "Though originating in Sumatra, it is deeply integrated into Malay culture and traditionally prepared for Hari Raya celebrations.",
      regionOrigin: "Peninsular Malaysia",
      images: [
        "images/dishes/Malaysia/MYRendang/MYRendang1.jpg",
        "images/dishes/Malaysia/MYRendang/MYRendang2.jpg",
        "images/dishes/Malaysia/MYRendang/MYRendang3.jpg",
      ],
    ),
    Dish(
      name: "Nasi Kandar",
      description:
          "Steamed rice served with a variety of side dishes and a signature mix of multiple gravies (flooded curry) poured over the top.",
      history:
          "Started with Indian Muslim traders in Penang who sold rice from baskets balanced on poles (kandar).",
      regionOrigin: "Penang, Malaysia",
      images: [
        "images/dishes/Malaysia/MYNKandar/MYNKandar1.jpg",
        "images/dishes/Malaysia/MYNKandar/MYNKandar2.jpg",
        "images/dishes/Malaysia/MYNKandar/MYNKandar3.jpg",
      ],
    ),
    Dish(
      name: "Hainanese Chicken Rice",
      description:
          "Poached chicken served with fragrant rice cooked in chicken broth, accompanied by ginger paste and spicy chili sauce.",
      history:
          "Brought by immigrants from Hainan, China, in the late 19th century and adapted into a distinct Malaysian style.",
      regionOrigin: "Kuala Lumpur, Penang, and Ipoh",
      images: [
        "images/dishes/Malaysia/MYHCR/MYHCR1.jpg",
        "images/dishes/Malaysia/MYHCR/MYHCR2.jpg",
        "images/dishes/Malaysia/MYHCR/MYHCR3.jpg",
      ],
    ),
    Dish(
      name: "Mee Goreng",
      description:
          "Stir-fried yellow egg noodles with garlic, chili, soy sauce, and tomato, often featuring tofu, shrimp, or beef.",
      history:
          "A product of the Mamak (Indian Muslim) community, blending Indian spices with Malay and Chinese stir-fry styles.",
      regionOrigin: "Mamak stalls throughout Peninsular Malaysia",
      images: [
        "images/dishes/Malaysia/MYMGoreng/MYMGoreng1.jpg",
        "images/dishes/Malaysia/MYMGoreng/MYMGoreng2.jpg",
        "images/dishes/Malaysia/MYMGoreng/MYMGoreng3.jpg",
      ],
    ),
    Dish(
      name: "Cendol",
      description:
          "A refreshing dessert of green rice-flour jelly, coconut milk, shaved ice, and rich palm sugar syrup (gula Melaka).",
      history:
          "Believed to have roots in the Indonesian archipelago but became a beloved Malaysian heat-reliever, especially in historic port towns.",
      regionOrigin: "Penang and Malacca",
      images: [
        "images/dishes/Malaysia/MYCendol/MYCendol1.jpg",
        "images/dishes/Malaysia/MYCendol/MYCendol2.jpg",
        "images/dishes/Malaysia/MYCendol/MYCendol3.jpg",
      ],
    ),
  ],

  "Myanmar": [
    Dish(
      name: "Mohinga",
      description:
          "A savory, aromatic rice noodle soup in a fish-based broth flavored with lemongrass, ginger, garlic, and banana stem.",
      history:
          "Considered Myanmar’s national dish, with records dating back to the Konbaung Dynasty (18th–19th century).",
      regionOrigin: "Lower Myanmar (Ayeyarwady River region)",
      images: [
        "images/dishes/Myanmar/MMMohinga/MMMohinga1.jpg",
        "images/dishes/Myanmar/MMMohinga/MMMohinga2.jpg",
        "images/dishes/Myanmar/MMMohinga/MMMohinga3.jpg",
      ],
    ),
    Dish(
      name: "Lahpet Thoke",
      description:
          "A unique salad of fermented tea leaves mixed with shredded cabbage, nuts, seeds, fried garlic, and chili.",
      history:
          "Fermented tea leaves were historically a symbol of peace used to settle disputes. It is now a staple of hospitality.",
      regionOrigin: "Shan State and central regions",
      images: [
        "images/dishes/Myanmar/MMLThoke/MMLThoke1.jpg",
        "images/dishes/Myanmar/MMLThoke/MMLThoke2.jpg",
        "images/dishes/Myanmar/MMLThoke/MMLThoke3.jpg",
      ],
    ),
    Dish(
      name: "Shan Noodles",
      description:
          "Thin rice noodles served dry or in soup, topped with marinated chicken or pork, peanuts, and pickled vegetables.",
      history:
          "Originated from the Shan ethnic group and became a nationwide favorite due to historical trade routes.",
      regionOrigin: "Shan State, Eastern Myanmar",
      images: [
        "images/dishes/Myanmar/MMShanN/MMShanN1.jpg",
        "images/dishes/Myanmar/MMShanN/MMShanN2.jpg",
        "images/dishes/Myanmar/MMShanN/MMShanN3.jpg",
      ],
    ),
    Dish(
      name: "Ohn No Khao Swe",
      description:
          "Wheat noodles in a spiced coconut milk broth with chicken, garnished with crispy noodles, egg, and lime.",
      history:
          "Reflects the fusion of Indian and Southeast Asian influences common in Myanmar's coastal and urban history.",
      regionOrigin: "Yangon, Myanmar",
      images: [
        "images/dishes/Myanmar/MMONKS/MMONKS1.jpg",
        "images/dishes/Myanmar/MMONKS/MMONKS2.jpg",
        "images/dishes/Myanmar/MMONKS/MMONKS3.jpg",
      ],
    ),
    Dish(
      name: "Nangyi Thoke",
      description:
          "A thick, round rice noodle salad mixed with chicken or fish, turmeric oil, and bean sprouts.",
      history:
          "An adaptation of regional noodle cultures, it became a popular street food and home meal in central Myanmar.",
      regionOrigin: "Central Myanmar (Mandalay)",
      images: [
        "images/dishes/Myanmar/MMNThoke/MMNThoke1.jpg",
        "images/dishes/Myanmar/MMNThoke/MMNThoke2.jpg",
        "images/dishes/Myanmar/MMNThoke/MMNThoke3.jpg",
      ],
    ),
    Dish(
      name: "Mont Lone Yay Paw",
      description:
          "Soft and chewy glutinous rice balls filled with palm sugar, traditionally boiled until they float.",
      history:
          "The 'floating snack' is the signature treat of the Thingyan (New Year) festival, symbolizing unity.",
      regionOrigin: "Nationwide (Thingyan Festival)",
      images: [
        "images/dishes/Myanmar/MMMLYP/MMMLYP1.jpg",
        "images/dishes/Myanmar/MMMLYP/MMMLYP2.jpg",
        "images/dishes/Myanmar/MMMLYP/MMMLYP3.jpg",
      ],
    ),
    Dish(
      name: "Kyay Oh",
      description:
          "A popular noodle soup with pork-based broth, meatballs, and greens, often seasoned with garlic oil.",
      history:
          "Developed as a street food influenced by regional noodle traditions, gaining major popularity in tea shops.",
      regionOrigin: "Yangon and Mandalay",
      images: [
        "images/dishes/Myanmar/MMKyayOh/MMKyayOh1.jpg",
        "images/dishes/Myanmar/MMKyayOh/MMKyayOh2.jpg",
        "images/dishes/Myanmar/MMKyayOh/MMKyayOh3.jpg",
      ],
    ),
    Dish(
      name: "Ngapi Yay",
      description:
          "A potent dipping sauce made from fermented fish paste, chili, and lime, served with fresh vegetables.",
      history:
          "A foundational household condiment that reflects Myanmar's ancient tradition of fermentation for food preservation.",
      regionOrigin: "Coastal regions and Yangon",
      images: [
        "images/dishes/Myanmar/MMNgapi/MMNgapi1.jpg",
        "images/dishes/Myanmar/MMNgapi/MMNgapi2.jpeg",
        "images/dishes/Myanmar/MMNgapi/MMNgapi3.jpg",
      ],
    ),
    Dish(
      name: "Si Htamin",
      description:
          "A bright yellow turmeric rice dish cooked with oil and onions, often served with fried fish.",
      history:
          "A staple of everyday home cooking valued for its simplicity and aromatic quality.",
      regionOrigin: "Central Myanmar (Mandalay)",
      images: [
        "images/dishes/Myanmar/MMSiH/MMSiH1.jpg",
        "images/dishes/Myanmar/MMSiH/MMSiH2.jpg",
        "images/dishes/Myanmar/MMSiH/MMSiH3.jpg",
      ],
    ),
    Dish(
      name: "Hto-Hpu Nwe",
      description:
          "Warm, soft 'silk' tofu made from chickpeas, served with sesame oil and chili sauce.",
      history:
          "A Shan ethnic specialty that demonstrates the influence of regional agricultural practices and Chinese culinary roots.",
      regionOrigin: "Shan State, Eastern Myanmar",
      images: [
        "images/dishes/Myanmar/MMHHNwe/MMHHNwe1.jpg",
        "images/dishes/Myanmar/MMHHNwe/MMHHNwe2.jpg",
        "images/dishes/Myanmar/MMHHNwe/MMHHNwe3.jpg",
      ],
    ),
  ],

  "Philippines": [
    Dish(
      name: "Adobo",
      description:
          "Meat (pork or chicken) braised in vinegar, soy sauce, garlic, and peppercorns.",
      history:
          "One of the oldest Filipino dishes; the vinegar-based method was originally used as a natural preservation technique.",
      regionOrigin: "Philippines (Luzon roots)",
      images: [
        "images/dishes/Philippines/PHAdobo/PHAdobo1.jpg",
        "images/dishes/Philippines/PHAdobo/PHAdobo2.jpg",
        "images/dishes/Philippines/PHAdobo/PHAdobo3.jpg",
      ],
    ),
    Dish(
      name: "Sinigang",
      description:
          "A comforting sour soup made with tamarind, meat or seafood, and various vegetables like kangkong and radish.",
      history:
          "Reflects the Filipino palate's love for sour flavors; it adapts to local souring agents like guava or calamansi.",
      regionOrigin: "Luzon, Philippines",
      images: [
        "images/dishes/Philippines/PHSinigang/PHSinigang1.jpg",
        "images/dishes/Philippines/PHSinigang/PHSinigang2.jpg",
        "images/dishes/Philippines/PHSinigang/PHSinigang3.jpg",
      ],
    ),
    Dish(
      name: "Lechon",
      description:
          "A whole pig roasted over charcoal until the skin is perfectly crisp and the meat is tender.",
      history:
          "Became a centerpiece of Filipino celebrations during the Spanish colonial period and remains a symbol of feasting.",
      regionOrigin: "Cebu, Philippines",
      images: [
        "images/dishes/Philippines/PHLechon/PHLechon1.jpeg",
        "images/dishes/Philippines/PHLechon/PHLechon2.jpg",
        "images/dishes/Philippines/PHLechon/PHLechon3.jpg",
      ],
    ),
    Dish(
      name: "Kare-Kare",
      description:
          "A rich stew of oxtail and vegetables in a thick peanut sauce, served with bagoong (shrimp paste).",
      history:
          "Believed to have indigenous roots later influenced by trade; it is a labor-intensive dish for special family meals.",
      regionOrigin: "Pampanga, Luzon",
      images: [
        "images/dishes/Philippines/PHKareK/PHKareK1.jpg",
        "images/dishes/Philippines/PHKareK/PHKareK2.jpg",
        "images/dishes/Philippines/PHKareK/PHKareK3.jpg",
      ],
    ),
    Dish(
      name: "Pancit",
      description:
          "Stir-fried noodles with vegetables and meat, traditionally served at birthdays to symbolize long life.",
      history:
          "Introduced via Chinese influence and fully integrated into Filipino culture over hundreds of years.",
      regionOrigin: "Luzon (Chinese-Filipino communities)",
      images: [
        "images/dishes/Philippines/PHPancit/PHPancit1.jpg",
        "images/dishes/Philippines/PHPancit/PHPancit2.jpg",
        "images/dishes/Philippines/PHPancit/PHPancit3.jpg",
      ],
    ),
    Dish(
      name: "Sisig",
      description:
          "Chopped pig's face and belly seasoned with calamansi and onions, served on a sizzling hot plate.",
      history:
          "Originating in Pampanga, it was once a way to use leftover pork parts and is now a world-famous bar snack.",
      regionOrigin: "Pampanga, Luzon",
      images: [
        "images/dishes/Philippines/PHSisig/PHSisig1.jpg",
        "images/dishes/Philippines/PHSisig/PHSisig2.jpg",
        "images/dishes/Philippines/PHSisig/PHSisig3.webp",
      ],
    ),
    Dish(
      name: "Bulalo",
      description:
          "A light-colored beef shank soup with bone marrow, corn, and leafy vegetables.",
      history:
          "A traditional comfort dish from the cattle-raising regions of Batangas and Cavite.",
      regionOrigin: "Southern Luzon",
      images: [
        "images/dishes/Philippines/PHBulalo/PHBulalo1.jpg",
        "images/dishes/Philippines/PHBulalo/PHBulalo2.jpg",
        "images/dishes/Philippines/PHBulalo/PHBulalo3.jpg",
      ],
    ),
    Dish(
      name: "Bicol Express",
      description:
          "A spicy pork stew cooked in coconut milk and shrimp paste with a high concentration of chili peppers.",
      history:
          "Inspired by traditional Bicolano cooking which heavily features coconut and heat.",
      regionOrigin: "Bicol Region, Luzon",
      images: [
        "images/dishes/Philippines/PHBExpress/PHBExpress1.jpg",
        "images/dishes/Philippines/PHBExpress/PHBExpress2.jpg",
        "images/dishes/Philippines/PHBExpress/PHBExpress3.jpg",
      ],
    ),
    Dish(
      name: "Lumpia",
      description:
          "Crispy fried spring rolls filled with minced meat and vegetables, served with sweet and sour sauce.",
      history:
          "Adapted from Chinese spring rolls to local tastes; a ubiquitous presence at any Filipino gathering.",
      regionOrigin: "Manila and Luzon",
      images: [
        "images/dishes/Philippines/PHLumpia/PHLumpia1.jpg",
        "images/dishes/Philippines/PHLumpia/PHLumpia2.jpg",
        "images/dishes/Philippines/PHLumpia/PHLumpia3.jpg",
      ],
    ),
    Dish(
      name: "Halo-Halo",
      description:
          "A colorful dessert of shaved ice, milk, and various ingredients like leche flan, beans, and jellies.",
      history:
          "Evolved from Japanese shaved ice (kakigori) introduced pre-WWII and localized with tropical Filipino fruits.",
      regionOrigin: "Luzon, Philippines",
      images: [
        "images/dishes/Philippines/PHHaloH/PHHaloH1.jpg",
        "images/dishes/Philippines/PHHaloH/PHHaloH2.jpg",
        "images/dishes/Philippines/PHHaloH/PHHaloH3.jpg",
      ],
    ),
  ],

  "Singapore": [
    Dish(
      name: "Hainanese Chicken Rice",
      description:
          "Considered a national dish; features poached chicken and fragrant rice served with spicy chili and ginger.",
      history:
          "Introduced by Hainanese migrants and refined locally into one of Singapore's most iconic culinary exports.",
      regionOrigin: "Singapore",
      images: [
        "images/dishes/Singapore/SGHCR/SGHCR1.jpg",
        "images/dishes/Singapore/SGHCR/SGHCR2.png",
        "images/dishes/Singapore/SGHCR/SGHCR3.jpg",
      ],
    ),
    Dish(
      name: "Laksa",
      description:
          "Rice noodles in a rich, spicy coconut milk broth (Katong style) or a tangy tamarind broth.",
      history:
          "A hallmark of Peranakan culture, blending Chinese and Malay ingredients and techniques.",
      regionOrigin: "Katong Area, Singapore",
      images: [
        "images/dishes/Singapore/SGLaksa/SGLaksa1.jpg",
        "images/dishes/Singapore/SGLaksa/SGLaksa2.jpg",
        "images/dishes/Singapore/SGLaksa/SGLaksa3.jpg",
      ],
    ),
    Dish(
      name: "Chili Crab",
      description:
          "Mud crabs stir-fried in a savory, sweet, and spicy tomato-and-chili sauce, served with mantou buns.",
      history:
          "Developed in the mid-20th century, it is now an internationally recognized symbol of Singaporean seafood.",
      regionOrigin: "Coastal Singapore",
      images: [
        "images/dishes/Singapore/SGChiliC/SGChiliC1.jpg",
        "images/dishes/Singapore/SGChiliC/SGChiliC2.jpg",
        "images/dishes/Singapore/SGChiliC/SGChiliC3.jpg",
      ],
    ),
    Dish(
      name: "Char Kway Teow",
      description:
          "Flat rice noodles stir-fried with sweet soy sauce, prawns, cockles, and bean sprouts.",
      history:
          "A street-food staple originating from immigrant laborers who needed cheap, high-energy meals.",
      regionOrigin: "Singapore",
      images: [
        "images/dishes/Singapore/SGCKT/SGCKT1.jpg",
        "images/dishes/Singapore/SGCKT/SGCKT2.jpg",
        "images/dishes/Singapore/SGCKT/SGCKT3.jpg",
      ],
    ),
    Dish(
      name: "Satay",
      description:
          "Grilled skewers of seasoned meat served with a signature peanut sauce and rice cakes.",
      history:
          "Famous in night markets like Lau Pa Sat, reflecting Singapore’s deep Malay cultural roots.",
      regionOrigin: "Singapore",
      images: [
        "images/dishes/Singapore/SGSatay/SGSatay1.jpg",
        "images/dishes/Singapore/SGSatay/SGSatay2.jpg",
        "images/dishes/Singapore/SGSatay/SGSatay3.jpg",
      ],
    ),
    Dish(
      name: "Bak Kut Teh",
      description:
          "A 'pork bone tea' soup, either peppery (Teochew style) or herbal (Hoklo style), served with dough fritters.",
      history:
          "Originally a tonic for early Chinese coolies to provide strength for a hard day's work at the docks.",
      regionOrigin: "Singapore (Chinese communities)",
      images: [
        "images/dishes/Singapore/SGBKT/SGBKT1.jpg",
        "images/dishes/Singapore/SGBKT/SGBKT2.jpg",
        "images/dishes/Singapore/SGBKT/SGBKT3.jpg",
      ],
    ),
    Dish(
      name: "Kaya Toast",
      description:
          "Toasted bread with kaya (coconut jam) and butter, usually eaten with soft-boiled eggs.",
      history:
          "A staple of the traditional 'kopitiam' (coffee shop) culture, influenced by British and Hainanese styles.",
      regionOrigin: "Singapore",
      images: [
        "images/dishes/Singapore/SGKToast/SGKToast1.jpg",
        "images/dishes/Singapore/SGKToast/SGKToast2.jpeg",
        "images/dishes/Singapore/SGKToast/SGKToast3.jpg",
      ],
    ),
    Dish(
      name: "Roti Prata",
      description:
          "A South Indian-influenced flatbread that is stretched and fried, served with dhal or fish curry.",
      history:
          "Introduced by the Indian Muslim community and evolved into a beloved 24-hour comfort food.",
      regionOrigin: "Singapore",
      images: [
        "images/dishes/Singapore/SGRotiP/SGRotiP1.jpg",
        "images/dishes/Singapore/SGRotiP/SGRotiP2.jpg",
        "images/dishes/Singapore/SGRotiP/SGRotiP3.jpg",
      ],
    ),
    Dish(
      name: "Fish Head Curry",
      description:
          "A large fish head stewed in a rich South Indian-style curry with vegetables.",
      history:
          "A true Singaporean invention that blended Indian spices with the Chinese preference for fish head.",
      regionOrigin: "Singapore (Indian-Chinese Fusion)",
      images: [
        "images/dishes/Singapore/SGFHCurry/SGFHCurry1.jpg",
        "images/dishes/Singapore/SGFHCurry/SGFHCurry2.jpg",
        "images/dishes/Singapore/SGFHCurry/SGFHCurry3.jpg",
      ],
    ),
    Dish(
      name: "Hokkien Mee",
      description:
          "A mix of egg and rice noodles stir-fried in a rich prawn stock, served with lime and sambal.",
      history:
          "Created by sailors from the Hokkien province who fried excess noodles at the wharf after work.",
      regionOrigin: "Singapore (Hokkien community)",
      images: [
        "images/dishes/Singapore/SGHMee/SGHMee1.jpg",
        "images/dishes/Singapore/SGHMee/SGHMee2.jpg",
        "images/dishes/Singapore/SGHMee/SGHMee3.jpg",
      ],
    ),
  ],

  "Thailand": [
    Dish(
      name: "Pad Thai",
      description:
          "A stir-fried rice noodle dish with shrimp, tofu, eggs, and bean sprouts, flavored with a signature tamarind sauce.",
      history:
          "Promoted mid-20th century to bolster Thai national identity; it transformed from a local noodle dish into a global street food icon.",
      regionOrigin: "Central Thailand, Bangkok",
      images: [
        "images/dishes/Thailand/THPThai/THPThai1.jpg",
        "images/dishes/Thailand/THPThai/THPThai2.jpg",
        "images/dishes/Thailand/THPThai/THPThai3.jpg",
      ],
    ),
    Dish(
      name: "Tom Yum Goong",
      description:
          "A hot and sour shrimp soup bursting with flavors of lemongrass, galangal, kaffir lime leaves, and chili.",
      history:
          "Reflects the ancient Thai focus on herbal balance. It is considered the 'gold standard' of Thai aromatic soups.",
      regionOrigin: "Central Thailand, Bangkok",
      images: [
        "images/dishes/Thailand/THTYum/THTYum1.jpg",
        "images/dishes/Thailand/THTYum/THTYum2.jpg",
        "images/dishes/Thailand/THTYum/THTYum3.jpg",
      ],
    ),
    Dish(
      name: "Green Curry",
      description:
          "A creamy coconut milk curry made with green chili paste, Thai eggplant, and sweet basil.",
      history:
          "Evolved from traditional spice-pounding techniques; it is distinguished by the use of fresh green chilies rather than dried red ones.",
      regionOrigin: "Central Thailand",
      images: [
        "images/dishes/Thailand/THGCurry/THGCurry1.jpg",
        "images/dishes/Thailand/THGCurry/THGCurry2.jpg",
        "images/dishes/Thailand/THGCurry/THGCurry3.jpg",
      ],
    ),
    Dish(
      name: "Massaman Curry",
      description:
          "A rich, mild curry featuring warm spices like cinnamon and cardamom, usually cooked with beef, potatoes, and peanuts.",
      history:
          "A beautiful example of 17th-century trade influence, blending Persian and Indian spice profiles with Thai coconut bases.",
      regionOrigin: "Southern Thailand",
      images: [
        "images/dishes/Thailand/THMCurry/THMCurry1.jpg",
        "images/dishes/Thailand/THMCurry/THMCurry2.jpg",
        "images/dishes/Thailand/THMCurry/THMCurry3.jpg",
      ],
    ),
    Dish(
      name: "Som Tam",
      description:
          "A spicy, crunchy salad made of shredded green papaya pounded with lime, chili, fish sauce, and peanuts.",
      history:
          "Hails from the Isan region. It represents the 'pounding' culinary tradition where flavors are bruised together in a mortar.",
      regionOrigin: "Isan, Northeastern Thailand",
      images: [
        "images/dishes/Thailand/THSTam/THSTam1.jpg",
        "images/dishes/Thailand/THSTam/THSTam2.jpg",
        "images/dishes/Thailand/THSTam/THSTam3.jpg",
      ],
    ),
    Dish(
      name: "Pad Kra Pao",
      description:
          "A fast-paced stir-fry of minced meat and holy basil, almost always served with a crispy fried egg on top.",
      history:
          "The ultimate 'workday' meal in Thailand; its popularity exploded in urban Bangkok as a quick, flavorful street lunch.",
      regionOrigin: "Central Thailand, Bangkok",
      images: [
        "images/dishes/Thailand/THPKP/THPKP1.jpg",
        "images/dishes/Thailand/THPKP/THPKP2.jpg",
        "images/dishes/Thailand/THPKP/THPKP3.jpg",
      ],
    ),
    Dish(
      name: "Khao Pad",
      description:
          "Thai-style fried rice made with jasmine rice, seasoned with fish sauce and served with fresh cucumber and lime.",
      history:
          "A practical evolution of Chinese fried rice, localized over centuries with Thai jasmine rice and fermented seasonings.",
      regionOrigin: "Central Thailand",
      images: [
        "images/dishes/Thailand/THKPad/THKPad1.jpg",
        "images/dishes/Thailand/THKPad/THKPad2.jpg",
        "images/dishes/Thailand/THKPad/THKPad3.jpg",
      ],
    ),
    Dish(
      name: "Mango Sticky Rice",
      description:
          "Sweet glutinous rice drenched in coconut cream and served with slices of perfectly ripe mango.",
      history:
          "A seasonal delicacy traditionally enjoyed during the peak mango harvest months (April and May) in Thailand.",
      regionOrigin: "Central Thailand",
      images: [
        "images/dishes/Thailand/THMSR/THMSR1.jpg",
        "images/dishes/Thailand/THMSR/THMSR2.jpg",
        "images/dishes/Thailand/THMSR/THMSR3.jpg",
      ],
    ),
    Dish(
      name: "Panang Curry",
      description:
          "A thick, salty-sweet red curry with a nutty profile, garnished with finely shredded kaffir lime leaves.",
      history:
          "A refined curry traditionally associated with the central royal courts, noted for being less soupy than other Thai curries.",
      regionOrigin: "Central Thailand, Bangkok",
      images: [
        "images/dishes/Thailand/THPCurry/THPCurry1.jpg",
        "images/dishes/Thailand/THPCurry/THPCurry2.jpg",
        "images/dishes/Thailand/THPCurry/THPCurry3.jpg",
      ],
    ),
    Dish(
      name: "Boat Noodles",
      description:
          "Intensely flavored noodle soup originally served in small portions from boats along Thailand's busy canals.",
      history:
          "The small bowl size was a safety measure so vendors wouldn't spill hot soup while rowing their boats.",
      regionOrigin: "Central Thailand (Canal Communities)",
      images: [
        "images/dishes/Thailand/THBNoodles/THBNoodles1.jpg",
        "images/dishes/Thailand/THBNoodles/THBNoodles2.jpg",
        "images/dishes/Thailand/THBNoodles/THBNoodles3.jpg",
      ],
    ),
  ],

  "TimorLeste": [
    Dish(
      name: "Ikan Sabuko",
      description:
          "Fresh coastal fish marinated in lime and local spices, then grilled over charcoal for a smoky finish.",
      history:
          "Reflects the nation's deep maritime heritage and indigenous reliance on open-fire cooking.",
      regionOrigin: "Coastal regions, Dili",
      images: [
        "images/dishes/TimorLeste/TLIkanS/TLIkanS1.jpg",
        "images/dishes/TimorLeste/TLIkanS/TLIkanS2.jpg",
        "images/dishes/TimorLeste/TLIkanS/TLIkanS3.jpg",
      ],
    ),
    Dish(
      name: "Batar Daan",
      description:
          "A hearty, plant-based stew made from corn, red beans, and pumpkin.",
      history:
          "Corn is a survival crop in TimorLeste; this dish highlights the rural tradition of using every part of the harvest.",
      regionOrigin: "Rural TimorLeste",
      images: [
        "images/dishes/TimorLeste/TLBDaan/TLBDaan1.webp",
        "images/dishes/TimorLeste/TLBDaan/TLBDaan2.jpg",
        "images/dishes/TimorLeste/TLBDaan/TLBDaan3.jpg",
      ],
    ),
    Dish(
      name: "Tukir",
      description:
          "Slow-cooked meat (usually goat or buffalo) seasoned with local spices and often prepared in bamboo or clay.",
      history:
          "A ceremonial dish used to honor guests and celebrate communal success in inland villages.",
      regionOrigin: "Inland TimorLeste",
      images: [
        "images/dishes/TimorLeste/TLTukir/TLTukir1.jpg",
        "images/dishes/TimorLeste/TLTukir/TLTukir2.jpg",
        "images/dishes/TimorLeste/TLTukir/TLTukir3.jpg",
      ],
    ),
    Dish(
      name: "Feijoada Timor",
      description:
          "A rich bean and meat stew, adapted from the classic Portuguese pork and bean dish.",
      history:
          "A culinary legacy of Portuguese colonization, localized with Timorese ingredients and spice levels.",
      regionOrigin: "Urban areas like Dili",
      images: [
        "images/dishes/TimorLeste/TLFeij/TLFeij1.avif",
        "images/dishes/TimorLeste/TLFeij/TLFeij2.jpg",
        "images/dishes/TimorLeste/TLFeij/TLFeij3.jpg",
      ],
    ),
    Dish(
      name: "Katupa",
      description:
          "Rice cooked inside woven palm leaf pouches, similar to the Indonesian ketupat.",
      history:
          "Part of the broader Austronesian tradition of leaf-wrapped rice, symbolizing unity during festivals.",
      regionOrigin: "TimorLeste",
      images: [
        "images/dishes/TimorLeste/TLKatupa/TLKatupa1.jpg",
        "images/dishes/TimorLeste/TLKatupa/TLKatupa2.jpg",
        "images/dishes/TimorLeste/TLKatupa/TLKatupa3.jpg",
      ],
    ),
    Dish(
      name: "Caldeirada",
      description:
          "A savory fish stew cooked with tomatoes, potatoes, and onions in a light, aromatic broth.",
      history:
          "Introduced by the Portuguese and embraced by coastal fishing communities who adapted it with local catches.",
      regionOrigin: "Coastal TimorLeste",
      images: [
        "images/dishes/TimorLeste/TLCal/TLCal1.jpg",
        "images/dishes/TimorLeste/TLCal/TLCal2.jpg",
        "images/dishes/TimorLeste/TLCal/TLCal3.jpg",
      ],
    ),
    Dish(
      name: "Eel Stew",
      description:
          "Freshwater eel simmered slowly with vegetables and local spices.",
      history:
          "Common among riverine communities where eels are a prized source of protein and traditional medicine.",
      regionOrigin: "Inland and river regions",
      images: [
        "images/dishes/TimorLeste/TLEelS/TLEelS1.jpg",
        "images/dishes/TimorLeste/TLEelS/TLEelS2.jpg",
        "images/dishes/TimorLeste/TLEelS/TLEelS3.jpg",
      ],
    ),
    Dish(
      name: "Grilled Fish",
      description:
          "Simplicity at its best; fresh catch from the Ombai Strait grilled with salt, chili, and lime.",
      history:
          "A staple of the Dili waterfront, representing the country's connection to the sea.",
      regionOrigin: "Coastal Dili",
      images: [
        "images/dishes/TimorLeste/TLGFish/TLGFish1.jpg",
        "images/dishes/TimorLeste/TLGFish/TLGFish2.jpg",
        "images/dishes/TimorLeste/TLGFish/TLGFish3.jpg",
      ],
    ),
    Dish(
      name: "Corn and Pumpkin Stew",
      description:
          "A thick, sweet-savory stew that serves as a primary source of nutrition in agricultural highland areas.",
      history:
          "Developed as a practical meal for farming families during the long harvest seasons.",
      regionOrigin: "Rural highlands",
      images: [
        "images/dishes/TimorLeste/TLCPStew/TLCPStew1.jpg",
        "images/dishes/TimorLeste/TLCPStew/TLCPStew2.jpg",
        "images/dishes/TimorLeste/TLCPStew/TLCPStew3.jpg",
      ],
    ),
    Dish(
      name: "Cassava-Based Dishes",
      description:
          "Boiled or mashed cassava served as a versatile starch alongside spicy stews or fish.",
      history:
          "Cassava’s drought-resistance made it a vital security crop throughout Timorese history.",
      regionOrigin: "Inland agricultural areas",
      images: [
        "images/dishes/TimorLeste/TLCassava/TLCassava1.jpg",
        "images/dishes/TimorLeste/TLCassava/TLCassava2.jpg",
        "images/dishes/TimorLeste/TLCassava/TLCassava3.jpg",
      ],
    ),
  ],

  "Vietnam": [
    Dish(
      name: "Pho",
      description:
          "Vietnam's most famous export; a delicate rice noodle soup with a clear broth, beef or chicken, and fresh herbs.",
      history:
          "Originated in Northern Vietnam, influenced by Chinese noodle traditions and French beef-cooking methods.",
      regionOrigin: "Northern Vietnam, Hanoi",
      images: [
        "images/dishes/Vietnam/VNPho/VNPho1.png",
        "images/dishes/Vietnam/VNPho/VNPho2.jpg",
        "images/dishes/Vietnam/VNPho/VNPho3.webp",
      ],
    ),
    Dish(
      name: "Banh Mi",
      description:
          "A fusion sandwich featuring a crispy baguette filled with pâté, grilled meats, and pickled daikon.",
      history:
          "The French brought the bread, but the Vietnamese made it a masterpiece by adding local fillings in the 1950s.",
      regionOrigin: "Ho Chi Minh City",
      images: [
        "images/dishes/Vietnam/VNBMi/VNBMi1.jpg",
        "images/dishes/Vietnam/VNBMi/VNBMi2.jpg",
        "images/dishes/Vietnam/VNBMi/VNBMi3.jpg",
      ],
    ),
    Dish(
      name: "Goi Cuon",
      description:
          "Fresh summer rolls made with shrimp, pork, and herbs wrapped in translucent rice paper.",
      history:
          "Showcases the Vietnamese culinary philosophy of 'freshness over oil,' often served as a healthy snack.",
      regionOrigin: "Southern Vietnam",
      images: [
        "images/dishes/Vietnam/VNGoiC/VNGoiC1.jpg",
        "images/dishes/Vietnam/VNGoiC/VNGoiC2.jpg",
        "images/dishes/Vietnam/VNGoiC/VNGoiC3.jpg",
      ],
    ),
    Dish(
      name: "Bun Cha",
      description:
          "Grilled pork patties served in a tangy dipping sauce with rice noodles and a mountain of fresh herbs.",
      history:
          "A Hanoi specialty that gained worldwide fame after being famously eaten by Anthony Bourdain and Barack Obama.",
      regionOrigin: "Northern Vietnam, Hanoi",
      images: [
        "images/dishes/Vietnam/VNBCha/VNBCha1.webp",
        "images/dishes/Vietnam/VNBCha/VNBCha2.jpg",
        "images/dishes/Vietnam/VNBCha/VNBCha3.jpg",
      ],
    ),
    Dish(
      name: "Cao Lau",
      description:
          "Thick, chewy noodles topped with pork and cracklings, unique for using water from specific ancient wells.",
      history:
          "A historic dish of Hoi An, reflecting the port city's mix of Japanese, Chinese, and local influences.",
      regionOrigin: "Hoi An, Central Vietnam",
      images: [
        "images/dishes/Vietnam/VNCLau/VNCLau1.jpg",
        "images/dishes/Vietnam/VNCLau/VNCLau2.jpg",
        "images/dishes/Vietnam/VNCLau/VNCLau3.jpg",
      ],
    ),
    Dish(
      name: "Banh Xeo",
      description:
          "A 'sizzling' pancake made from rice flour and turmeric, stuffed with shrimp, pork, and bean sprouts.",
      history:
          "Named for the loud sizzling sound the batter makes when it hits the hot pan.",
      regionOrigin: "Southern Vietnam (Mekong Delta)",
      images: [
        "images/dishes/Vietnam/VNBXeo/VNBXeo1.jpg",
        "images/dishes/Vietnam/VNBXeo/VNBXeo2.jpg",
        "images/dishes/Vietnam/VNBXeo/VNBXeo3.jpg",
      ],
    ),
    Dish(
      name: "Hu Tieu",
      description:
          "A pork-based noodle soup that can be served 'dry' or with broth, popular as a hearty breakfast.",
      history:
          "Brought to Southern Vietnam by Cambodian and Chinese immigrants and localized in the Mekong region.",
      regionOrigin: "Ho Chi Minh City and Mekong Delta",
      images: [
        "images/dishes/Vietnam/VNHuT/VNHuT1.jpg",
        "images/dishes/Vietnam/VNHuT/VNHuT2.jpg",
        "images/dishes/Vietnam/VNHuT/VNHuT3.jpg",
      ],
    ),
    Dish(
      name: "Com Tam",
      description:
          "Made from 'broken' rice grains, served with grilled pork chops and a steamed egg meatloaf.",
      history:
          "Once a 'poor man's rice' made from fractured grains, it is now a celebrated comfort food of the South.",
      regionOrigin: "Ho Chi Minh City",
      images: [
        "images/dishes/Vietnam/VNCTam/VNCTam1.jpg",
        "images/dishes/Vietnam/VNCTam/VNCTam2.jpg",
        "images/dishes/Vietnam/VNCTam/VNCTam3.jpg",
      ],
    ),
    Dish(
      name: "Bun Bo Hue",
      description:
          "A spicy, lemongrass-heavy beef noodle soup with a much bolder flavor profile than Pho.",
      history:
          "Created in the royal city of Huế, reflecting the sophisticated and spicy tastes of the imperial court.",
      regionOrigin: "Huế, Central Vietnam",
      images: [
        "images/dishes/Vietnam/VNBBHue/VNBBHue1.jpg",
        "images/dishes/Vietnam/VNBBHue/VNBBHue2.jpg",
        "images/dishes/Vietnam/VNBBHue/VNBBHue3.jpg",
      ],
    ),
    Dish(
      name: "Che",
      description:
          "A diverse category of sweet dessert soups made with beans, jelly, and coconut milk.",
      history:
          "Vietnam’s favorite way to end a meal, with hundreds of regional varieties sold in every local market.",
      regionOrigin: "Nationwide",
      images: [
        "images/dishes/Vietnam/VNChe/VNChe1.jpg",
        "images/dishes/Vietnam/VNChe/VNChe2.jpg",
        "images/dishes/Vietnam/VNChe/VNChe3.jpg",
      ],
    ),
  ],
};
