"""create table business

Revision ID: 801c677b6731
Revises: 
Create Date: 2019-09-13 18:59:21.688482

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '801c677b6731'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    op.create_table(
    'business',
    sa.Column('business_id', sa.String(100), primary_key=True),
    sa.Column('name', sa.VARCHAR(length=2048), nullable=True),
    sa.Column('address', sa.dialects.mysql.LONGTEXT(), nullable=True),
    sa.Column('city', sa.String(length=100), nullable=True),
    sa.Column('state', sa.String(length=20), nullable=True),
    sa.Column('postal_code', sa.String(length=50), nullable=True),
    sa.Column('latitude', sa.String(length=20), nullable=True),
    sa.Column('longitude', sa.String(length=20), nullable=True),
    sa.Column('stars', sa.Integer(), nullable=True),
    sa.Column('review_count', sa.Integer(), nullable=True),
    sa.Column('is_open', sa.BOOLEAN(), nullable=True),
    sa.Column('attributes', sa.VARCHAR(length=2048), nullable=True),
    sa.Column('categories', sa.VARCHAR(length=2048), nullable=True),
    sa.Column('hours',sa.VARCHAR(length=2048), nullable=True),
    sa.PrimaryKeyConstraint('business_id') 
    )


def downgrade():
    op.drop_table('business')
