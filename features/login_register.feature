# language: pl
Właściwość: Uwierzytelnianie i Rejestracja
  W celu zapewnienia elementarnego bezpieczeństwa
  Jako użytkownik
  Chcę mieć możliwość uwierzytelniania i autoryzacji moich poczynań

  Scenariusz: Widoczność formularza logowania
    Zakładając że jestem na stronie "root"
    Oraz że widzę odnośnik "Sign in"
    Jeżeli kliknę odnośnik "Sign in"
    Wtedy trafię na stronę "sign_in"
    Oraz będę widział formularz logowania

  Szablon scenariusza: logowanie emailem LUB loginem
    Zakładając że mamy danych użytkowników
      | email                   | login | password   |
      | jkb.zuchowski@gmail.com | ellmo | haslo123   |
    Oraz że jestem na stronie "sign_in"
    Jeżeli wypełnię formularz logowania danymi
      | user_login       | user_password   |
      | <login_or_email> | <pass>          |
    Oraz kliknę przycisk "Sign in"
    Wtedy trafię na stronę "root"
    Oraz będę widział informację "Zalogowałeś się jako ellmo"

    Przykłady:
      | login_or_email          | pass     |
      | ellmo                   | haslo123 |
      | jkb.zuchowski@gmail.com | haslo123 |
  
  Szablon scenariusza: błędne logowanie
    Zakładając że mamy danych użytkowników
      | email                   | login | password   |
      | jkb.zuchowski@gmail.com | ellmo | haslo123   |
    Oraz że jestem na stronie "sign_in"
    Jeżeli wypełnię formularz logowania danymi
      | user_login       | user_password   |
      | <login_or_email> | <pass>          |
    Oraz kliknę przycisk "Sign in"
    Wtedy trafię na stronę "sign_in"
    Oraz będę widział informację o błędach

    Przykłady:
      | login_or_email          | pass        |
      | niepoprawny             | haslo123    |
      | ellmo                   | niepoprawne |
  
  Scenariusz: Widoczność formularza rejestracji
    Zakładając że jestem na stronie "root"
    Oraz że widzę odnośnik "Sign up"
    Jeżeli kliknę odnośnik "Sign up"
    Wtedy trafię na stronę "sign_up"
    Oraz będę widział formularz rejestracji

  Scenariusz: Poprawne rejestrowanie
    Zakładając że jestem na stronie "sign_up"
    Jeżeli wypełnię formularz rejestracji danymi
      | email                   | login | password |
      | jkb.zuchowski@gmail.com | ellmo | haslo123 |
    Oraz kliknę przycisk "Register"
    Wtedy trafię na stronę "root"
    Oraz w bazie danych znajdzie się użytkownik "ellmo"
    Oraz będę widział informację "Zalogowałeś się jako ellmo"

  Szablon scenariusza: Niepoprawne rejestrowanie
    Zakładając że mamy danych użytkowników
      | email                   | login | password   |
      | jkb.zuchowski@gmail.com | ellmo | haslo123   |
    Oraz że liczba użytkowników wynosi "1"
    Oraz że jestem na stronie "sign_up"
    Jeżeli wypełnię formularz rejestracji danymi
      | email   | login   | password   |
      | <email> | <login> | <password> |
    Oraz kliknę przycisk "Register"
    Wtedy trafię na stronę "sign_up"
    Oraz w bazie danych nie znajdzie się nowy użytkownik
    Oraz będę widział informację o błędach

    Przykłady:
      | email                   | login | password |
      |                         | ellmo | haslo123 |
      | jkb.zuchowski@gmail.com |       | haslo123 |  
      | jkb.zuchowski@gmail.com |       |          |  
      | niepoprawny_adres       | ellmo | haslo123 |
      | jkb.zuchowski@gmail.com | ellmo | haslo123 |
