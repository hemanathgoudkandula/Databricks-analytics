{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set invocation_context = env_var(
        'DBT_CLOUD_INVOCATION_CONTEXT',
        ''
    ) -%}

    {%- set deployment_targets = ['dev','qa','uat'] -%}

    {# CI / Pull Request execution #}
    {%- if invocation_context == 'ci' -%}

        {%- if custom_schema_name is not none -%}
            {{ target.schema }}_{{ custom_schema_name | trim }}
        {%- else -%}
            {{ target.schema }}
        {%- endif -%}

    {# Deployment execution #}
    {%- elif target.name in deployment_targets -%}

        {%- if custom_schema_name is not none -%}
            {{ custom_schema_name | trim }}
        {%- else -%}
            {{ target.schema }}
        {%- endif -%}

    {# Developer execution #}
    {%- else -%}

        {%- if custom_schema_name is not none -%}
            {{ target.schema }}_{{ custom_schema_name | trim }}
        {%- else -%}
            {{ target.schema }}
        {%- endif -%}

    {%- endif -%}

{%- endmacro %}