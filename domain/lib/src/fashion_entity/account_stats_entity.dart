class AccountStatsEntity {
  const AccountStatsEntity({
    required this.orderCount,
    required this.favoriteCount,
    required this.voucherCount,
  });

  final int orderCount;
  final int favoriteCount;
  final int voucherCount;
}
