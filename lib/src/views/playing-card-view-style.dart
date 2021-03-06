import 'package:flutter/widgets.dart';
import 'package:playing_cards/src/model/card-value.dart';
import 'package:playing_cards/src/model/suit.dart';

/// These styles are specific to a suit.
class SuitStyle {
  /// builds the widget for this suit
  final Widget Function(BuildContext) builder;

  /// This controls the color and style for the card label text. Font
  /// size will be selected based on card size.
  final TextStyle style;

  /// This is for customization of card content. A common use-case
  /// is to customize the look of face cards, but rank cards
  /// can also be customized via this api.
  final Map<CardValue, Widget Function(BuildContext context)>
      cardContentBuilders;

  /// Creates a suit style. All parameters are optional and will fall back
  /// to the default.
  SuitStyle({this.builder, this.style, this.cardContentBuilders});
}

/// Create a style object if you wish to customize the look of your cards.
///
/// A style is not required, however, and default styles will use imagery from
/// https://commons.wikimedia.org/wiki/Category:SVG_playing_cards
class PlayingCardViewStyle {
  /// Use this to override the style for each suit.
  final Map<Suit, SuitStyle> suitStyles;

  final double top;

  final double left;

  /// The back of the card.
  final Widget Function(BuildContext context) cardBackContentBuilder;

  /// Creates a style. One style can be used for an entire deck.
  const PlayingCardViewStyle(
      {this.suitStyles, this.cardBackContentBuilder, this.top, this.left});
}
