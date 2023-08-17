part of 'tab_bar_cubit.dart';

@immutable
class TabBarState extends Equatable {
  final int index;
  final int listIndex;
  const TabBarState({
    this.index = 0,
    this.listIndex = 0,
  });
  TabBarState copyWith({
    int? index,
    int? listIndex,
  }) =>
      TabBarState(
        index: index ?? this.index,
        listIndex: listIndex ?? this.listIndex,
      );
  @override
  List<Object?> get props => [
        index,
        listIndex,
      ];
}
