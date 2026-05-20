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


MIJN RAPPORTEN V2:
- Nieuwe knop: Mijn rapporten
- Elke gebruiker ziet daar zijn eigen opgeslagen rapporten.
- Werkt voor Overdracht, Ingangscontrole en Expeditiecontrole.
- Nieuwe kolom created_by wordt toegevoegd via supabase-setup.sql.
- Loginpagina toont: Versie: mijn rapporten v2


TIMEOUT FIX MIJN RAPPORTEN V4:
- Mijn rapporten haalt niet meer alle rapporten + foto's op.
- Alleen eigen rapporten worden opgehaald via created_by.
- Lijst toont alleen lichte data.
- Volledige data/foto's worden pas geladen bij Open of PDF.
- Indexen toegevoegd in supabase-setup.sql voor created_by + created_at.


FOTO COMPRESSIE:
- Foto's worden automatisch omgezet naar JPEG.
- Foto's worden verkleind/gecomprimeerd tot ongeveer maximaal 100 KB per foto.
- Dit voorkomt Supabase timeouts en houdt rapporten sneller.


STRUCTURELE TIMEOUT FIX:
- Dashboard haalt geen foto's/checklist JSON meer vooraf op.
- Dashboard haalt alleen lichte overzichtsdata op.
- Volledige rapporten worden pas geladen bij Open of PDF.
- Foto's worden nog steeds gecomprimeerd naar ca. 100 KB.
- Voer supabase-setup.sql opnieuw uit voor indexen.


ADMIN RAPPORTEN VERWIJDEREN:
- Admin ziet nu bij rapporten een knop Verwijderen.
- Alleen Admin ziet deze knop.
- Werkt voor:
  Ploegenoverdrachten
  Ingangscontroles
  Expeditiecontroles
- Voer supabase-setup.sql opnieuw uit voor delete policies.
