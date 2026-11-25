Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE70606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GrRjBWNy;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=cem+NKqN;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=5c1ggHKN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tPfjmyQdI1wI78ZQpZVsv6HuB0zGqQ8CU1z0eSNCe1o=; b=GrRjBWNydNYyXc
	fxa78LhgL8jswpdAxZYkBYAbodmt8y/Dhif2s/nsM+Zfc4n8Qzh6rlSjbjz+Wjj3al9m1yHhzXkt/
	jQocdkjSu2sKPpvGPPr3dnT6JHNEm0jdp31taxBo8hVmUqyPcfFUOuWmI02e/GWGT5Fcg281u87Kf
	08Go/DZWHNNJzx1VgPrKSwoTgbv/8MOTMEtNN6MUrvbhfB98gIVbamqMdAnPMnUDkrGnjF0+QBmAn
	9VVx3K64EwKa+oHSXWIPOmpc5DTmxEcFxGEOuLLES5fFyv6e6+bZJ0O7SUQ73roka+cX58myQxA7h
	H433dJyRVEXqGas+VYDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Xw-00000008ucB-3kU9;
	Wed, 25 Nov 2026 07:36:04 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Xu-00000008uba-2a44
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:36:03 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0F4A7140043D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 02:36:00 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 02:36:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1795592158;
	 x=1795678558; bh=tPfjmyQdI1wI78ZQpZVsv6HuB0zGqQ8CU1z0eSNCe1o=; b=
	cem+NKqNK+7HTiXuZmA36wnUlbvMxx87aOPckiLjhzI/ic2Umq6MYEEVHmfAPL27
	LktYDQ5sLpLPden4DB8mejq6aChyJIyGFDpR5mNz6SSj10bpJoJ5jr9Qnri6Ypuo
	s8e9EJpl5xWu24fiT2171SvXJTNRknJe8F9cUzgm2ZtXQLBpSb6R9Cktqxt5TDPp
	AZ4pjY/jMakJ1TGocFsB3Ai2k6BcorMr17AmNfvLTQX5e0K0BEYlPI7+KsZu9q6c
	t2esCGCW4MKeyyVINXnJfO4DpCnONPFb9xW3mZV0fmbKyGVSPV+RG72VIUNHLT0w
	o5McUYzKq1erFiTs/Sv/sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795592158; x=
	1795678558; bh=tPfjmyQdI1wI78ZQpZVsv6HuB0zGqQ8CU1z0eSNCe1o=; b=5
	c1ggHKNhKei6a3hNAXodpTDD3H1tQQt6m4Ntkl0KBoCsA2Z0YQPwQrI3O7jkig2c
	TI2eWILD+qR0FUkiDhqelg4W7uYWArvkcaq4fFKQAhuwpQEpm4lwj9XjHj1W+6/n
	HmuUWmsyuNu1XVpZ6nsMkzbbvJSiuR9ft1Cg4AFO1IDs8ONdiFhUDkiEzOATWiSJ
	IFRtB8XiJmJfLnxGbdY5UtHt1K5CiHgi2C5dgiBtBYS7shAVAHdn9zrNnNiCT0Nk
	tTNgmNuJ+FmP+g9FC66Lsz6G5RGrvVm6HzTRgKkkIgJUwrXOVbEbA12qv0WWGnNe
	lEznBbHtg757gHs4SypcA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795592158; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm3:rsa-sha256:UTKQnB03wWJGg4lOyvHDA9nmgseXdmNQW+Oy4pR1pv1+UHl
	A2hz5Ch7I2f19VZKs53+Hk9p44UOBAX4CnrFA5ioVnrt/Y7xdL6lToN6DoLk2Z4w
	YKkoy1Fen8CLk4EG8wkfkjuhaJJn5aNHPWZgSxvqSC5S9whyQzywQQjuwesPnMsk
	C07VLUInBbIIj4R0INkZbV4BgSGNlAPej+8HVjD9vLfhfg/5cQXoFQpmDB6f+C2a
	YqVshUD4fUdSBbNSmCYQltTA27X8+y2XyZW9qvsPGXjx6iq3C4kl4DtMSkqFAOLy
	QR1jhPAkwcZs5auVOsMhMgqZS2aS2oODNiYN2Ug==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:bW5FRmYnw2iDbGd3eaFqNwmv5yh6L3aE4etpdkNBVtk=:hrxNOVHbBregGpHYaJkR12E7QCIoh1riEQpTvoafJcg=;
X-ME-Sender: <xms:2o8GazeeYYgqzcHbNF_rkxQUz2xUjTw4w7KdYfxAqHoKp4uKltD5Pw>
    <xme:2o8Ga0Cb-C2mTlcMLLysGSzYCytbCAAzx7nvnAOHckQR6VpSqXyunPm5QvyX8ezKE
    kzhD7f1ERXgFkR47o4X0QEE-pTPAMIjUVJzs20mC1I4l3O5q-LCi0Ns>
X-ME-Proxy-Cause: dmFkZTF0yS0MDcn3oitaXGaLh/T1Znmg+Y9viFJsGCCIYBwtFyg2c0Bv0woD65rVl9QQSb
    1qORFKt9sFj/jdf+I9Tkd2aPYPC4KDYAH90W1e+HnOPgTFUnKUoQb7njRDMZjGi5F26v5B
    nxnVyEU+KbjqSNcshxyga9nWtk40g7NGqt0TKfaWP3udAENirjS4CIX5YQrkGFMEQ98Qq7
    lQqj1gDL5YSeG57itLhbj4VvwS605kDR4g9zG1KoLrtcic815vwJxOONPE3kBaC+zrsLuo
    4MHjpylZpzypBJ61EnVMxfcH0G05eAC1eXw2iwV5dpyBWCUQyRNcYxZCTjjhwurGp77HNY
    zJ+uRFY4Vy4yCO7Y29OyfeT/tm4t7kR9yj3h0Pj7l1eiV/KZK2I2zQ0P/UF1dCaeJsi3TL
    IvA5FSNe9BQa2FJ1fzYFkJn+iQRNk1g2DIsl4hSO7uVZbosNujyAanL/JB3d7XOEVKMhHx
    JnX3eBZ0aLmg3tKMSPDBR03Xpmw+w5GBD7qSON4nWDNOYKS0NiE7T6JJFfM5Z21W/dKe0q
    0haSJTwyoQ5+naV1u0J7qfKBfKjgdwpmBknK/K08ylvZznq8wN07a6q9SEGfFmKzX33pnM
    o1mmFUGvmsbljuMVCqzqBlFoUyiSKrbTl8aX26d4QkB22ixWTHbSX4OIeOnQ
X-ME-Proxy: <xmx:3I8Ga_AURC0D_YghEUtDgnbxvzmIONyRsmDHyq1IY18JKof8WuaK_Q>
    <xmx:3I8Ga0mFdWzf74Zt2M2SzI5MXifHHXolm8HLTcQ76w6G24uHp8kjAQ>
    <xmx:3I8GawwUooTJQRDV-Ta66znUVLDILwpe7Cy3dCOpAmHA5f06hSGhkA>
    <xmx:3I8Ga-Ru_m5iP6nXTYQ8DpyMd-d9_8pIKIDKV3BLYAvEwgISrBdO4g>
    <xmx:3o8Ga4hsgHYTAMDLV1k-zkwlMWTqJUoQR3pDvU7iXXWPcOb46v0LnToP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 8101A32A009C; Wed, 25 Nov 2026 02:35:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A9foQpwh9yuF
Date: Wed, 25 Nov 2026 08:35:34 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Brad Hawthorne" <brad@sim.vu>, "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org
Cc: "Vladimir Murzin" <vladimir.murzin@arm.com>,
 "Linus Walleij" <linusw@kernel.org>, envzhu@gmail.com,
 linux-kernel@vger.kernel.org
Message-Id: <70f2038a-5ed5-4a38-8a62-87b292e102a2@app.fastmail.com>
In-Reply-To: <20261125025852.1160075-3-brad@sim.vu>
References: <20261125025852.1160075-1-brad@sim.vu>
 <20261125025852.1160075-3-brad@sim.vu>
Subject: Re: [PATCH 2/2] ARM: v7m: clear the Cortex-M33's ACTLR.EXTEXCLALL at boot
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_233602_740959_04080FAE 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026, at 03:58, Brad Hawthorne wrote:
> +/* Cortex-M33: clear ACTLR.EXTEXCLALL so that exclusives use the local 
> monitor */
> +__v7m_cm33_setup:
> +	ldr	r0, =V7M_SCS_ACTLR
> +	ldr	r1, [r0]
> +	bic	r1, r1, #V7M_SCS_ACTLR_CM33_EXTEXCLALL
> +	str	r1, [r0]
> +	dsb
> +	isb
> +	b	__v7m_setup

Doesn't this prevent using Cortex-M33 on SMP configurations?

     Arnd

