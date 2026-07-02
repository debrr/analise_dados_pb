# ==========================================================
# Sistema Nacional de Informações sobre Saneamento - SNIS
# fonte: https://basedosdados.org/dataset/2a543ad8-3cdb-4047-9498-efe7fb8ed697?table=df7cf198-4889-4baf-bb77-4e0e28eb90ca
# ==========================================================

SELECT
    dados.ano as ano,
    diretorio_id_municipio.nome AS id_municipio_nome,
    dados.sigla_uf AS sigla_uf,
    diretorio_sigla_uf.nome AS sigla_uf_nome,
    dados.populacao_atendida_agua as populacao_atendida_agua,
    dados.populacao_atentida_esgoto as populacao_atentida_esgoto,
    dados.populacao_urbana as populacao_urbana,
    dados.populacao_urbana_residente_agua as populacao_urbana_residente_agua,
    dados.populacao_urbana_atendida_agua as populacao_urbana_atendida_agua
FROM `basedosdados.br_mdr_snis.municipio_agua_esgoto` AS dados
LEFT JOIN (SELECT DISTINCT id_municipio,nome  FROM `basedosdados.br_bd_diretorios_brasil.municipio`) AS diretorio_id_municipio
    ON dados.id_municipio = diretorio_id_municipio.id_municipio
LEFT JOIN (SELECT DISTINCT sigla,nome  FROM `basedosdados.br_bd_diretorios_brasil.uf`) AS diretorio_sigla_uf
    ON dados.sigla_uf = diretorio_sigla_uf.sigla
    WHERE dados.sigla_uf = 'PB'



# ==========================================================
# População Brasileira - IBGE
# fonte: https://basedosdados.org/dataset/d30222ad-7a5c-4778-a1ec-f0785371d1ca?table=0c279444-165b-41da-92cd-50fd7e66baa1
# ==========================================================

SELECT
    dados.ano as ano,
    dados.sigla_uf AS sigla_uf,
    diretorio_id_municipio.nome AS id_municipio_nome,
    dados.populacao as populacao
FROM `basedosdados.br_ibge_populacao.municipio` AS dados
LEFT JOIN (SELECT DISTINCT sigla,nome  FROM `basedosdados.br_bd_diretorios_brasil.uf`) AS diretorio_sigla_uf
    ON dados.sigla_uf = diretorio_sigla_uf.sigla
LEFT JOIN (SELECT DISTINCT id_municipio,nome  FROM `basedosdados.br_bd_diretorios_brasil.municipio`) AS diretorio_id_municipio
    ON dados.id_municipio = diretorio_id_municipio.id_municipio
    WHERE dados.sigla_uf = 'PB'