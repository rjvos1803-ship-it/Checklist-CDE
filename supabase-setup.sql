
-- Eigen rapporten per gebruiker
alter table overdrachten add column if not exists created_by text;
alter table ingangscontroles add column if not exists created_by text;
alter table expeditiecontroles add column if not exists created_by text;
