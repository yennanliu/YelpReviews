"""Create business table

Revision ID: 49be2135a2a8
Revises: 
Create Date: 2019-09-13 17:35:25.915202

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '49be2135a2a8'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    op.create_table(
    'business',
    sa.Column('business_id', sa.String(100), primary_key=True),
    sa.Column('name', sa.VARCHAR(length=1024), nullable=False),
    sa.Column('address', sa.String(length=100), nullable=False),
    sa.Column('city', sa.String(length=100), nullable=False),
    sa.Column('state', sa.String(length=20), nullable=False),
    sa.Column('postal_code', sa.String(length=50), nullable=False),
    sa.Column('latitude', sa.DECIMAL(precision=10, scale=0), nullable=False),
    sa.Column('longitude', sa.DECIMAL(precision=10, scale=0), nullable=False),
    sa.Column('stars', sa.Integer(), nullable=False),
    sa.Column('review_count', sa.Integer(), nullable=False),
    sa.Column('is_open', sa.BOOLEAN(), nullable=False),
    sa.Column('attributes', sa.VARCHAR(length=1024), nullable=False),
    sa.Column('categories', sa.VARCHAR(length=1024), nullable=False),
    sa.Column('hours',sa.VARCHAR(length=1024), nullable=False),
    sa.PrimaryKeyConstraint('business_id') 
    )


def downgrade():
    op.drop_table('business')
