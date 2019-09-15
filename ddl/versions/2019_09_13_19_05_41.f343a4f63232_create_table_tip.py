"""create table tip

Revision ID: f343a4f63232
Revises: 7042637a71f0
Create Date: 2019-09-13 19:05:41.862805

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'f343a4f63232'
down_revision = '7042637a71f0'
branch_labels = None
depends_on = None


def upgrade():
    op.create_table(
    'tip',
    sa.Column('tip_id', sa.String(100),primary_key=True),
    sa.Column('user_id', sa.String(100)),
    sa.Column('business_id', sa.String(100)),
    sa.Column('text', sa.dialects.mysql.LONGTEXT()),
    sa.Column('date', sa.String(50), nullable=True),
    sa.Column('compliment_count', sa.Integer()),
    sa.PrimaryKeyConstraint('tip_id') 
    )



def downgrade():
    op.drop_table('tip')
