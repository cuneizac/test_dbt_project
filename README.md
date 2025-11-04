"# test_dbt_project" 

setup VSCode:
1. Create new project
2. Open Terminal:
    Create venv:
        >python -m venv dbt-env
    Activate venv:
        >dbt-env\Scripts\activate
    Install dbt
        (dbt-env)>pip install dbt-core dbt-snowflake
    Create profile (must match project name in step below)
        By default in user root dir\.dbt\profiles.yml
    Set env variables
        >$env:SNOWFLAKE_ACCOUNT = "xxxxxxx-xx99999"    
    Initialise dbt
        >dbt init project_name 
        ctrl + c if requires config - details in profile.yml
    Debug dbt    
        >cd project_name
        >dbt debug --target prod
    Run dbt
        >dbt run --target prod     





What dbt parse Does

dbt parse compiles and validates your dbt project without actually running any SQL on your warehouse.

It’s like a “dry run” that checks:

✅ Your project’s YAML and Jinja syntax

✅ Model references ({{ ref() }}, {{ source() }}, etc.)

✅ Macro definitions

✅ Configuration validity (e.g., no invalid keys or duplicate resource names)

✅ Tests and documentation blocks

✅ Whether the project graph can be built successfully