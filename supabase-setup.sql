create table if not exists overdrachten (
  id uuid primary key default gen_random_uuid(),
  created_at timestamp with time zone default now(),
  datum_tijd text,
  overdragende_teamleider text,
  ontvangende_teamleider text,
  checklist_data jsonb,
  five_s_data jsonb,
  photos jsonb,
  status text default 'Opgeslagen'
);

alter table overdrachten enable row level security;

drop policy if exists "Iedereen mag overdrachten lezen" on overdrachten;
drop policy if exists "Iedereen mag overdrachten toevoegen" on overdrachten;
drop policy if exists "Iedereen mag overdrachten wijzigen" on overdrachten;
drop policy if exists "Iedereen mag overdrachten verwijderen" on overdrachten;

create policy "Iedereen mag overdrachten lezen" on overdrachten for select using (true);
create policy "Iedereen mag overdrachten toevoegen" on overdrachten for insert with check (true);
create policy "Iedereen mag overdrachten wijzigen" on overdrachten for update using (true);
create policy "Iedereen mag overdrachten verwijderen" on overdrachten for delete using (true);

create table if not exists ingangscontroles (
  id uuid primary key default gen_random_uuid(),
  created_at timestamp with time zone default now(),
  datum_tijd text,
  ordernummer text not null,
  controleur text,
  checklist_data jsonb,
  photos jsonb,
  status text default 'Opgeslagen'
);

alter table ingangscontroles enable row level security;

drop policy if exists "Iedereen mag ingangscontroles lezen" on ingangscontroles;
drop policy if exists "Iedereen mag ingangscontroles toevoegen" on ingangscontroles;
drop policy if exists "Iedereen mag ingangscontroles wijzigen" on ingangscontroles;
drop policy if exists "Iedereen mag ingangscontroles verwijderen" on ingangscontroles;

create policy "Iedereen mag ingangscontroles lezen" on ingangscontroles for select using (true);
create policy "Iedereen mag ingangscontroles toevoegen" on ingangscontroles for insert with check (true);
create policy "Iedereen mag ingangscontroles wijzigen" on ingangscontroles for update using (true);
create policy "Iedereen mag ingangscontroles verwijderen" on ingangscontroles for delete using (true);

create table if not exists expeditiecontroles (
  id uuid primary key default gen_random_uuid(),
  created_at timestamp with time zone default now(),
  datum_tijd text,
  vracht_type text,
  zonder_schade text,
  opmerking text,
  photos jsonb,
  status text default 'Opgeslagen'
);

alter table expeditiecontroles enable row level security;

drop policy if exists "Iedereen mag expeditiecontroles lezen" on expeditiecontroles;
drop policy if exists "Iedereen mag expeditiecontroles toevoegen" on expeditiecontroles;
drop policy if exists "Iedereen mag expeditiecontroles wijzigen" on expeditiecontroles;
drop policy if exists "Iedereen mag expeditiecontroles verwijderen" on expeditiecontroles;

create policy "Iedereen mag expeditiecontroles lezen" on expeditiecontroles for select using (true);
create policy "Iedereen mag expeditiecontroles toevoegen" on expeditiecontroles for insert with check (true);
create policy "Iedereen mag expeditiecontroles wijzigen" on expeditiecontroles for update using (true);
create policy "Iedereen mag expeditiecontroles verwijderen" on expeditiecontroles for delete using (true);


-- Simpel test-login systeem zonder e-mail
create table if not exists app_users (
  id uuid primary key default gen_random_uuid(),
  created_at timestamp with time zone default now(),
  username text unique not null,
  password text not null,
  display_name text,
  can_dashboard boolean default false,
  can_overdracht boolean default false,
  can_5s boolean default false,
  can_ingang boolean default false,
  can_expeditie boolean default false,
  is_admin boolean default false,
  is_active boolean default true
);

alter table app_users enable row level security;

drop policy if exists "Iedereen mag app_users lezen" on app_users;
drop policy if exists "Iedereen mag app_users toevoegen" on app_users;
drop policy if exists "Iedereen mag app_users wijzigen" on app_users;

create policy "Iedereen mag app_users lezen" on app_users for select using (true);
create policy "Iedereen mag app_users toevoegen" on app_users for insert with check (true);
create policy "Iedereen mag app_users wijzigen" on app_users for update using (true);

insert into app_users
(username, password, display_name, can_dashboard, can_overdracht, can_5s, can_ingang, can_expeditie, is_admin, is_active)
values
('robert', '1234', 'Robert', true, true, true, true, true, true, true),
('teamleider', '1234', 'Teamleider', true, true, true, false, false, false, true),
('expeditie', '1234', 'Expeditie', false, false, false, false, true, false, true),
('ingang', '1234', 'Ingangscontrole', false, false, false, true, false, false, true)
on conflict (username) do update set
password=excluded.password,
display_name=excluded.display_name,
can_dashboard=excluded.can_dashboard,
can_overdracht=excluded.can_overdracht,
can_5s=excluded.can_5s,
can_ingang=excluded.can_ingang,
can_expeditie=excluded.can_expeditie,
is_admin=excluded.is_admin,
is_active=excluded.is_active;


-- app_users verwijderen definitief
drop policy if exists "Iedereen mag app_users verwijderen" on app_users;
create policy "Iedereen mag app_users verwijderen" on app_users for delete using (true);
