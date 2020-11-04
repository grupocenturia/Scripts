COPY /b /y "Definitions\*.sql" 01_Definitions.sql
COPY /b /y "Functions\*.sql" 02_Functions.sql
COPY /b /y "Procedures\Administrator\*.sql" 03_Administrator.sql
COPY /b /y "Procedures\Core\*.sql" 04_Core.sql
COPY /b /y "Procedures\Accounting\*.sql" 05_Accounting.sql
COPY /b /y "Scripts\*.sql" 06_Scripts.sql
PAUSE
