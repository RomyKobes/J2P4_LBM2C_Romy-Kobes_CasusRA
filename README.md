# J2P4_LBM2C_Romy-Kobes_CasusRA
<p align="center">
<img width="1536" height="1024" alt="Intro_CasusRA" src="https://github.com/user-attachments/assets/f4702a26-bf39-4e35-b71d-7efeb93ee4be" />
</p>

# 🔍 Casus Reumatoïde artritis
👋 Welkom!
Leuk dat je een kijkje neemt in deze repository! Hier vind je een transcriptomicsanalyse van Reumatoïde Artritis (RA) op basis van RNA-seq data.

Wat gebeurt er als duizenden genen tegelijk hun mening geven? Dan krijg je een RNA-seq dataset — en hopelijk interessante biologische inzichten. Gelukkig hoef je niet zelf door duizenden genen te bladeren; de data staat al netjes voor je klaar.

In dit project onderzoeken we verschillen in genexpressie tussen gezonde controlemonsters en RA-monsters. Daarnaast analyseren we welke biologische processen en metabole routes mogelijk betrokken zijn bij de ontwikkeling van de ziekte.

## 👩🏼‍🔬 Auteur
Romy Kobes | 5544858 | LBM2-C

Biomedisch laboratorium analist | NHL Stenden

Periode code: 25-26 J2P4_BM Innovatieve Diagnostiek

Tutor: Dewi van der Bergh

## 📁 Inhoud/structuur

- `data/raw/` –  Ruwe dataset van RNA-seq dataset uit het onderzoek van Platzer et al. (2019).
- `data/processed` -  Verwerkte dataset gegeneerd met R
- `scripts/` – Gebruikte script voor casus
- `README.md` - Informatie over casus
- `data_stewardship/` - Competentie beheren

## 📄 Introductie Reumatoïde artritis
Reumatoïde artritis (RA) is een chronische systemische auto-immuunziekte die voornamelijk de gewrichten aantast. De ziekte wordt gekenmerkt door synovitis, een ontsteking van het gewrichtsslijmvlies, die kan leiden tot progressieve schade aan kraakbeen en bot. Hierdoor ervaren patiënten vaak pijn, stijfheid en verlies van gewrichtsfunctie. Daarnaast kunnen ook andere organen, zoals het cardiovasculaire systeem en de longen, betrokken raken, waardoor RA wordt beschouwd als een systemische aandoening (Di Matteo & Emery, 2024).

De precieze oorzaak van RA is nog niet volledig bekend, maar onderzoek wijst op een complexe interactie tussen genetische aanleg, omgevingsfactoren en een ontregeld immuunsysteem. Genetische varianten, met name binnen het HLA-gencomplex, verhogen het risico op ziekteontwikkeling. Factoren zoals roken, infecties en veranderingen in het microbioom kunnen vervolgens bijdragen aan het ontstaan van een auto-immuunreactie (Sharma et al., 2024).
Op moleculair niveau spelen verschillende immuuncellen en ontstekingsbevorderende cytokinen een centrale rol in het ziekteproces. Recente studies tonen aan dat naast veranderingen in immuunresponsen ook verstoringen in metabole routes bijdragen aan het ontstaan en de instandhouding van chronische ontsteking (D'Orazio et al., 2024). In dit onderzoek worden verschillen in genexpressie tussen RA-patiënten en gezonde controles geanalyseerd. Daarnaast worden pathway-analyses uitgevoerd om biologische processen en metabole routes te identificeren die mogelijk betrokken zijn bij de pathogenese van RA.


## ⚙️ Methode
Voor deze analyse werd gebruikgemaakt van een publieke RNA-seq dataset uit het onderzoek van Platzer et al. (2019). De dataset bevatte acht synoviumbiopten, afkomstig van vier patiënten met gevestigde Reumatoïde Artritis (RA; ziekteduur >12 maanden) en vier individuen zonder RA. Alle RA-patiënten waren positief voor anti-cyclische gecitrullineerde peptiden (ACPA), terwijl de controlegroep ACPA-negatief was. Een overzicht van de gebruikte samples is weergegeven in Tabel 1.  

<i>Tabel 1: Overzicht samples uit onderzoek van Platzer et al. (2019)</i>
| FASTQ | Leeftijd	| Geslacht |	Groep |
|-----------|-----------|-----------|-----------|
| SRR4785819 |	31 | vrouw | Normaal |
| SRR4785820 |	15 | vrouw | Normaal |
| SRR4785828 |	31 | vrouw | Normaal |
| SRR4785831 |	42 | vrouw | Normaal |
| SRR4785979 |	54 | vrouw | Reumatoïde artritis (vastgesteld) |
| SRR4785980 |	66 | vrouw | Reumatoïde artritis (vastgesteld) |
| SRR4785986 |	60 | vrouw | Reumatoïde artritis (vastgesteld) |
| SRR4785988 |	59 | vrouw | Reumatoïde artritis (vastgesteld) |


RNA-seq reads werden gealigneerd tegen het humane referentiegenoom (GRCh38) met behulp van Rsubread en gekwantificeerd per gen met featureCounts. Verschillen in genexpressie tussen patiënten met Reumatische Artritis (RA) en gezonde controles werden vervolgens bepaald met DESeq2. De analyse richtte zich voornamelijk op genen die significant verhoogd tot expressie kwamen in RA. Deze up-gereguleerde genen werden verder onderzocht met Gene Ontology (GO)- en KEGG-pathwayverrijkingsanalyses om betrokken biologische processen en routes te identificeren. Tot slot werden de gevonden expressieveranderingen gevisualiseerd binnen de specifieke KEGG Reumatische Artritis-pathway (hsa05323) met behulp van Pathview. Het volledige stappenplan van deze pipe is terug te vinden in Figuur 1. De exacte uitvoering en documentatie van deze stappen zijn te vinden in het script in de GitHub-map scripts.

<img width="525" height="652" alt="image" src="https://github.com/user-attachments/assets/8748db6d-1f03-419e-9e71-32ff81fe7152" />

<i>Figuur 1. Schematisch overzicht van de bio-informatische workflow voor de RNA-seq data-analyse. De opeenvolgende fasen van de analyse zijn kleurgecodeerd weergegeven. De oranje blokken omvatten de upstream-verwerking, startend vanaf de ruwe dataset via read alignment tegen het GRCh38.p14 referentiegenoom (inclusief genoomindexering) tot aan de genkwantificatie middels featureCounts. De blauwe blokken tonen de downstream statistische analyse, waarbij differentiële genexpressie (DGE) is bepaald met DESeq2, gevolgd door filtering ($p.adjust < 0.05$ en $|\log_2\text{FC}| > 1$) en kwaliteitscontrole via Principal Component Analysis (PCA) en een Volcano plot. De groene blokken representeren de genselectie en de noodzakelijke ID-conversie van Gene Symbols naar ENTREZ-IDs. De gele blokken illustreren de finale functionele annotatie en visualisatie van de up-gereguleerde genen via GO-pathwayverrijking (Dotplot), KEGG-pathwayverrijking (Top 5 Dotplot) en moleculaire pathway-mapping via Pathview (hsa05323).</i>





##  📊 Resultaten
###  Duidelijke differentiële genexpressie bij Reumatoïde Artritis
De PCA-analyse laat een duidelijke scheiding zien tussen RA-patiënten en gezonde controles langs de eerste principale component (PC1), die 74% van de totale variantie verklaart. Dit wijst erop dat de globale genexpressieprofielen sterk verschillen tussen beide groepen. De volcano plot bevestigt deze bevindingen en toont een groot aantal significant differentieel geëxpresseerde genen. Zowel verhoogde als verlaagde expressie werd waargenomen, waarbij vooral een substantiële groep genen een hogere expressie vertoonde in RA-patiënten.

<img width="1210" height="602" alt="PCA + Volcanoplot RA" src="https://github.com/user-attachments/assets/2ce96263-4e10-4a58-8b1d-ea05e38f04d9" />
<i>Figuur 2. Transcriptomische verschillen tussen patiënten met Reumatoïde Artritis (RA) en gezonde controles. (A) Principal Component Analysis (PCA) van RNA-seq expressiegegevens. Elke stip vertegenwoordigt één sample; rode stippen geven gezonde controles weer en blauwe stippen RA-patiënten. De eerste principale component (PC1) verklaart 74% van de totale variantie en laat een duidelijke scheiding zien tussen RA-patiënten en gezonde controles. (B) Volcano plot van de differentiële expressieanalyse. Elke stip vertegenwoordigt één gen. De x-as toont de log₂ fold change en de y-as de statistische significantie (-log₁₀ p-waarde). Rode stippen geven genen weer die zowel significant verschillend geëxpresseerd zijn als een relevante fold change vertonen. Groene stippen voldoen alleen aan de fold-change drempel, blauwe stippen alleen aan de significantiedrempel en grijze stippen zijn niet significant. Genen rechts van de nulwaarde zijn hoger tot expressie gebracht in RA, terwijl genen links van de nulwaarde relatief hoger tot expressie komen in gezonde controles.</i>

### Verrijkte immuunprocessen in Reumatoïde Artritis
De GO-analyse toont aan dat de genen die verhoogd tot expressie komen in RA voornamelijk betrokken zijn bij processen van het adaptieve immuunsysteem. De sterkst verrijkte term was *lymphocyte differentiation* (GeneRatio ≈ 0,040; padj < 1×10⁻⁴), wat wijst op een verhoogde ontwikkeling en specialisatie van lymfocyten. Daarnaast waren processen gerelateerd aan *adaptive immune response* en *lymphocyte mediated immunity* sterk verrijkt (GeneRatio ≈ 0,035–0,038; padj < 1×10⁻⁴), wat suggereert dat immuuncellen een centrale rol spelen in de waargenomen transcriptomische veranderingen.

Ook werd een significante verrijking gevonden voor *B cell activation* (GeneRatio ≈ 0,027; padj ≈ 1–2×10⁻⁴). B-cellen zijn verantwoordelijk voor de productie van antilichamen en worden beschouwd als belangrijke spelers in de pathogenese van Reumatoïde Artritis. Verder waren processen betrokken bij receptor-gemedieerde immuunsignalering sterk vertegenwoordigd, waaronder *immune response-regulating cell surface receptor signaling pathway* (GeneRatio ≈ 0,035; padj < 1×10⁻⁴).

Gezamenlijk wijzen deze resultaten erop dat de verhoogd geëxpresseerde genen in RA voornamelijk betrokken zijn bij activatie, differentiatie en regulatie van immuuncellen. Dit ondersteunt het bekende beeld van Reumatoïde Artritis als een auto-immuunziekte waarbij ontregeling van het adaptieve immuunsysteem een belangrijke rol speelt.

<img width="857" height="852" alt="Dotplot RA" src="https://github.com/user-attachments/assets/5bf9f878-4005-42f3-a56f-93841cfcabb9" />

<i>Figuur 3. Gene Ontology (GO) verrijkingsanalyse van genen die verhoogd tot expressie komen in patiënten met Reumatoïde Artritis (RA). Elke stip vertegenwoordigt een verrijkt biologisch proces. De grootte van de stip geeft het aantal genen binnen een GO-term weer, terwijl de kleur de gecorrigeerde p-waarde (padj) weergeeft. De x-as toont de GeneRatio, oftewel het aandeel genen uit de dataset dat betrokken is bij het betreffende proces.</i>

### Up-gereguleerde DEGs in Reumatoïde Artritis veroorzaken sterke verrijking van specifieke ontstekingspathways
De top 5 meest significant verrijkte KEGG-pathways ($p.adjust < 0.01$) staat gerangschikt op basis van dalende Gene Ratio op de x-as. De NOD-like receptor signaling pathway vertoont de hoogste verrijkingsgraad (Gene Ratio $\approx 0.035$, ~50 genen) en de hoogste significantie ($p.adjust \approx 0.003$). De pathways Th17 cell differentiation (Gene Ratio $\approx 0.0225$, $>50$ genen) en Toll-like receptor signaling pathway (Gene Ratio $\approx 0.021$, $<50$ genen) volgen in het mediane bereik met een $p.adjust$ van circa $0.008$. De IL-17 signaling pathway heeft een Gene Ratio van $\approx 0.0205$, maar valt op door een eveneens zeer hoge significantie ($p.adjust \approx 0.003$) bij ruim 45 genen. De rangschikking sluit met Leishmaniasis, die de laagste verrijkingsgraad ($\approx 0.018$, $p.adjust \approx 0.006$) en de kleinste omvang ($<40$ genen) binnen deze selectie bezit.

<img width="857" height="854" alt="image" src="https://github.com/user-attachments/assets/8d6263a1-2b00-493d-be1c-ec901ba842e3" />

<i>Figuur 4. Dotplot van de top 5 significant verrijkte KEGG-pathways ($p.adjust < 0.05$) op basis van uitsluitend de up-gereguleerde differentieel tot expressie gebrachte genen (DEGs) in Reumatische Artritis (RA). De x-as geeft de Gene Ratio weer (het aandeel DEGs binnen de pathway). De grootte van de stip representeert het absolute aantal genen (Gene count) en de kleur geeft de statistische significantie weer ($p.adjust$, berekend via de Viridis-kleurenschaal waarbij rood de hoogste significantie weerspiegelt).</i>

### Pathview uitleg

<img width="1492" height="859" alt="hsa05323 pathview" src="https://github.com/user-attachments/assets/53091f8f-b343-4de2-b202-b75300cb99f2" />


##  💡 Conclusie

##  📚 Bronnenlijst
Bioinformatics Core Shared Training. (2020). Gene set testing. CRUK Summer School 2020. https://bioinformatics-core-shared-training.github.io/cruk-summer-school-2020/RNAseq/extended_html/06_Gene_set_testing.html

Bioinformatics Core at The University of Texas at Austin. (2014, 18 augustus). GO enrichment using goseq. UT Austin Wiki. https://cloud.wikis.utexas.edu/wiki/spaces/bioiteam/pages/47732482/GO+Enrichment+using+goseq

Kanehisa Laboratories. (2024, 15 augustus). Rheumatoid arthritis - Homo sapiens (human) (KEGG Pathway hsa05323). Kyoto Encyclopedia of Genes and Genomes. https://www.kegg.jp/pathway/hsa05323

Maciejewski, M., Smiljanovic, B., & Grützkau, A. (2019). Analysis of gene expression in rheumatoid arthritis and related conditions offers insights into sex-bias, gene biotypes and co-expression patterns. PLoS ONE, 14(7), Artikel e0219698. https://doi.org/10.1371/journal.pone.0219698

OpenAI. (2026). ChatGPT (Versie GPT-4o) [Groot taalmodel]. https://chatgpt.com

Puxeddu, I., Alunno, A., & Liguori, M. (2024). Pathogenesis of rheumatoid arthritis: One year in review 2024. Clinical and Experimental Rheumatology, 42(9), 1707–1713. https://doi.org/10.55563/clinexprheumatol/0307ed

Smith, M. H., Emery, P., & Jones, A. K. (2024). Rheumatoid arthritis: A review of the key clinical features and ongoing challenges of the disease. Panminerva Medica, 66(4), 427–442. https://doi.org/10.23736/S0031-0808.24.05272-8

Viatte, S. (2024). Genetics of rheumatoid arthritis. Best Practice & Research Clinical Rheumatology, 38(4), Artikel 101968. https://doi.org/10.1016/j.berh.2024.101968

##  🤖 AI disclaimer
Voor dit project is gebruikgemaakt van ChatGPT (OpenAI) als ondersteunend hulpmiddel. AI is ingezet voor het genereren van de illustratieve bannerafbeelding bovenaan de GitHub-pagina en voor het verbeteren van de wetenschappelijke formulering van teksten en figuurbijschriften. De bio-informatische analyses, interpretatie van de resultaten, selectie van methoden en biologische conclusies zijn zelfstandig uitgevoerd door de auteur.

