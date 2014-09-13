# Character ROM
CharRom:
	.byte	0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80	# First 8 characters, blocks filled from left
	.byte	0xc0,0xc0,0xc0,0xc0,0xc0,0xc0,0xc0,0xc0
	.byte	0xe0,0xe0,0xe0,0xe0,0xe0,0xe0,0xe0,0xe0
	.byte	0xf0,0xf0,0xf0,0xf0,0xf0,0xf0,0xf0,0xf0

	.byte	0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8
	.byte	0xfc,0xfc,0xfc,0xfc,0xfc,0xfc,0xfc,0xfc
	.byte	0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe,0xfe
	.byte	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff

	.byte	0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01	# Chars 8 -> 15, blocks filled from right
	.byte	0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03
	.byte	0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07
	.byte	0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f

	.byte	0x1f,0x1f,0x1f,0x1f,0x1f,0x1f,0x1f,0x1f
	.byte	0x3f,0x3f,0x3f,0x3f,0x3f,0x3f,0x3f,0x3f
	.byte	0x7f,0x7f,0x7f,0x7f,0x7f,0x7f,0x7f,0x7f
	.byte	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff

	.byte	0x00,0x40,0x70,0x7c,0x7c,0x70,0x40,0x00	# Chars 16 -> 20 - arrows, right, left, up, down
	.byte	0x00,0x02,0x0e,0x3e,0x3e,0x0e,0x02,0x00
	.byte	0x00,0x18,0x18,0x3c,0x3c,0x7e,0x7e,0x00
	.byte	0x00,0x7e,0x7e,0x3c,0x3c,0x18,0x18,0x00

	.byte	0x00,0x06,0x06,0x0c,0xcc,0x78,0x38,0x00	# Char 20 - checkmark, Char 21 - cross
	.byte	0x00,0xc6,0x6c,0x38,0x38,0x6c,0xc6,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00	# SPACE
	.byte	0x18,0x18,0x18,0x18,0x18,0x00,0x18,0x00	# !
	.byte	0x6C,0x6C,0x00,0x00,0x00,0x00,0x00,0x00	# "
	.byte	0x6C,0x6C,0xFE,0x6C,0xFE,0x6C,0x6C,0x00	# #
	.byte	0x18,0x3E,0x60,0x3C,0x06,0x7C,0x18,0x00	# $
	.byte	0x00,0x66,0xAC,0xD8,0x36,0x6A,0xCC,0x00	# %
	.byte	0x38,0x6C,0x68,0x76,0xDC,0xCE,0x7B,0x00	# &
	.byte	0x18,0x18,0x30,0x00,0x00,0x00,0x00,0x00	# '
	.byte	0x0C,0x18,0x30,0x30,0x30,0x18,0x0C,0x00	# (
	.byte	0x30,0x18,0x0C,0x0C,0x0C,0x18,0x30,0x00	# )
	.byte	0x00,0x66,0x3C,0xFF,0x3C,0x66,0x00,0x00	# *
	.byte	0x00,0x18,0x18,0x7E,0x18,0x18,0x00,0x00	# +
	.byte	0x00,0x00,0x00,0x00,0x00,0x18,0x18,0x30	# ,
	.byte	0x00,0x00,0x00,0x7E,0x00,0x00,0x00,0x00	# -
	.byte	0x00,0x00,0x00,0x00,0x00,0x18,0x18,0x00	# .
	.byte	0x03,0x06,0x0C,0x18,0x30,0x60,0xC0,0x00	# /
	.byte	0x3C,0x66,0x6E,0x7E,0x76,0x66,0x3C,0x00	# 0
	.byte	0x18,0x38,0x78,0x18,0x18,0x18,0x18,0x00	# 1
	.byte	0x3C,0x66,0x06,0x0C,0x18,0x30,0x7E,0x00	# 2
	.byte	0x3C,0x66,0x06,0x1C,0x06,0x66,0x3C,0x00	# 3
	.byte	0x1C,0x3C,0x6C,0xCC,0xFE,0x0C,0x0C,0x00	# 4
	.byte	0x7E,0x60,0x7C,0x06,0x06,0x66,0x3C,0x00	# 5
	.byte	0x1C,0x30,0x60,0x7C,0x66,0x66,0x3C,0x00	# 6
	.byte	0x7E,0x06,0x06,0x0C,0x18,0x18,0x18,0x00	# 7
	.byte	0x3C,0x66,0x66,0x3C,0x66,0x66,0x3C,0x00	# 8
	.byte	0x3C,0x66,0x66,0x3E,0x06,0x0C,0x38,0x00	# 9
	.byte	0x00,0x18,0x18,0x00,0x00,0x18,0x18,0x00	# :
	.byte	0x00,0x18,0x18,0x00,0x00,0x18,0x18,0x30	# ;
	.byte	0x00,0x06,0x18,0x60,0x18,0x06,0x00,0x00	# <
	.byte	0x00,0x00,0x7E,0x00,0x7E,0x00,0x00,0x00	# =
	.byte	0x00,0x60,0x18,0x06,0x18,0x60,0x00,0x00	# >
	.byte	0x3C,0x66,0x06,0x0C,0x18,0x00,0x18,0x00	# ?
	.byte	0x7C,0xC6,0xDE,0xD6,0xDE,0xC0,0x78,0x00	# @
	.byte	0x3C,0x66,0x66,0x7E,0x66,0x66,0x66,0x00	# A
	.byte	0x7C,0x66,0x66,0x7C,0x66,0x66,0x7C,0x00	# B
	.byte	0x1E,0x30,0x60,0x60,0x60,0x30,0x1E,0x00	# C
	.byte	0x78,0x6C,0x66,0x66,0x66,0x6C,0x78,0x00	# D
	.byte	0x7E,0x60,0x60,0x78,0x60,0x60,0x7E,0x00	# E
	.byte	0x7E,0x60,0x60,0x78,0x60,0x60,0x60,0x00	# F
	.byte	0x3C,0x66,0x60,0x6E,0x66,0x66,0x3E,0x00	# G
	.byte	0x66,0x66,0x66,0x7E,0x66,0x66,0x66,0x00	# H
	.byte	0x3C,0x18,0x18,0x18,0x18,0x18,0x3C,0x00	# I
	.byte	0x06,0x06,0x06,0x06,0x06,0x66,0x3C,0x00	# J
	.byte	0xC6,0xCC,0xD8,0xF0,0xD8,0xCC,0xC6,0x00	# K
	.byte	0x60,0x60,0x60,0x60,0x60,0x60,0x7E,0x00	# L
	.byte	0xC6,0xEE,0xFE,0xD6,0xC6,0xC6,0xC6,0x00	# M
	.byte	0xC6,0xE6,0xF6,0xDE,0xCE,0xC6,0xC6,0x00	# N
	.byte	0x3C,0x66,0x66,0x66,0x66,0x66,0x3C,0x00	# O
	.byte	0x7C,0x66,0x66,0x7C,0x60,0x60,0x60,0x00	# P
	.byte	0x78,0xCC,0xCC,0xCC,0xCC,0xDC,0x7E,0x00	# Q
	.byte	0x7C,0x66,0x66,0x7C,0x6C,0x66,0x66,0x00	# R
	.byte	0x3C,0x66,0x70,0x3C,0x0E,0x66,0x3C,0x00	# S
	.byte	0x7E,0x18,0x18,0x18,0x18,0x18,0x18,0x00	# T
	.byte	0x66,0x66,0x66,0x66,0x66,0x66,0x3C,0x00	# U
	.byte	0x66,0x66,0x66,0x66,0x3C,0x3C,0x18,0x00	# V
	.byte	0xC6,0xC6,0xC6,0xD6,0xFE,0xEE,0xC6,0x00	# W
	.byte	0xC3,0x66,0x3C,0x18,0x3C,0x66,0xC3,0x00	# X
	.byte	0xC3,0x66,0x3C,0x18,0x18,0x18,0x18,0x00	# Y
	.byte	0xFE,0x0C,0x18,0x30,0x60,0xC0,0xFE,0x00	# Z
	.byte	0x3C,0x30,0x30,0x30,0x30,0x30,0x3C,0x00	# [
	.byte	0xC0,0x60,0x30,0x18,0x0C,0x06,0x03,0x00	# \
	.byte	0x3C,0x0C,0x0C,0x0C,0x0C,0x0C,0x3C,0x00	# ]
	.byte	0x10,0x38,0x6C,0xC6,0x00,0x00,0x00,0x00	# ^
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFE	# _
	.byte	0x18,0x18,0x0C,0x00,0x00,0x00,0x00,0x00	# `
	.byte	0x00,0x00,0x3C,0x06,0x3E,0x66,0x3E,0x00	# a
	.byte	0x60,0x60,0x7C,0x66,0x66,0x66,0x7C,0x00	# b
	.byte	0x00,0x00,0x3C,0x60,0x60,0x60,0x3C,0x00	# c
	.byte	0x06,0x06,0x3E,0x66,0x66,0x66,0x3E,0x00	# d
	.byte	0x00,0x00,0x3C,0x66,0x7E,0x60,0x3C,0x00	# e
	.byte	0x1C,0x30,0x7C,0x30,0x30,0x30,0x30,0x00	# f
	.byte	0x00,0x00,0x3E,0x66,0x66,0x3E,0x06,0x3C	# g
	.byte	0x60,0x60,0x7C,0x66,0x66,0x66,0x66,0x00	# h
	.byte	0x18,0x00,0x18,0x18,0x18,0x18,0x0C,0x00	# i
	.byte	0x0C,0x00,0x0C,0x0C,0x0C,0x0C,0x0C,0x78	# j
	.byte	0x60,0x60,0x66,0x6C,0x78,0x6C,0x66,0x00	# k
	.byte	0x18,0x18,0x18,0x18,0x18,0x18,0x0C,0x00	# l
	.byte	0x00,0x00,0xEC,0xFE,0xD6,0xC6,0xC6,0x00	# m
	.byte	0x00,0x00,0x7C,0x66,0x66,0x66,0x66,0x00	# n
	.byte	0x00,0x00,0x3C,0x66,0x66,0x66,0x3C,0x00	# o
	.byte	0x00,0x00,0x7C,0x66,0x66,0x7C,0x60,0x60	# p
	.byte	0x00,0x00,0x3E,0x66,0x66,0x3E,0x06,0x06	# q
	.byte	0x00,0x00,0x7C,0x66,0x60,0x60,0x60,0x00	# r
	.byte	0x00,0x00,0x3C,0x60,0x3C,0x06,0x7C,0x00	# s
	.byte	0x30,0x30,0x7C,0x30,0x30,0x30,0x1C,0x00	# t
	.byte	0x00,0x00,0x66,0x66,0x66,0x66,0x3E,0x00	# u
	.byte	0x00,0x00,0x66,0x66,0x66,0x3C,0x18,0x00	# v
	.byte	0x00,0x00,0xC6,0xC6,0xD6,0xFE,0x6C,0x00	# w
	.byte	0x00,0x00,0xC6,0x6C,0x38,0x6C,0xC6,0x00	# x
	.byte	0x00,0x00,0x66,0x66,0x66,0x3C,0x18,0x30	# y
	.byte	0x00,0x00,0x7E,0x0C,0x18,0x30,0x7E,0x00	# z
	.byte	0x0E,0x18,0x18,0x70,0x18,0x18,0x0E,0x00	# {
	.byte	0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x00	# |
	.byte	0x70,0x18,0x18,0x0E,0x18,0x18,0x70,0x00	# }
	.byte	0x72,0x9C,0x00,0x00,0x00,0x00,0x00,0x00	# ~
	.byte	0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0x00	#
#	END CharRom

