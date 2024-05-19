List<int> winningNumbers = [
  12,
  6,
  34,
  22,
  41,
];
void main() {
  List<int> ticket1 = [45, 2, 9, 18, 12, 33];
  List<int> ticket2 = [41, 17, 26, 32, 7, 35];
  checkNumbers(ticket1);
}

void checkNumbers(List<int> myNumbers) {
  for (int myNum in myNumbers) {
    for (int winNum in winningNumbers) {
      print('mynum = ${myNum.}');
      print('winNum=$winNum');
    }
  }
}
