from flask import Flask, request, jsonify
from openapi_core import create_spec
from openapi_core.validation.request.validators import RequestValidator
from openapi_core.contrib.flask import FlaskOpenAPIRequest
from openapi_spec_validator import validate_spec
from openapi_spec_validator.readers import read_from_filename
from werkzeug.exceptions import (BadRequest, Conflict, Forbidden,
                                 MethodNotAllowed, NotFound,
                                 UnsupportedMediaType)


app = Flask(__name__)

@app.route('/v1/validate', methods=['POST']) 
def myrequest():
    yml_file = "/Users/luismarin/api/flask/topology.yml"
    spec_dict, spec_url = read_from_filename(yml_file)
    try:
        spec_error = validate_spec(spec_dict)
    except ValueError as err:
        raise BadRequest(err) from err
    else:
        if spec_error:
            log.debug("spec_url %s", spec_url)
            raise BadRequest(spec_error) from spec_error
    spec = create_spec(spec_dict)
    print('################ spec ################')
    print(spec)
    try:
        data = request.json
    except BadRequest:
        result = "The request body is not a well-formed JSON."
        print("create_circuit result %s %s", result, 400)
        raise BadRequest(result) from BadRequest
    validator = RequestValidator(spec)
    print('################ validator ################')
    print(validator)
    openapi_request = FlaskOpenAPIRequest(request)
    print('################ openapi_request ################')
    print(openapi_request)
    result = validator.validate(openapi_request)
    print('################ result ################')
    print(result)
    if result.errors:
        errors = result.errors[0]
        if hasattr(errors, "schema_errors"):
            schema_errors = errors.schema_errors[0]
            error_response = {
                "error_message": schema_errors.message,
                "error_validator": schema_errors.validator,
                "error_validator_value": schema_errors.validator_value,
                "error_path": list(schema_errors.path),
                "error_schema": schema_errors.schema,
                "error_schema_path": list(schema_errors.schema_path),
            }
            print("error response: %s", error_response)
        else:
            error_response = (
                "The request body mimetype is not application/json."
            )
        raise BadRequest(error_response) from BadRequest
    return jsonify(data)


if __name__ == '__main__':
    app.run(debug=True)
