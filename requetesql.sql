CREATE TABLE TParent(
                      Login VARCHAR(7) Primary KEY, 
                      Nom VARCHAR(20), 
                      Prenom VARCHAR(20), 
                      Adresse VARCHAR(50), 
                      Tel integer,
                      mdp VARCHAR(10));
                      
                      
                      
CREATE TABLE TSection(Section VARCHAR(3) PRIMARY KEY);
                      
CREATE TABLE TEnfant(Login VARCHAR(7),
                    Nom VARCHAR(20),
                    Prenom VARCHAR(20),
                    DateN Date,
                    Genre VARCHAR(15),
                    Section VARCHAR(3),
                    PRIMARY KEY(Login, Prenom),
                    FOREIGN KEY(Login) REFERENCES TPARENT(Login),
                    FOREIGN KEY(Section) REFERENCES TSECTION(Section));
                    
CREATE TABLE TRegime(Regime VARCHAR(25) PRIMARY KEY);

CREATE TABLE TAnimation(Activite VARCHAR(15), 
                        Jour VARCHAR(15), 
                        Effectif integer,
                        Prix Float,
                        PRIMARY KEY(Activite, Jour));

CREATE TABLE TPeriode(Debut Date PRIMARY KEY, Fin Date);

CREATE TABLE TAnimateur(
                        Nom VARCHAR(20), 
                        Prenom VARCHAR(20),
                        PRIMARY KEY(Nom, Prenom));
                        
CREATE TABLE AssocAnimationEnfant(
                                  Activite VARCHAR(15),
                                  Jour VARCHAR(15),
                                  Login VARCHAR(7),
                                  Prenom VARCHAR(20),
                                  PRIMARY KEY(Activite, Jour, Login, Prenom),
                                  FOREIGN KEY(Activite, Jour) REFERENCES TAnimation(Activite, Jour),
                                  FOREIGN KEY(Login, Prenom) REFERENCES TEnfant(Login, Prenom)
                                  );

CREATE TABLE AssocAnimationAnimateurJour(
                                          Activite VARCHAR(15),
                                          Nom VARCHAR(20),
                                          Prenom VARCHAR(20),
                                          Jour VARCHAR(10),
                                          PRIMARY KEY(Activite, Nom, Prenom, Jour),
                                          FOREIGN KEY(Activite, Jour) REFERENCES TAnimation(Activite, Jour),
                                          FOREIGN KEY(Nom, Prenom) REFERENCES TAnimateur(Nom, Prenom)
                                          );
                                    
CREATE TABLE AssocAnimationPeriode(
                                    Debut Date,
                                    Activite VARCHAR(15),
                                    Jour VARCHAR(15),
                                    PRIMARY KEY(Debut, Activite, Jour),
                                    FOREIGN KEY(Debut) REFERENCES TPeriode(Debut),
                                    FOREIGN KEY(Activite, Jour) REFERENCES TAnimation(Activite, Jour)
                                  );
                                 
CREATE TABLE AssocAnimationSection(Activite VARCHAR(15),
                                   Jour VARCHAR(15),
                                   Section VARCHAR(3),
                                   PRIMARY KEY(Activite, Jour, Section)
					FOREIGN KEY(Activite, Jour) REFERENCES TAnimation(Activite, Jour),
                                   FOREIGN KEY(Section) REFERENCES TSection(Section)
				);

CREATE TABLE AssocRegimeEnfant(
				  LOGIN VARCHAR(7),
				  PRENOM VARCHAR(20),
				  REGIME VARCHAR(25),
				  PRIMARY KEY(LOGIN, PRENOM, REGIME),
				  FOREIGN KEY(LOGIN, PRENOM) REFERENCES TENFANT(LOGIN, PRENOM),
				  FOREIGN KEY(REGIME) REFERENCES TREGIME(REGIME)
				);

INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('albertt','Albert','Timéo','',NULL,'3lBz60A');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('aubryn','Aubry','Noé','',NULL,'2fAc39N');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('baillyl','Bailly','Lenny','',NULL,'2nGi66K');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('barona','Baron','Arthur','',NULL,'7iSt96O');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('barree','Barre','Eden','',NULL,'3vHo41L');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('benoitm','Benoit','Mohamed','',NULL,'7fIa83T');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('bouchel','Boucher','Léna','',NULL,'7iAa13R');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('boulanl','Boulanger','Léo','',NULL,'0kDf57V');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('bouviet','Bouvier','Thomas','',NULL,'6uPt00P');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('bretonc','Breton','Charlotte','',NULL,'5nGp67O');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('carrec','Carre','Capucine','',NULL,'7pKo06U');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('charper','Charpentier','Rose','',NULL,'7bDi85X');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('chevalm','Chevallier','Martin','',NULL,'0wAe93P');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('colletr','Collet','Rayan','',NULL,'5tUj13O');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('collinl','Collin','Léonie','',NULL,'6fPb02P');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('cordies','Cordier','Simon','',NULL,'2hXp31H');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('cousine','Cousin','Elsa','',NULL,'0nAr07L');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('daniels','Daniel','Sacha','',NULL,'2bRb72R');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('dupuya','Dupuy','Augustin','',NULL,'8hZy47T');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('etiennl','Etienne','Lola','',NULL,'2hNk43O');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('evrardl','Evrard','Lilou','',NULL,'6jVv07U');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('ferreit','Ferreira','Tom','',NULL,'9nRk50Z');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('gayl','Gay','Lucas','',NULL,'8zEr83L');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('germaiv','Germain','Victor','',NULL,'7vBr69L');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('gillett','Gillet','Théo','',NULL,'4dEk05J');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('gomezl','Gomez','Louise','',NULL,'0bOi07E');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('guyotc','Guyot','Clément','',NULL,'8hEm01G');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('hervel','Herve','Liam','',NULL,'5uOr71U');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('hueta','Huet','Antoine','',NULL,'5wVx55A');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('humbers','Humbert','Sofia','',NULL,'6tBa30V');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('jacobv','Jacob','Valentin','',NULL,'8cUx60G');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('jacquer','Jacquet','Raphaël','',NULL,'0yOq82O');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('julienm','Julien','Mila','',NULL,'5tAq47M');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('kleiny','Klein','Yanis','',NULL,'0gAj36J');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('lainec','Laine','Camille','',NULL,'6tOp72F');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('le gofl','Le goff','Léa','',NULL,'2fWu13O');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('le rouo','Le roux','Olivia','',NULL,'3eLc26L');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('lebrunr','Lebrun','Rose','',NULL,'0sYz41V');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('levequt','Leveque','Tiago','',NULL,'1rRs95Y');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('maillan','Maillard','Nina','',NULL,'4lKs47A');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('malletm','Mallet','Mathéo','',NULL,'1oCp08H');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('marchan','Marchal','Noah','',NULL,'0iYm70O');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('marechl','Marechal','Louna','',NULL,'3lZd74B');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('martye','Marty','Elena','',NULL,'5qTs10J');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('milletz','Millet','Zoé','',NULL,'1hDa15W');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('parisn','Paris','Nathan','',NULL,'6yQm90K');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('pasquis','Pasquier','Sarah','',NULL,'3fCk32E');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('paulb','Paul','Baptiste','',NULL,'1sVh72D');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('pereirs','Pereira','Samuel','',NULL,'7kVd12D');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('perrotc','Perrot','Clémence','',NULL,'5sDt97V');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('poirier','Poirier','Romane','',NULL,'3qFv20D');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('ponsa','Pons','Axel','',NULL,'2gIc85V');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('poulail','Poulain','Lina','',NULL,'8tHn80Z');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('prevosr','Prevost','Robin','',NULL,'0gRx35Z');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('remyc','Remy','Chloé','',NULL,'5eYe70K');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('renaulp','Renault','Paul','',NULL,'7dMs50B');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('royera','Royer','Anna','',NULL,'7pKo83E');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('schneic','Schneider','Clara','',NULL,'7uXa91Z');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('vasseun','Vasseur','Nolan','',NULL,'2kXz62L');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('weberl','Weber','Louis','',NULL,'9uWt95T');
INSERT INTO TPARENT (LOGIN, NOM, PRENOM, ADRESSE, TEL, MDP) VALUES ('ensimap','Ensimag','Prof','',NULL,'mdp');

INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('vasseun','Vasseur','Maëlys',to_date('1-FEB-13', 'DD-MON-RR'),'F','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('ponsa','Pons','Marius',to_date('1-JUN-08', 'DD-MON-RR'),'M','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('evrardl','Evrard','Lana',to_date('1-MAR-10', 'DD-MON-RR'),'F','CE1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('charper','Charpentier','Théo',to_date('10-APR-07', 'DD-MON-RR'),'M','CM2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('aubryn','Aubry','Juliette',to_date('10-FEB-07', 'DD-MON-RR'),'F','CM2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('bouchel','Boucher','Paul',to_date('10-FEB-09', 'DD-MON-RR'),'M','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('charper','Charpentier','Alicia',to_date('10-JUL-08', 'DD-MON-RR'),'F','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('marechl','Marechal','Martin',to_date('10-JUL-13', 'DD-MON-RR'),'M','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('schneic','Schneider','Sacha',to_date('10-MAY-14', 'DD-MON-RR'),'M','PS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('martye','Marty','Tom',to_date('11-MAR-07', 'DD-MON-RR'),'M','CM2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('jacobv','Jacob','Elsa',to_date('11-MAR-12', 'DD-MON-RR'),'M','GS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('le rouo','Le roux','Gabin',to_date('11-MAY-07', 'DD-MON-RR'),'M','CM2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('marchan','Marchal','Samuel',to_date('11-MAY-07', 'DD-MON-RR'),'M','CM2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('aubryn','Aubry','Inès',to_date('11-NOV-13', 'DD-MON-RR'),'F','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('collinl','Collin','Baptiste',to_date('11-SEP-10', 'DD-MON-RR'),'M','CE1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('prevosr','Prevost','Sarah',to_date('12-FEB-10', 'DD-MON-RR'),'F','CE1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('bretonc','Breton','Lilou',to_date('12-JAN-10', 'DD-MON-RR'),'F','CE1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('hervel','Herve','Chloé',to_date('12-JAN-14', 'DD-MON-RR'),'F','PS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('pasquis','Pasquier','Agathe',to_date('12-JUL-08', 'DD-MON-RR'),'F','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('boulanl','Boulanger','Capucine',to_date('13-APR-13', 'DD-MON-RR'),'F','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('remyc','Remy','Louise',to_date('13-JUL-10', 'DD-MON-RR'),'F','CE1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('colletr','Collet','Ethan',to_date('13-OCT-12', 'DD-MON-RR'),'M','GS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('pasquis','Pasquier','Alice',to_date('14-AUG-10', 'DD-MON-RR'),'F','CE1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('milletz','Millet','Adèle',to_date('14-AUG-14', 'DD-MON-RR'),'F','PS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('poirier','Poirier','Anna',to_date('14-JAN-09', 'DD-MON-RR'),'F','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('lebrunr','Lebrun','Zoé',to_date('14-JAN-10', 'DD-MON-RR'),'F','CE1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('gillett','Gillet','Emma',to_date('14-JUL-07', 'DD-MON-RR'),'F','CM2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('dupuya','Dupuy','Enzo',to_date('14-MAR-08', 'DD-MON-RR'),'M','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('ponsa','Pons','Robin',to_date('14-MAR-11', 'DD-MON-RR'),'M','CP');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('barona','Baron','Camille',to_date('14-MAY-08', 'DD-MON-RR'),'F','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('paulb','Paul','Antoine',to_date('14-OCT-08', 'DD-MON-RR'),'M','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('gayl','Gay','Marius',to_date('14-OCT-10', 'DD-MON-RR'),'M','CE1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('barree','Barre','Axel',to_date('14-SEP-07', 'DD-MON-RR'),'M','CM2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('paulb','Paul','Manon',to_date('15-FEB-13', 'DD-MON-RR'),'F','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('aubryn','Aubry','Hugo',to_date('15-JUL-10', 'DD-MON-RR'),'M','CE1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('colletr','Collet','Jeanne',to_date('15-MAR-08', 'DD-MON-RR'),'F','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('marechl','Marechal','Mathéo',to_date('15-NOV-12', 'DD-MON-RR'),'M','GS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('jacobv','Jacob','Maxence',to_date('15-OCT-07', 'DD-MON-RR'),'M','CM2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('jacquer','Jacquet','Elena',to_date('15-OCT-12', 'DD-MON-RR'),'F','GS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('gayl','Gay','Margaux',to_date('15-SEP-11', 'DD-MON-RR'),'F','CP');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('humbers','Humbert','Alexis',to_date('16-JUL-10', 'DD-MON-RR'),'M','CE1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('boulanl','Boulanger','Giulia',to_date('16-JUN-14', 'DD-MON-RR'),'F','PS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('perrotc','Perrot','Chloé',to_date('16-NOV-09', 'DD-MON-RR'),'F','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('ferreit','Ferreira','Raphaël',to_date('17-APR-11', 'DD-MON-RR'),'M','CP');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('benoitm','Benoit','Romane',to_date('17-FEB-12', 'DD-MON-RR'),'F','GS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('albertt','Albert','Samuel',to_date('17-JAN-09', 'DD-MON-RR'),'M','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('perrotc','Perrot','Lilou',to_date('17-JUL-07', 'DD-MON-RR'),'F','CM2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('milletz','Millet','Maxime',to_date('17-MAR-09', 'DD-MON-RR'),'M','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('weberl','Weber','Margaux',to_date('18-DEC-09', 'DD-MON-RR'),'F','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('bouviet','Bouvier','Léonie',to_date('18-SEP-13', 'DD-MON-RR'),'F','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('evrardl','Evrard','Lucas',to_date('19-APR-12', 'DD-MON-RR'),'M','GS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('perrotc','Perrot','Maël',to_date('19-AUG-13', 'DD-MON-RR'),'M','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('gillett','Gillet','Jade',to_date('19-JUL-09', 'DD-MON-RR'),'F','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('cousine','Cousin','Thomas',to_date('19-JUN-11', 'DD-MON-RR'),'M','CP');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('daniels','Daniel','Agathe',to_date('19-OCT-09', 'DD-MON-RR'),'F','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('cordies','Cordier','Eden',to_date('2-DEC-14', 'DD-MON-RR'),'M','PS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('daniels','Daniel','Sacha',to_date('2-JUL-07', 'DD-MON-RR'),'M','CM2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('lebrunr','Lebrun','Olivia',to_date('2-NOV-08', 'DD-MON-RR'),'F','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('gillett','Gillet','Alexandre',to_date('2-SEP-11', 'DD-MON-RR'),'M','CP');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('lainec','Laine','Léna',to_date('20-APR-07', 'DD-MON-RR'),'F','CM2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('renaulp','Renault','Axel',to_date('20-JAN-09', 'DD-MON-RR'),'M','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('poirier','Poirier','Lucas',to_date('20-JUN-10', 'DD-MON-RR'),'M','CE1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('guyotc','Guyot','Adam',to_date('20-MAR-14', 'DD-MON-RR'),'M','PS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('etiennl','Etienne','Clara',to_date('20-NOV-09', 'DD-MON-RR'),'F','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('schneic','Schneider','Enzo',to_date('20-OCT-10', 'DD-MON-RR'),'M','CE1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('levequt','Leveque','Léo',to_date('21-APR-08', 'DD-MON-RR'),'M','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('ferreit','Ferreira','Valentin',to_date('21-APR-13', 'DD-MON-RR'),'M','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('benoitm','Benoit','Ambre',to_date('21-AUG-07', 'DD-MON-RR'),'F','CM2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('charper','Charpentier','Anaïs',to_date('21-JUL-12', 'DD-MON-RR'),'F','GS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('julienm','Julien','Manon',to_date('21-MAR-10', 'DD-MON-RR'),'F','CE1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('weberl','Weber','Olivia',to_date('21-NOV-07', 'DD-MON-RR'),'F','CM2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('malletm','Mallet','Nolan',to_date('21-NOV-09', 'DD-MON-RR'),'M','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('baillyl','Bailly','Léa',to_date('21-NOV-12', 'DD-MON-RR'),'F','GS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('lainec','Laine','Louane',to_date('21-OCT-09', 'DD-MON-RR'),'F','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('le gofl','Le goff','Tiago',to_date('21-SEP-13', 'DD-MON-RR'),'M','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('daniels','Daniel','Nathan',to_date('22-DEC-14', 'DD-MON-RR'),'M','PS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('guyotc','Guyot','Maël',to_date('22-MAY-13', 'DD-MON-RR'),'M','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('kleiny','Klein','Liam',to_date('22-OCT-13', 'DD-MON-RR'),'M','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('germaiv','Germain','Victor',to_date('22-SEP-11', 'DD-MON-RR'),'M','CP');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('carrec','Carre','Nina',to_date('23-AUG-07', 'DD-MON-RR'),'F','CM2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('albertt','Albert','Baptiste',to_date('23-FEB-13', 'DD-MON-RR'),'M','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('chevalm','Chevallier','Alice',to_date('23-JAN-10', 'DD-MON-RR'),'F','CE1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('schneic','Schneider','Simon',to_date('23-JUL-11', 'DD-MON-RR'),'M','CP');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('collinl','Collin','Julia',to_date('23-NOV-13', 'DD-MON-RR'),'F','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('barree','Barre','Clément',to_date('24-APR-14', 'DD-MON-RR'),'M','PS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('parisn','Paris','Victor',to_date('24-DEC-08', 'DD-MON-RR'),'M','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('etiennl','Etienne','Maëlys',to_date('24-FEB-11', 'DD-MON-RR'),'F','CP');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('milletz','Millet','Louis',to_date('24-JUL-08', 'DD-MON-RR'),'M','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('boulanl','Boulanger','Eva',to_date('24-MAR-08', 'DD-MON-RR'),'F','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('humbers','Humbert','Mia',to_date('25-AUG-12', 'DD-MON-RR'),'F','GS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('bretonc','Breton','Mathilde',to_date('25-DEC-08', 'DD-MON-RR'),'F','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('lainec','Laine','Noé',to_date('25-DEC-12', 'DD-MON-RR'),'M','GS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('evrardl','Evrard','Evan',to_date('25-FEB-13', 'DD-MON-RR'),'M','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('hervel','Herve','Mohamed',to_date('25-JUN-11', 'DD-MON-RR'),'M','CP');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('hervel','Herve','Sofia',to_date('25-MAY-09', 'DD-MON-RR'),'F','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('le rouo','Le roux','Aaron',to_date('25-MAY-13', 'DD-MON-RR'),'M','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('renaulp','Renault','Margot',to_date('25-MAY-14', 'DD-MON-RR'),'F','PS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('vasseun','Vasseur','Sofia',to_date('25-OCT-09', 'DD-MON-RR'),'M','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('pereirs','Pereira','Léo',to_date('25-SEP-12', 'DD-MON-RR'),'M','GS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('benoitm','Benoit','Simon',to_date('26-DEC-08', 'DD-MON-RR'),'M','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('malletm','Mallet','Timéo',to_date('26-JUL-08', 'DD-MON-RR'),'M','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('marechl','Marechal','Antoine',to_date('26-MAR-09', 'DD-MON-RR'),'M','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('boulanl','Boulanger','Jules',to_date('26-NOV-09', 'DD-MON-RR'),'M','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('royera','Royer','Alexandre',to_date('27-APR-09', 'DD-MON-RR'),'M','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('gomezl','Gomez','Robin',to_date('28-APR-11', 'DD-MON-RR'),'M','CP');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('gillett','Gillet','Louna',to_date('28-JUN-08', 'DD-MON-RR'),'F','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('humbers','Humbert','Louise',to_date('28-JUN-14', 'DD-MON-RR'),'F','PS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('collinl','Collin','Noah',to_date('28-OCT-11', 'DD-MON-RR'),'M','CP');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('poulail','Poulain','Jules',to_date('28-OCT-11', 'DD-MON-RR'),'M','CP');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('poulail','Poulain','Eden',to_date('3-DEC-14', 'DD-MON-RR'),'M','PS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('poirier','Poirier','Rayan',to_date('3-FEB-14', 'DD-MON-RR'),'M','PS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('jacquer','Jacquet','Lou',to_date('3-JUN-08', 'DD-MON-RR'),'F','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('maillan','Maillard','Arthur',to_date('3-JUN-10', 'DD-MON-RR'),'M','CE1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('gomezl','Gomez','Charlotte',to_date('3-JUN-13', 'DD-MON-RR'),'F','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('pasquis','Pasquier','Mathis',to_date('4-AUG-10', 'DD-MON-RR'),'M','CE1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('hueta','Huet','Mathis',to_date('4-FEB-11', 'DD-MON-RR'),'M','CP');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('kleiny','Klein','Anna',to_date('4-JAN-12', 'DD-MON-RR'),'F','GS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('bouviet','Bouvier','Augustin',to_date('4-JUL-11', 'DD-MON-RR'),'F','CP');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('jacquer','Jacquet','Lucie',to_date('4-MAR-09', 'DD-MON-RR'),'F','CE2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('boulanl','Boulanger','Gabriel',to_date('4-SEP-07', 'DD-MON-RR'),'M','CM2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('remyc','Remy','Gabriel',to_date('4-SEP-14', 'DD-MON-RR'),'M','PS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('baillyl','Bailly','Yanis',to_date('5-OCT-10', 'DD-MON-RR'),'M','CE1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('aubryn','Aubry','Lola',to_date('6-AUG-11', 'DD-MON-RR'),'F','CP');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('poirier','Poirier','Paul',to_date('6-AUG-12', 'DD-MON-RR'),'M','GS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('maillan','Maillard','Lina',to_date('6-FEB-14', 'DD-MON-RR'),'F','PS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('cordies','Cordier','Margot',to_date('6-JUL-08', 'DD-MON-RR'),'F','CM1');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('carrec','Carre','Inaya',to_date('6-MAR-14', 'DD-MON-RR'),'F','PS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('dupuya','Dupuy','Rose',to_date('7-APR-14', 'DD-MON-RR'),'F','PS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('remyc','Remy','Romane',to_date('7-AUG-07', 'DD-MON-RR'),'F','CM2');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('bouchel','Boucher','Mila',to_date('7-JUN-13', 'DD-MON-RR'),'F','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('hueta','Huet','Clémence',to_date('7-MAY-13', 'DD-MON-RR'),'F','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('dupuya','Dupuy','Sarah',to_date('8-APR-12', 'DD-MON-RR'),'F','GS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('vasseun','Vasseur','Anaïs',to_date('8-MAR-11', 'DD-MON-RR'),'F','CP');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('maillan','Maillard','Lenny',to_date('9-JAN-12', 'DD-MON-RR'),'M','GS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('baillyl','Bailly','Rayan',to_date('9-JUN-13', 'DD-MON-RR'),'M','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('ensimap','Ensimag','Enfant1',to_date('9-JUN-11', 'DD-MON-RR'),'M','CP');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('ensimap','Ensimag','Enfant2',to_date('9-JUN-13', 'DD-MON-RR'),'M','MS');
INSERT INTO TENFANT (LOGIN, NOM, PRENOM, DATEN, GENRE, SECTION) VALUES ('ensimap','Ensimag','Enfant3',to_date('9-JUN-09', 'DD-MON-RR'),'M','CE2');


INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Cantine', 'LUNDI', '2,5');
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Cantine', 'MARDI', '2,5');
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Cantine', 'MERCREDI', '2,5');
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Cantine', 'JEUDI', '2,5');
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Cantine', 'VENDREDI', '2,5');
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie0', 'LUNDI', '1');
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie0', 'MARDI', '1');
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie1', 'MARDI', '1');
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie2', 'MARDI', '1'); 
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie3', 'MARDI', '1');
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie4', 'MARDI', '1'); 
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie1', 'LUNDI', '1'); 
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie2', 'LUNDI', '1'); 
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie3', 'LUNDI', '1'); 
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie4', 'LUNDI', '1'); 
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie0', 'JEUDI', '1'); 
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie1', 'JEUDI', '1'); 
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie2', 'JEUDI', '1'); 
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie3', 'JEUDI', '1'); 
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie4', 'JEUDI', '1'); 
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie0', 'VENDREDI', '1'); 
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie1', 'VENDREDI', '1'); 
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie2', 'VENDREDI', '1'); 
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie3', 'VENDREDI', '1'); 
INSERT INTO TANIMATION (ACTIVITE, JOUR, PRIX) VALUES ('Garderie4', 'VENDREDI', '1'); 

INSERT INTO TREGIME VALUES ('Végétarien');
INSERT INTO TREGIME VALUES ('Végétalien');
INSERT INTO TREGIME VALUES ('Sans Restriction');
INSERT INTO TREGIME VALUES ('Hallal');
INSERT INTO TREGIME VALUES ('Kasher');

INSERT INTO TSECTION VALUES ('PS');
INSERT INTO TSECTION VALUES ('MS');
INSERT INTO TSECTION VALUES ('GS');
INSERT INTO TSECTION VALUES ('CP');
INSERT INTO TSECTION VALUES ('CE1');
INSERT INTO TSECTION VALUES ('CE2');
INSERT INTO TSECTION VALUES ('CM1');
INSERT INTO TSECTION VALUES ('CM2');

INSERT INTO TPERIODE VALUES ('01-SEP-18', '01-DEC-18');

INSERT INTO TANIMATEUR VALUES ('Martin', 'Rose');
INSERT INTO TANIMATEUR VALUES ('Roux', 'Anais');
INSERT INTO TANIMATEUR VALUES ('Thomas', 'Samuel');
INSERT INTO TANIMATEUR VALUES ('Petit', 'Lucas');
INSERT INTO TANIMATEUR VALUES ('Durand', 'Léa');
INSERT INTO TANIMATEUR VALUES ('Robert', 'Alexandre');




