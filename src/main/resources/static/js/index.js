const logout = async () => {
    const res = await fetch('/api/logout', {method: 'POST'});
    if (res.ok) window.location.href = "/";
}