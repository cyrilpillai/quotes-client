enum NavigationBarItem {
  list(0),
  chart(1),
  leaderboard(2),
  random(3);

  const NavigationBarItem(this.indexValue);

  final int indexValue;

  factory NavigationBarItem.fromIndexValue(int indexValue) {
    switch (indexValue) {
      case 1:
        return NavigationBarItem.chart;
      case 2:
        return NavigationBarItem.leaderboard;
      case 3:
        return NavigationBarItem.random;
      default:
        return NavigationBarItem.list;
    }
  }
}