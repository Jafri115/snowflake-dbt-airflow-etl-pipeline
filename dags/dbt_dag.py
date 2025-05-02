from datetime import datetime, timedelta
from cosmos import DbtDag, ProjectConfig, ProfileConfig, ExecutionConfig
from cosmos.profiles import SnowflakeUserPasswordProfileMapping

dbt_snowflake_dag = DbtDag(
    project_config=ProjectConfig(
        dbt_project_path="/usr/local/airflow/dags/data_pipeline"
    ),
    profile_config=ProfileConfig(
        profile_name="default",
        target_name="dev",
        profile_mapping=SnowflakeUserPasswordProfileMapping(
            conn_id="snowflake_conn",
            profile_args={
                "schema": "dbt_schema",
                "database": "dbt_db"
            }
        )
    ),
    execution_config=ExecutionConfig(
        dbt_executable_path="/usr/local/bin/dbt"
    ),
    start_date=datetime.utcnow() - timedelta(days=1),
    schedule=None,
    catchup=False,
    dag_id="dbt_snowflake_dag"
)
