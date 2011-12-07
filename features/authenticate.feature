# language: pl
Właściwość: Autoryzacja
  W celu zapewnienia elementarnego bezpieczeństwa
  Jako użytkownik
  Chcę mieć możliwość uwierzytelniania i autoryzacji moich poczynań

  Scenariusz: Poprawne Logowanie
    Zakładając że mamy danych użytkowników
      | email                   | login | password |
      | jkb.zuchowski@gmail.com | ellmo | haslo1   |
    Oraz że jestem na stronie "root"
    Oraz że nie jestem zalogowany
    Jeżeli niezalogowany użytkownik loguje się z widoku za pomocą kredencjałów "ellmo" oraz "haslo1"
    Wtedy trafię na stronę "root"
    Oraz będzie stworzona sesja dla użytkownika "ellmo"
    Oraz będę widział informację "Zalogowałeś się jako ellmo"
