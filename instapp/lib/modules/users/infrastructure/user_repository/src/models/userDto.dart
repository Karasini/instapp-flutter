import 'package:equatable/equatable.dart';

class UserDto extends Equatable {
  const UserDto(this.id);

  final String id;

  @override
  List<Object> get props => [id];

  static const empty = UserDto('-');
}
