import 'package:equatable/equatable.dart';

abstract class BottomnaviEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeTab extends BottomnaviEvent {
  final int selectedIndex;
  ChangeTab(this.selectedIndex);
  @override
  List<Object?> get props => [selectedIndex];
}
