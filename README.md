# Controle de Qualidade de Genomas Bacterianos
## Curso de Inverno de Bioinformática - 2026

Neste exercício vamos comparar genomas completos e MAGs usando duas ferramentas amplamente utilizadas:

* QUAST → estatísticas de montagem
* BUSCO → completude genômica

```text
.
├── README.md
├── fastas/
│   ├── 1_genome.fasta
│   ├── 1_mag.fasta
│   └── ...
└── run_busco.sh
```

---

## Instalação do ambiente conda

OBS: os ambientes já estão instalados em todos os usuários do minicurso. Para alunos externos, a etapa de instalar os ambientes deve ser realizada:

```bash
conda create -n busco_env -c conda-forge -c bioconda busco
```

```bash
conda create -n quast_env -c conda-forge -c bioconda quast=5.0.2
```

---

## Executando o QUAST

```bash
conda activate quast_env
```

```bash
quast fastas/*.fasta \
    -t 32 \
    -o results/quast_out
```

### Visualizando os resultados

Abra:

```text
results/quast_out/icarus.html
```

Observe:

* número de contigs
* tamanho total da montagem
* N50
* fragmentação

Compare os MAGs com os genomas completos.

Perguntas:

1. Qual montagem apresenta maior fragmentação?
2. Qual possui maior N50?
3. O tamanho total dos genomas é semelhante?

---

## Executando o BUSCO

```bash
conda activate busco_env
```

```bash
bash run_busco.sh
```

```text
Prática: mover os arquivos gerados pelo busco pra pasta results/
```

---

### Visualizando os resultados

```bash
busco --plot busco_json/
```

Abra:

```text
results/busco_json/busco_figure.png
```

Observe:

* Complete BUSCOs (C)
* Single-copy BUSCOs (S)
* Duplicated BUSCOs (D)
* Fragmented BUSCOs (F)
* Missing BUSCOs (M)

Perguntas:

1. Os MAGs apresentam menor completude?
2. Existem genes essenciais ausentes?
3. Os genomas completos possuem BUSCOs faltantes?

---

## Discussão

QUAST mede características estruturais da montagem:

* tamanho
* fragmentação
* continuidade

BUSCO mede características biológicas:

* presença de genes conservados esperados para aquele grupo taxonômico

Uma montagem pode apresentar N50 elevado e ainda assim possuir baixa completude biológica. Por isso ambas as ferramentas são frequentemente utilizadas em conjunto.
