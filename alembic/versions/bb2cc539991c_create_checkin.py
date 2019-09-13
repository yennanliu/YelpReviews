"""create checkin

Revision ID: bb2cc539991c
Revises: 49be2135a2a8
Create Date: 2019-09-13 18:29:03.289144

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'bb2cc539991c'
down_revision = '49be2135a2a8'
branch_labels = None
depends_on = None


def upgrade():
    op.create_table(
    'checkin',
    sa.Column('business_id', sa.String(100), primary_key=True),
    sa.Column('date', sa.dialects.mysql.LONGTEXT(), nullable=False),
    sa.PrimaryKeyConstraint('business_id') 
    )


def downgrade():
    op.drop_table('checkin')
