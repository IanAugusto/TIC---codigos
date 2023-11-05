-- CreateTable
CREATE TABLE "origem_receita" (
    "ID" SERIAL NOT NULL,
    "ATIVO" CHAR(1) NOT NULL,
    "DESCRICAO" VARCHAR(100) NOT NULL,
    "OBSERVACAO" VARCHAR(400),
    "USER_CAD" INTEGER NOT NULL,
    "DATA_CAD" DATE NOT NULL,

    CONSTRAINT "origem_receita_pkey" PRIMARY KEY ("ID")
);

-- CreateTable
CREATE TABLE "plano_contas" (
    "ID" INTEGER NOT NULL,
    "COD_NIVE1" INTEGER NOT NULL,
    "DESC_NIVEL1" INTEGER NOT NULL,
    "COD_NIVE2" INTEGER NOT NULL,
    "DESC_NIVEL2" INTEGER NOT NULL,
    "COD_NIVE3" INTEGER NOT NULL,
    "DESC_NIVEL3" INTEGER NOT NULL,
    "USER_CAD" INTEGER NOT NULL,
    "DATA_CAD" DATE NOT NULL,

    CONSTRAINT "plano_contas_pkey" PRIMARY KEY ("ID")
);

-- CreateTable
CREATE TABLE "movimentacao_financeira" (
    "ID" INTEGER NOT NULL,
    "E_S" CHAR(1) NOT NULL,
    "ID_CENTRO_CUSTO" INTEGER NOT NULL,
    "DATA_MOVTO" DATE NOT NULL,
    "ID_ORIG_RECEITA" INTEGER NOT NULL,
    "VALOR" DECIMAL(16,2),
    "ID_FORN" INTEGER,
    "ID_PLANO" INTEGER,
    "OBSERVACAO" VARCHAR(400),
    "USER_CAD" INTEGER NOT NULL,
    "DATA_CAD" DATE NOT NULL,

    CONSTRAINT "movimentacao_financeira_pkey" PRIMARY KEY ("ID")
);

-- AddForeignKey
ALTER TABLE "origem_receita" ADD CONSTRAINT "OR_RECEITA_USUARIO_FK" FOREIGN KEY ("USER_CAD") REFERENCES "usuario"("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "plano_contas" ADD CONSTRAINT "PCONTAS_USUARIO_FK" FOREIGN KEY ("USER_CAD") REFERENCES "usuario"("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "movimentacao_financeira" ADD CONSTRAINT "MOVTOFIN_USUARIO_FK" FOREIGN KEY ("USER_CAD") REFERENCES "usuario"("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "movimentacao_financeira" ADD CONSTRAINT "MOVTOFIN_FORN_FK" FOREIGN KEY ("ID_FORN") REFERENCES "fornecedor"("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "movimentacao_financeira" ADD CONSTRAINT "MOVTOFIN_CCUSTO_FK" FOREIGN KEY ("ID_CENTRO_CUSTO") REFERENCES "centro_custo"("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "movimentacao_financeira" ADD CONSTRAINT "MOVTOFIN_PLANO_CONTAS_FK" FOREIGN KEY ("ID_PLANO") REFERENCES "plano_contas"("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "movimentacao_financeira" ADD CONSTRAINT "MOVTOFIN_ORIG_RECEITA_FK" FOREIGN KEY ("ID_ORIG_RECEITA") REFERENCES "origem_receita"("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;