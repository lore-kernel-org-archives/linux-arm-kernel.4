Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A7F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KmJ7vGA8;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=dNpiQxcm;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Q7HuxEpV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pJ7kZ9nUY1FS8i9+F2Sr6CiD7I+mA4vNUnLZI2Bguvc=; b=KmJ7vGA8ItaT3Q
	HZ2aB1pavuLzD7ifvzMtXmyXQ3qz0huFSUpr78g8a9RwqiNaG4xYTFJYI58RBxibYw3F+T3jzkarO
	xDtit0JQOsKHIxz75zRS154vSyhLrAb1OmQC+b7X8ar4zWruNIBxZka38WvpL4WQaXvj9nX0BEBz/
	sZdYP71kyk1QzLbgzZq3G1uFH8DT/Y4BUZ0wL28Wa16pd6/7GDrrfXN49MLgTXmgF7b1kXRjD+Uzl
	GCbatzVlR1KRIX/N0uHXJP/2sgirz6eRbVPM6hakCsQctlnHjlJoJUiD+wn9jwl52xN10v6ZHezGz
	Yi0xiM3QKearxEYJQD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh9O-000000036gU-12Kz;
	Tue, 10 Nov 2026 08:24:18 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh9L-000000036es-1CVe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 08:24:16 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id AC64FEC05B1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:24:13 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 03:24:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794299045;
	 x=1794385445; bh=pJ7kZ9nUY1FS8i9+F2Sr6CiD7I+mA4vNUnLZI2Bguvc=; b=
	dNpiQxcm/LTlEH+ENPBJvoiFcYsHoAYRUPxxiWnMnZvx0bcOleaFPTnP4ajNucix
	iRbUa46O2NvgQ2gOC9ZH6JVUlLAWc0uALNMBhiOg+hq82+IiLP/bZMC6aCHNXCFb
	iJbsKTYmgzGwzt7ooDMT00ZpU3FV1jizbHO9Sl1dIXTNu1HXk0qjK3BoWqKRbUVL
	ShAR1NCT+Q9sQIGdiXxly6wOPRw4/oY4Ia0uOePastoa5MeGPlCq37HnA0yBIkGJ
	NSx3vOy9xbHXSVFswyN+1yPQR9odChV2+vB+v2mxwpr1vXh8Yqskj3uLhRlTiNGi
	SVLfC3XsTwaC2kRLLWKJXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794299045; x=
	1794385445; bh=pJ7kZ9nUY1FS8i9+F2Sr6CiD7I+mA4vNUnLZI2Bguvc=; b=Q
	7HuxEpVd0l+Y1znEZuutAuPCK1IvS5vSA1eYwtm6S/V2FMpuNLY9ITRzSvVcg5MV
	rqtyqvCCyutLDbaNFvMsr4BUa9Vd+6Tcrdk6UKVfUJlK7/U/G47yVrYhNSoS2CXT
	WRs+pa/tBWsQLbxtHOS1sZCosn0MJ1y+XVI9zXwVHWY2m9r/0jKf1h2Xnmm4ewI5
	SAaXG9PalmiOv0EM4GtDG6V2GyvyUXRtLX5S+zcn9siKVgOnFAHnqlBWM8ToDkVg
	Gs4xfgslPooxfQbbR40RfmLAQOUsb+OdQue1x5M9STT34FNniEtq/6K2iexyYuWI
	ox+4Na261koKbSU/TxK+Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794299045; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:aS02hPxaRR9Ci5p/G6LlazT4ULm+bbjqR+clFC5lv/hqa36
	+z6tYqUXyoU7++8WAhrtX847uTJeiVBp1+WlgDm1VvZat2sjgbs/GzIJ3Z57YSqK
	YI9mLO1DyYlgO+la04zlMh5w+/gnVc0djtaZ8Ns01B+KS5k699h/bdZSLeu5qV7b
	6dpOvVSE7KZHxAODn2J42Og0fXahoy2w5cIqxK7u3JTJmuVfkfraQI+Eh90qLQ6l
	ObVhrj+XTlVKvk5p2ijhcvURx5lLRp/kjdiZ8EyWDqkVa2Vx6FO4ijTDaitEWzS6
	rUMo6W0ByOCEXfTKUNBxN5Sztkr3P5SkzIqPypA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ktkt6ltiBGKbSI1Dv4eMdW/rPon5WRacUu/yJWvAbFM=:YHe1sRh1MG0Z87scZREWOS/U54FxdcAzg54EAvaJvyM=;
X-ME-Sender: <xms:ntTyai159Zd1TWTFb8disCIbX-ESvHK6iER0DnaW1P1yFFn3BPS-mA>
    <xme:ntTyav7ZbdXs1acK2ek2q1NrSAQLPptJX-kA8SrkFj68JoAnHM7cU2yl_W90tVrn7
    WR_lijJeUQiLGtL2zVu6nfC0xy6zkrgcMVB4S6oAxfS0J0zyo552yLD>
X-ME-Proxy-Cause: dmFkZTFhnp+eSghulVC5JWADloFkUjjFVGSalw0CVyEdMRmlAiSUDb7+3LfuLl3igcWhrv
    rxwikOVoj6lne5AbCik35y+9S6btewepACyIhyG90ycgGUYbwMNhaKkA64CoB4aB5y/I60
    cMtl1TZXAzhvHDdO2oMYLvai3+H6wMrcPNFHwTDXMM0Kjbs1XA9ZS6itTWdU5hRvnkUxkP
    ad4R+WVBoKTvmiH4LNLGAVG86/jTgDEkLgB7rX0PL5U6tW7XpOJEssncm/1a1JaF6CcvmG
    yiOpEF6KRUz+RDTu7fs+tbNhQq1fIT1ral92Q28jjJT9XIT/eDIUC6zbGzGKkpbK5czYTn
    afXL1tsd35fxMj8mT54b1hKMZ2BVznP2Oe4/mRFh5QYiPLqdxmd+XvPSiPbpXbEm2AcYjc
    bhmOSTCGNaDDZALeu7FHIoJuFeNryO3porVnFS8ZIn00T/dLZUnKvfst2bsbXg00go9Qzv
    OkAvBUz+QeTI5teT8YR+WF0CPD43gPElAaBPgnYQrXb3eERb15ZCfNzzxAZoAjF911X7Ub
    63csgRLyBuqOqcgACZHxmZ4yFF2i6FeVlEAXt5u3DQUrbCQRCCwpC9D6qBgEvStRMuL2KN
    k5sKSCWxkwfJsAeCeDWGoe4aMYJx4mZ5fdDMuJq8irFnYAcOsyTPP1OCPBpQ
X-ME-Proxy: <xmx:odTyavhCNDjOH-wzRpLquum4MOhNTbNjM5N-FMB7oUXl9n35geZwUQ>
    <xmx:odTyajrMwqZ1TsWy7i4c74538Rp37lQXTUfWB16cSovXoyoS6-u_2A>
    <xmx:odTyavQXrqvAhbwrt_LRb0k6nDLqtld5g-cuP37ngUj7rErjnNwBVA>
    <xmx:odTyakRQV5b1qZQl2gcWE6c267k7X66XhBWjbGCdpsHKSDQotltrig>
    <xmx:pdTyai6-zP5L2uLUegPSsdJ_F-fX7biOcPtSyo02lUVSD-CD1YdDA0Ij>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0680B32A0097; Tue, 10 Nov 2026 03:23:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A4QaHkHhrVgc
Date: Tue, 10 Nov 2026 09:23:27 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Brian Masney" <masneyb@kernel.org>
Cc: "Long Zhao" <longzhao@ambarella.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Jerome Brunet" <jbrunet@baylibre.com>,
 linux-clk@vger.kernel.org,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 devicetree@vger.kernel.org, "Long Zhao" <zl020895@163.com>,
 linux-kernel@vger.kernel.org, "Linus Walleij" <linusw@kernel.org>
Message-Id: <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
In-Reply-To: <20261110-interesting-hilarious-shark-2dbfc0@quoll>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
Subject: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_002415_628161_D0F647ED 
X-CRM114-Status: GOOD (  18.98  )
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

On Tue, Nov 10, 2026, at 09:02, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 08:22:33PM -0500, Brian Masney wrote:

>> - I can then merge patches 3 and 5 into clk-pile.
>
> You will have code depending on non-exisitng ARCH_AMBARELLA symbol, but
> if that's fine for you then sure.
>
>> 
>> - The DTS folks will take patch 4.
>
> The entire platform is for SoC tree. This sounds ok for
> me, but I am not sure if Arnd was merging pulls with
> dependencies. If not, then worse case the arm64 bits will
> wait a cycle. Anyway, I guess you can take clock bits.

The way I usually handle new SoC families is to have
a separate branch for those beside the usual dt/driver/defconfig
updates, possibly for multiple new SoC families, and
possibly including required drivers. The idea is that
whatever we merge here has at least a chance to boot
into an initramfs with a console.

If it can boot without the clk driver, the easiest way
would be to just keep the clk and arch/arm64 bits
separate. If the clk driver is required to boot, I would
suggest having a branch with the two clk patches that
can get merged (not applied) into both the clk tree
and the soc/newsoc branch to put the other patches
on top. This would make sure we only have each commit
once, but still have a clean history that includes the
driver in both sides.

     Arnd

