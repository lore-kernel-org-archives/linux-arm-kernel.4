Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBE5606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kZp2KCZ2;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=WKdnVgri;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rl5FsS4I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X5Rz2Ygap5kebIv8LKY3vVFeHVyc95pMyChBqQQNkts=; b=kZp2KCZ2Z/hjUv
	OS640BLzCgZyCis4wTJY/ofNqjcSjvY0cYTkGbT++v6BxM5CfJFTCPoDHL5nsYrw+JqCVBQpJIIqd
	Z8o25dUJkZZPBqU2V6dgBFwBoxA2U0H+SHEGP8DNul1dVHKvhCZpLchUTXeOOFkEbpfYlUyF0qrlv
	Usi59HZg+S0YPM54cImsLGL/ePondqUcHib8I0pM7UnorHmM/se+aS0yZ9uvUmEg8S/Wk6F2ZYga3
	lZhDTtVPjrGAIcABczVlZb4Q2xsiyNfv8kaIGoVoWxaIbV924Qwb/MlHQM9LZd6JTGf45WIV4XJbh
	BSzHHvDTppKHBOl0QJcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJ59-00000005taF-29Pa;
	Tue, 17 Nov 2026 13:18:43 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJ55-00000005tUp-1m0Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:18:42 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.phl.internal (Postfix) with ESMTP id 6CFD01381C12
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:18:34 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 17 Nov 2026 08:18:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794921506;
	 x=1794928706; bh=X5Rz2Ygap5kebIv8LKY3vVFeHVyc95pMyChBqQQNkts=; b=
	WKdnVgriXweWZY4U1+3kve1Va7e1M/Pj8ATLzphElORes34pUpLyH3bHbrZCHO0n
	wsBP+6b9ZTG66/Fk9E3ETVSXuyxFZ8YnxzVpLnBDzwhG3GSn72tl2ifD3mZ7ZTEG
	n0MI3+tzPkoeKfW/aPsBUfAj8ujAwEihGOVYWBk6FieNHgSSycXFOKmi9sjcssvA
	vbxwQ1i6ZI07uaDP+nsNxSWKv/2STM6+kICF07pu01ESt7hNLjIQyP+Gu3AlmmsL
	7sj+zajL/M/eLzJM4B8lOCPzpzCv2dwkUckoGi9zvoCiEKK/A9PxsLowBvsKMXXt
	m9dNjTVqFyeEq6zOz4R0AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794921506; x=
	1794928706; bh=X5Rz2Ygap5kebIv8LKY3vVFeHVyc95pMyChBqQQNkts=; b=r
	l5FsS4IDuyP752/h1Jb6fS61PRMZoiCuMXTKa3VYNVTdykFf5oSzlx1fTq9Mne+z
	tswNEnclYS+YFaCJZwxUyUlUGB+K3XNfya/YoGUwnBtBbt0/ASY2d+8VGdapj1Qa
	VIJ4t9qv8XXWj2Wt0AHdQiIEM4asJ3irmDiwbfjcTivM3PecnjnCa/zXV3rMmz+1
	piik4/axMNMt6+lY9/RXFrYr1s5OVgj5Ds8ZSK+ocG1Nag1ZSfqQbyfkxsa9sgq0
	9ONmtzN+cRmqoqNtUn0kQAq9yX3XvCBdKbBV1URJVneUr1JK6VPo8n0gn9EqMLzb
	ZnxuKQoj+gmZH6yuK/Dgw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794921506; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:FEhGMfQWyym87IeMcTxZ260WTS/rXlzwJod8mNz6WvCQ3Ah
	bPseVEX0sozwHDkE0MGyDseqB0F/DL0l9S5wURI5HdtulkQ8jypPfPKDzgJsw6qI
	IpTIsVldKXKudTrzXuosfuFU3tjh7UL0/g/1K3mIwhXj9jJ6NV2N7gRcaaIg69p2
	EflUuFTU3+DBSQjzu2GpS4mX0uTMsak4ehUsBhr+vsgAv3/1jrjLxh428UtiPJ+x
	w5GW+4Rb7nPgpEDLAM8i/Q2bxZ2xPw+OG/69EvJpFh/uA7bAa4yAM6Pp+4m0Hxbo
	JT9QEAz+f5WpJTZZdAlf/O+GBNww9d6yZ3roc/w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:E4p+jgEjA6z4YOh+zG8xI2+TIk/z5V7O3REzuJQl8e0=:s3MaRm4deGZPyFhIC/OTW6d1TxrbpBC2jMCuDZt0O64=;
X-ME-Sender: <xms:G1T8akqR9LXxK17B3VNCjPaUZv57ob7Yn46_dzb14CXweKQFfcsvSw>
    <xme:G1T8alcscSthCjjkEkXgL3qIRo-bMunpt4OBXbN78KGGfcuTDxoOWm0DixukFZnAB
    3jwegdzC0Na_olzE9jxlu50q8T7-2oo-ZplwiPDT5uLUjQ65k0u1q9j>
X-ME-Proxy-Cause: dmFkZTGybI4vNsfJtZzIBSKeQUH0Qakpa4RCkhFfnaLfC6yUDA+d0FhnQKXWZPDy/kj75y
    /NHXCGCkIIRkpWzs7V9nOux+5xMy4D//gORpgKSuDZagCYoHdROAEolXCtxYlk0V1qzgQ7
    tcyU5IV832OfArLFKi2C/fRZinN6cp9vGaENPPMTnNQB1tBH54th32q6znhW6538GoSMEE
    EhVz6USd1rgWFhLy5dx+8gopg3Q2n02hhp9Ut/26LIFIBBrr6XDaNrQr3uc7JLxPG1YIcm
    CXvYq72ZJ4TSsSUhaxEqTJ4r5trqsjQG41MN2FyVjBHM4jh7jdH8iSN98sq8Kket5g8KTq
    KPawFUnDmboDkfTjXA1nO+6db8zom9yA7ww/NF516/xY8wRTARG4qPKmjfyMlz5FZzA4+a
    UmK8pc0Ig7ijBU+s+TdVHbSuTD7IF1SFl3/OCRO1wCGCX1MOwhgdWVLrswT1xBdYUb5IZo
    q2MKDq7HBY1HPpvVYhu0TUuc2fFf0gvDTmeNvi4jjM/cWX23SJ0vmGopOyiS+K3gGgeuiH
    JaLkcuenAxN7oIrhjnHLdpKm8HwRus9h/Xb6D/dA3byDadtX8Q5Z2zWcygswz7dG3P6d1U
    aOIqYoTzVsKgm58c6yLw2B2ghJF5wUPpSx0T9gzjYz+50yTWNagB3MCcR8WA
X-ME-Proxy: <xmx:H1T8atf0rCO8nggJRHa3MyNETIrNXBA9ztat274b8BY8M91kpbOlSQ>
    <xmx:H1T8apDGPcEkAr2z3ZJXbIveHkxb4ZSuzFvSStwP3wvf13bTz57KtA>
    <xmx:H1T8anZqVdU-2n1FqALuJcgxj9pguX_xsdvzfQXPKL-6O-W2_l3BxQ>
    <xmx:H1T8ah5fpGKSVyEDLsEzjKY9JbCEw_GPFnc29qLNYFLNdcNn_pni1g>
    <xmx:IlT8ah8jKTg2Mn15xl3Eu9v6m_LkhV9tQB8vZpV-ATMNI6ddq304vKIJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 45C6C32A0099; Tue, 17 Nov 2026 08:18:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AruObr9CcEcw
Date: Tue, 17 Nov 2026 14:17:58 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: yogo.0917.sabu@gmail.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Radu Rendec" <radu@rendec.net>,
 "Ulf Hansson" <ulfh@kernel.org>,
 "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>, "Drew Fustini" <fustini@kernel.org>,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 linux-doc@vger.kernel.org, soc@lists.linux.dev
Message-Id: <c3832ce3-4605-4810-9348-c6fee394fe04@app.fastmail.com>
In-Reply-To: <20261117-at550-rfc-v1-v1-6-5879573cb825@gmail.com>
References: <20261117-at550-rfc-v1-v1-0-5879573cb825@gmail.com>
 <20261117-at550-rfc-v1-v1-6-5879573cb825@gmail.com>
Subject: Re: [PATCH RFC 6/6] ARM: add the SiRF AT550 platform and YPL514si board
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_051839_542193_EF1CC2E7 
X-CRM114-Status: GOOD (  10.21  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026, at 14:06, yy-Local-LLM via B4 Relay wrote:
> From: yy-Local-LLM <yogo.0917.sabu@gmail.com>
>
> Add a minimal DT machine using standard IRQ, timer and simplefb paths.
> Describe the SoC and the firmware-configured YPL514si display. Leave
> usable memory and the divided counter rate for the bootloader to
> populate. Keep optional peripheral nodes disabled until firmware hands
> them over. Disable unvalidated board suspend; limit this board to SD PIO
> at 25 MHz. Document the RAM-boot contract and the missing
> cold-boot/clock-tree support.
>
> Signed-off-by: yy-Local-LLM <yogo.0917.sabu@gmail.com>

Please use a real name for signoff and make sure you understand
the legal meaning of this.

> +config ARCH_AT550
> +	bool "SiRF AT550 platforms"
> +	depends on ARCH_MULTI_V6
> +	select ARM_ERRATA_411920
> +	select AT550_IRQ
> +	select CLKSRC_AT550
> +	select CPU_V6

Which CPU is this specifically? You need to select CPU_ARM1136R0,
CPU_ARM1136R1 or CPU_ARM1176 instead CPU_V6 since b5fdfa208175
("ARM: deprecate support for ARM1136r0").

     Arnd

