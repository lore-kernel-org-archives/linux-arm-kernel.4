Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C572606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 23:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xQzEptkZ;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Ku/us/nu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vhRGA5stCNe5n0EWpCuQMaKiuxZMQFmZwfvJS2nbnJs=; b=xQzEptkZ6jifnf6Xrvo42gU/RD
	1myvnAFlACNqIhNN6xI9IiTons9OtN5zMp9vDWVi7Y61e5fiI1fp30ohprMj1MotCCvYjaR18dw9N
	yUeqyrww/axsDs90mFzbPynTb1xxxz/GdL103ZC2xj4UJcgB71BVzT+aXN+RaHfI8LblfqHihkHJS
	faPZAW4tK+pqJROPAZQZlSELcnOXa+a6afjz6lg/4yK3FaFFTCBGGn6ZH0E/CNIaftdPiaRzy1yzp
	DWtq1YuCjeRFOMuOPgu47uIAlCUpzhnKcwKYfXfNYI9Xdo1OEeBHlYEjwyC99ZN/HeanIdNaRzsIg
	MleqJALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXib-0000000GNXZ-0Mkg;
	Fri, 20 Nov 2026 23:08:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXiV-0000000GNWk-2l1O;
	Fri, 20 Nov 2026 23:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795216105;
	bh=vhRGA5stCNe5n0EWpCuQMaKiuxZMQFmZwfvJS2nbnJs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Ku/us/nudTVXa1sGIDwmBnCyhJyIoDqC4IqMpZYBnsH2YKz7i1ub6EJ56VVQgHVrl
	 0e/bcAlozEsdha+oA5ioGWJSmKVtCutMBs7wjIUZvns9QtrIyl8CNewH6M6Pus6CRQ
	 8mdOuNZSnMV7Gq6x3HrE2CdQjODP2/Z/2bVjgh2yeemw02C3CrW7Hn4upUr1jfvbfF
	 7tLgaeNvQUWY5bb9SKy1sRX9AEL2/AxIxXD7nI2aU69EWPnhNch3xJH7oonhuzVJhy
	 MUtVG90XUwxdbfL57SVZYUU8tuTmkyGlMbfeCzs178gL6JvPoIQ6JSSkjSMfTrqmwt
	 IdJPAMXe0mldg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 737EB17E031D;
	Sat, 21 Nov 2026 00:08:23 +0100 (CET)
Message-ID: <fd7d38bfd2e6b3ba56422c0f14ccf46f6f1bea6d.camel@collabora.com>
Subject: Re: [PATCH v3] media: rkvdec: Handle interrupts without a current
 context
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Alex Kazinsky <a.kazinsky@ideco.ru>, Detlev Casanova
	 <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	lvc-project@linuxtesting.org
Date: Fri, 20 Nov 2026 18:08:22 -0500
In-Reply-To: <20261113102456.4155237-1-a.kazinsky@ideco.ru>
References: <20261113102456.4155237-1-a.kazinsky@ideco.ru>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-voWmVM1frdbreVTmWmdK"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_150827_935047_883C346B 
X-CRM114-Status: GOOD (  10.06  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-voWmVM1frdbreVTmWmdK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 13 novembre 2026 =C3=A0 14:24 +0400, Alex Kazinsky a =C3=A9crit=
=C2=A0:
> The watchdog can finish the current job before the threaded IRQ handler
> retrieves its context. In that case, v4l2_m2m_get_curr_priv() returns NUL=
L,
> but the variant IRQ handlers unconditionally dereference ctx->dev.
>=20
> Pass only the device pointer to the variant IRQ handlers, so they can
> acknowledge interrupts without accessing the current context. Retrieve
> the context inside rkvdec_job_finish() instead. In the IRQ path, this
> happens only after successfully cancelling the watchdog, while the job
> is still active.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: f9c7b7deeffd ("media: rkvdec: Support per-variant interrupt handle=
r")
> Signed-off-by: Alex Kazinsky <a.kazinsky@ideco.ru>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-voWmVM1frdbreVTmWmdK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawDS5gAKCRDZQZRRKWBy
9N/xAP93QEhfxMoixZ27CiEovcLw6efRsiOmrPrLVvLdjDXqVwD/Y19TZSzDEVqi
qmeVvZAq3Glew2P4GvsejKJZnuBWiQI=
=hXHK
-----END PGP SIGNATURE-----

--=-voWmVM1frdbreVTmWmdK--

