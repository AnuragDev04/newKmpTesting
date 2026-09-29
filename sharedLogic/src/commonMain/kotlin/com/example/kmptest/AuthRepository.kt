package com.example.kmptest

import kotlinx.coroutines.delay

class AuthRepository {
    suspend fun login(email: String, password: String): Result<Unit>{
        delay(100)
        return if(email=="user@test.com" && password=="password123"){
            Result.success(Unit)
        }else{
            Result.failure(Exception("Invalid email or password"))
        }

    }
}