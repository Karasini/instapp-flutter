class UserDto {
  UserDto(this.email, this.nick, this.password, this.id);

  final String email;
  final String nick;
  final String password;
  final String id;

  getEmail() => email;

  getNick() => nick;

  getPassword() => password;

  getId() => id;
}
