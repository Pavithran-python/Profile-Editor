

class Validators {
  // ---------- basic ----------
  static String? required(String? v, {String msg = 'Required'}) => (v == null || v.trim().isEmpty) ? msg : null;

  // ---------- e-mail ----------
  static final _emailRegex = RegExp(r'^[\w.\-]+@[\w.\-]+\.\w+$'); // hyphen escaped/last

  static String? email(String? v) => required(v) ?? (_emailRegex.hasMatch(v!) ? null : 'Invalid email address');

  // ---------- phone ----------
  static String? countryCode(String? v) => required(v) ?? (v!.isEmpty || v.length > 4 ? '1–4 digits' : null);

  static String? mobile(String? v) => required(v) ?? (v!.length < 3 || v.length > 21 ? '3–21 digits' : null);

}