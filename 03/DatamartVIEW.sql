CREATE MATERIALIZED VIEW datamart.Datamart_Facts AS (
	SELECT t_client.client_tk,
    t_disposition.disp_k,
    t_district.district_tk,
    sum(t_loan.amount) AS total_amount,
    count(
        CASE
            WHEN t_loan.status = 'A'::bpchar THEN t_loan.status
            ELSE NULL::bpchar
        END) AS total_paid_finished,
    count(
        CASE
            WHEN t_loan.status = 'B'::bpchar THEN t_loan.status
            ELSE NULL::bpchar
        END) AS total_unpaid_finished,
    count(
        CASE
            WHEN t_loan.status = 'C'::bpchar THEN t_loan.status
            ELSE NULL::bpchar
        END) AS total_paid_unfinished,
    count(
        CASE
            WHEN t_loan.status = 'D'::bpchar THEN t_loan.status
            ELSE NULL::bpchar
        END) AS total_unpaid_unfinished
   FROM t_loan
     JOIN t_account ON t_account.account_tk = t_loan.account_id
     JOIN t_disposition ON t_disposition.account_id = t_account.account_tk
     JOIN t_client ON t_disposition.client_id = t_client.client_tk
     JOIN t_district ON t_client.district_id = t_district.district_tk
  GROUP BY t_loan.status, t_client.client_tk, t_disposition.disp_tk, t_district.district_tk
)

REFRESH MATERIALIZED VIEW datamart.Datamart_Facts