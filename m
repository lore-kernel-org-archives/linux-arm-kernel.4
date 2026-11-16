Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7EB606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zMT0mdPf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WryHB1Y5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9qlmeEjjN/Hi5B1yhZatHZmrPx94agQrfT4eJRLAUHQ=; b=zMT0mdPfUyt2eUdQFJWXTwC4gS
	djpPD0uOp8vzJq/OFTI36Y+wij8X6lh0zr4hqhnV35+lG+zO2EerSmPRksOgseixZtxSHU2qEjvsg
	X9XOMczILjuyG6pof2f+XuPYc7n/8OlR37Hpy1kkqi8IrvQm6uejNFtlCdIm7RxRlCtnWLMFSKgg5
	za2RagK0ZFb1LABAZG0zN5IB0qpMYNprH3GTG8o3avbANylP9eUmRZEA+VaHhwhEq+4L3YxBpwkkW
	CupF6AuoAI7DoBGTc/tvd+5llBz9rfhpRq/cQMpxYWpgl9N3loDvthbDzjwgw/Hw3ubc4+E2+BroF
	37gRqYlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSt1R-00000001mI5-2QhZ;
	Mon, 16 Nov 2026 09:29:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSt1Q-00000001mHx-3Fgy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:29:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 3CFD543280;
	Mon, 16 Nov 2026 09:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 91AE21F000C4;
	Mon, 16 Nov 2026 09:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794821348;
	bh=9qlmeEjjN/Hi5B1yhZatHZmrPx94agQrfT4eJRLAUHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WryHB1Y5S8dXg39aRX1rQ50qwjg8X6zBrNMJ+ABoR3hHhY+4yElAJwg8iwYY7Kkf1
	 FfPPVktWVzNRS6EEjk6BK8MBcvzabmWwtTgTAF1aRdBqZBDlCZfUufQpEbcQ0rHuK2
	 zOyzkWwv5eHoc8mhrIMolgkw21AiIWOPi9nM94kfZZET/4TtTllsTOpSU8huyPDHZS
	 oGtxKBVY//l4D8cGoQaEUJesYrkV+KnfgWKPI/C19I1W56JBwdWeH08YZkA4Ne/YI2
	 u8giuvqKE4kCzZGbe3v8E6DJyScj2Ojun43MuWYdgjGPQFdK6THB6PHPGdfa6opebd
	 OQTvAKnGB8Vjg==
Date: Mon, 16 Nov 2026 10:29:05 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pwm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH] pwm: mxs: Disable clock on invalid period error path
Message-ID: <avrMdLAPp2oOtdQA@monoceros>
References: <20261102105005.1007-1-laixiangwu@cmss.chinamobile.com>
 <20261116031043.508-1-laixiangwu@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2qdyaspsc4lt35jv"
Content-Disposition: inline
In-Reply-To: <20261116031043.508-1-laixiangwu@cmss.chinamobile.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--2qdyaspsc4lt35jv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: mxs: Disable clock on invalid period error path
MIME-Version: 1.0

[Cc: +=3D Lee]

Hello,

On Mon, Nov 16, 2026 at 11:10:43AM +0800, Xiangwu Lai wrote:
> I've noticed that Lee Jones' series "pwm: Fix various bugs
> reported by Sashiko" also fixes the clock leak addressed by my
> patch below, with a broader scope:
>=20
>   [PATCH 2/8] pwm: mxs: Return early when disabling and fix error-path cl=
ock leak
>   https://lore.kernel.org/all/20261105143847.2559586-3-lee@kernel.org/
>=20
> Besides balancing clk_prepare_enable() on the same -EINVAL error
> path, that patch also handles the !state->enabled case upfront,
> avoiding a division by zero when state->period is zero, and it
> already carries a Reviewed-by from Frank Li.
>=20
> My patch for reference:
>=20
>   pwm: mxs: Disable clock on invalid period error path
>   https://lore.kernel.org/all/20261102105005.1007-1-laixiangwu@cmss.china=
mobile.com/
>=20
> Please feel free to drop my patch in favour of Lee's more complete
> fix; there is no need to keep both.

Thanks for this follow-up, very appreciated. I marked your patch as
Superseded in patchwork in favour of Lee's patch.

Best regards
Uwe

--2qdyaspsc4lt35jv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr6zN8ACgkQj4D7WH0S
/k7o7Qf/UjQPeXOgoT/+hklwnuPwbNMvmFIoh2yJPPQxNX68YtUWalecVUW/TmP+
/ZSd6ajIFk0peHc7RIh2WFNEehinYm9NtMF18bmVq1NX4SqsyLwsml249xLW8WoA
WaKvrw5E2R68hfsgFf0UyL0XosMR83mQr0cYXnaPGOjqMxjR03euzOF0vU5+bLR6
asiWvLn0dquA7ZbR59dOrWYC+w/2IY9qBpQxZEWYh6IdNzVwMw/9hKoA8SOW7l0C
6836BOJF8XGxdkZ/ceXALJtxeVgmwxhry3xYika7u+OKSdMhdYxX0idkNfpUGNtv
S5quDF/FV+xyi93Z+bqj9pyFQmZG5A==
=KPRv
-----END PGP SIGNATURE-----

--2qdyaspsc4lt35jv--

