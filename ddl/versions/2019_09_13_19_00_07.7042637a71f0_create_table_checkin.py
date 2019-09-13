"""create table checkin

Revision ID: 7042637a71f0
Revises: 801c677b6731
Create Date: 2019-09-13 19:00:07.674646

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '7042637a71f0'
down_revision = '801c677b6731'
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
