
-- Eigen rapporten per gebruiker
alter table overdrachten add column if not exists created_by text;
alter table ingangscontroles add column if not exists created_by text;
alter table expeditiecontroles add column if not exists created_by text;

-- Indexen voor snellere Mijn rapporten
create index if not exists idx_overdrachten_created_by_created_at on overdrachten(created_by, created_at desc);
create index if not exists idx_ingangscontroles_created_by_created_at on ingangscontroles(created_by, created_at desc);
create index if not exists idx_expeditiecontroles_created_by_created_at on expeditiecontroles(created_by, created_at desc);
