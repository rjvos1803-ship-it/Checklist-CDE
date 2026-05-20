
-- Eigen rapporten per gebruiker
alter table overdrachten add column if not exists created_by text;
alter table ingangscontroles add column if not exists created_by text;
alter table expeditiecontroles add column if not exists created_by text;

-- Indexen voor snellere Mijn rapporten
create index if not exists idx_overdrachten_created_by_created_at on overdrachten(created_by, created_at desc);
create index if not exists idx_ingangscontroles_created_by_created_at on ingangscontroles(created_by, created_at desc);
create index if not exists idx_expeditiecontroles_created_by_created_at on expeditiecontroles(created_by, created_at desc);

-- Performance optimalisatie dashboard en eigen rapporten
alter table overdrachten add column if not exists created_by text;
alter table ingangscontroles add column if not exists created_by text;
alter table expeditiecontroles add column if not exists created_by text;

create index if not exists idx_overdrachten_created_at on overdrachten(created_at desc);
create index if not exists idx_ingangscontroles_created_at on ingangscontroles(created_at desc);
create index if not exists idx_expeditiecontroles_created_at on expeditiecontroles(created_at desc);

create index if not exists idx_overdrachten_created_by_created_at on overdrachten(created_by, created_at desc);
create index if not exists idx_ingangscontroles_created_by_created_at on ingangscontroles(created_by, created_at desc);
create index if not exists idx_expeditiecontroles_created_by_created_at on expeditiecontroles(created_by, created_at desc);

-- Verwijderen van rapporten mogelijk maken
drop policy if exists "Iedereen mag overdrachten verwijderen" on overdrachten;
create policy "Iedereen mag overdrachten verwijderen" on overdrachten for delete using (true);

drop policy if exists "Iedereen mag ingangscontroles verwijderen" on ingangscontroles;
create policy "Iedereen mag ingangscontroles verwijderen" on ingangscontroles for delete using (true);

drop policy if exists "Iedereen mag expeditiecontroles verwijderen" on expeditiecontroles;
create policy "Iedereen mag expeditiecontroles verwijderen" on expeditiecontroles for delete using (true);
