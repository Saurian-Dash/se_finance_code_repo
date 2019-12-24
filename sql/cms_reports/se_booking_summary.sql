-- SE CMS Booking Summary V5
SELECT
       b.id                           AS booking_id,
       o.id				    AS offer_id,
       s.id				    AS sale_id,
       b.unique_transaction_reference AS order_code,
       b.user_id                      AS user_id,
       b.affiliate_user_id            AS affiliate_user_id,
       b.payment_id                   AS payment_id,
       b.date_created                 AS date_created,
       b.completion_date              AS completion_date,
       b.last_updated                 AS last_updated,
       COALESCE(
              au.date_created,
              su.date_created
       )                              AS user_join_date,
       b.type                         AS booking_type,
       b.status                       AS booking_status,
       b.hold_id                      AS hold_id,
       b.payment_amount_type          AS payment_type,
       p.status                       AS payment_status,
       p.type                         AS payment_method,
       t.name                         AS territory,
       b.currency                     AS currency,
       b.booking_fee                  AS booking_fee,
       b.atol_fee                     AS atol_fee,
       p.surcharge                    AS payment_surcharge,
       Sum(c.amount)                  AS credit_amount,
       p.amount                       AS payment_amount
FROM
       secretescapes.booking b

       -- Get sale information --
       LEFT JOIN secretescapes.booking_allocations ba
              ON ba.booking_allocations_id = b.id
       LEFT JOIN secretescapes.allocation al
              ON al.id = ba.allocation_id
       LEFT JOIN secretescapes.offer o
              ON o.id = al.offer_id
       LEFT JOIN secretescapes.sale s
              ON s.id = o.sale_id

       -- Get payment information --
       LEFT JOIN secretescapes.payment p
              ON p.id = b.payment_id
       LEFT JOIN secretescapes.booking_credit bc
              ON bc.booking_credits_used_id = b.id
       LEFT JOIN secretescapes.credit c
              ON c.id = bc.credit_id

       -- Get territory information --
       LEFT JOIN secretescapes.affiliate_user au
              ON au.id = b.affiliate_user_id
       LEFT JOIN secretescapes.shiro_user su
              ON su.id = b.user_id
       LEFT JOIN secretescapes.affiliate a
              ON a.id = su.affiliate_id OR a.id = au.affiliate_id
       LEFT JOIN secretescapes.territory t
              ON t.id = a.territory_id

       -- Report filters --
WHERE b.status != 'ABANDONED'
       AND Year(b.date_created) = 2017
       AND Month(b.date_created) = 10
GROUP BY b.id
ORDER BY b.id;
