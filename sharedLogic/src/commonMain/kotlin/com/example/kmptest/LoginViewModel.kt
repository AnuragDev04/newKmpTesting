package com.example.kmptest

import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class LoginViewModel {
    private val repository = AuthRepository()
    private val scope = CoroutineScope(Dispatchers.Main)

    var state: LoginState = LoginState()
        private set

    var onStateChanged: ((LoginState) -> Unit)? = null

    fun updateEmail(value: String){update(state.copy(email = value))}
    fun updatePassword(value: String){ update(state.copy(password=value))}

    fun login() {
        val error = validateCredentials(state.email, state.password)
        if (error != null){
            update(state.copy(error=error))
            return
        }
        scope.launch {
            update(state.copy(isLoading = true, error = null))
            val result = repository.login(state.email, state.password)
            update(
                if(result.isSuccess) state.copy(isLoading = false, isSuccess = true)
                else state.copy(isLoading = false, error = result.exceptionOrNull()?.message)
            )
        }
    }
    private fun update(newState: LoginState){
        state = newState
        onStateChanged?.invoke(newState)
    }
}