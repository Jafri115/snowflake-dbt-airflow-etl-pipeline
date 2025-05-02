
{% macro discount_amount(extended_price,discounted_percentage, scale=2) %}
    (-1 * {{extended_price}} * {{discounted_percentage}})::decimal(16, {{ scale }})
{% endmacro %}
