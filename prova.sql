 create table investidores(
  id serial primary key,
  nome varchar(100) not null,
  cpf varchar(11) unique not null,
  nivel_experiencia INT DEFAULT 0 CHECK (nivel_experiencia >= 0 )
  );

 create table carteiras(
  id serial primary key,
  investidor_id int REFERENCES investidores(id),
  endereço_wallet varchar(100) unique not null,
  rede_blockchain varchar(100) not null,
  saldo_usd decimal not null check (saldo_usd > 0),
  status varchar(10) default 'Ativado' not null CHECK (status in('Ativa', 'Em Analise', 'Bloqueada', 'Pausada'))
 );

 create table corretoras(
 	id serial primary key,
 	nome_exchange varchar(100) not null,
 	cnpj varchar(14) unique not null,
 	email_suport varchar(100) not null
 );

 create table criptomoedas(
 	id serial primary key,
 	corretoras_id int REFERENCES corretoras(id),
 	nome_moeda varchar(100) not null,
 	preco_unitario_usd decimal not null check (preco_unitario_usd > 0),
 	categoria varchar(10) default 'Layer1' not null CHECK (categoria in('Layer1', 'DeFi', 'Memecoin', 'Stablecoin'))
 );

 create table transacoes_cripto(
 	id serial primary key,
 	carteira_id int REFERENCES carteiras(id),
 	criptomoeda_id int REFERENCES criptomoedas(id),
 	quantidade decimal not null check (quantidade > 0),
 	valor_pago decimal not null check (valor_pago > 0),
 	data_transacao timestamp not null DEFAULT current_timestamp	
 );

INSERT INTO investidores(nome, cpf, nivel_experiencia) values
('Paulo Pedra', '48903489085', '30'),
('George Cabeludo', '09867468345', '99'),
('João Leno', '09854398709', '47'),
('Ricardo Estrela', '64798347898', '28'),
('Francisco Geraldo', '78909875434', '84');

INSERT INTO carteiras(investidor_id, endereço_wallet, rede_blockchain, saldo_usd, status) values
('1', '94ng9ng9ugn', 'Bitcoin', 10.000,00, 'Ativa'),
('2', '294nrnfw95n78', 'Dudcoin', 25.500,00, 'Em Analise'),
('3', '4958hhjnben56', 'Ethereum', 19.800,0, 'Bloqueada'),
('4', '9857hgir356-67h', 'Ethereum 2', 30.598,00, 'Ativa'),
('5', '597gh9bj6_ngbj', 'Solana', 50.948,00, 'Pausada');

INSERT INTO corretoras(nome_exchange, cnpj, email_suport) values
('master', '56789873624579', 'master_bank_suporte@master.com'),
('itau', '98590856890985', 'itau_banco_suporte@itau.com'),
('banco bom', '098567898754325', 'banco_bom_suporte@bom.com'),
('baba bank', '759098487589874', 'baba_bank_suporte@baba.com'),
('sugma bank', '98745987348609', 'sugma_bank_suporte@maste.com');

INSERT INTO criptomoedas(corretoras_id, nome_moeda, preco_unitario_usd, categoria) values
('1', 'Bitcoin', 90, 'Stablecoin'),
('2', 'Dudcoin', 50, 'Memecoin'),
('3', 'Ethereum', 20, 'Layer1'),
('4', 'Ethereum 2', 22, 'DeFi'),
('5', 'Solana', 10, 'Stablecoin');

INSERT INTO transacoes_cripto(carteira_id, criptomoeda_id, quantidade, valor_pago, data_transacao) values
('1', '1', 200, 3586, '2026-11-24'),
('2', '2', 300, 86874, '2026-11-13'),
('3', '3', 500, 6778, '2026-11-22'),
('4', '4', 100, 8766, '2026-11-14'),
('5', '5', 20, 4786, '2026-11-17');
