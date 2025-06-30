import 'package:flutter/material.dart';
import 'package:fooder/assets/color/app_color.dart';
import '../../components/search/main.dart';
import '../../components/search/card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // const SizedBox(height: 20),
          SearchBarWidget(),
          Expanded(
            child: ListView(
              children: [
                Text(
                  'Nhà hàng gần bạn',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                ),
                RestaurantCard(
                  imagePath: 'lib/assets/png/img_test/jollicow.png',
                  title: 'Jollicow - Chuẩn hương vị bò',
                  description:
                      'Nhà hàng hảo hạng, nhiều món ngon. Không gian ấm cúng, mát mẻ, yên tĩnh, náo nhiệt. Là đối tác đầu tiên và duy nhất của chúng tôi.',
                  rating: 5,
                ),
                RestaurantCard(
                  imagePath: 'lib/assets/png/img_test/jollicow.png',
                  title: 'Jollicow - Chuẩn hương vị bò',
                  description:
                      'Nhà hàng hảo hạng, nhiều món ngon. Không gian ấm cúng, mát mẻ, yên tĩnh, náo nhiệt. Là đối tác đầu tiên và duy nhất của chúng tôi.',
                  rating: 5,
                ),
                RestaurantCard(
                  imagePath: 'lib/assets/png/img_test/jollicow.png',
                  title: 'Jollicow - Chuẩn hương vị bò',
                  description:
                      'Nhà hàng hảo hạng, nhiều món ngon. Không gian ấm cúng, mát mẻ, yên tĩnh, náo nhiệt. Là đối tác đầu tiên và duy nhất của chúng tôi.',
                  rating: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
