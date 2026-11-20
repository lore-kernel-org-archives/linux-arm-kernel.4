Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C281606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 08:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0a9DUkv2;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=GE5c121U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y/5uQGxEblP1QNa5FQUl4azsIJFSa7HqVTp4kxYVMp8=; b=0a9DUkv24DPfsWKqMq17W0R6MZ
	CMwQjCoXuYoYwYuJN5go6N51ic00Z22Q3FVf1sSC8bKQ939/yX5iYlSie68Wi9ifyr1gCbCerHE7W
	tdxhZ2BDlXtZxBk7o5fomE0uhYnVPXRZOxs76Xn4lXIf4wJTBns70QJX5L+IqvWdDCszhzz/W9kR2
	T+BdHdkWwhXJg8lhbesgV884VNG4HR4Fan+AOtfZfAXHXYm/NSyC2jyL6vfH1hAMiaoaxH/emjtG3
	jJSz4dNKDsfWr0dus/ACl+Ub7RVqA/4eKV/cRbb+bAQiyQS1vUFCWtqwqadfWtUaluJElykAectyu
	nbOQHOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJtI-0000000EK5S-1a3l;
	Fri, 20 Nov 2026 08:22:40 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJtE-0000000EK3t-3hXq;
	Fri, 20 Nov 2026 08:22:39 +0000
Received: from pengutronix.de (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: mkl@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 78CB92017E5;
	Fri, 20 Nov 2026 09:22:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795162952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/5uQGxEblP1QNa5FQUl4azsIJFSa7HqVTp4kxYVMp8=;
	b=GE5c121UHs2n5BSAgKfgB4UAg22dahNMv8gtW8T2J12eMm8NWP4QfMcsA4Z/dd7JIX3c3w
	kAsaRzKHrTRRyriliRNGceNDflXU6FxTsmig1p3unObLiIix1YolCi3LEBKkhOnzLyyHYH
	fmvF0zXqTs6c4OGjtL706Si1AUHqRBhIPDXUVc2X6JRUDRnUIb2u69t+ei2OvFKt6ZLn+0
	UI8EoqDujX0CvFY+2jiLswSoIq4/Ckb+zmSU8svWN7mRAF4lsrzKLpl65XHzbDNruPffnC
	MJ/w+kRsCwOvGlOzJF9j1caHNV7/qNG+HT4LPB6g+YPhzgPzD3HnA05tuJd8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795162952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/5uQGxEblP1QNa5FQUl4azsIJFSa7HqVTp4kxYVMp8=;
	b=WtWg6lZX1FCqjke3jm7mml4iR6FqFYZP0OoLInJvvasFfuJD/5Lvq9ITSg3OK3zEmmkI8i
	cbYBmRgMEuL43mJdx7pczD05NrkJK0oXtOnTjE+xcqMtgD0FsXCXOWp86u582KjoKeXD2t
	fsnNuOz2Mu4dORhQPpIV4HcRaJuGmHyT5cgk3Dr2/ajUrGdFEpzBkbEg9ZDhRNXKwld/qi
	Dj5P4TTudFfmm3uw2YRxmbIxqO79ZtQH5k975bkmLVU/VphxHSeuJ9yyfvNu2lk26wAYNY
	O7QqNtbBlvXlP+GWqieo4J4VYabJ/hh55Wc4SfGkS+H6DGG0+rz/41DIOat4HQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795162952; a=rsa-sha256;
	cv=none;
	b=bzTC6V8bGxwSBtKuK9w/OJX7PmSMssI45hU9zRkWP7aFfLVIP0rKU06oktbxd9al9fxcAf
	qzM+4R9BjYHj2majw+Dq8JXxNyACL8Q3XCU09KSlbfpbCLWs1XUqRdctZMO7bDBszK9kTR
	tdYAl4aE9ogR62rkZA6/2FNN9jY58ONd3UyS9+1YcB+Yk+AAVyoElD6aBOsJiQjuempAAh
	/bxSM8KdzTAfNwRVL+GpfwxWJQqyb4G02dFMwu3lQKCrnk3xZPb8N/zvZgA2qOnKZ04o8G
	+rv5uGFhR4c3tkzKF45T0rGDD0KWOgF90CaSvUvfq9DvwuEz/Xw7iBKG43Gytw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=mkl@pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Date: Fri, 20 Nov 2026 09:22:32 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: zelong dong <zelong.dong@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Vincent Mailhol <mailhol@kernel.org>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-can@vger.kernel.org
Subject: Re: [PATCH 0/3] can: amlogic: add support for Amlogic A9 CAN-FD
 controller
Message-ID: <20261120-positive-strong-rooster-bb80bf-mkl@pengutronix.de>
References: <20261120080820.3340646-1-zelong.dong@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ufvdvwkayadg7w25"
Content-Disposition: inline
In-Reply-To: <20261120080820.3340646-1-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_002237_075927_5FCBEB7B 
X-CRM114-Status: GOOD (  12.53  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--ufvdvwkayadg7w25
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] can: amlogic: add support for Amlogic A9 CAN-FD
 controller
MIME-Version: 1.0

On 20.11.2026 16:08:17, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
>
> This series adds support for the CAN-FD controller found on the
> Amlogic A9 SoC family.
>
> The controller supports classic CAN and CAN-FD. The
> driver uses the generic RX offload infrastructure with hardware
> timestamps, reports bus errors through the CAN berr counter, and
> implements suspend/resume support.

Have you had a look at the flexcan driver? The register layout of the IP
core (and parts of your driver) looks like they were heavily inspired by
it.

Can you summarize why you require a separate driver?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ufvdvwkayadg7w25
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCawADRQAKCRDMOmT6rpmt
0owUAP4yQwL4nDipSaSrhs+obdRM1fx21ITtqamlnevbzqV9ygEAx8vF0wxa8/dG
vO+cu0wayf87TVvPzR8g6YzWU8+KGAY=
=gxBT
-----END PGP SIGNATURE-----

--ufvdvwkayadg7w25--

