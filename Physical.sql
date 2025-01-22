/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Databricks.DM1
 *
 * Date Created : Wednesday, January 22, 2025 15:55:17
 * Target DBMS : Databricks
 */

/* 
 * TABLE: customer 
 */

CREATE TABLE customer
(
    c_custkey       bigint,
    c_name          string,
    c_address       string,
    c_nationkey     bigint,
    c_phone         string,
    c_acctbal       decimal(18, 2),
    c_mktsegment    string,
    c_comment       string
)
;

/* 
 * TABLE: forecast_daily_calendar_imperial 
 */

CREATE TABLE forecast_daily_calendar_imperial
(
    city_name                              string,
    country_code                           string,
    latitude                               double,
    longitude                              double,
    date                                   date,
    cloud_cover_perc_avg                   int,
    cloud_cover_perc_max                   int,
    cloud_cover_perc_min                   int,
    degree_days_cooling                    double,
    degree_days_freezing                   double,
    degree_days_growing                    double,
    degree_days_heating                    double,
    humidity_relative_avg                  double,
    humidity_relative_max                  double,
    humidity_relative_min                  double,
    index_air_quality_24hr_max             double,
    index_uv_avg                           double,
    index_uv_max                           double,
    index_uv_min                           double,
    minutes_of_ice_total                   int,
    minutes_of_precipitation_total         int,
    minutes_of_sun_total                   int,
    minutes_of_rain_total                  int,
    minutes_of_snow_total                  int,
    has_ice                                boolean,
    ice_lwe_rate_avg                       double,
    ice_lwe_rate_max                       double,
    ice_lwe_rate_min                       double,
    ice_lwe_total                          double,
    ice_probability                        int,
    has_precipitation                      boolean,
    precipitation_lwe_rate_avg             double,
    precipitation_lwe_rate_max             double,
    precipitation_lwe_rate_min             double,
    precipitation_lwe_total                double,
    precipitation_probability              int,
    precipitation_type_desc_predominant    string,
    has_rain                               boolean,
    rain_lwe_rate_avg                      double,
    rain_lwe_rate_max                      double,
    rain_lwe_rate_min                      double,
    rain_lwe_total                         double,
    rain_probability                       int,
    snow_liquid_ratio_accuweather_avg      double,
    snow_liquid_ratio_accuweather_max      double,
    snow_liquid_ratio_accuweather_min      double,
    has_snow                               boolean,
    snow_avg                               double,
    snow_max                               double,
    snow_min                               double,
    snow_total                             double,
    snow_lwe_rate_avg                      double,
    snow_lwe_rate_max                      double,
    snow_lwe_rate_min                      double,
    snow_lwe_total                         double,
    snow_probability                       int,
    solar_irradiance_avg                   double,
    solar_irradiance_max                   double,
    solar_irradiance_total                 double,
    temperature_avg                        double,
    temperature_max                        double,
    temperature_min                        double,
    temperature_dew_point_avg              double,
    temperature_dew_point_max              double,
    temperature_dew_point_min              double,
    temperature_heat_index_avg             double,
    temperature_heat_index_max             double,
    temperature_heat_index_min             double,
    temperature_realfeel_avg               double,
    temperature_realfeel_max               double,
    temperature_realfeel_min               double,
    temperature_realfeel_shade_avg         double,
    temperature_realfeel_shade_max         double,
    temperature_realfeel_shade_min         double,
    temperature_wind_chill_avg             double,
    temperature_wind_chill_max             double,
    temperature_wind_chill_min             double,
    visibility_avg                         double,
    visibility_max                         double,
    visibility_min                         double,
    wind_direction_avg                     double,
    wind_gust_avg                          double,
    wind_gust_max                          double,
    wind_gust_min                          double,
    wind_gust_direction_avg                double,
    wind_speed_avg                         double,
    wind_speed_max                         double,
    wind_speed_min                         double
)
;

/* 
 * TABLE: forecast_daily_calendar_metric 
 */

CREATE TABLE forecast_daily_calendar_metric
(
    city_name                              string,
    country_code                           string,
    latitude                               double,
    longitude                              double,
    date                                   date,
    cloud_cover_perc_avg                   int,
    cloud_cover_perc_max                   int,
    cloud_cover_perc_min                   int,
    degree_days_cooling                    double,
    degree_days_freezing                   double,
    degree_days_growing                    double,
    degree_days_heating                    double,
    humidity_relative_avg                  double,
    humidity_relative_max                  double,
    humidity_relative_min                  double,
    index_air_quality_24hr_max             double,
    index_uv_avg                           double,
    index_uv_max                           double,
    index_uv_min                           double,
    minutes_of_ice_total                   int,
    minutes_of_precipitation_total         int,
    minutes_of_sun_total                   int,
    minutes_of_rain_total                  int,
    minutes_of_snow_total                  int,
    has_ice                                boolean,
    ice_lwe_rate_avg                       double,
    ice_lwe_rate_max                       double,
    ice_lwe_rate_min                       double,
    ice_lwe_total                          double,
    ice_probability                        int,
    has_precipitation                      boolean,
    precipitation_lwe_rate_avg             double,
    precipitation_lwe_rate_max             double,
    precipitation_lwe_rate_min             double,
    precipitation_lwe_total                double,
    precipitation_probability              int,
    precipitation_type_desc_predominant    string,
    has_rain                               boolean,
    rain_lwe_rate_avg                      double,
    rain_lwe_rate_max                      double,
    rain_lwe_rate_min                      double,
    rain_lwe_total                         double,
    rain_probability                       int,
    snow_liquid_ratio_accuweather_avg      double,
    snow_liquid_ratio_accuweather_max      double,
    snow_liquid_ratio_accuweather_min      double,
    has_snow                               boolean,
    snow_avg                               double,
    snow_max                               double,
    snow_min                               double,
    snow_total                             double,
    snow_lwe_rate_avg                      double,
    snow_lwe_rate_max                      double,
    snow_lwe_rate_min                      double,
    snow_lwe_total                         double,
    snow_probability                       int,
    solar_irradiance_avg                   double,
    solar_irradiance_max                   double,
    solar_irradiance_total                 double,
    temperature_avg                        double,
    temperature_max                        double,
    temperature_min                        double,
    temperature_dew_point_avg              double,
    temperature_dew_point_max              double,
    temperature_dew_point_min              double,
    temperature_heat_index_avg             double,
    temperature_heat_index_max             double,
    temperature_heat_index_min             double,
    temperature_realfeel_avg               double,
    temperature_realfeel_max               double,
    temperature_realfeel_min               double,
    temperature_realfeel_shade_avg         double,
    temperature_realfeel_shade_max         double,
    temperature_realfeel_shade_min         double,
    temperature_wind_chill_avg             double,
    temperature_wind_chill_max             double,
    temperature_wind_chill_min             double,
    visibility_avg                         string,
    visibility_max                         string,
    visibility_min                         double,
    wind_direction_avg                     double,
    wind_gust_avg                          double,
    wind_gust_max                          double,
    wind_gust_min                          double,
    wind_gust_direction_avg                double,
    wind_speed_avg                         double,
    wind_speed_max                         double,
    wind_speed_min                         double
)
;

/* 
 * TABLE: forecast_daynight_imperial 
 */

CREATE TABLE forecast_daynight_imperial
(
    city_name                              string,
    country_code                           string,
    latitude                               double,
    longitude                              double,
    date                                   date,
    day_flag                               string,
    cloud_cover_perc_avg                   double,
    degree_days_cooling                    double,
    degree_days_freezing                   double,
    degree_days_growing                    double,
    degree_days_heating                    double,
    humidity_relative_avg                  double,
    humidity_relative_max                  double,
    humidity_relative_min                  double,
    index_air_quality_24hr_max             double,
    index_uv_avg                           double,
    minutes_of_ice_total                   int,
    minutes_of_precipitation_total         int,
    minutes_of_sun_total                   int,
    minutes_of_rain_total                  int,
    minutes_of_snow_total                  int,
    has_ice                                boolean,
    ice_lwe_total                          double,
    ice_probability                        int,
    phrase_long                            string,
    phrase_short                           string,
    has_precipitation                      boolean,
    precipitation_lwe_total                double,
    precipitation_probability              int,
    precipitation_type_desc_predominant    string,
    has_rain                               boolean,
    rain_lwe_total                         double,
    rain_probability                       int,
    snow_liquid_ratio_accuweather_avg      double,
    has_snow                               boolean,
    snow_total                             double,
    snow_lwe_total                         double,
    snow_probability                       int,
    solar_irradiance_total                 double,
    temperature_avg                        double,
    temperature_max                        double,
    temperature_min                        double,
    temperature_dew_point_avg              double,
    temperature_dew_point_max              double,
    temperature_dew_point_min              double,
    temperature_heat_index_avg             double,
    temperature_heat_index_max             double,
    temperature_heat_index_min             double,
    temperature_realfeel_avg               double,
    temperature_realfeel_max               double,
    temperature_realfeel_min               double,
    temperature_realfeel_shade_avg         double,
    temperature_realfeel_shade_max         double,
    temperature_realfeel_shade_min         double,
    temperature_wind_chill_avg             double,
    temperature_wind_chill_max             double,
    temperature_wind_chill_min             double,
    weather_icon                           int,
    wind_direction_avg                     double,
    wind_direction_predominant             double,
    wind_gust_avg                          double,
    wind_gust_max                          double,
    wind_gust_min                          double,
    wind_gust_direction_avg                double,
    wind_speed_avg                         double,
    wind_speed_max                         double,
    wind_speed_min                         double
)
;

/* 
 * TABLE: forecast_daynight_metric 
 */

CREATE TABLE forecast_daynight_metric
(
    city_name                              string,
    country_code                           string,
    latitude                               double,
    longitude                              double,
    date                                   date,
    day_flag                               string,
    cloud_cover_perc_avg                   double,
    degree_days_cooling                    double,
    degree_days_freezing                   double,
    degree_days_growing                    double,
    degree_days_heating                    double,
    humidity_relative_avg                  double,
    humidity_relative_max                  double,
    humidity_relative_min                  double,
    index_air_quality_24hr_max             double,
    index_uv_avg                           double,
    minutes_of_ice_total                   bigint,
    minutes_of_precipitation_total         bigint,
    minutes_of_sun_total                   bigint,
    minutes_of_rain_total                  bigint,
    minutes_of_snow_total                  bigint,
    has_ice                                boolean,
    ice_lwe_total                          double,
    ice_probability                        bigint,
    phrase_long                            string,
    phrase_short                           string,
    has_precipitation                      boolean,
    precipitation_lwe_total                double,
    precipitation_probability              bigint,
    precipitation_type_desc_predominant    string,
    has_rain                               boolean,
    rain_lwe_total                         double,
    rain_probability                       bigint,
    snow_liquid_ratio_accuweather_avg      double,
    has_snow                               boolean,
    snow_total                             double,
    snow_lwe_total                         double,
    snow_probability                       bigint,
    solar_irradiance_total                 double,
    temperature_avg                        double,
    temperature_max                        double,
    temperature_min                        double,
    temperature_dew_point_avg              double,
    temperature_dew_point_max              double,
    temperature_dew_point_min              double,
    temperature_heat_index_avg             double,
    temperature_heat_index_max             double,
    temperature_heat_index_min             double,
    temperature_realfeel_avg               double,
    temperature_realfeel_max               double,
    temperature_realfeel_min               double,
    temperature_realfeel_shade_avg         double,
    temperature_realfeel_shade_max         double,
    temperature_realfeel_shade_min         double,
    temperature_wind_chill_avg             double,
    temperature_wind_chill_max             double,
    temperature_wind_chill_min             double,
    weather_icon                           bigint,
    wind_direction_avg                     double,
    wind_direction_predominant             double,
    wind_gust_avg                          double,
    wind_gust_max                          double,
    wind_gust_min                          double,
    wind_gust_direction_avg                double,
    wind_speed_avg                         double,
    wind_speed_max                         double,
    wind_speed_min                         double
)
;

/* 
 * TABLE: forecast_hourly_imperial 
 */

CREATE TABLE forecast_hourly_imperial
(
    city_name                        string,
    country_code                     string,
    latitude                         double,
    longitude                        double,
    datetime_valid_local             timestamp,
    gmt_offset                       double,
    cloud_base_height                int,
    cloud_cover_perc_total           double,
    humidity_relative                double,
    index_uv                         double,
    has_ice                          boolean,
    ice_lwe                          double,
    ice_probability                  int,
    minutes_of_sun                   int,
    has_precipitation                boolean,
    precipitation_lwe                double,
    precipitation_probability        int,
    precipitation_type_desc          string,
    has_rain                         boolean,
    rain_lwe                         double,
    rain_probability                 int,
    snow_liquid_ratio_accuweather    double,
    has_snow                         boolean,
    snow                             double,
    snow_lwe                         double,
    snow_probability                 int,
    solar_irradiance                 double,
    temperature                      double,
    temperature_dew_point            double,
    temperature_heat_index           double,
    temperature_realfeel             double,
    temperature_realfeel_shade       double,
    temperature_wind_chill           double,
    thunderstorm_probability         int,
    visibility                       double,
    weather_code                     int,
    wind_direction                   double,
    wind_gust                        double,
    wind_speed                       double
)
;

/* 
 * TABLE: forecast_hourly_metric 
 */

CREATE TABLE forecast_hourly_metric
(
    city_name                        string,
    country_code                     string,
    latitude                         double,
    longitude                        double,
    datetime_valid_local             timestamp,
    gmt_offset                       double,
    cloud_base_height                int,
    cloud_cover_perc_total           double,
    humidity_relative                double,
    index_uv                         double,
    has_ice                          boolean,
    ice_lwe                          double,
    ice_probability                  int,
    minutes_of_sun                   int,
    has_precipitation                boolean,
    precipitation_lwe                double,
    precipitation_probability        int,
    precipitation_type_desc          string,
    has_rain                         boolean,
    rain_lwe                         double,
    rain_probability                 int,
    snow_liquid_ratio_accuweather    double,
    has_snow                         boolean,
    snow                             double,
    snow_lwe                         double,
    snow_probability                 int,
    solar_irradiance                 double,
    temperature                      double,
    temperature_dew_point            double,
    temperature_heat_index           double,
    temperature_realfeel             double,
    temperature_realfeel_shade       double,
    temperature_wind_chill           double,
    thunderstorm_probability         int,
    visibility                       double,
    weather_code                     int,
    wind_direction                   double,
    wind_gust                        double,
    wind_speed                       double
)
;

/* 
 * TABLE: historical_daily_calendar_imperial 
 */

CREATE TABLE historical_daily_calendar_imperial
(
    city_name                              string,
    country_code                           string,
    latitude                               double,
    longitude                              double,
    date                                   date,
    cloud_base_height_avg                  bigint,
    cloud_base_height_max                  bigint,
    cloud_base_height_min                  bigint,
    cloud_cover_avg                        double,
    cloud_cover_max                        double,
    cloud_cover_min                        double,
    cloud_cover_perc_avg                   bigint,
    cloud_cover_perc_max                   bigint,
    cloud_cover_perc_min                   bigint,
    degree_days_cooling                    double,
    degree_days_freezing                   double,
    degree_days_growing                    double,
    degree_days_heating                    double,
    humidity_relative_avg                  double,
    humidity_relative_max                  double,
    humidity_relative_min                  double,
    index_uv_avg                           double,
    index_uv_max                           double,
    index_uv_min                           double,
    minutes_of_ice_total                   string,
    minutes_of_precipitation_total         bigint,
    minutes_of_sun_total                   bigint,
    minutes_of_rain_total                  string,
    minutes_of_snow_total                  bigint,
    has_ice                                string,
    ice_lwe_rate_avg                       string,
    ice_lwe_rate_max                       string,
    ice_lwe_rate_min                       string,
    ice_lwe_total                          string,
    has_precipitation                      boolean,
    precipitation_lwe_rate_avg             double,
    precipitation_lwe_rate_max             double,
    precipitation_lwe_rate_min             double,
    precipitation_lwe_total                double,
    precipitation_type_desc_predominant    string,
    precipitation_type_predominant         bigint,
    pressure_avg                           double,
    pressure_max                           double,
    pressure_min                           double,
    pressure_msl_avg                       double,
    pressure_msl_max                       double,
    pressure_msl_min                       double,
    has_rain                               string,
    rain_lwe_rate_avg                      string,
    rain_lwe_rate_max                      string,
    rain_lwe_rate_min                      string,
    rain_lwe_total                         string,
    snow_cover_avg                         string,
    snow_cover_max                         string,
    snow_cover_min                         string,
    snow_depth_avg                         string,
    snow_depth_max                         string,
    snow_depth_min                         string,
    snow_liquid_ratio_accuweather_avg      double,
    snow_liquid_ratio_accuweather_max      double,
    snow_liquid_ratio_accuweather_min      double,
    has_snow                               boolean,
    snow_avg                               string,
    snow_max                               string,
    snow_min                               string,
    snow_total                             string,
    snow_lwe_rate_avg                      double,
    snow_lwe_rate_max                      double,
    snow_lwe_rate_min                      double,
    snow_lwe_total                         double,
    solar_irradiance_avg                   double,
    solar_irradiance_max                   double,
    solar_irradiance_total                 double,
    solar_radiation_net_avg                double,
    solar_radiation_net_max                double,
    solar_radiation_net_total              double,
    temperature_avg                        double,
    temperature_max                        double,
    temperature_min                        double,
    temperature_dew_point_avg              double,
    temperature_dew_point_max              double,
    temperature_dew_point_min              double,
    temperature_heat_index_avg             double,
    temperature_heat_index_max             double,
    temperature_heat_index_min             double,
    temperature_realfeel_avg               double,
    temperature_realfeel_max               double,
    temperature_realfeel_min               double,
    temperature_realfeel_shade_avg         double,
    temperature_realfeel_shade_max         double,
    temperature_realfeel_shade_min         double,
    temperature_wind_chill_avg             double,
    temperature_wind_chill_max             double,
    temperature_wind_chill_min             double,
    visibility_avg                         double,
    visibility_max                         double,
    visibility_min                         double,
    wind_direction_avg                     double,
    wind_direction_predominant             double,
    wind_gust_avg                          double,
    wind_gust_max                          double,
    wind_gust_min                          double,
    wind_gust_instantaneous_avg            string,
    wind_gust_instantaneous_max            string,
    wind_gust_instantaneous_min            string,
    wind_speed_avg                         double,
    wind_speed_max                         double,
    wind_speed_min                         double
)
;

/* 
 * TABLE: historical_daily_calendar_metric 
 */

CREATE TABLE historical_daily_calendar_metric
(
    city_name                              string,
    country_code                           string,
    latitude                               double,
    longitude                              double,
    date                                   date,
    cloud_base_height_avg                  int,
    cloud_base_height_max                  int,
    cloud_base_height_min                  int,
    cloud_cover_avg                        double,
    cloud_cover_max                        double,
    cloud_cover_min                        double,
    cloud_cover_perc_avg                   int,
    cloud_cover_perc_max                   int,
    cloud_cover_perc_min                   int,
    degree_days_cooling                    double,
    degree_days_freezing                   double,
    degree_days_growing                    double,
    degree_days_heating                    double,
    humidity_relative_avg                  double,
    humidity_relative_max                  double,
    humidity_relative_min                  double,
    index_uv_avg                           double,
    index_uv_max                           double,
    index_uv_min                           double,
    minutes_of_ice_total                   string,
    minutes_of_precipitation_total         int,
    minutes_of_sun_total                   int,
    minutes_of_rain_total                  string,
    minutes_of_snow_total                  int,
    has_ice                                string,
    ice_lwe_rate_avg                       string,
    ice_lwe_rate_max                       string,
    ice_lwe_rate_min                       string,
    ice_lwe_total                          string,
    has_precipitation                      boolean,
    precipitation_lwe_rate_avg             double,
    precipitation_lwe_rate_max             double,
    precipitation_lwe_rate_min             double,
    precipitation_lwe_total                double,
    precipitation_type_desc_predominant    string,
    precipitation_type_predominant         int,
    pressure_avg                           double,
    pressure_max                           double,
    pressure_min                           double,
    pressure_msl_avg                       double,
    pressure_msl_max                       double,
    pressure_msl_min                       double,
    has_rain                               string,
    rain_lwe_rate_avg                      string,
    rain_lwe_rate_max                      string,
    rain_lwe_rate_min                      string,
    rain_lwe_total                         string,
    snow_cover_avg                         string,
    snow_cover_max                         string,
    snow_cover_min                         string,
    snow_depth_avg                         string,
    snow_depth_max                         string,
    snow_depth_min                         string,
    snow_liquid_ratio_accuweather_avg      double,
    snow_liquid_ratio_accuweather_max      double,
    snow_liquid_ratio_accuweather_min      double,
    has_snow                               boolean,
    snow_avg                               string,
    snow_max                               string,
    snow_min                               string,
    snow_total                             string,
    snow_lwe_rate_avg                      double,
    snow_lwe_rate_max                      double,
    snow_lwe_rate_min                      double,
    snow_lwe_total                         double,
    solar_irradiance_avg                   double,
    solar_irradiance_max                   double,
    solar_irradiance_total                 double,
    solar_radiation_net_avg                double,
    solar_radiation_net_max                double,
    solar_radiation_net_total              double,
    temperature_avg                        double,
    temperature_max                        double,
    temperature_min                        double,
    temperature_dew_point_avg              double,
    temperature_dew_point_max              double,
    temperature_dew_point_min              double,
    temperature_heat_index_avg             double,
    temperature_heat_index_max             double,
    temperature_heat_index_min             double,
    temperature_realfeel_avg               double,
    temperature_realfeel_max               double,
    temperature_realfeel_min               double,
    temperature_realfeel_shade_avg         double,
    temperature_realfeel_shade_max         double,
    temperature_realfeel_shade_min         double,
    temperature_wind_chill_avg             double,
    temperature_wind_chill_max             double,
    temperature_wind_chill_min             double,
    visibility_avg                         double,
    visibility_max                         double,
    visibility_min                         double,
    wind_direction_avg                     double,
    wind_direction_predominant             double,
    wind_gust_avg                          double,
    wind_gust_max                          double,
    wind_gust_min                          double,
    wind_gust_instantaneous_avg            string,
    wind_gust_instantaneous_max            string,
    wind_gust_instantaneous_min            string,
    wind_speed_avg                         double,
    wind_speed_max                         double,
    wind_speed_min                         double
)
;

/* 
 * TABLE: historical_daynight_imperial 
 */

CREATE TABLE historical_daynight_imperial
(
    city_name                              string,
    country_code                           string,
    latitude                               double,
    longitude                              double,
    date                                   date,
    day_flag                               string,
    cloud_base_height_avg                  int,
    cloud_base_height_max                  int,
    cloud_base_height_min                  int,
    cloud_cover_avg                        double,
    cloud_cover_max                        double,
    cloud_cover_min                        double,
    cloud_cover_perc_avg                   int,
    cloud_cover_perc_max                   int,
    cloud_cover_perc_min                   int,
    degree_days_cooling                    double,
    degree_days_freezing                   double,
    degree_days_growing                    double,
    degree_days_heating                    double,
    humidity_relative_avg                  double,
    humidity_relative_max                  double,
    humidity_relative_min                  double,
    index_uv_avg                           double,
    index_uv_max                           double,
    index_uv_min                           double,
    minutes_of_ice_total                   string,
    minutes_of_precipitation_total         int,
    minutes_of_sun_total                   int,
    minutes_of_rain_total                  string,
    minutes_of_snow_total                  int,
    has_ice                                string,
    ice_lwe_rate_avg                       string,
    ice_lwe_rate_max                       string,
    ice_lwe_rate_min                       string,
    ice_lwe_total                          string,
    has_precipitation                      boolean,
    precipitation_lwe_rate_avg             double,
    precipitation_lwe_rate_max             double,
    precipitation_lwe_rate_min             double,
    precipitation_lwe_total                double,
    precipitation_type_desc_predominant    string,
    precipitation_type_predominant         int,
    pressure_avg                           double,
    pressure_max                           double,
    pressure_min                           double,
    pressure_msl_avg                       double,
    pressure_msl_max                       double,
    pressure_msl_min                       double,
    has_rain                               string,
    rain_lwe_rate_avg                      string,
    rain_lwe_rate_max                      string,
    rain_lwe_rate_min                      string,
    rain_lwe_total                         string,
    snow_cover_avg                         string,
    snow_cover_max                         string,
    snow_cover_min                         string,
    snow_depth_avg                         string,
    snow_depth_max                         string,
    snow_depth_min                         string,
    snow_liquid_ratio_accuweather_avg      double,
    snow_liquid_ratio_accuweather_max      double,
    snow_liquid_ratio_accuweather_min      double,
    has_snow                               boolean,
    snow_avg                               string,
    snow_max                               string,
    snow_min                               string,
    snow_total                             string,
    snow_lwe_rate_avg                      double,
    snow_lwe_rate_max                      double,
    snow_lwe_rate_min                      double,
    snow_lwe_total                         double,
    solar_irradiance_avg                   double,
    solar_irradiance_max                   double,
    solar_irradiance_total                 double,
    solar_radiation_net_avg                double,
    solar_radiation_net_max                double,
    solar_radiation_net_total              double,
    temperature_avg                        double,
    temperature_max                        double,
    temperature_min                        double,
    temperature_dew_point_avg              double,
    temperature_dew_point_max              double,
    temperature_dew_point_min              double,
    temperature_heat_index_avg             double,
    temperature_heat_index_max             double,
    temperature_heat_index_min             double,
    temperature_realfeel_avg               double,
    temperature_realfeel_max               double,
    temperature_realfeel_min               double,
    temperature_realfeel_shade_avg         double,
    temperature_realfeel_shade_max         double,
    temperature_realfeel_shade_min         double,
    temperature_wind_chill_avg             double,
    temperature_wind_chill_max             double,
    temperature_wind_chill_min             double,
    visibility_avg                         double,
    visibility_max                         double,
    visibility_min                         double,
    wind_direction_avg                     double,
    wind_direction_predominant             double,
    wind_gust_avg                          double,
    wind_gust_max                          double,
    wind_gust_min                          double,
    wind_gust_instantaneous_avg            string,
    wind_gust_instantaneous_max            string,
    wind_gust_instantaneous_min            string,
    wind_speed_avg                         double,
    wind_speed_max                         double,
    wind_speed_min                         double
)
;

/* 
 * TABLE: historical_daynight_metric 
 */

CREATE TABLE historical_daynight_metric
(
    city_name                              string,
    country_code                           string,
    latitude                               double,
    longitude                              double,
    date                                   date,
    day_flag                               string,
    cloud_base_height_avg                  int,
    cloud_base_height_max                  int,
    cloud_base_height_min                  int,
    cloud_cover_avg                        double,
    cloud_cover_max                        double,
    cloud_cover_min                        double,
    cloud_cover_perc_avg                   int,
    cloud_cover_perc_max                   int,
    cloud_cover_perc_min                   int,
    degree_days_cooling                    double,
    degree_days_freezing                   double,
    degree_days_growing                    double,
    degree_days_heating                    double,
    humidity_relative_avg                  double,
    humidity_relative_max                  double,
    humidity_relative_min                  double,
    index_uv_avg                           double,
    index_uv_max                           double,
    index_uv_min                           double,
    minutes_of_ice_total                   string,
    minutes_of_precipitation_total         int,
    minutes_of_sun_total                   int,
    minutes_of_rain_total                  string,
    minutes_of_snow_total                  int,
    has_ice                                string,
    ice_lwe_rate_avg                       string,
    ice_lwe_rate_max                       string,
    ice_lwe_rate_min                       string,
    ice_lwe_total                          string,
    has_precipitation                      boolean,
    precipitation_lwe_rate_avg             double,
    precipitation_lwe_rate_max             double,
    precipitation_lwe_rate_min             double,
    precipitation_lwe_total                double,
    precipitation_type_desc_predominant    string,
    precipitation_type_predominant         int,
    pressure_avg                           double,
    pressure_max                           double,
    pressure_min                           double,
    pressure_msl_avg                       double,
    pressure_msl_max                       double,
    pressure_msl_min                       double,
    has_rain                               string,
    rain_lwe_rate_avg                      string,
    rain_lwe_rate_max                      string,
    rain_lwe_rate_min                      string,
    rain_lwe_total                         string,
    snow_cover_avg                         string,
    snow_cover_max                         string,
    snow_cover_min                         string,
    snow_depth_avg                         string,
    snow_depth_max                         string,
    snow_depth_min                         string,
    snow_liquid_ratio_accuweather_avg      double,
    snow_liquid_ratio_accuweather_max      double,
    snow_liquid_ratio_accuweather_min      double,
    has_snow                               boolean,
    snow_avg                               string,
    snow_max                               string,
    snow_min                               string,
    snow_total                             string,
    snow_lwe_rate_avg                      double,
    snow_lwe_rate_max                      double,
    snow_lwe_rate_min                      double,
    snow_lwe_total                         double,
    solar_irradiance_avg                   double,
    solar_irradiance_max                   double,
    solar_irradiance_total                 double,
    solar_radiation_net_avg                double,
    solar_radiation_net_max                double,
    solar_radiation_net_total              double,
    temperature_avg                        double,
    temperature_max                        double,
    temperature_min                        double,
    temperature_dew_point_avg              double,
    temperature_dew_point_max              double,
    temperature_dew_point_min              double,
    temperature_heat_index_avg             double,
    temperature_heat_index_max             double,
    temperature_heat_index_min             double,
    temperature_realfeel_avg               double,
    temperature_realfeel_max               double,
    temperature_realfeel_min               double,
    temperature_realfeel_shade_avg         double,
    temperature_realfeel_shade_max         double,
    temperature_realfeel_shade_min         double,
    temperature_wind_chill_avg             double,
    temperature_wind_chill_max             double,
    temperature_wind_chill_min             double,
    visibility_avg                         double,
    visibility_max                         double,
    visibility_min                         double,
    wind_direction_avg                     double,
    wind_direction_predominant             double,
    wind_gust_avg                          double,
    wind_gust_max                          double,
    wind_gust_min                          double,
    wind_gust_instantaneous_avg            string,
    wind_gust_instantaneous_max            string,
    wind_gust_instantaneous_min            string,
    wind_speed_avg                         double,
    wind_speed_max                         double,
    wind_speed_min                         double
)
;

/* 
 * TABLE: historical_hourly_imperial 
 */

CREATE TABLE historical_hourly_imperial
(
    city_name                     string,
    country_code                  string,
    latitude                      double,
    longitude                     double,
    date                          timestamp,
    cloud_base_height             int,
    cloud_cover_high              string,
    cloud_cover_low               string,
    cloud_cover_medium            string,
    cloud_cover_total             double,
    humidity_relative             double,
    index_uv                      double,
    has_ice                       string,
    ice_lwe                       string,
    ice_lwe_rate                  string,
    minutes_of_ice                string,
    minutes_of_precipitation      int,
    minutes_of_sun                int,
    minutes_of_rain               string,
    minutes_of_snow               int,
    has_precipitation             boolean,
    precipitation_lwe             double,
    precipitation_lwe_rate        double,
    precipitation_type            int,
    precipitation_type_desc       string,
    pressure                      double,
    pressure_msl                  double,
    has_rain                      string,
    rain_lwe                      string,
    rain_lwe_rate                 string,
    snow_cover                    string,
    snow_depth                    string,
    has_snow                      boolean,
    snow                          string,
    snow_lwe                      double,
    snow_lwe_rate                 double,
    solar_irradiance              double,
    solar_radiation_net           double,
    temperature                   double,
    temperature_dew_point         double,
    temperature_heat_index        double,
    temperature_realfeel          double,
    temperature_realfeel_shade    double,
    temperature_wind_chill        double,
    visibility                    double,
    wind_direction                double,
    wind_gust                     double,
    wind_gust_instantaneous       string,
    wind_speed                    double
)
;

/* 
 * TABLE: historical_hourly_metric 
 */

CREATE TABLE historical_hourly_metric
(
    city_name                     string,
    country_code                  string,
    latitude                      double,
    longitude                     double,
    datetime_valid_local          timestamp,
    gmt_offset                    double,
    cloud_base_height             int,
    cloud_cover_high              string,
    cloud_cover_low               string,
    cloud_cover_medium            string,
    cloud_cover_total             double,
    humidity_relative             double,
    index_uv                      double,
    has_ice                       string,
    ice_lwe                       string,
    ice_lwe_rate                  string,
    minutes_of_ice                string,
    minutes_of_precipitation      int,
    minutes_of_sun                int,
    minutes_of_rain               string,
    minutes_of_snow               int,
    has_precipitation             boolean,
    precipitation_lwe             double,
    precipitation_lwe_rate        double,
    precipitation_type            int,
    precipitation_type_desc       string,
    pressure                      double,
    pressure_msl                  double,
    has_rain                      string,
    rain_lwe                      string,
    rain_lwe_rate                 string,
    snow_cover                    string,
    snow_depth                    string,
    has_snow                      boolean,
    snow                          string,
    snow_lwe                      double,
    snow_lwe_rate                 double,
    solar_irradiance              double,
    solar_radiation_net           double,
    temperature                   double,
    temperature_dew_point         double,
    temperature_heat_index        double,
    temperature_realfeel          double,
    temperature_realfeel_shade    double,
    temperature_wind_chill        double,
    visibility                    double,
    wind_direction                double,
    wind_gust                     double,
    wind_gust_instantaneous       string,
    wind_speed                    double
)
;

/* 
 * TABLE: lineitem 
 */

CREATE TABLE lineitem
(
    l_orderkey         bigint,
    l_partkey          bigint,
    l_suppkey          bigint,
    l_linenumber       int,
    l_quantity         decimal(18, 2),
    l_extendedprice    decimal(18, 2),
    l_discount         decimal(18, 2),
    l_tax              decimal(18, 2),
    l_returnflag       string,
    l_linestatus       string,
    l_shipdate         date,
    l_commitdate       date,
    l_receiptdate      date,
    l_shipinstruct     string,
    l_shipmode         string,
    l_comment          string
)
;

/* 
 * TABLE: media_customer_reviews 
 */

CREATE TABLE media_customer_reviews
(
    review         string,
    franchiseID    bigint,
    review_date    timestamp,
    new_id         int
)
;

/* 
 * TABLE: media_gold_reviews_chunked 
 */

CREATE TABLE media_gold_reviews_chunked
(
    franchiseID     int,
    review_date     timestamp,
    chunked_text    string,
    chunk_id        string,
    review_uri      string
)
;

/* 
 * TABLE: nation 
 */

CREATE TABLE nation
(
    n_nationkey    bigint,
    n_name         string,
    n_regionkey    bigint,
    n_comment      string
)
;

/* 
 * TABLE: orders 
 */

CREATE TABLE orders
(
    o_orderkey         bigint,
    o_custkey          bigint,
    o_orderstatus      string,
    o_totalprice       decimal(18, 2),
    o_orderdate        date,
    o_orderpriority    string,
    o_clerk            string,
    o_shippriority     int,
    o_comment          string
)
;

/* 
 * TABLE: part 
 */

CREATE TABLE part
(
    p_partkey        bigint,
    p_name           string,
    p_mfgr           string,
    p_brand          string,
    p_type           string,
    p_size           int,
    p_container      string,
    p_retailprice    decimal(18, 2),
    p_comment        string
)
;

/* 
 * TABLE: partsupp 
 */

CREATE TABLE partsupp
(
    ps_partkey       bigint,
    ps_suppkey       bigint,
    ps_availqty      int,
    ps_supplycost    decimal(18, 2),
    ps_comment       string
)
;

/* 
 * TABLE: region 
 */

CREATE TABLE region
(
    r_regionkey    bigint,
    r_name         string,
    r_comment      string
)
;

/* 
 * TABLE: sales_customers 
 */

CREATE TABLE sales_customers
(
    customerID         bigint,
    first_name         string,
    last_name          string,
    email_address      string,
    phone_number       string,
    address            string,
    city               string,
    state              string,
    country            string,
    continent          string,
    postal_zip_code    bigint,
    gender             string
)
;

/* 
 * TABLE: sales_franchises 
 */

CREATE TABLE sales_franchises
(
    franchiseID    bigint,
    name           string,
    city           string,
    district       string,
    zipcode        string,
    country        string,
    size           string,
    longitude      double,
    latitude       double,
    supplierID     bigint
)
;

/* 
 * TABLE: sales_suppliers 
 */

CREATE TABLE sales_suppliers
(
    supplierID    bigint,
    name          string,
    ingredient    string,
    continent     string,
    city          string,
    district      string,
    size          string,
    longitude     double,
    latitude      double,
    approved      string
)
;

/* 
 * TABLE: sales_transactions 
 */

CREATE TABLE sales_transactions
(
    transactionID    bigint,
    customerID       bigint,
    franchiseID      bigint,
    dateTime         timestamp,
    product          string,
    quantity         bigint,
    unitPrice        bigint,
    totalPrice       bigint,
    paymentMethod    string,
    cardNumber       bigint
)
;

/* 
 * TABLE: supplier 
 */

CREATE TABLE supplier
(
    s_suppkey      bigint,
    s_name         string,
    s_address      string,
    s_nationkey    bigint,
    s_phone        string,
    s_acctbal      decimal(18, 2),
    s_comment      string
)
;

/* 
 * TABLE: trips 
 */

CREATE TABLE trips
(
    tpep_pickup_datetime     timestamp,
    tpep_dropoff_datetime    timestamp,
    trip_distance            double,
    fare_amount              double,
    pickup_zip               int,
    dropoff_zip              int
)
;

