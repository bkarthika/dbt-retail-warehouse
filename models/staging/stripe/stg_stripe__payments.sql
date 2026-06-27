with source as (

    select * from raw.stripe.payments

),

renamed as (

    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status as payment_status,
        amount as payment_amount,
        created as payment_created

    from source

)

select * from renamed