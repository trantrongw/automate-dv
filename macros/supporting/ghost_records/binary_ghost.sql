/*
 * Copyright (c) Business Thinking Ltd. 2019-2023
 * This software includes code developed by the AutomateDV (f.k.a dbtvault) Team at Business Thinking Ltd. Trading as Datavault
 */

{%- macro binary_ghost(alias, hash) -%}
    {{ adapter.dispatch('binary_ghost', 'automate_dv')(alias=alias, hash=hash) }}
{%- endmacro -%}

{%- macro default__binary_ghost(alias, hash) -%}

    {%- if hash | lower == 'md5' -%}
        {{ automate_dv.cast_binary(column_str=modules.itertools.repeat('0', 32) | join (''), alias=alias, quote=true) }}
    {%- elif hash | lower == 'sha' -%}
        {{ automate_dv.cast_binary(column_str=modules.itertools.repeat('0', 64) | join (''), alias=alias, quote=true) }}
    {%- elif hash | lower == 'sha1' -%}
        {{ automate_dv.cast_binary(column_str=modules.itertools.repeat('0', 40) | join (''), alias=alias, quote=true) }}
    {%- else -%}
        {{ automate_dv.cast_binary(column_str=modules.itertools.repeat('0', 32) | join (''), alias=alias, quote=true) }}
    {%- endif -%}
{%- endmacro -%}

{%- macro fabric__binary_ghost(alias, hash) -%}
    {%- if hash | lower == 'md5' -%}
        CAST(REPLICATE('0', 32) AS CHAR(32))
	{%- elif hash | lower == 'sha' -%}
        CAST(REPLICATE('0', 32) AS CHAR(32))
    {%- elif hash | lower == 'sha1' -%}
        CAST(REPLICATE('0', 20) AS CHAR(20))
    {%- else -%}
        CAST(REPLICATE('0', 32) AS CHAR(32))
    {%- endif -%}

    {%- if alias %} AS {{ alias }} {%- endif -%}
{%- endmacro -%}
