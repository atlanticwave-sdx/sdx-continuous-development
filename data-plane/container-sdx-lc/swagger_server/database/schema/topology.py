""" topology model """
import enum

from swagger_server.database import db
from swagger_server.models import Topology, PaginatedResponseData


class Status(enum.Enum):
    """ status """
    done = "done"
    late = "late"
    in_progress = "in progress"
    to_do = "to do"


class TopologyModel(db.Model):
    """ topology model """
    __tablename__ = "topology"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64))
    description = db.Column(db.String(256), nullable=True)
    due_date = db.Column(db.Date, nullable=True)
    status = db.Column(db.Enum(Status), nullable=False)

    def to_obj(self) -> Topology:
        """ topology """
        return Topology(
            id=self.id,
            name=self.name,
            description=self.description,
            due_date=self.due_date,
            status=self.status.value,
        )

    def __repr__(self):
        """ repr """
        return "<Topology %r>" % self.name

    @classmethod
    def from_obj(cls, obj: Topology) -> "TopologyModel":
        """ from obj """
        return cls(
            id=obj.id,
            name=obj.name,
            description=obj.description,
            due_date=obj.due_date,
            status=Status(obj.status),
        )

    def save(self):
        """ save """
        db.session.add(self)
        db.session.commit()

    @classmethod
    def get_all(cls, page: int = 1, size: int = 20, status: str = None):
        """ get all """
        if status:
            query = cls.query.filter_by(status=Status(status)).paginate(
                page, size, False
            )
        else:
            query = cls.query.paginate(page, size, False)
        total = query.total
        items = query.items
        return PaginatedResponseData(
            page=page,
            size=size,
            total=total,
            count=len(items),
            resources=[i.to_obj() for i in items],
        )

    @classmethod
    def get_by_id(cls, _id: str) -> Topology:
        """ get by id """
        res = cls.query.filter_by(id=_id).first_or_404()
        return res.to_obj()

    @classmethod
    def update_by_id(cls, _id: str, body: Topology):
        """ update by id """
        _ = cls.query.filter_by(id=_id).first_or_404()
        cls.from_obj(body).save()

    @classmethod
    def delete_by_id(cls, _id: str):
        """ delete by id """
        res = cls.query.filter_by(id=_id).first_or_404()
        db.session.delete(res)
        db.session.commit()
        return res.to_obj()
