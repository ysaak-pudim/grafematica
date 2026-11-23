part of 'ui_components.dart';

// boxes
BoxStyler get box => boxBaseStyle;
BoxStyler get outlinedBox => outlinedBoxBaseStyle;

// row & column
FlexBoxStyler get row => flexBoxBaseStyle.direction(.horizontal);
FlexBoxStyler get column => flexBoxBaseStyle.direction(.vertical);
FlexBoxStyler get outlinedRow => row.merge(outlinedFlexBoxBaseStyle);
FlexBoxStyler get outlinedColumn => column.merge(outlinedFlexBoxBaseStyle);