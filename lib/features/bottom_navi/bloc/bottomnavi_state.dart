import 'package:equatable/equatable.dart';

class BottomnaviState extends Equatable {
  final selectTabIndex;
  BottomnaviState(this.selectTabIndex);

  @override
  List<Object?> get props => [selectTabIndex];
}
