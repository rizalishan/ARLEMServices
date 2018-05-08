@extends("mail")
@section("content")
    <b>Forgot Password!</b><br/><br/>
    Please verify your account to change your password.<br/><br/>
    {{ $code }}
    Thanks,<br/>
@endsection

