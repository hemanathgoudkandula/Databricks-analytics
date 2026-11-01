with 

source as (

    select * from {{ source('claims_source', 'diagnosis') }}

),

renamed as (

    select
        claim_id,
        patient_id,
        date_service,
        date_service_end,
        diagnosis_code,
        diagnosis_qual,
        admit_diagnosis_ind

    from source

)

select * from renamed