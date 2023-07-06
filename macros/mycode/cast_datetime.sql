{%- macro default_cast_datetime(column_str, as_string=false, alias=none, date_type=none) -%}

    CONVERT(DATETIME2(6), {{ column_str }})

    {%- if alias %} AS {{ alias }} {%- endif %}

{%- endmacro -%}