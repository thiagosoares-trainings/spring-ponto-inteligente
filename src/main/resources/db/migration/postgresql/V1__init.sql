-- Sequence: public.hibernate_sequence

-- DROP SEQUENCE public.hibernate_sequence;

CREATE SEQUENCE public.hibernate_sequence
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.hibernate_sequence
  OWNER TO postgres;


-- Table: public.empresa

-- DROP TABLE public.empresa;

CREATE TABLE public.empresa
(
  id bigint NOT NULL,
  cnpj character varying(255) NOT NULL,
  data_atualizacao timestamp without time zone NOT NULL,
  data_criacao timestamp without time zone NOT NULL,
  razao_social character varying(255) NOT NULL,
  CONSTRAINT empresa_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.empresa
  OWNER TO postgres;

-- Table: public.funcionario

-- DROP TABLE public.funcionario;

CREATE TABLE public.funcionario
(
  id bigint NOT NULL,
  cpf character varying(255) NOT NULL,
  data_atualizacao timestamp without time zone NOT NULL,
  data_criacao timestamp without time zone NOT NULL,
  email character varying(255) NOT NULL,
  nome character varying(255) NOT NULL,
  perfil character varying(255) NOT NULL,
  qtd_horas_almoco real,
  qtd_horas_trabalho_dia real,
  senha character varying(255) NOT NULL,
  valor_hora numeric(19,2),
  empresa_id bigint,
  CONSTRAINT funcionario_pkey PRIMARY KEY (id),
  CONSTRAINT fk4cm1kg523jlopyexjbmi6y54j FOREIGN KEY (empresa_id)
      REFERENCES public.empresa (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.funcionario
  OWNER TO postgres;


-- Table: public.lancamento

-- DROP TABLE public.lancamento;

CREATE TABLE public.lancamento
(
  id bigint NOT NULL,
  data timestamp without time zone NOT NULL,
  data_atualizacao timestamp without time zone NOT NULL,
  data_criacao timestamp without time zone NOT NULL,
  descricao character varying(255),
  localizacao character varying(255),
  tipo character varying(255) NOT NULL,
  funcionario_id bigint,
  CONSTRAINT lancamento_pkey PRIMARY KEY (id),
  CONSTRAINT fk46i4k5vl8wah7feutye9kbpi4 FOREIGN KEY (funcionario_id)
      REFERENCES public.funcionario (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.lancamento
  OWNER TO postgres;


