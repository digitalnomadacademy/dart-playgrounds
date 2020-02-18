class SavedCredentialsE{
  final String emailKey;
  final String passwordKey;

  SavedCredentialsE(this.emailKey, this.passwordKey);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedCredentialsE &&
          runtimeType == other.runtimeType &&
          emailKey == other.emailKey &&
          passwordKey == other.passwordKey;

  @override
  int get hashCode => emailKey.hashCode ^ passwordKey.hashCode;

}