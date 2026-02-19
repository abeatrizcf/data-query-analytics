let
    tabela =
        #table(
            {"Produto"},
            {
                {"Suco de uva"},
                {"suco de Uva"},
                {"   Suco de UVA"},
                {"Suco de Uva"},
                {"SUCO DE UVA"},
                {"   suco de uva"},
                {"suco de Uva"}
            }
        ),

    texto_padrao = "Suco de uva",

    tabelaFinal =
        Table.AddColumn(
            tabela,
            "Produto Padronizado",
            each
                let
                    produtoLimpo =
                        Text.Trim(
                            Text.Clean([Produto])
                        )
                in
                    if Comparer.OrdinalIgnoreCase(
                        produtoLimpo,
                        texto_padrao
                    ) = 0
                    then "Suco de uva"
                    else "Outro"
        )
in
    tabelaFinal