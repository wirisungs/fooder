import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fooder/assets/color/app_color.dart';
import '../../components/all/input.dart';
import '../../components/search/card.dart';
import '../../components/search/btn_res_type.dart';
import '../booking/detail.dart';

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
          InputComponent(
            hintText: "Tìm nhà hàng",
            suffixIcon: SvgPicture.asset(
              'lib/assets/svg/components/calendar.svg',
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Nhà hàng gần bạn', style: kSectionTitleTextStyle),
                      Text('Xem thêm', style: kSeeMoreTextStyle),
                    ],
                  ),
                ),

                RestaurantCard(
                  imagePath: 'lib/assets/png/img_test/jollicow.png',
                  title: 'Jollicow - Chuẩn hương vị bò',
                  description:
                      'Nhà hàng hảo hạng, nhiều món ngon. Không gian ấm cúng, mát mẻ, yên tĩnh, náo nhiệt. Là đối tác đầu tiên và duy nhất của chúng tôi.',
                  rating: 5,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookingPage(),
                      ),
                    );
                  },
                ),
                RestaurantCard(
                  imagePath: 'lib/assets/png/img_test/jollicow.png',
                  title: 'Jollicow - Chuẩn hương vị bò',
                  description:
                      'Nhà hàng hảo hạng, nhiều món ngon. Không gian ấm cúng, mát mẻ, yên tĩnh, náo nhiệt. Là đối tác đầu tiên và duy nhất của chúng tôi.',
                  rating: 5,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookingPage(),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Nhà hàng gu bạn', style: kSectionTitleTextStyle),
                      Text('Xem thêm', style: kSeeMoreTextStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      TypeResButton(
                        text: 'Chill',
                        color: AppColors.btntyperes1,
                        textColor: Colors.black,
                      ),
                      SizedBox(width: 6),
                      TypeResButton(
                        text: 'Thoáng mát',
                        color: AppColors.btntyperes2,
                        textColor: Colors.black,
                      ),
                      SizedBox(width: 6),
                      TypeResButton(
                        text: 'Yên tĩnh',
                        color: AppColors.btntyperes3,
                        textColor: Colors.white,
                      ),
                      SizedBox(width: 6),
                      TypeResButton(
                        text: 'Lãng mạng',
                        color: AppColors.btntyperes4,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                ),
                RestaurantCard(
                  imagePath: 'lib/assets/png/img_test/jollicow.png',
                  title: 'Jollicow - Chuẩn hương vị bò',
                  description:
                      'Nhà hàng hảo hạng, nhiều món ngon. Không gian ấm cúng, mát mẻ, yên tĩnh, náo nhiệt. Là đối tác đầu tiên và duy nhất của chúng tôi.',
                  rating: 5,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookingPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ========== STYLES ==========
const kSectionTitleTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w700,
  color: AppColors.text,
);

const kSeeMoreTextStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: AppColors.title,
);
