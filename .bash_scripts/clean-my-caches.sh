#!/usr/bin/env bash

rm -r "${XDG_CACHE_HOME:?}"/*
rm -r "${APPLICATION_SUPPORT:?}"/Slack/Cache/*
rm -r "${APPLICATION_SUPPORT:?}"/Slack/Code\ Cache/*
rm -r "${APPLICATION_SUPPORT:?}"/Slack/Service\ Worker/CacheStorage/*
rm -r "${APPLICATION_SUPPORT:?}"/Slack/Service\ Worker/ScriptCache/*


rm -r "${APPLICATION_SUPPORT:?}"/Code/Cache/*
rm -r "${APPLICATION_SUPPORT:?}"/Code/Code\ Cache/*
rm -r "${APPLICATION_SUPPORT:?}"/Code/CachedData/*
rm -r "${APPLICATION_SUPPORT:?}"/Code/Service\ Worker/CacheStorage/*
rm -r "${APPLICATION_SUPPORT:?}"/Code/Service\ Worker/ScriptCache/*

rm -r "${APPLICATION_SUPPORT:?}"/Microsoft/Teams/Cache/*
rm -r "${APPLICATION_SUPPORT:?}"/Microsoft/Teams/Code\ Cache/*
rm -r "${APPLICATION_SUPPORT:?}"/Microsoft/Teams/Service\ Worker/CacheStorage/*
rm -r "${APPLICATION_SUPPORT:?}"/Microsoft/Teams/Service\ Worker/ScriptCache/*

rm -r "${APPLICATION_SUPPORT:?}"/Google/Chrome/Default/Service\ Worker/CacheStorage/*
rm -r "${APPLICATION_SUPPORT:?}"/Google/Chrome/Default/Service\ Worker/ScriptCache/*
rm -r "${APPLICATION_SUPPORT:?}"/Google/Chrome/Profile\ 2/Service\ Worker/CacheStorage/*
rm -r "${APPLICATION_SUPPORT:?}"/Google/Chrome/Profile\ 2/Service\ Worker/ScriptCache/*
rm -r "${APPLICATION_SUPPORT:?}"/Google/Chrome/Profile\ 3/Service\ Worker/CacheStorage/*
rm -r "${APPLICATION_SUPPORT:?}"/Google/Chrome/Profile\ 3/Service\ Worker/ScriptCache/*
rm -r "${APPLICATION_SUPPORT:?}"/Google/Chrome/Profile\ 4/Service\ Worker/CacheStorage/*
rm -r "${APPLICATION_SUPPORT:?}"/Google/Chrome/Profile\ 4/Service\ Worker/ScriptCache/*