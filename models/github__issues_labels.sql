with issues as (
    select
        id as label_id,
        _airbyte_issues_hashid
    from {{ ref('stg_github_issues_tmp') }}

),

labels as (
    select 
        id as label_id,
        _airbyte_issues_hashid
    {{ ref('stg_github_labels_tmp') }}
),

issue_labels as (
    select 
        issue_id,
        label_id
    from issues
    left join labels on issues._airbyte_issues_hashid = labels._airbyte_issues_hashid
)

select * from issue_labels