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
