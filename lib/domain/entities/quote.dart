import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String author;
  final int id;
  final String content;
  final String permalink;

  const Quote({
    required this.author,
    required this.id,
    required this.content,
    required this.permalink,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        author,
        id,
        content,
        permalink,
      ];
/*
  {
  "author":"Larry DeLuca",
  "id":37,
  "quote":"I\u2019ve noticed lately that the paranoid fear of computers becoming intelligent and taking over the world has almost entirely disappeared from the common culture.  Near as I can tell, this coincides with the release of MS-DOS.",
  "permalink":"http://quotes.stormconsultancy.co.uk/quotes/37"
  }
  * */
}
