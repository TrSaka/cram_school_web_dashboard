extension UpperCase on dynamic {
  get toUpc {
    return toString().toUpperCase();
  }
}

extension LowerCase on dynamic {
  get toDpc {
    return toString().toLowerCase();
  }
}
