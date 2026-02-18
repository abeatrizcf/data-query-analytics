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

    texto_padrao = "suco de uva",

    tabelaFinal = 
        Table.AddColumn(
            tabela,
            "Produto Padronizado",
            each 
                let
                    produtoTratado = Text.Lower( Text.Trim(Text.Clean([Produto]))
                        )
                in
                    if produtoTratado = texto_padrao 
                    then "Suco de uva"
                    else "Outro"
        )
in
    tabelaFinal