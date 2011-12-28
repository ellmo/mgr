# language: pl
Właściwość: Zautomatyzowana poczta
  W celu zapewnienia możliwości odzyskiwania konta
  Jako użytkownik
  Chcę mieć możliwość resetowania hasła na wypadek, gdybym je zapomniał

  Scenariusz: Widoczność formularza odzyskiwania konta
    Zakładając że jestem na stronie "sign_in"
    Oraz że widzę odnośnik "Forgot your password?"
    Jeżeli kliknę odnośnik "Forgot your password?"
    Wtedy trafię na stronę "new_user_password"
    Oraz będę widział formularz odzyskiwania konta

  Scenariusz: Próba odzyskania konta za pomocą poprawnych kredencjałów
    Zakładając że mamy danych użytkowników
      | email                   | login | password   |
      | jkb.zuchowski@gmail.com | ellmo | haslo123   |
    Oraz że jestem na stronie "new_user_password"
    Oraz że mailer jest przygotowany
    Jeżeli wypełnię pole "user_email" tekstem "jkb.zuchowski@gmail.com"
    Oraz kliknę przycisk "Send me reset password instructions"
    Wtedy zostanie wysłany email

  Scenariusz: Próba odzyskania konta za pomocą niepoprawnych kredencjałów
    Zakładając że mamy danych użytkowników
      | email                   | login | password   |
      | jkb.zuchowski@gmail.com | ellmo | haslo123   |
    Oraz że jestem na stronie "new_user_password"
    Oraz że mailer jest przygotowany
    Jeżeli wypełnię pole "user_email" tekstem "niepoprawny@gmail.com"
    Oraz kliknę przycisk "Send me reset password instructions"
    Wtedy nie zostanie wysłany email
    Oraz będę widział informację o błędach
