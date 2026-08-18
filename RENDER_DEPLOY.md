# Deploy pe Render.com

Proiectul este configurat ca Web Service Docker prin `render.yaml` din rădăcina
repository-ului. Serverul HTTP mic din `bot.py` ascultă pe variabila `PORT`,
iar ruta `/health` este folosită de Render pentru verificarea serviciului.

## Pași

1. Urcă repository-ul pe GitHub/GitLab și creează un serviciu nou în Render
   folosind **Blueprint**.
2. Selectează repository-ul; Render va detecta automat `render.yaml`.
3. În setările serviciului adaugă valoarea secretă pentru `DISCORD_TOKEN`.
   Nu o pune în repository și nu o trimite în chat.
4. Pornește deploy-ul. Render va construi imaginea cu Python 3.11, FFmpeg și
   libopus, apoi va porni `python bot.py`.

Pentru mai multe conturi se pot adăuga ulterior variabilele
`DISCORD_TOKEN_1` până la `DISCORD_TOKEN_10`; codul le citește automat.

Notă: automatizarea conturilor de utilizator prin selfbot poate încălca
regulile Discord. Folosește proiectul doar dacă accepți responsabilitatea și
riscurile platformei.
