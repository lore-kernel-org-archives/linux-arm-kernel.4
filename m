Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED037606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 16:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cljszXj/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UPLq6v8R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kUgrgwbIAJZqykyVFH7B082507Cz9Cbb4X4NmbAHYNU=; b=cljszXj/Kx/GyivFMSM+9CoYXl
	dFj+RDvvQrNkQ1Pa9yPCm/6MncKDM/Ay/8/fDdf3va2ZvhqDnBCwe66J0c7rfJb1JggCqHMmXRko7
	X/IxXDa4bYHcDsQ4+LA7G7RDxaPH41NmY2F60BRogA3BlZqQGdhFoCMcUJMBmnd/Axx7KzZ1MDAuz
	qmLG2rmaUXDuQgoVi6LW9PPHxLBQYSqmVMLwxfAub9+FOu9qLKxKlMNLUeCl4MuZTsXYq7rMkuTJT
	DtrDEQFdbFQoZKUaoJsrTZgSrCRpoZD+Tu/8FEWnSfyx2aYR4NaDKT3W+NE9at7xp0V+NKUl0E7oD
	lWQJxNUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUR8K-0000000FVyD-31tJ;
	Fri, 20 Nov 2026 16:06:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUR8J-0000000FVxv-0JjE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 16:06:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 4A262623EC;
	Fri, 20 Nov 2026 16:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 534421F000C4;
	Fri, 20 Nov 2026 16:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795190797;
	bh=kUgrgwbIAJZqykyVFH7B082507Cz9Cbb4X4NmbAHYNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UPLq6v8R9jO2AcjARnKfPzjLMJXSG+pHCQCnuCLw4ptOS0XtZKF4kc3yI1PktvKQ0
	 Tyf8YGc7cyHc2Ddl90VOLSHFZ9TIJ8p/P5t4UL3CNGMYf2ANBOs5TWoyC+JBvzI9Yv
	 qcUwRIQ+s5nqvIKcbOdFBYtn7CsRnkJPEZD1Mnc29/aeQ0BTXvADFK0BT94Ghotnmz
	 i4ispBoSIKXrt1E6aa8R9Ym7oirKZTtrLvLfmoazapoXkftnVIKYL5o7TqC7BRsF89
	 uoCUvWYYU4Oo6y58UM53dZ283iVHl5hrJuDS7A8Tw5jrt/RYWBjFdFqYo/ZXjlwbHI
	 JNYe7OCJ9GmYA==
Date: Fri, 20 Nov 2026 17:06:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pwm: atmel-tcb: Fix the channel restart write on resume
Message-ID: <awBvPEph3wqbEqxV@monoceros>
References: <20261112071615.154385-1-zhujun2@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d6zp3rsvlu3kvp7g"
Content-Disposition: inline
In-Reply-To: <20261112071615.154385-1-zhujun2@cmss.chinamobile.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--d6zp3rsvlu3kvp7g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: atmel-tcb: Fix the channel restart write on resume
MIME-Version: 1.0

On Thu, Nov 12, 2026 at 03:16:15PM +0800, Zhu Jun wrote:
> atmel_tcb_pwm_resume() passes the start command as the register address
> and the channel control register offset as the value. The command is
> 0x5, which is not an aligned register address, so regmap rejects the
> write and an enabled PWM channel is not restarted after resume.
>=20
> Pass the channel control register first and the clock-enable and
> software-trigger bits second.
>=20
> Fixes: 061f8572a31c ("pwm: atmel-tcb: Switch to new binding")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

Thanks
Uwe

--d6zp3rsvlu3kvp7g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsAcAgACgkQj4D7WH0S
/k4BwggAiMnDPMxSpZjzXiPJ1MiGu7Of5KGOAOXIUiQgseggdhpkQXB4W5dImuRm
cCBhD8ooc0C/+xbFDtlF0liSsMf5zmKaAXE6MfC6H0S8Zi4eiwSMKc7w13TxrXOP
wIYEeo7hD3IRFmgSwRU1ahr/8zIelyqgQS0jo1Jni04AuSyN+FPuYrX9fPBoWAAC
PtvzIALwAahKhBGs4o7kK1xJ0BXAMTF9DLxnNWfGKoh0asx6PPH7JuMoM0aFgET5
h6m81LR5GhMjiCglHdMEj38Hbpxmqm+KhQqXf+S7DMUlQoTc4BlB/x4XLGMTX1na
ROT6so46f8hJl3iSIZzpmoQMd6QPRA==
=jUVf
-----END PGP SIGNATURE-----

--d6zp3rsvlu3kvp7g--

