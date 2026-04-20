enum RecipientType {
  senior,
  friend,
  significantOther,
  coworker,
  peer,
  junior,
  other,
}

extension RecipientTypeX on RecipientType {
  String get displayName {
    switch (this) {
      case RecipientType.senior:
        return '어른/상사';
      case RecipientType.friend:
        return '친구';
      case RecipientType.significantOther:
        return '연인';
      case RecipientType.coworker:
        return '동료';
      case RecipientType.peer:
        return '동년배';
      case RecipientType.junior:
        return '동생';
      case RecipientType.other:
        return '기타';
    }
  }

  String get apiValue {
    switch (this) {
      case RecipientType.senior:
        return 'senior';
      case RecipientType.friend:
        return 'friend';
      case RecipientType.significantOther:
        return 'significant other';
      case RecipientType.coworker:
        return 'coworker';
      case RecipientType.peer:
        return 'peer';
      case RecipientType.junior:
        return 'junior';
      case RecipientType.other:
        return 'other';
    }
  }

  static RecipientType fromDisplayName(String value) {
    switch (value) {
      case '어른/상사':
        return RecipientType.senior;
      case '친구':
        return RecipientType.friend;
      case '연인':
        return RecipientType.significantOther;
      case '동료':
        return RecipientType.coworker;
      case '동년배':
        return RecipientType.peer;
      case '동생':
        return RecipientType.junior;
      case '기타':
      default:
        return RecipientType.other;
    }
  }

  static RecipientType fromApiValue(String value) {
    switch (value) {
      case 'senior':
        return RecipientType.senior;
      case 'friend':
        return RecipientType.friend;
      case 'significant other':
        return RecipientType.significantOther;
      case 'coworker':
        return RecipientType.coworker;
      case 'peer':
        return RecipientType.peer;
      case 'junior':
        return RecipientType.junior;
      case 'other':
      default:
        return RecipientType.other;
    }
  }
}
