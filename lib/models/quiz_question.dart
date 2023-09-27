class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

    //here the of constructor creates a new list based on the prevois list so basically i have done this because shuffle method works is to shuffle the list items but it does this on the list it changes the original list.
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers); 
    shuffledList.shuffle();
    return shuffledList;
  }
}
