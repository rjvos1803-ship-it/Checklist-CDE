ADMIN FIX V2

Deze versie is gemaakt op basis van jouw aangeleverde index.html.

Te controleren na upload:
- Loginpagina toont: Versie: admin beheer definitief v2
- Admin tabel toont kolommen:
  Gebruiker / Wachtwoord / Naam / Rechten / Acties
- Acties bevat:
  Aanpassen / Verwijderen

Upload alle bestanden naar GitHub en overschrijf index.html.
Voer eventueel supabase-setup-admin-fix.sql uit voor verwijderrechten.


MIJN RAPPORTEN:
- Nieuwe knop: Mijn rapporten
- Elke gebruiker ziet daar zijn eigen opgeslagen rapporten.
- Werkt voor Overdracht, Ingangscontrole en Expeditiecontrole.
- Nieuwe kolom created_by wordt toegevoegd via supabase-setup.sql.
- Let op: oude rapporten van vóór deze update hebben nog geen created_by.
