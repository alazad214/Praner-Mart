import 'package:iconsax/iconsax.dart';

import '../about/about_screen.dart';
import '../faviorite/faviorite_screen.dart';
import '../help and support/help_support_screen.dart';

final List<Map<String, dynamic>> navItem = [
  {'icon': Iconsax.user, 'title': 'Profile', 'screen': FavioriteScreen()},
  {'icon': Iconsax.heart, 'title': 'Favorite', 'screen': FavioriteScreen()},
  {'icon': Iconsax.info_circle, 'title': 'About', 'screen': AboutPage()},
  {
    'icon': Iconsax.message_question,
    'title': 'Help & Support',
    'screen': HelpAndSupportScreen()
  },
];
