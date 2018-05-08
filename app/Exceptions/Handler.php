<?php

namespace App\Exceptions;

use Exception;
use PDOException;
use Illuminate\Validation\ValidationException;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Laravel\Lumen\Exceptions\Handler as ExceptionHandler;
use Symfony\Component\HttpKernel\Exception\HttpException;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that should not be reported.
     *
     * @var array
     */
    protected $dontReport = [
        AuthorizationException::class,
        //HttpException::class,
        ModelNotFoundException::class,
        //ValidationException::class,
    ];

    /**
     * Report or log an exception.
     *
     * This is a great spot to send exceptions to Sentry, Bugsnag, etc.
     *
     * @param  \Exception  $e
     * @return void
     */
    public function report(Exception $e)
    {
        parent::report($e);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Exception  $e
     * @return \Illuminate\Http\Response
     */
    public function render($request, Exception $exception)
    {
        if ($exception instanceof HttpException) {
            return response()->json(["message" => [trans("messages.".$exception->getStatusCode())]], $exception->getStatusCode());
        } else if($exception instanceOf ValidationException){
            return response()->json(["message" => $exception->response->original],401);
        } else if ($exception instanceof PDOException) {
            return response()->json(["message" => [trans("messages.500")]],500);
        } else if($exception instanceOf ValidationException){
            return response()->json(["message" => [$exception->getMessage()]],401);
        } else if(env('APP_ENV') == 'production') {
            return response()->json(["message" => [$exception->getMessage()]],500);
        }

        return parent::render($request, $exception);
    }
}
