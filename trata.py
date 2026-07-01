from pathlib import Path
import geopandas as gpd

BASE = Path(__file__).resolve().parent

shp = BASE / "Data" / "Raw" / "municipios-da-paraiba" / "Municípios da Paraíba" / "PARAIBA_MUNICIPIOS.shp"

gdf = gpd.read_file(shp)

print("CRS original:", gdf.crs)

# Converte para WGS84
gdf = gdf.to_crs(epsg=4326)

print("Novo CRS:", gdf.crs)

# Salva um novo shapefile
saida = BASE / "Data" / "outputs" / "PARAIBA_MUNICIPIOS_WGS84.shp"
gdf.to_file(saida)