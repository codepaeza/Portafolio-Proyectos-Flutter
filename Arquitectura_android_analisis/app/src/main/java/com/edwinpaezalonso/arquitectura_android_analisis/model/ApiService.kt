package com.edwinpaezalonso.arquitectura_android_analisis.model

import com.google.gson.JsonObject //para JsonObject
import retrofit2.Call  //para Call
import retrofit2.http.GET //para @GET


    interface ApiService {
        @GET("getOffers/")
        fun getCoupons(): Call<JsonObject>
    }
