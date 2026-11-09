Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B56606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hchsomxc;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=U/3+jibd;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yOsGBGru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NcBU2cPzzA69TnFKl3QcEWwS4YrVCELU3Z1b9WHRzow=; b=HchsomxcCRRPEL
	CQMigBWTvu5YaEII0fIz91J/QMBf4yhVKURvMAuiIBzqrZDbmP58JQUvvrnVmIpbZfecFMAvbKjPe
	fXZF6yWNz5a31DHNla/nFqNlmXP6Z5RjFrSqU80xpCT2PXNPAfT91ufVQscvsy+A283doYHv2n3zS
	dzdjXZmPVbPAoDpJTCVlfsdMH/fs0u3a7ZozbjpABe3DTAdP72pxJit4FmyO1Jcl2OJEfozCirxhA
	DDQ+LU0/MsGSI/0wlCVpAyv4XJifHf/mR9PdbyrKRXI5zDoq00mN1oMIMoJf3CmgVgsaxKnoY+/Hj
	BNy2d+HLUXIJp6rKO5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQME4-00000000LUB-2Y6S;
	Mon, 09 Nov 2026 10:03:44 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQME0-00000000LSa-2SwU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:03:42 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C899C7A0160
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Nov 2026 05:03:35 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 09 Nov 2026 05:03:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794218612;
	 x=1794305012; bh=NcBU2cPzzA69TnFKl3QcEWwS4YrVCELU3Z1b9WHRzow=; b=
	U/3+jibdQ7w09n8aWRpqomoBEXOLgzf9E7RSvnbej+BpSS9jXiTaCxC+rp4EwjB7
	2+ljXNHVwGmMepBnmucfLh2UcA9Aq/L1wfsP8mIdDKksvQpcrrT+IXiubOQMgv9x
	w+2iC45jBQhDgymh+T8nMfy5aXmwg1WR37pHlCKT16zP9gxXli4VxYsZ3PN2vd6P
	Pqi5zZ5f/Zdn0TlpGKwamFQ/ByApdgBYgHZsoQ/ofIFVgnVJTrnBrLTdkgjkHnLr
	MQZEkCNE0qOirkqX0LboZ2tMgC/Ziwru9M+3ZOGucgXb8DOFhtO4LBpvJTYpamcb
	AH4O+0RP+E2sQmxqUmb6OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794218612; x=
	1794305012; bh=NcBU2cPzzA69TnFKl3QcEWwS4YrVCELU3Z1b9WHRzow=; b=y
	OsGBGrutSkhSdaQ/ocJkFKrEmFkUOXl4S6P103BxwZ8zsstGhHPRtEGO1GwbGes2
	OMBAe2FwcaSmQX/O+XBwhT5oZsW5EjG0DVy8v7BrPquJR5uuMzuCURi4IqjmKgcB
	8QwGeAvxBoVWRohYXXQIOgT/neg2AEOjhLYdjaHegPAJh5epFZnXmJA13yBKLDLC
	3Wy7B1Lq61GuDRbowUgCuKojMjGHqfUQ9vWGpfhRkYyunycUOz/Ja6riBqhaZvqu
	JqKWKulhxoaLaYKfl+IVynUB8mnLBEAAQ5mfi3EiZEcym+oENqd/b8uGUkmagRS+
	V1oHmYgDPPGGuyXHcMIaw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794218612; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:nfgVyNHeNhN0CUPeAcNdRpjP4RuqqWw67yGRaP9GQ3tvT4E
	9lS0WNHauUD+6kce5i0goHbc1eQM16/QYUGQ6Ndc8OC4oyMsx+LOFex+KI+JMm4K
	vlJ2by/5Zc/agf3IybSpTc1zIcDzuGa92eTyda6DnyaLuRcTWzl0aljfq+doPyDh
	diLYSbTp68l03bmgF3TZLjjnHoSOOuEAYNqHVF99L1H7KwrvNJ81c251r/MQXe3N
	rBFcaWJKhmgKt71jzhFbzfjrD3s2UMTMwT2CZuhQoZ8Tr0susMjNIGu/+K70C2yM
	cY0HL/qUdPudkTubS/amPSnoPTSP9jlfvEoO4iA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:/T8MQmjz4GgBV8DREY1eJ8DpVLZE+wGw4tn3GSaZ7xU=:57Zn1j/vg5m77olubO1nUZ0hRd4/i5D+ObqZzW2/XIE=;
X-ME-Sender: <xms:cJrxapzgnQqPss_-TwQrMYbyKTgsEz6hZ8621LCMpyVrbfZOmn0T5A>
    <xme:cJrxakGeY5By--w60vNj9Wo3ydd-t3hOoDrHtZWN4O-bffoJ5y6tHcPiVc2GH-khh
    lCZcW_xIZtljhaCardEgnKbIlLCQnsjqlIkHbMcqXD4PmBV7bNjqKvk>
X-ME-Proxy-Cause: dmFkZTGvWADeWR/cH2ixjH2ih6Shn7KR8b6kzpUoRzcAgWCVZfdu5PxFSNYgCdsaBx4kaN
    voP7dIVHKYz17En2UcFyHAph/oJuKXxytAVdfU4I8x/F6lTuiqhMeySiQmO4KuXRXZdF6X
    y65RrVvohm3rtrGxnryzfbyb7+PrWXNZd02w2yJ86QnvVtkrRu39DaIiTVZ8O+fsx6Eo/h
    mstnA7zFXRRLBJ8EtbIYWMy9ALVMztR49hHA5kQnxdSuWOMsBY518tECWvKFP3uwKMP1Uk
    qtKLvNyebuxzJRINHjt8OdRLXuZ6RoC3ijSQwIWccFJO1SAcPpM7R75j/bwnWgXjFAgGD+
    eacF6WdYw8srTH0TxqnS2/AASgz6v10E01ZNPe5Xx1N8h2aI0IP0NBkU9h6SK584V66C68
    roKXba+DE/MtDgsKiZzrgtfn4U59rzi0fNgPq9A7EDMDmQppcX9YARd3KjraRKt1JRB7N+
    wwzz6jL4Q6M9cMtrCd2vzH7SBS3If4zTS0PhBuW5MM8TImzSKHxODJQcQP/Y1Rn7UVCaLj
    I9andH2RXfMutRY5nLTVhI1DhFEDJh0NXF3We+h9z2M50zcS9z3hrN5SfYjWIQ1PW1OhNN
    mpgaCrPxfvKPkGpNaMoBvMqq9X+FVG3sdBWDd9Afo24nCrLJFuzYjiRqviHA
X-ME-Proxy: <xmx:cprxavUQ6OAb7GkkSH7a-EuKBsPopbhUTIUUyKARXJsHCKiouD2UPQ>
    <xmx:cprxajcpzFDVsQ3QyEqRyk9yspa1t22fXjOnuZIaIRsZ-s6vv9AOQQ>
    <xmx:cprxaoYRdFRSwPwsIcuDgfJLZzqrc6VdZel4tKDFR8lVb0I33GFTEQ>
    <xmx:cprxavNE41VAk_zq_paGGP-cPuBKMIjA7aYU82M5vnVU8ofljaMy-w>
    <xmx:dJrxasDgAn3QgTRQ4zX-prmDKdcIj5kwR7Dvp1_aSxo4tlIjF-S4Dy04>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 5D2B732A0099; Mon,  9 Nov 2026 05:03:28 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AW8OeY5oRCck
Date: Mon, 09 Nov 2026 11:00:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
Cc: "Daniel Mack" <daniel@zonque.org>, "Russell King" <linux@armlinux.org.uk>,
 "Sasha Levin" <sashal@kernel.org>, linux-input@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <8560bc0d-5687-4b77-ab07-3d6dda465537@app.fastmail.com>
In-Reply-To: <20261109080944.3802916-1-dmitry.torokhov@gmail.com>
References: <20261109080944.3802916-1-dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Input: apm-power - remove driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_020340_897096_A5B46098 
X-CRM114-Status: GOOD (  15.82  )
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

On Mon, Nov 9, 2026, at 09:09, Dmitry Torokhov wrote:
> The apm-power input handler solely listens for EV_PWR KEY_SUSPEND
> events to queue APM_USER_SUSPEND via legacy APM emulation. The only
> in-tree platforms generating those events are legacy Sharp Zaurus ARM
> machines (spitz/borzoi/akita and collie), none of which were converted
> to Device Tree. Both mach-pxa board files and mach-sa1100 were marked
> deprecated in v7.3 by commit cc7852314abd ("ARM: PXA: mark remaining
> board files as deprecated") and commit 7d92e50ceacd ("ARM: mark
> mach-sa1100 as deprecated"), and are queued for removal in v7.5. None
> of the remaining ARM platforms or other APM_EMULATION targets
> (MIPS_ALCHEMY, PMAC_APM_EMU, and SH_HP6XX) emit EV_PWR input events or
> enable CONFIG_INPUT_APMPOWER, and arch/arm/configs/pxa_defconfig
> already dropped CONFIG_PXA_SHARPSL at the same time, leaving its
> CONFIG_INPUT_APMPOWER=m entry inert.
>
> Normalizing dashes and underscores in scripts/modules-check.sh for v7.5
> exposes a module name collision (apm_power) between
> drivers/input/apm-power.ko and drivers/power/supply/apm_power.ko.
> Remove this obsolete input bridge to resolve the collision rather than
> renaming a module whose last target platforms are going away in the
> same cycle.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

I missed this one and thought it was still needed, but your
explanation makes sense.

I think we can follow the same logic for drivers/power/supply/apm_power.c
and remove that once my board removal lands: the only actual battery
that is ever registered with battery_desc.use_for_apm=1 is for the
OLPC XO1.5, and that one does not have CONFIG_APM_EMULATION, so that
can probably all go away.

Maybe we can then fold drivers/char/apm-emulation.c back into
arch/sh/boards/mach-hp6xx/hp6xx_apm.c and drivers/macintosh/apm_emu.c
as separate copies. This started out in the mac driver to be
compatible with x86 and was later unified across architectures,
but is entirely obsolete now except for the few 20+ year old
machines that were converted to it in the past.

       Arnd

