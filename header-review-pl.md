# Przegląd i modernizacja nagłówka

## Wykryte problemy

1. **Dostępność (a11y)**
   - `iframe` nie miał `title`.
   - Zamykanie panelu było spięte wyłącznie przez `onclick` (słabe dla klawiatury i utrzymania).
   - Brak semantyki dialogu (`role="dialog"`, `aria-modal`).

2. **Jakość front-endu**
   - Użycie inline JS (`onclick`) utrudnia testowanie i rozwój.
   - Powtarzalny warunek `if (true && typeof ilance_widget === 'function')` zawiera zbędne `true &&`.

3. **Wydajność**
   - Obrazy logo nie miały podpowiedzi `decoding="async"`.
   - Główny widget iframe nie miał `loading="lazy"` i polityki referrer.

## Co zostało ulepszone

- Dodano obsługę zamykania panelu przez:
  - kliknięcie overlay/ikony zamknięcia,
  - klawisz `Escape`.
- Zamieniono element zamknięcia na semantyczny `<button type="button">` z `aria-label`.
- Dodano atrybuty bezpieczeństwa i dostępności dla `iframe`.
- Uproszczono osadzanie widgetu (`ilance_widget`) i zostawiono wyłącznie sensowny guard.
- Dodano wskazówki wydajnościowe dla obrazów logo (`decoding`, `fetchpriority`).

## Plik z poprawionym wariantem

- `header-modernized-snippet.tpl`
