# J2P4_LBM2C_Romy-Kobes_CasusRA
<p align="center">
<img width="1536" height="1024" alt="Intro_CasusRA" src="https://github.com/user-attachments/assets/f4702a26-bf39-4e35-b71d-7efeb93ee4be" />
</p>

# 🔍 Casus Reumatoïde artritis
👋 Welkom!
Leuk dat je een kijkje neemt in deze repository! Hier vind je een transcriptomicsanalyse van Reumatoïde Artritis (RA) op basis van RNA-seq data.

Wat gebeurt er als duizenden genen tegelijk hun mening geven? Dan krijg je een RNA-seq dataset — en hopelijk interessante biologische inzichten. Gelukkig hoef je niet zelf door duizenden genen te bladeren; de data staat al netjes voor je klaar.

In dit project onderzoeken we verschillen in genexpressie tussen gezonde controlemonsters en RA-monsters. Daarnaast analyseren we welke biologische processen en metabole routes mogelijk betrokken zijn bij de ontwikkeling van de ziekte.

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
De ruwe genexpressiedata die in dit onderzoek is geanalyseerd, werd verstrekt door NHL Stenden Hogeschool via de Blackboard-leeromgeving. De dataset was beschikbaar als gecomprimeerd archiefbestand (Data_RAW.zip). RNA-seq paired-end data van RA en normale controles zijn geanalyseerd in R.

Pipeline
- Referentiegenoom (GRCh38) geïndexeerd en reads gealigneerd met Rsubread 
- BAM-bestanden gesorteerd en geïndexeerd met Rsamtools 
- Genexpressie bepaald met featureCounts (gene-level quantification) 
- Low-expression filtering toegepast (≤10 reads in <2 samples)
  
Differentiële expressie
- Analyse uitgevoerd met DESeq2 
- Criteria: adjusted p-value < 0.05 en |log2FC| > 1 
- PCA gebruikt voor exploratieve analyse
  
Functionele analyse
- GO en KEGG enrichment met clusterProfiler 
- Visualisaties: volcano plots en PCA 
- Pathway mapping met pathview
  
Output
- Count matrix, DEG-lijsten en figuren opgeslagen voor reproduceerbaarheid. Volledig script beschikbaar in deze repository.

##  Resultaten



## Conclusie

Spreuken met meer accuraatheid lijken minder krachtig te zijn. Een uitzondering op deze trend is de onvergeeflijke vloek *Avada Kedavra*, welke beter niet gebruikt kan worden. 
