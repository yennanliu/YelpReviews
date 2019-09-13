"""create table user

Revision ID: 7f660573eff6
Revises: f343a4f63232
Create Date: 2019-09-13 23:09:24.156804

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '7f660573eff6'
down_revision = 'f343a4f63232'
branch_labels = None
depends_on = None


def upgrade():
    op.create_table(
    'user',
    sa.Column('user_id', sa.String(100), primary_key=True),
    sa.Column('name', sa.String(50), nullable=False),
    sa.Column('review_count', sa.Integer(), nullable=False),
    sa.Column('yelping_since', sa.String(50), nullable=False),
    sa.Column('useful', sa.Integer(),  nullable=False),
    sa.Column('funny', sa.Integer(),  nullable=False),
    sa.Column('cool', sa.Integer(),  nullable=False),
    sa.Column('elite', sa.String(length=100), nullable=False),
    sa.Column('friends',sa.dialects.mysql.LONGTEXT(), nullable=False),
    sa.Column('fans', sa.Integer(), nullable=False),
    sa.Column('average_stars', sa.VARCHAR(length=10), nullable=False),
    sa.Column('compliment_hot', sa.VARCHAR(length=10), nullable=False),
    sa.Column('compliment_more', sa.VARCHAR(length=10), nullable=False),
    sa.Column('compliment_profile', sa.VARCHAR(length=10), nullable=False),
    sa.Column('compliment_cute', sa.VARCHAR(length=10), nullable=False),
    sa.Column('average_stars', sa.VARCHAR(length=10), nullable=False),
    sa.Column('compliment_list', sa.VARCHAR(length=10), nullable=False),
    sa.Column('compliment_note', sa.VARCHAR(length=10), nullable=False),
    sa.Column('compliment_plain', sa.VARCHAR(length=10), nullable=False),
    sa.Column('compliment_cool', sa.VARCHAR(length=10), nullable=False),
    sa.Column('compliment_funny', sa.VARCHAR(length=10), nullable=False),
    sa.Column('compliment_writer', sa.VARCHAR(length=10), nullable=False),
    sa.Column('compliment_photos', sa.VARCHAR(length=10), nullable=False),
    sa.PrimaryKeyConstraint('user_id') 
    )


def downgrade():
    op.drop_table('user')
