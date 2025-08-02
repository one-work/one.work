Money.default_currency = Money::Currency.new('CNY')
Money.locale_backend = :i18n
Money.rounding_mode = BigDecimal::ROUND_HALF_UP
Money.default_formatting_rules = {
  html_wrap: true
}
