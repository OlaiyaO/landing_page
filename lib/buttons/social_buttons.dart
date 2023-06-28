import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SocialButton extends StatelessWidget {
  final String imageUrl;

  const SocialButton({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SocialButtonState>(
      create: (_) => SocialButtonState(),
      child: Consumer<SocialButtonState>(
        builder: (context, state, _) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width / 28,
              minHeight: MediaQuery.of(context).size.height / 16,
            ),
            child: MouseRegion(
              onHover: (pointerHoverEvent) {
                state.setHovered(true);
              },
              onExit: (pointerExitEvent) {
                state.setHovered(false);
              },
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: state.isHovered ? const Color(0xFFc3c2cd) : Colors.transparent,
                  ),
                  height: MediaQuery.of(context).size.height / 12,
                  child: Align(
                    alignment: Alignment.center,
                      child: Image.asset(imageUrl)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SocialButtonState extends ChangeNotifier {
  bool _isHovered = false;

  bool get isHovered => _isHovered;

  void setHovered(bool value) {
    _isHovered = value;
    notifyListeners();
  }
}
