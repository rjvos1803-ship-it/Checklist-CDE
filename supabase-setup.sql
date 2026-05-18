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
