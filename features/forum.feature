# language: pl
Właściwość: Używanie forum
  
  Scenariusz: Widoczność forum dla użytkowników
    Zakładając że nie jestem zalogowany
    Oraz że widzę odnośnik "Forum"
    Jeżeli kliknę odnośnik "Forum"
    Wtedy trafię na stronę "forum"
    Oraz będę widział listę postów

  Scenariusz: dostęp do forum jako zalogowany użytkownik
    Zakładając że jestem zalogowany jako użytkownik "ellmo"
    Oraz że jestem na stronie "forum"
    Oraz że widzę odnośnik "New post"
    Jeżeli kliknę odnośnik "New post"
    Wtedy trafię na stronę "new_post"
    Oraz będę widział formularz dodawania posta

  Scenariusz: dostęp do forum jako niezalogowany użytkownik
    Zakładając że nie jestem zalogowany
    Oraz że jestem na stronie "forum"
    Wtedy nie będę widział odnośnika "New post"

  Scenariusz: dostęp do forum jako zalogowany użytkownik
    Zakładając że jestem zalogowany jako użytkownik "ellmo"
    Oraz że jestem na stronie "new_post"
    Jeżeli wypełnię pole "post_content" tekstem "testowy tekst testowy"
    Oraz kliknę przycisk "Post"
    Wtedy trafię na stronę "forum"
    Oraz będę widział post "testowy tekst testowy" na liście postów
