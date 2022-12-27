FROM python:3.10 as builder
RUN pip wheel --no-cache-dir --no-deps --wheel-dir /wheels Flask Psycopg2-binary ConfigParser

FROM python:3.10-slim
COPY --from=builder /wheels /wheels
RUN pip install --no-cache /wheels/*
ENTRYPOINT ["python", "/srv/app/web.py"]