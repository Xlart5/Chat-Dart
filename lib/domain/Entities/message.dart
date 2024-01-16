enum Fromwho { me, her }

class Message {
  final String text;
  final String? imageUrl;
  final Fromwho fromWho;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
  });
}
