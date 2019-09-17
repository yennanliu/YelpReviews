"""create table user_attr

Revision ID: cc6a976c3102
Revises: 1982b4028a44
Create Date: 2019-09-18 00:54:09.531705

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'cc6a976c3102'
down_revision = '1982b4028a44'
branch_labels = None
depends_on = None


def upgrade():
    op.create_table(
    'user_attr',
    sa.Column('user_id', sa.String(100), primary_key=True),
    sa.Column('friend_count', sa.Integer(),  nullable=False),
    sa.PrimaryKeyConstraint('user_id') 
    )


def downgrade():
    op.drop_table('user_attr')
