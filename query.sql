SELECT
    dados.id_municipio AS id_municipio,
    diretorio_id_municipio.nome AS id_municipio_nome,
    dados.sigla_uf AS sigla_uf,
    dados.taxa_alfabetizacao AS taxa_alfabetizacao,
    dados.indice_envelhecimento AS indice_envelhecimento,
    dados.idade_mediana AS idade_mediana,
    dados.populacao_indigena AS populacao_indigena,
    dados.populacao_indigena_terra_indigena AS populacao_indigena_terra_indigena,
    dados.populacao_quilombola AS populacao_quilombola,
    dados.populacao_quilombola_territorio_quilombola AS populacao_quilombola_territorio_quilombola
FROM `basedosdados.br_ibge_censo_2022.municipio` AS dados
LEFT JOIN (
    SELECT DISTINCT id_municipio, nome  
    FROM `basedosdados.br_bd_diretorios_brasil.municipio`
) AS diretorio_id_municipio
    ON dados.id_municipio = diretorio_id_municipio.id_municipio
WHERE dados.sigla_uf = 'PB'