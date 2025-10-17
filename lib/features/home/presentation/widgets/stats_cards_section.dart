import 'package:catty/features/home/presentation/widgets/stats_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';

class StatsCardsSection extends StatelessWidget {
  const StatsCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: StatsCard(
            icon: Icons.pets,
            iconColor: AppColors.primary,
            label: 'Breeds',
            value: '8+',
          ),
        ),
        Gap(16),
        Expanded(
          child: StatsCard(
            icon: Icons.star_rounded,
            iconColor: AppColors.primary,
            label: 'Photos',
            value: '1000+',
          ),
        ),
        Gap(16),
        Expanded(
          child: StatsCard(
            icon: Icons.favorite_rounded,
            iconColor: AppColors.primary,
            label: 'Favorites',
            value: '0',
          ),
        ),
      ],
    );
  }
}
