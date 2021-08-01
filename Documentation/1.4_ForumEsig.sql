/*-----------------------------------------------
Script : ForumESIG.sql
Objet  : Création de la base de donnée du site
Auteur : Marco, Kayuran, Silvana

Mise à jour
Version    Visa       Date    Commentaires
-------- --------- ----------  -----------------
--  1.0            03/03/2021  Création
--  1.1            04/03/2021  Création des clés primaires / étrangères / Règles de gestion (4 premières)
--  1.2            11/03/2021  Finition creation de tables
--  1.3            18/03/2021  Modification de table FRM_PERSONNE etc..
--  1.4            25/03/2021  Re modification des tables car il y a eu un bug et rien n'a été enregistré (très bizarre)

------------------------------------------------
Règles de gestion

1: Lors de l’inscription les champs nom, prénom, pseudonyme, email et mot de passe sont obligatoires                
2: Le pseudonyme est unique.
3: La classe est soit ESIG1, soit ESIG2 ou Rien.             
4: Les noms et les prénoms commencent par une lettre majuscule suivi de minuscules.           
6: Le rôle est soit enseignant, soit étudiant.          
9: Le mail doit comporter un “@eduge.ch”.               
10:Le statut d’activité d’une personne est soit Actif soit Inactif.
11:Le rôle d’une personne est soit Utilisateur, soit Administration.               
12:La confidentialité d’un article est soit public soit privé.
13:Chaque article a comme appréciation : Like ou Dislike ou Rien.               
14:Chaque commentaire a comme appréciation : Like ou Dislike ou Rien.

-----------------------------------------------
Règles de gestion non implémentable

5: La date de naissance ne doit pas être supérieure à la date du jour.  
7: N’importe lequel des utilisateurs peut rédiger un article et un commentaire s’ils sont connectés au site.   
8: Lors de la création d’un compte sur le site un CAPTCHA devra être complété pour la protection à cause des bots, qui crée à la chaîne des comptes.

-----------------------------------------------*/

-- Suppression des tables

DROP TABLE FRM_DATE;
DROP TABLE FRM_ASSO_PARRAINAGE;
DROP TABLE FRM_COMMENTAIRE;
DROP TABLE FRM_ARTICLE;
DROP TABLE FRM_PERSONNE;
DROP TABLE FRM_SERVICE_TECHNIQUE;
DROP TABLE FRM_SUJET;
DROP TABLE FRM_ACTUALITE;

-----------------------------------------------

-- Création table FRM_ACTUALITE
   
CREATE TABLE FRM_ACTUALITE(
ACT_ID NUMBER(4) CONSTRAINT PK_FRM_ACTUALITE PRIMARY KEY,
ACT_NOUVEAUTE VARCHAR2(4000)
);

-----------------------------------------------

-- Création table FRM_SUJET
   
CREATE TABLE FRM_SUJET(
SUJ_ID NUMBER(4) CONSTRAINT PK_FRM_SUJET PRIMARY KEY,
SUJ_TITRE CHAR(50)
);

-----------------------------------------------

-- Création table FRM_SERVICE_TECHNIQUE
   
CREATE TABLE FRM_SERVICE_TECHNIQUE(
SVT_ID NUMBER(4) CONSTRAINT PK_FRM_SERVICE_TECHNIQUE PRIMARY KEY,
SVT_DESCRIPTION VARCHAR(500)
);

-----------------------------------------------

-- Création table FRM_PERSONNE
   
CREATE TABLE FRM_PERSONNE(
PER_ID NUMBER(4) CONSTRAINT PK_FRM_PERSONNE PRIMARY KEY,
PER_SVT_ID NUMBER(4)
	     CONSTRAINT FK_FRM_PERSONNE_SVT_ID REFERENCES FRM_SERVICE_TECHNIQUE(SVT_ID),
PER_PSEUDONYME CHAR(20) CONSTRAINT nnPER_PSEUDONYME NOT NULL --RG-1
       CONSTRAINT uqPER_PSEUDONYME UNIQUE, --RG-2
PER_NOM VARCHAR2(128) CONSTRAINT nnPER_NOM NOT NULL --RG-1,
       CONSTRAINT ckPER_NOM CHECK(SUBSTR(PER_NOM,1,1)=UPPER(SUBSTR(PER_NOM,1,1))),--RG-4
PER_PRENOM VARCHAR2(128) CONSTRAINT nnPER_PRENOM NOT NULL --RG-1,
       CONSTRAINT ckPER_PRENOM CHECK(SUBSTR(PER_PRENOM,1,1)=UPPER(SUBSTR(PER_PRENOM,1,1))),--RG-4
PER_EMAIL VARCHAR2(128) CONSTRAINT nnPER_EMAIL NOT NULL --RG-1,
CONSTRAINT ckPER_EMAIL CHECK (PER_EMAIL LIKE '%@eduge.ch'), --RG-9
PER_MDP VARCHAR2(128) CONSTRAINT nnPER_MDP NOT NULL, --RG-1,
PER_DATE_DE_NAISSANCE DATE,
PER_ROLE CHAR(32) CONSTRAINT ckPER_ROLE CHECK(PER_ROLE IN ('Administrateur' , 'Utilisateur')), --RG-11
PER_ACTIVITE CHAR(32)CONSTRAINT ckPER_ACTIVITE CHECK(PER_ACTIVITE IN ('Actif' , 'Inactif')),--RG-10
PER_CLASSE CHAR(32) CONSTRAINT ckPER_CLASSE CHECK(PER_CLASSE IN ('ESIG1','ESIG2','Rien')),--RG-3
PER_TYPE_PERSONNE CHAR(10)CONSTRAINT ckPER_TYPE_PERSONNE CHECK(PER_TYPE_PERSONNE IN ('Enseignant' , 'Etudiant')),--RG-6
PER_N_DIP CHAR(32) /*CONSTRAINT nPER_N_DIP NULL*/
);

-----------------------------------------------

-- Création table FRM_ARTICLE

CREATE TABLE FRM_ARTICLE(
ART_ID NUMBER(4) CONSTRAINT PK_FRM_ARTICLE PRIMARY KEY,
ART_SUJ_ID NUMBER(4)
	     CONSTRAINT FK_FRM_ARTICLE_SUJ_ID REFERENCES FRM_SUJET(SUJ_ID),
ART_PER_ID NUMBER(4)
	     CONSTRAINT FK_FRM_ARTICLE_PER_ID REFERENCES FRM_PERSONNE(PER_ID),
ART_NOMARTICLE CHAR(50),
ART_CONTENU VARCHAR2(4000),
ART_DATE DATE,
ART_APPRECIATION CHAR(7)CONSTRAINT ckART_APPRECIATION CHECK(ART_APPRECIATION IN ('Like' ,'Dislike','Rien')),--RG-13
ART_CONFIDENTIALITE CHAR(6)CONSTRAINT ckART_CONFIDENTIALITE CHECK(ART_CONFIDENTIALITE IN ('Public' , 'Privé'))--RG-12
);

-----------------------------------------------

-- Création table FRM_COMMENTAIRE
   
CREATE TABLE FRM_COMMENTAIRE(
COM_ID NUMBER(4) CONSTRAINT PK_FRM_COMMENTAIRE PRIMARY KEY,
COM_ART_ID NUMBER(4)
	     CONSTRAINT FK_FRM_COMMENTAIRE_ART_ID REFERENCES FRM_ARTICLE(ART_ID),
COM_PER_ID NUMBER(4)
    CONSTRAINT FK_FRM_COMMENTAIRE_PER_ID REFERENCES FRM_PERSONNE(PER_ID),
COM_CONTENU VARCHAR2(3000),
COM_DATE DATE,
COM_APPRECIATION CHAR(7)CONSTRAINT ckCOM_APPRECIATION CHECK(COM_APPRECIATION IN ('Like' ,'Dislike','Rien'))--RG-14
);

-----------------------------------------------

-- Création table FRM_ASSO_PARRAINAGE
   
CREATE TABLE FRM_ASSO_PARRAINAGE(
ASP_PER_PARRAIN_ID     NUMBER(4)
   CONSTRAINT   FKFRM_ASSO_PARRAINAGE_PARRAIN REFERENCES FRM_PERSONNE(PER_ID),
ASP_PER_FILLEUL_ID     NUMBER(4)
   CONSTRAINT   FKFRM_ASSO_PARRAINAGE_FILLEUL REFERENCES FRM_PERSONNE(PER_ID),
ASP_DATE_DEBUT_PARRAINAGE DATE,
CONSTRAINT PKFRM_ASSO_PARRAINAGE PRIMARY KEY (ASP_PER_PARRAIN_ID,ASP_PER_FILLEUL_ID)
);

-----------------------------------------------

-- Création table FRM_DATE

CREATE TABLE FRM_DATE(
DAT_ART_ID       NUMBER(4)
   CONSTRAINT   FKFRM_DATE_ARTICLE REFERENCES FRM_ARTICLE(ART_ID),
DAT_ACT_ID       NUMBER(4)
   CONSTRAINT   FKFRM_DATE_ACTUALITE REFERENCES FRM_ACTUALITE(ACT_ID),
DAT_DATE_CREATION DATE,
   CONSTRAINT PKFRM_DATE PRIMARY KEY (DAT_ART_ID, DAT_ACT_ID)
);

-----------------------------------------------
