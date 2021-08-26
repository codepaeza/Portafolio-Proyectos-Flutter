package com.edwinpaezalonso.arquitectura_android_analisis.model

import androidx.lifecycle.MutableLiveData

interface CouponRepository {
    fun getCoupons(): MutableLiveData<List<Coupon>>
    fun callCouponsAPI()
}