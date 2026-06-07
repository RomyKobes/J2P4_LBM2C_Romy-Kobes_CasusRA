# J2P4_LBM2C_Romy-Kobes_CasusRA
<p align="center">
<img width="1536" height="1024" alt="Intro_CasusRA" src="https://github.com/user-attachments/assets/f4702a26-bf39-4e35-b71d-7efeb93ee4be" />
</p>

# 🔍 Casus Reumatoïde artritis

Reumatoïde artritis (RA) is een chronische systemische auto-immuunziekte die voornamelijk de gewrichten aantast. Hoewel de exacte oorzaak nog niet volledig bekend is, spelen genetische aanleg, omgevingsfactoren en een ontregeld immuunsysteem een belangrijke rol bij het ontstaan van de ziekte.

In dit onderzoek wordt geanalyseerd welke genen verschillend tot expressie komen bij personen met reumatoïde artritis ten opzichte van gezonde individuen. Daarnaast wordt onderzocht welke metabole routes mogelijk verstoord zijn.

## 📁 Inhoud/structuur

- `data/raw/` –  
- `data/processed` -  
- `scripts/` –
- `resultaten/` - 
- `bronnen/` -  
- `README.md` - 
- `assets/` - overige documenten voor de opmaak van deze pagina
- `data_stewardship/` -

## Introductie Reumatoïde artritis
Reumatoïde artritis (RA) is een chronische systemische auto-immuunziekte die voornamelijk de gewrichten aantast. De ziekte wordt gekenmerkt door synovitis, een ontsteking van het gewrichtsslijmvlies, die kan leiden tot progressieve schade aan kraakbeen en bot. Hierdoor ervaren patiënten vaak pijn, stijfheid en verlies van gewrichtsfunctie. Daarnaast kunnen ook andere organen, zoals het cardiovasculaire systeem en de longen, betrokken raken, waardoor RA wordt beschouwd als een systemische aandoening (Di Matteo & Emery, 2024).

De precieze oorzaak van RA is nog niet volledig bekend, maar onderzoek wijst op een complexe interactie tussen genetische aanleg, omgevingsfactoren en een ontregeld immuunsysteem. Genetische varianten, met name binnen het HLA-gencomplex, verhogen het risico op ziekteontwikkeling. Factoren zoals roken, infecties en veranderingen in het microbioom kunnen vervolgens bijdragen aan het ontstaan van een auto-immuunreactie (Sharma et al., 2024).
Op moleculair niveau spelen verschillende immuuncellen en ontstekingsbevorderende cytokinen een centrale rol in het ziekteproces. Recente studies tonen aan dat naast veranderingen in immuunresponsen ook verstoringen in metabole routes bijdragen aan het ontstaan en de instandhouding van chronische ontsteking (D'Orazio et al., 2024). In dit onderzoek worden verschillen in genexpressie tussen RA-patiënten en gezonde controles geanalyseerd. Daarnaast worden pathway-analyses uitgevoerd om biologische processen en metabole routes te identificeren die mogelijk betrokken zijn bij de pathogenese van RA.


## Methoden
De ruwe genexpressiedata die in dit onderzoek is geanalyseerd, werd verstrekt door NHL Stenden Hogeschool via de Blackboard-leeromgeving. De dataset was beschikbaar als gecomprimeerd archiefbestand (Data_RAW.zip).

De ruwe data van spreuken is eerst bewerkt voor analyse met behulp van [scripts/01_clean_spell_data.R](scripts/01_clean_spell_data.R). Vervolgens zijn de spreuken geanalyseerd op kracht en nauwkeurigheid met [scripts/02_spell_analysis.R](scripts/02_spell_analysis.R).

## 📊 Resultaten

Om inzicht te krijgen in eigenschappen van de te gebruiken spreuken is er een overzicht gemaakt, te vinden in [deze tabel](resultaten/top_10_spells.csv). Onvergeeflijke vloeken zijn niet meegenomen in dit overzicht. 

Om een afweging te maken welke spreuken het meest effectief zijn, is er onderzocht of er een verband te vinden is tussen kracht en accuraatheid. In [het resultaat hiervan](resultaten/spell_power_vs_accuracy.png) is te zien dat er een negatieve daling lijkt te zijn in kracht als de accuraatheid toeneemt. Een uitschieter is de onvergeeflijke vloek *Avada Kedavra*, met zowel hoge kracht als accuraatheid. 

## Conclusie

Spreuken met meer accuraatheid lijken minder krachtig te zijn. Een uitzondering op deze trend is de onvergeeflijke vloek *Avada Kedavra*, welke beter niet gebruikt kan worden. 
