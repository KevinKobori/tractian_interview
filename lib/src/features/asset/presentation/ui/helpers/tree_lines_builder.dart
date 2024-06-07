import 'package:flutter/material.dart';
import 'package:tractian_interview/src/design_system/challenge_metrics.dart';

class TreeLinesBuilder extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isLastOfChildrens;
  final bool parentHaveBrother;

  const TreeLinesBuilder({
    required this.isFirst,
    required this.isLast,
    required this.isLastOfChildrens,
    required this.parentHaveBrother,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const leftSpace = 23.0;

    return CustomPaint(
      painter: TreeLinesPainter(
        isFirst: isFirst,
        isLast: isLast,
        isLastOfChildrens: isLastOfChildrens,
        parentHaveBrother: parentHaveBrother,
      ),
      child:
          const SizedBox(width: leftSpace, height: ChallegeMetrics.tileHeight),
    );
  }
}

class TreeLinesPainter extends CustomPainter {
  final bool isFirst;
  final bool isLast;
  final bool isLastOfChildrens;
  final bool parentHaveBrother;

  TreeLinesPainter({
    required this.isFirst,
    required this.isLast,
    required this.isLastOfChildrens,
    required this.parentHaveBrother,
    super.repaint,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ChallegeMetrics.nodeTileLinesColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final double startX = size.width;
    final double endX = startX * 2;

    if (!isFirst) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX, size.height / 2),
        paint,
      );
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(endX, size.height / 2),
        paint,
      );
      if (!isLast) {
        canvas.drawLine(
          Offset(startX + ChallegeMetrics.nodeTileLeftMargin, 38),
          Offset(startX + ChallegeMetrics.nodeTileLeftMargin, size.height),
          paint,
        );
      }
      if (!isLastOfChildrens) {
        canvas.drawLine(
          Offset(startX, 28),
          Offset(startX, size.height),
          paint,
        );
      }
      if (parentHaveBrother) {
        canvas.drawLine(
          Offset(startX - ChallegeMetrics.nodeTileLeftMargin, 0),
          Offset(startX - ChallegeMetrics.nodeTileLeftMargin, size.height),
          paint,
        );
      }
    } else if (isFirst && !isLast) {
      canvas.drawLine(
        Offset(startX, 38),
        Offset(startX, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
