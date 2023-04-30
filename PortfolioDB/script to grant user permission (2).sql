
select concat('grant execute on ', r.SPECIFIC_NAME,' to portfolio_role ') from INFORMATION_SCHEMA.ROUTINES r  where r.SPECIFIC_NAME not like 'sp_%' and r.SPECIFIC_NAME not like 'fn_%'
union select concat('grant select on ',t.TABLE_NAME,' to portfolio_role')from INFORMATION_SCHEMA.TABLES t
where t.TABLE_NAME not in ('sysdiagrams')