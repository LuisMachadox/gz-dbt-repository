{% macro margin_percent(revenue, purchase_cost) %}
round (margin/revenue,2)
{% endmacro %}