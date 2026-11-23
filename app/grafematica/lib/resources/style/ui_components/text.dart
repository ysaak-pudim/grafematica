part of 'ui_components.dart';

TextStyler get text => textBaseStyle;
TextStyler get textBold => text.fontWeight(.bold);

TextStyler get greyText => text.color(Colors.grey);
TextStyler get greyTextBold => greyText.merge(textBold);


TextStyler get h1 => textBold.fontSize(25);
TextStyler get h2 => textBold.fontSize(22);
TextStyler get h3 => textBold.fontSize(19);
TextStyler get h4 => textBold.fontSize(16);
TextStyler get h5 => textBold.fontSize(14);
TextStyler get h6 => textBold.fontSize(12);
