#!/bin/bash
psql -d postgres -f create_database.sql
psql -d inventomao -f initialize.sql