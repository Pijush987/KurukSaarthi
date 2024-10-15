part of 'region_select_bloc.dart';

abstract class RegionSelectEvent extends Equatable {
  const RegionSelectEvent();

  @override
  List<Object> get props => [];
}

class RegionChange extends RegionSelectEvent{
  final String selectedRegion;

  const RegionChange({required this.selectedRegion});

  @override
  List<Object> get props => [selectedRegion];
}

class AddItemEvent extends RegionSelectEvent {
  final String item;

  AddItemEvent(this.item);
}

class RemoveItemEvent extends RegionSelectEvent {
  final String item;

  RemoveItemEvent(this.item);
}


class DropdownExpanded extends RegionSelectEvent{
  final bool isDropdownExpanded;

  const DropdownExpanded({required this.isDropdownExpanded});

  @override
  List<Object> get props => [isDropdownExpanded];
}
class IconVisible extends RegionSelectEvent{
  final bool isIconVisible;

  const IconVisible({required this.isIconVisible});

  @override
  List<Object> get props => [isIconVisible];
}

class RegionSelectApi extends RegionSelectEvent{}