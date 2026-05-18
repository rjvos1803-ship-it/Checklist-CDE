-- Admin delete policy en gebruikersrechten
drop policy if exists "Iedereen mag app_users verwijderen" on app_users;
create policy "Iedereen mag app_users verwijderen" on app_users for delete using (true);
