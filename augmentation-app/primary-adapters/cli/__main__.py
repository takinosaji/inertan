import click
from pymilvus import connections, db

@click.command()
@click.option('--host', '-h', default='127.0.0.1', help='Host')
@click.option('--port', '-p', default=19530, help='Port')
@click.option('--db_name', '-d', default='test', help='Database name')
def augment_command(host: str, port: str, db_name: str):
    connection_alias = 'default'
    connections.connect(
        host=host,
        port=port,
        alias=connection_alias)

    databases = db.list_database()

    if db_name not in databases:
        db.create_database(db_name)

    print(db.list_database())

    connections.disconnect(connection_alias)

if __name__ == '__main__':
    augment_command()