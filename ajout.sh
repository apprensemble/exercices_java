#!/usr/bin/env bash
choix=1;
while [ "$choix" ];
do
  echo "r->regex;f->fin;p->phrase;e->executer;s->sauvegarder"
  read choix
  if [ "$choix" == "f" ];then exit 0;fi
  if [ "$choix" == "r" ];then
    echo "veuillez entrer une regex : "
    read regex
    echo "regex : $regex"
  fi
  if [ "$choix" == "p" ];then
    echo "veuillez entrer une phrase"
    read phrase
    echo "phrase : $phrase"
  fi
  if [ "$choix" == "e" ];then
    echo "execution $regex sur $phrase"
    java Regme "$phrase" "$regex"
  fi
  if [ "$choix" == "s" ];then
    echo "sauvegarde vers le fichier \"reponse\"?"
    read sauv
    if [ "$sauv" == "o" ];then
      dest=reponse
    else
      echo "nom fichier destination?"
      read dest
      echo $dest
    fi
    echo "commentaire : "
    read commentaire
    echo "echo $commentaire">>$dest
    echo "java Regme \"$phrase\" \"$regex\"">>$dest
  fi
done
