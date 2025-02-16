# Informacje
Projekt (publiczny) ze skryptem do pobierania prywatnych repo:
https://github.com/Pioxolotl/Cerebritron_HAL.git
https://github.com/Pioxolotl/Cerebritron_PS.git
https://github.com/Pioxolotl/Cerebritron_CC.git
https://github.com/Pioxolotl/Cerebritron_AC.git
https://github.com/Pioxolotl/Cerebritron_SM.git

Wymagany wpis w .env
```
GITHUB_TOKEN=ghp_personal_access_token
```

# Opis warstw oprogramowania

## Warstwa Sprzętowa (HAL)
Warstwa ta jest fundamentem percepcji robota. Jej zadaniem jest zbieranie surowych danych z wszystkich sensorów fizycznych (kamery, mikrofony, czujniki dotykowe, temperatury, skanery lidar, sensory stanu wewnętrznego, czujniki położenia itp) i przekształcanie ich w formę cyfrową, gotową do dalszego przetwarzania. Kluczowe jest tutaj efektywne i szybkie pozyskiwanie danych w czasie rzeczywistym

## System Percepcji (PS)
Warstwa ta przejmuje surowe dane sensoryczne i przetwarza je na wyższy poziom abstrakcji, tworząc zrozumiałą dla robota reprezentację otoczenia i kontekstu. Kluczowe jest tutaj ekstrakcja cech, fuzja multimodalna i budowanie spójnego modelu percepcyjnego. Ważne dane, jak np. informacje o usterkach, anomaliach, przeciążeniach itp powinny być dostępne od razu dla rdzenia kognitywnego (powinny go wyzwalać), pozostałe dane powinny budować model odczytowy dostępny na żądanie CC. Warstwa podzielona na moduły dla każdego ze zmysłów. 

## Rdzeń kognitywny (Cerebritron) (CC)
Ta warstwa stanowi "mózg" robota. Wykorzystuje informacje percepcyjne do rozumienia poleceń użytkownika, prowadzenia dialogu, rozumowania, planowania zadań, podejmowania decyzji i zarządzania wiedzą. Polecenia użytkowników/automatyczne są tutaj przetwarzane i generowana jest odpowiedź w oparciu o percepcję. 

## Akcja i komunikacja (AC)
Warstwa ta przekłada decyzje CC na działania w świecie rzeczywistym. Obejmuje sterowanie aktuatorami robota. Warstwa wyposażona jest w środowisko symulacyjne i przetwarza polecenia wyższego poziomu z CC na zrozumiałe dla HAL.

## Monitorowanie (SM)
Ta warstwa obejmuje kluczowe komponenty wspomagające działanie całego systemu robota: zarządzanie systemem, bezpieczeństwo, monitorowanie zasobów i działania, diagnostyka błędów. 
