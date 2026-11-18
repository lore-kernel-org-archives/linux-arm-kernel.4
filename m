Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EFC60A2609
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B0zkpXQr;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Me85+vo/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:Message-ID:Reply-To:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xMp3FYu46+6069H+eeh9xe9hJqU7BcZ6oUpQKIuSBzI=; b=B0zkpXQryHTYU/TdpbBdTkRmFr
	Ur7NHb4xBB5rlip6cW4zPUSPmim/eQHnA+b+RWhGjkKQ6SZu3DWUtzDXZugl2wKlFgtwnqXNAohKj
	94RGxDLaiSmxdqyoTvZkoM3SElOWo5CohYw9a+J3v15sSZMGPTZkaNzVQ6BWVo7ZisKMrv57DxDp8
	cfy5kxudEa4eRdSuDBkXssyxlvwhV2+LKw2w9vtOgXbx+NLdQGHqdNB37DAZzpxQbn8s8uKvXocC7
	vLoVRXK2CDIzgP4NWqia4nXHHwYXXdqoR2gDIafGRcWwVzlmBKl3kqghYVM4Xu4H2V29Y6ucBeIT2
	pr899mIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgdL-000000096Jz-1E4F;
	Wed, 18 Nov 2026 14:27:35 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgdG-000000096Iy-1rKR;
	Wed, 18 Nov 2026 14:27:34 +0000
Received: from [127.0.0.1] (unknown [IPv6:2a02:560:5d79:c700:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 974E4200467;
	Wed, 18 Nov 2026 15:27:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795012041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMp3FYu46+6069H+eeh9xe9hJqU7BcZ6oUpQKIuSBzI=;
	b=Me85+vo/f/nhQM61h7rSJ5PPBlV8oD7W9uZoIuFV7DZt+a+nSry9WHf0WeIXJUW72WpSp1
	pZ3j512U+5drZmnS9kpvHitgtItEfuwwS4CHCz780c/Qn+NtoHd/XUYyOkZr22lDo04KvN
	dkFXso2iT3oXuEQEmW2r7hWoW9lhSJK+DxbyafO80RVb0iZnJYABEmcjbEwnPAyjX8MpbL
	shPqt4fR5xk55wOSWQ6lTa+Zwx5ZEAWN+P8t46fxQw3PLdFYPtCPy+hPiwWeh7Mq0n+V8V
	pb8J6xiieVupVvRgYpBDbQMAMBVpCc+92dvzxKA/mFt0HIo3eN2eoc+JOtb37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795012041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMp3FYu46+6069H+eeh9xe9hJqU7BcZ6oUpQKIuSBzI=;
	b=R1CTktpI/kcm1o0kpUr6Vf4xk65GzoczI0OOivAob8oGWg6WoU2s4C5C5CVyfHNK+wMxL6
	GRQdT+u5gA2FYiM02w3s5iJRS11rVckYYoLDluZ+tRPqFm+DU0gdHxjO6ZDBI+IANEAeOC
	oHG7a5qHQFYdfyECVb1WsmdYavyNE0N5kzH1eeZgkZyLG+KiWjuk/EkhcUGAkEIcqYT38G
	whREQHXMzEENeUCO8xgEM2XCGGQL8yPUfKZJb8ShNUUdw25lplmnrpt2uHb/6V8W5R4Ajp
	1J60u36r8D5y2umasqNR7lFf+JeL17cDGS2/TvCTR34b8sgWRsL6HccpolVF0w==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795012041; a=rsa-sha256;
	cv=none;
	b=DWYDpM32y+fWfnZgEaZzIGJmWONZ9jWLYXZGBOtgRvjx+MrMuJWUmg+Mou3TLBXoTaq4kh
	+6fgA4kb5kcKfwqDiQ2ALD6asMmATMi/zXdLK1IzE7aZh+oSmdWVvXr74cCdJSkYhTE+Gm
	gQSGCAsd4qA52uVlhipFPYw0ypBI5QUk3nO7Jmi9SJJV8+a++gmEdoKLZEJY8W8oD5JVsA
	/Qe/ZdoKucq+uzcGyoijWVSD3w9QG4DsvBStDjNrGazsowC3BEY8muIMrewUnw3foksDk6
	N1S79cC4KI1E1BoYR14Tw3SSFM3ZFVMuux3ZDm3UQwQt+EiMQ1wPTGRmvIfoww==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
Message-ID: <85353f59-52a0-446d-ace3-65e2d03d0d0b@pengutronix.de>
From: "Sascha Hauer" <s.hauer@pengutronix.de>
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
To: "Sergei Khomenkov" <shomenkow@gmail.com>
Cc: "Sascha Hauer" <s.hauer@pengutronix.de>, "Lucas Sinn" <lucas.sinn@wolfvision.net>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <596F6C9E-4A5D-4AE8-8D26-7A7247050D7D@gmail.com>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
 <596F6C9E-4A5D-4AE8-8D26-7A7247050D7D@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 14:27:20 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_062731_753032_C9AFC3AE 
X-CRM114-Status: GOOD (  21.64  )
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

Hi Sergei,

On 2026-11-07 15:38, Sergei Khomenkov wrote:
> Hi Sascha,
>=20
> > +/* Bytes per pixel used to size a coded buffer for a given resolution.=
 */
> > +#define RKJPEGD_CODED_MAX_DEPTH	2
>=20
> A valid JPEG can be larger than 2 bytes per pixel. libjpeg-turbo sizes
> its worst case in tj3JPEGBufSize() at 3 bytes per pixel for 4:2:0, 4
> for 4:2:2 and 6 for 4:4:4, plus 2 KiB. Quality 100 noise comes close:
> 2.75 bytes per pixel at 4:2:0, both from libjpeg and from the Hantro H1
> encoder on an RK3026. Such a frame does not fit the default buffer; by
> your commit message a truncated one fails through BUF_EMPTY, so the
> client gets an ERROR buffer for a valid picture. I can't run the VDPU720
> to confirm.
>=20
> The default only matters to clients that pass sizeimage 0. GStreamer
> 1.26 asks for max_width * max_height / 2 of the enumerated range; at
> 65528x65528 that wraps in its 32-bit calculate_max_sizeimage() to about
> 255 MiB, which the driver keeps, so 1.26 is not affected. Its main
> branch (08ea5bc9fab9) asks for width * height bytes of the stream,
> which the driver keeps too, so these frames would not fit. Both are
> from reading the code; I did not run them on this driver.
>=20
> Would 3 bytes per pixel be acceptable as the default, and as a floor
> for smaller requests, like the 2 bytes per pixel floor in 6/7 of your
> hantro-based v1? 4:4:4 at quality 100 would still not fit, but the
> subsampling is not known before the header is parsed.

I haven't been affected by this issue lately, but saw it when the series
was still based on the hantro driver. Yes, I'll change to 3 bytes per
pixel next round and make that the floor of sizeimage. Would be nice to
have a proper solution for this rather than either wasting tons of
memory or risk having too small buffers.

Sascha

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


