Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7111606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TODRpxrX;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=YmrxRN5B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:Message-ID:Reply-To:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PSHSxED65AnpWskI+zndcsoj9vhLG7Y6yB7a+EXXCRI=; b=TODRpxrXS1nApt0bOJ1emBp7rx
	8xsDJHcznFWogZjOZK+1gz5kKL5y9Yh9vn56Qb2QgsNLQ40F18UfQKbQvTLAbI0lvvRsyxJnWjjD9
	ZFGpQs0v/wSyO4uu8FSz7HsnruZSOVtyJx6w/HSnxCkx74an6nbp26ENWEleusNohjK6tBD13E+pq
	W6r9Ok1Am7KPW4iO8zXkJD+7yQDkgziaJFCKdeWf9k0heehlzBBZCqe8d6RXfWxl83E7u/ZS3K6hE
	t+D3Oop35vg2YIJDAbsqsFBdrHOlnoNqzkvulCTStH6v74qARcmGF0G0FwghDnwYx5K4BatJaHNsL
	Au+Z0M+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOzH-0000000FApL-0PgV;
	Fri, 20 Nov 2026 13:49:11 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOzD-0000000FAoE-2psT;
	Fri, 20 Nov 2026 13:49:09 +0000
Received: from [127.0.0.1] (unknown [IPv6:2a02:560:5c0a:3200:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C891C202284;
	Fri, 20 Nov 2026 14:49:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795182543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PSHSxED65AnpWskI+zndcsoj9vhLG7Y6yB7a+EXXCRI=;
	b=YmrxRN5BlxHFPxY2kfXI38ZIFzr/mftDDptQVVgALq8EGk9KFpm/BSUUTumF7A8Lg40Z5t
	voMLta3CKVM3VysCnjW4vOnfG5m0WR8auBgrCLd4902vrffq0E6qONyaZGNTDA9Wmssr0d
	cxvfRY70R2A/nmWpFrfE4D/MpBNK+NQudVO2OtTMWrtHZqbj8qMzXXzVoYwzX1gG4K11Ei
	PIecDc56J4CrUHlPxBLdHKAE7Sp0NZ3/CXF9b8Wa3Kjiec9xaMBNhIb0X8lq9InAkfvK2c
	pOuVFmkOgf69YS+uGAdE4oELkAKSiMjCsyhMqRCq9sAR010D/CrwWmos3LAh9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795182543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PSHSxED65AnpWskI+zndcsoj9vhLG7Y6yB7a+EXXCRI=;
	b=RMJ//48gHnP/MWe0w62kRSDg6IbkJw6cekgiRaswZ9QGQZtBRCtu2/xUY9ch/Df8k5ktJV
	EJ+pFcoz4KjIzNUYZ3OcA41zWU6kftNV/WgufDUgzDEneTy2XyoAmgszrHx3c/uBXXXa2R
	QKh8NFp4tXVElNIGOwDY+4Ow1jnr2bNhM4N05Vr/dpX6ZxqTy7F97KM7MDPl/o0FlcU858
	18u+v4coNkBtex8Tx+EPPEYZNPv5EZab4nptBKnbdaIFIrxOyU4ykp0yF0IMoo8nCo2OjO
	0IKculyiRnGLXttfpTfWvGkyWUQiorjWNzWySMPu7zZjYOvyHZd258v48FRCzA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795182543; a=rsa-sha256;
	cv=none;
	b=f8N6LrVJ/HxgbB54m+tOKZ9deaW+Yb9M9s+xMyzEl6SXLcRkLuj/z1ISJJ22V+uab16Jte
	VCEbxmoMRdGC0GgPrzIT9gygOJVPtNvbkSVGjUhwaO7YkxNDN5DNoVk5lyk0+fuWQh7tVx
	7hxpwv/x46dlr0iO6mI9okNgDlpjlyck9T8jiL+pPT63ZIN6V6IgUXsZPH6ZDhePLdeRxv
	xHldrd4+hl6h8LFaIPfaYyRWAzq5/vaUbnkuXDgPpsBa8Yc+ckqrDyHJO43+LLqlkpOco6
	BG/3hMDUmDoX7bmV3jMQ1g8YJuP+moBMEf88hcC4/FHlGHcF9DGXsVOnM9upDQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
Message-ID: <8bc5870a-2b38-4e3a-9f93-76b2673a79dd@pengutronix.de>
From: "Sascha Hauer" <s.hauer@pengutronix.de>
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
To: "Nicolas Dufresne" <nicolas@ndufresne.ca>
Cc: "Sascha Hauer" <s.hauer@pengutronix.de>, "Sergei Khomenkov" <shomenkow@gmail.com>, "Lucas
 Sinn" <lucas.sinn@wolfvision.net>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <41e428a6fcdcf3d0c10cada8743231797b3dd5f4.camel@ndufresne.ca>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
 <596F6C9E-4A5D-4AE8-8D26-7A7247050D7D@gmail.com>
 <85353f59-52a0-446d-ace3-65e2d03d0d0b@pengutronix.de>
 <41e428a6fcdcf3d0c10cada8743231797b3dd5f4.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 13:49:03 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054907_860030_5AE3AC49 
X-CRM114-Status: GOOD (  20.82  )
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
X-Archived-By: <archiver.kernel.org>

Hi Nicolas,

On 2026-11-19 11:00, Nicolas Dufresne wrote:
> Le mercredi 18 novembre 2026 =C3=A0 14:27 +0000, Sascha Hauer a =C3=A9cri=
t=C2=A0:
> > > Would 3 bytes per pixel be acceptable as the default, and as a floor
> > > for smaller requests, like the 2 bytes per pixel floor in 6/7 of your
> > > hantro-based v1? 4:4:4 at quality 100 would still not fit, but the
> > > subsampling is not known before the header is parsed.
> >=20
> > I haven't been affected by this issue lately, but saw it when the series
> > was still based on the hantro driver. Yes, I'll change to 3 bytes per
> > pixel next round and make that the floor of sizeimage. Would be nice to
> > have a proper solution for this rather than either wasting tons of
> > memory or risk having too small buffers.
>=20
> The hantro HW can run in ring buffer mode, that forces us to copy, but I =
think
> you can then perform decode without actually having the entire image in R=
AM.
> Would need some experimentation. We probably don't want copy to mmap + co=
py to
> ring buffer (double copy), and V4L2 read/write are deprecated. Note sure =
what to
> propose really.

The Rockchip JPEG decoder can stop on buffer ends and I just managed to
resume operation on the next buffer afterwards, so in principle we could
implement streaming mode.

Anyway, I'd say it's not worth adding the complexity to the driver to
handle that.

Sascha

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


