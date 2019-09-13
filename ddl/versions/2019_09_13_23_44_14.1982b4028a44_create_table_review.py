"""create table review

Revision ID: 1982b4028a44
Revises: 7f660573eff6
Create Date: 2019-09-13 23:44:14.321308

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '1982b4028a44'
down_revision = '7f660573eff6'
branch_labels = None
depends_on = None


def upgrade():
    op.create_table(
    'review',
    sa.Column('review_id', sa.String(50),primary_key=True),
    sa.Column('user_id', sa.String(100)),
    sa.Column('business_id', sa.String(100)),
    sa.Column('stars', sa.Integer(),  nullable=False),
    sa.Column('useful', sa.Integer(),  nullable=False),
    sa.Column('funny', sa.Integer(),  nullable=False),
    sa.Column('cool', sa.Integer(),  nullable=False),
    sa.Column('text', sa.dialects.mysql.LONGTEXT()),
    sa.Column('date', sa.String(30), autoincrement=False, nullable=True),
    sa.PrimaryKeyConstraint('review_id') 
    )


def downgrade():
    op.drop_table('review')
