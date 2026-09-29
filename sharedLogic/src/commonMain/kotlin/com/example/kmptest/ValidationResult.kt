package com.example.kmptest

data class LoginState(
    val email: String="",
    val password: String="",
    val isLoading: Boolean=false,
    val error: String?=null,
    val isSuccess: Boolean=false
)

fun validateCredentials(email: String, password: String): String?=
    when{
        email.isBlank()->"Email con not be empty"
        !email.contains("@")-> "Invalid email format"
        password.length<6 -> "Password must be at least 6 characters"
        else-> null
    }