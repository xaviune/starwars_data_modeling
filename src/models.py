import os
import sys
from sqlalchemy import Column, ForeignKey, Integer, String, Date
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy import create_engine
from eralchemy2 import render_er

Base = declarative_base()

class Users(Base):
    __tablename__ = 'users'
    user_id = Column(Integer, primary_key=True)
    user_nickname = Column(String(20), nullable=False)
    user_password = Column(String(60), nullable=False)
    user_email = Column(String(50), nullable=False)
    user_name = Column(String(30), nullable=False)
    user_lastname = Column(String(30), nullable=False)
    user_datecreated = Column(Date(), nullable=False)

class Characters(Base):
    __tablename__ = 'characters'
    char_id = Column(Integer, primary_key=True)
    char_name = Column(String(20), nullable=False)
    char_url = Column(String(512), nullable=False)

class Planets(Base):
    __tablename__ = 'planets'
    planets_id = Column(Integer, primary_key=True)
    planets_name = Column(String(20), nullable=False)
    planets_url = Column(String(512), nullable=False)

class Favorite_Characters(Base):
    __tablename__ = 'favorite_characters'
    id = Column(Integer, primary_key=True)
    user_id = Column(Integer, ForeignKey('users.user_id'))
    char_id = Column(Integer, ForeignKey('characters.char_id'))

class Favorite_Planets(Base):
    __tablename__ = 'favorite_planets'
    id = Column(Integer, primary_key=True)
    user_id = Column(Integer, ForeignKey('users.user_id'))
    planet_id = Column(Integer, ForeignKey('planets.planet_id'))

    def to_dict(self):
        return {}

render_er(Base, 'diagram.png')
