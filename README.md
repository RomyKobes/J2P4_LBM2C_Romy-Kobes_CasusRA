# Differentiële genexpressieanalyse toont versterkte immuunactivatie en ontstekingssignalering bij Reumatoïde Artritis
<p align="center">
<img width="1536" height="1024" alt="Intro_CasusRA" src="https://github.com/user-attachments/assets/f4702a26-bf39-4e35-b71d-7efeb93ee4be" />
</p>

# 🔍 Casus Reumatoïde artritis
👋 Welkom!
Leuk dat je een kijkje neemt in deze repository! Hier vind je een transcriptomicsanalyse van Reumatoïde Artritis (RA) op basis van RNA-seq data.

Wat gebeurt er als duizenden genen tegelijk hun mening geven? Dan krijg je een RNA-seq dataset  en hopelijk interessante biologische inzichten. Gelukkig hoef je niet zelf door duizenden genen te bladeren; de data staat al netjes voor je klaar.

In dit project worden verschillen in genexpressie tussen gezonde controles en patiënten met Reumatoïde Artritis (RA) onderzocht. Daarnaast worden functionele verrijkings- en pathway-analyses uitgevoerd om biologische processen en signaalroutes te identificeren die mogelijk bijdragen aan de pathogenese van de ziekte.

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
Reumatoïde artritis (RA) is een chronische systemische auto-immuunziekte die voornamelijk de gewrichten aantast. De ziekte wordt gekenmerkt door synovitis, een ontsteking van het gewrichtsslijmvlies, die kan leiden tot progressieve schade aan kraakbeen en bot. Hierdoor ervaren patiënten vaak pijn, stijfheid en verlies van gewrichtsfunctie. Daarnaast kunnen ook andere organen, zoals het cardiovasculaire systeem en de longen, betrokken raken, waardoor RA wordt beschouwd als een systemische aandoening [(Di Matteo & Emery, 2024)](https://pmc.ncbi.nlm.nih.gov/articles/PMC13034790/).

De precieze oorzaak van RA is nog niet volledig bekend, maar onderzoek wijst op een complexe interactie tussen genetische aanleg, omgevingsfactoren en een ontregeld immuunsysteem. Genetische varianten, met name binnen het HLA-gencomplex, verhogen het risico op ziekteontwikkeling. Factoren zoals roken, infecties en veranderingen in het microbioom kunnen vervolgens bijdragen aan het ontstaan van een auto-immuunreactie [(Sharma et al., 2024)](https://pubmed.ncbi.nlm.nih.gov/38955657/).
Op moleculair niveau spelen verschillende immuuncellen en ontstekingsbevorderende cytokinen een centrale rol in het ziekteproces. Recente studies tonen aan dat veranderingen in immuunresponsen en intracellulaire signaleringsroutes bijdragen aan het ontstaan en de instandhouding van chronische ontsteking [(D'Orazio et al., 2024)](https://pubmed.ncbi.nlm.nih.gov/39315569/). In dit onderzoek worden verschillen in genexpressie tussen RA-patiënten en gezonde controles geanalyseerd. Daarnaast worden functionele verrijkings- en pathway-analyses uitgevoerd om biologische processen en signaalroutes te identificeren die mogelijk betrokken zijn bij de pathogenese van RA.


## ⚙️ Methode
Voor deze analyse wordt gebruikgemaakt van een publieke RNA-seq-dataset uit het onderzoek van [Platzer et al. (2019)](https://pubmed.ncbi.nlm.nih.gov/31344123/). De dataset bevat acht synoviumbiopten, afkomstig van vier patiënten met vastgestelde reumatoïde artritis (RA; ziekteduur >12 maanden) en vier individuen zonder RA. Alle RA-patiënten zijn positief voor anti-cyclische gecitrullineerde peptiden (ACPA), terwijl de controlegroep ACPA-negatief is. Een overzicht van de gebruikte samples is weergegeven in Tabel 1

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


RNA-seq reads worden gealigneerd tegen het humane referentiegenoom [GRCh38.p14 (NCBI Assembly GCF_000001405.40)](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.40/) met behulp van het R/Bioconductor-package Rsubread (v2.24.0), waarna genexpressie wordt gekwantificeerd met de functie featureCounts. Differentiale genexpressie tussen patiënten met Reumatoïde Artritis (RA) en gezonde controles wordt bepaald met DESeq2 (v1.50.0) volgens een negatief-binomiaal model. Significant opgereguleerde genen in RA worden vervolgens onderworpen aan Gene Ontology (GO)- en KEGG-pathwayverrijkingsanalyses. Expressieveranderingen worden gevisualiseerd binnen de KEGG RA-pathway [(hsa05323)](https://www.kegg.jp/pathway/hsa05323) met Pathview (v1.48.0). De KEGG-database wordt geraadpleegd voor pathwayannotaties. De volledige workflow is weergegeven in Figuur 1; de exacte R-code is beschikbaar in de GitHub-map scripts.

<img width="525" height="652" alt="image" src="https://github.com/user-attachments/assets/8748db6d-1f03-419e-9e71-32ff81fe7152" />

<i>Figuur 1. Schematisch overzicht van de bio-informatische workflow voor de RNA-seq data-analyse. De opeenvolgende fasen van de analyse zijn kleurgecodeerd weergegeven. De oranje blokken omvatten de upstream-verwerking, startend vanaf de ruwe dataset via read alignment tegen het GRCh38.p14 referentiegenoom (inclusief genoomindexering) tot aan de genkwantificatie middels featureCounts. De blauwe blokken tonen de downstream statistische analyse, waarbij differentiële genexpressie (DGE) is bepaald met DESeq2, gevolgd door filtering ($p.adjust < 0.05$ en $|\log_2\text{FC}| > 1$) en kwaliteitscontrole via Principal Component Analysis (PCA) en een Volcano plot. De groene blokken representeren de genselectie en de noodzakelijke ID-conversie van Gene Symbols naar ENTREZ-IDs. De gele blokken illustreren de finale functionele annotatie en visualisatie van de up-gereguleerde genen via GO-pathwayverrijking (Dotplot), KEGG-pathwayverrijking (Top 5 Dotplot) en moleculaire pathway-mapping via Pathview (hsa05323).</i>





##  📊 Resultaten
Om verschillen in genexpressie tussen RA-patiënten en gezonde controles te onderzoeken, werd een RNA-seq-analyse uitgevoerd. Hierbij lag de focus op genen die verhoogd tot expressie kwamen in RA, waarbij functionele verrijkings- en pathway-analyses werden toegepast om biologische processen en signaalroutes te identificeren die mogelijk bijdragen aan de pathogenese van de ziekte.
###  Duidelijke differentiële genexpressie bij Reumatoïde Artritis
De PCA-analyse laat een duidelijke scheiding zien tussen RA-patiënten en gezonde controles, waarbij de eerste principale component (PC1) 74% van de totale variantie verklaart. Dit wijst op substantiële verschillen in het genexpressieprofiel tussen beide groepen. De volcano plot, gebaseerd op in totaal 29.407 geanalyseerde variabelen, bevestigt deze bevindingen. Hierbij is een groot aantal genen geïdentificeerd als differentieel geëxpresseerd, waarbij een aanzienlijk deel significant verhoogd tot expressie komt in RA.

<img width="1210" height="602" alt="PCA + Volcanoplot RA" src="https://github.com/user-attachments/assets/2ce96263-4e10-4a58-8b1d-ea05e38f04d9" />
<i>Figuur 2. Transcriptomische verschillen tussen patiënten met Reumatoïde Artritis (RA) en gezonde controles. (A) Principal Component Analysis (PCA) van RNA-seq expressiegegevens. Elke stip vertegenwoordigt één sample; rode stippen geven gezonde controles weer en blauwe stippen RA-patiënten. De eerste principale component (PC1) verklaart 74% van de totale variantie en laat een duidelijke scheiding zien tussen RA-patiënten en gezonde controles. (B) Volcano plot van de differentiële expressieanalyse. Elke stip vertegenwoordigt één gen. De x-as toont de log₂ fold change en de y-as de statistische significantie (-log₁₀ p-waarde). Rode stippen geven genen weer die zowel significant verschillend geëxpresseerd zijn als een relevante fold change vertonen. Groene stippen voldoen alleen aan de fold-change drempel, blauwe stippen alleen aan de significantiedrempel en grijze stippen zijn niet significant. Genen rechts van de nulwaarde zijn hoger tot expressie gebracht in RA, terwijl genen links van de nulwaarde relatief hoger tot expressie komen in gezonde controles.</i>

### Verrijkte immuunprocessen in Reumatoïde Artritis
Gene Ontology (GO)-analyse van deze up-gereguleerde genen toonde een sterke verrijking van processen die betrokken zijn bij het adaptieve immuunsysteem. Met name lymphocyte differentiation (GeneRatio ≈ 0,040; padj < 1×10⁻⁴), adaptive immune response en lymphocyte mediated immunity waren sterk verrijkt. Daarnaast werd een significante verrijking gevonden voor B cell activation (GeneRatio ≈ 0,027; padj ≈ 1–2×10⁻⁴). Deze resultaten wijzen op een verhoogde activatie en regulatie van immuuncellen bij RA.

<img width="857" height="852" alt="Dotplot RA" src="https://github.com/user-attachments/assets/5bf9f878-4005-42f3-a56f-93841cfcabb9" />

<i>Figuur 3. Gene Ontology (GO) verrijkingsanalyse van genen die verhoogd tot expressie komen in patiënten met Reumatoïde Artritis (RA). Elke stip vertegenwoordigt een verrijkt biologisch proces. De grootte van de stip geeft het aantal genen binnen een GO-term weer, terwijl de kleur de gecorrigeerde p-waarde (padj) weergeeft. De x-as toont de GeneRatio, oftewel het aandeel genen uit de dataset dat betrokken is bij het betreffende proces.</i>

### Up-gereguleerde DEGs in Reumatoïde Artritis veroorzaken sterke verrijking van specifieke ontstekingspathways
De KEGG-analyse bevestigde dit patroon en identificeerde meerdere ontstekingsgerelateerde pathways. De sterkst verrijkte pathway was de NOD-like receptor signaling pathway (GeneRatio ≈ 0,035; padj ≈ 0,003), gevolgd door Th17 cell differentiation, Toll-like receptor signaling en IL-17 signaling.

<img width="857" height="854" alt="image" src="https://github.com/user-attachments/assets/8d6263a1-2b00-493d-be1c-ec901ba842e3" />

<i>Figuur 4. Dotplot van de top 5 significant verrijkte KEGG-pathways ($p.adjust < 0.05$) op basis van uitsluitend de up-gereguleerde differentieel tot expressie gebrachte genen (DEGs) in Reumatische Artritis (RA). De x-as geeft de Gene Ratio weer (het aandeel DEGs binnen de pathway). De grootte van de stip representeert het absolute aantal genen (Gene count) en de kleur geeft de statistische significantie weer ($p.adjust$, berekend via de Viridis-kleurenschaal waarbij rood de hoogste significantie weerspiegelt).</i>

### Visualisatie van expressieveranderingen in de Reumatische Artritis-pathway
Visualisatie van de KEGG Rheumatoid Arthritis pathway (hsa05323) liet zien dat verschillende genen betrokken bij immuuncelactivatie, cytokinesignalering en gewrichtsschade verhoogd tot expressie kwamen in RA. Verhoogde expressie werd onder andere waargenomen voor CD80/86, CD28, APRIL, BLyS, TLR2/4, CXCL5, IL1B, VEGF, MMP1/3 en CTSL. Deze genen zijn betrokken bij ontstekingsprocessen en weefselafbraak die kenmerkend zijn voor Reumatoïde Artritis.

<img width="1492" height="859" alt="hsa05323 pathview" src="https://github.com/user-attachments/assets/53091f8f-b343-4de2-b202-b75300cb99f2" />

<i>Figuur 5. Pathview-visualisatie van de KEGG Reumatische Artritis-pathway (hsa05323). De figuur toont de expressieveranderingen ($\log_2\text{FC}$) van genen binnen de cellulaire micro-omgeving van het synovium. Genen met een verhoogde expressie (up-gereguleerd) in RA-patiënten ten opzichte van gezonde controles zijn rood gekleurd, terwijl genen met een verlaagde expressie (down-gereguleerd) groen zijn gekleurd; onveranderde of niet-gemeten genen blijven wit.</i>


##  💡 Conclusie
Deze RNA-seq analyse laat zien dat patiënten met Reumatoïde Artritis (RA) een duidelijk afwijkend genexpressieprofiel hebben ten opzichte van gezonde controles. De PCA-analyse toonde een sterke scheiding tussen beide groepen, wat erop wijst dat RA gepaard gaat met grootschalige veranderingen in genexpressie. De differentiële expressieanalyse identificeerde vervolgens een groot aantal genen die verhoogd tot expressie kwamen in RA.

De GO-analyse liet zien dat deze verhoogd geëxpresseerde genen voornamelijk betrokken zijn bij processen van het adaptieve immuunsysteem. Vooral lymfocytdifferentiatie, B-celactivatie en immuunresponsen waren sterk verrijkt. Dit suggereert dat een verhoogde activiteit van immuuncellen een belangrijke bijdrage levert aan het ontstaan en de instandhouding van de ziekte.

De KEGG-analyse bevestigde deze bevindingen door een sterke verrijking van ontstekingsgerelateerde pathways aan te tonen, waaronder de NOD-like receptor-, Toll-like receptor- en IL-17-signaleringsroutes. Deze pathways worden aangestuurd door genen die verhoogd tot expressie komen in RA en spelen een belangrijke rol bij het initiëren en onderhouden van ontstekingsreacties.

De visualisatie van de Rheumatoid Arthritis pathway (hsa05323) bracht deze resultaten samen en liet zien dat genen betrokken bij immuunactivatie, cytokinesignalering en weefselafbraak verhoogd actief zijn in RA-patiënten. Hierdoor ontstaat een omgeving waarin ontstekingssignalen voortdurend worden versterkt, wat uiteindelijk kan bijdragen aan gewrichtsschade.

De resultaten ondersteunen het huidige inzicht dat een ontregelde immuunrespons een centrale rol speelt in de pathogenese van Reumatoïde Artritis. Verhoogde expressie van genen betrokken bij immuunactivatie en ontstekingssignalering leidt tot activatie van pathways die bijdragen aan chronische ontsteking en uiteindelijk gewrichtsschade. 

##  📚 Bronnenlijst
Bioinformatics Core Shared Training. (2020). Gene set testing. CRUK Summer School 2020. [https://bioinformatics-core-shared-training.github.io/.../06_Gene_set_testing.html](https://bioinformatics-core-shared-training.github.io/cruk-summer-school-2020/RNAseq/extended_html/06_Gene_set_testing.html)

<br>

Bioinformatics Core at The University of Texas at Austin. (2014, 18 augustus). GO enrichment using goseq. UT Austin Wiki. [https://cloud.wikis.utexas.edu/wiki/spaces/bioiteam/...](https://cloud.wikis.utexas.edu/wiki/spaces/bioiteam/pages/47732482/GO+Enrichment+using+goseq)

<br>

Kanehisa, M., Furumichi, M., Sato, Y., Ishiguro-Watanabe, M., & Tanabe, M. (2023). KEGG: integrating viruses and cellular organisms. *Nucleic Acids Research*, *51*(D1), D587–D592. [https://doi.org/10.1093/nar/gkac963](https://doi.org/10.1093/nar/gkac963)

<br>

Kanehisa Laboratories. (2024, 15 augustus). Rheumatoid arthritis - Homo sapiens (human) (KEGG Pathway hsa05323). Kyoto Encyclopedia of Genes and Genomes. [https://www.kegg.jp/pathway/hsa05323](https://www.kegg.jp/pathway/hsa05323)

<br>

Liao, Y., Smyth, G. K., & Shi, W. (2019). The R package Rsubread is easier, faster, cheaper and better for alignment and quantification of RNA sequencing reads. *Nucleic Acids Research*, *47*(8), e47. [https://doi.org/10.1093/nar/gkz114](https://doi.org/10.1093/nar/gkz114)

<br>

Love, M. I., Huber, W., & Anders, S. (2014). Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2. *Genome Biology*, *15*(12), 550. [https://doi.org/10.1186/s13059-014-0550-8](https://doi.org/10.1186/s13059-014-0550-8)

<br>

Luo, W., & Brouwer, C. (2013). Pathview: an R/Bioconductor package for pathway-based data integration and visualization. *Bioinformatics*, *29*(14), 1830–1831. [https://doi.org/10.1093/bioinformatics/btt285](https://doi.org/10.1093/bioinformatics/btt285)

<br>

NCBI. (2026). Homo sapiens genome assembly GRCh38.p14 (GCF_000001405.40). National Center for Biotechnology Information. [https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.40/](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.40/)

<br>

OpenAI. (2026). ChatGPT (Versie GPT-4o) [Groot taalmodel]. [https://chatgpt.com](https://chatgpt.com)

<br>

Platzer, A., Nussbaumer, T., Karonitsch, T., Smolen, J. S., & Aletaha, D. (2019). Analysis of gene expression in rheumatoid arthritis and related conditions offers insights into sex-bias, gene biotypes and co-expression patterns. *PLoS ONE*, *14*(7), Article e0219698. [https://doi.org/10.1371/journal.pone.0219698](https://doi.org/10.1371/journal.pone.0219698)

<br>

Puxeddu, I., Alunno, A., & Liguori, M. (2024). Pathogenesis of rheumatoid arthritis: One year in review 2024. *Clinical and Experimental Rheumatology*, *42*(9), 1707–1713. [https://doi.org/10.55563/clinexprheumatol/0307ed](https://doi.org/10.55563/clinexprheumatol/0307ed)

<br>

Smith, M. H., Emery, P., & Jones, A. K. (2024). Rheumatoid arthritis: A review of the key clinical features and ongoing challenges of the disease. *Panminerva Medica*, *66*(4), 427–442. [https://doi.org/10.23736/S0031-0808.24.05272-8](https://doi.org/10.23736/S0031-0808.24.05272-8)

<br>

Viatte, S. (2024). Genetics of rheumatoid arthritis. *Best Practice & Research Clinical Rheumatology*, *38*(4), 101968. [https://doi.org/10.1016/j.berh.2024.101968](https://doi.org/10.1016/j.berh.2024.101968)
##  🤖 AI disclaimer
Voor dit project is gebruikgemaakt van ChatGPT (OpenAI) als ondersteunend hulpmiddel. AI is ingezet voor het genereren van de illustratieve bannerafbeelding bovenaan de GitHub-pagina en voor het verbeteren van de wetenschappelijke formulering van teksten en figuurbijschriften. De bio-informatische analyses, interpretatie van de resultaten, selectie van methoden en biologische conclusies zijn zelfstandig uitgevoerd door de auteur.

