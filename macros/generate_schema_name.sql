{% macro generate_schema_name(custom_schema_name, node) -%}
 
    {%- set shared_targets = ['shared_dev', 'qa', 'uat'] -%}
    {%- set default_schema = target.schema -%}
 
    {%- if custom_schema_name is none -%}
        {{ default_schema }}
 
    {%- elif target.name in shared_targets -%}
        {{ custom_schema_name | trim }}
 
    {%- else -%}
        {{ default_schema }}_{{ custom_schema_name | trim }}
 
    {%- endif -%}
 
{%- endmacro %}
