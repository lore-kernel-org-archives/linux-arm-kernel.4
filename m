Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BDB606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3T/tsm5t;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=ZFg7XYud;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=1uQLCPUh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VRT7mJ1HJtli90asQUPZL0I86WWZMiU/wK7Ix1+t7eg=; b=3T/tsm5tdNiLtl
	aKVqhioJH7asHiIsdySrAj+ThbVfRM5q0DAjUHJR29r2RzHtfV7QLePcxTssbL7q5f+WUP8YbFJFn
	SNjqS7Fzz7FCsQXVMMecIoK1Ov6jzItl6XCzvu9kmPtpH9krE0sV43kI08imcjMvCvrOxbyerlXqX
	oWjBfyQSQf3CeABSwy99W8WY2v11XPJGng3kQl3zmO6fzpoEwm18DEyAaa9KJPCrNx69JdG39s2KM
	7DNdQwfyvWDHU9SdT0v8D/0hbqOKQniapOozUXGUifX44tkHkx7BcPv5yDHDAbLQhQ7l+e2w60eaq
	kF3rN6Ufrlyqfaw/pLbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVAD-0000000A8fQ-1B3r;
	Thu, 12 Nov 2026 13:48:29 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVAA-0000000A8et-3oTx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:48:28 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 84CF11D00142
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 08:48:25 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 08:48:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794491296;
	 x=1794577696; bh=VRT7mJ1HJtli90asQUPZL0I86WWZMiU/wK7Ix1+t7eg=; b=
	ZFg7XYud8u3ZU3Vkr/1+eIliGEe+kQpH74nnhHWI7Eqc+HTavuuK9CUC1l9eKjDl
	jxu0OB8wXxkeLLbJv/9cSzU6GZc5Ct1v5d2nKsqHPbE2eB7l1wEap3sBTnrNH9fd
	tHE/oZj3+liNdFO1FR9C/XEbBMz1bm3QTqTsv9uWf9GEn4OB+UsPYx+LzAu+UJJO
	kRuyewpUP8qR94gZ5U+ZiVkd7Y8gPbDaB1GcbLOwO/p6es1saLOgeIvtTtKfXkxI
	VUfs+tVFBkTtn2Hro2xBsdP2fIs8DZ3ubGeDC4d+RPucAlx2znFsP1S5Gpq2O/wS
	nD0UZ6mz4iqcRJlx1HrjTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794491296; x=
	1794577696; bh=VRT7mJ1HJtli90asQUPZL0I86WWZMiU/wK7Ix1+t7eg=; b=1
	uQLCPUhfpBkq2Q22QgeuW9H5rrij5v+JMSy5FM2Wn+bVtVQBLeosNDVadLXZzukT
	3ouV7DnyvuyiCjMHoXchkZDUIAQ5TNEOLM8fzzVTzUmtwfczTeK2Z9KzWhjwH51f
	yDnw4gyc+K0fXZmrcuW80+VEyvEIDtNjgrjgvRYEjyryAv/MZzVXs4TEY03/oaGO
	0ZFAdG+NCCE6y9SCvV2bOMdPwpuvyjJJWHehPsHJjVpsttWDo2kiTwmWwwreEe5S
	85mDPA3PfONLF0QXnmwQletEi95k4tT3wPna+QS8PYV+oeL/9yPHQJP+K4xyjoxj
	ibh6+VdtoW1xNp2Vd7e3A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794491296; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:ZAiBD5VHh3GBxuHZKMgNfSp7ipybELYmwNo5nBCVVkHQUcl
	YsPRtljVMpPQF8cuChS4s8qWPv5KnkwnnNtdVlwXiiwliCvDRfemtRdCddJEt9s0
	p+SqLbOxzTZBEha9ycyKAYiD/JpTvty3PHnefYFwJJm3xQH58LZ0WrSpuGr/koW3
	Vn8LwTxuBKyK4PYHlM49CGtrtr2j+BDj2nVfIMlenluZPqChxEMZwVgg9M4Q3BiX
	1L5TQwFMuSSAoKPSZhyYoywLeSW3tckLGl1Z+GPMJcrBEqbPwkWAwtFgZS4kFQh/
	RaOD2SyNwd03XDbNMD2/yjcG/gR4pHPFsEWHBzw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:cDV/QukbB05DRWJQW1ny9Aplo0b9qlgUV7WG7RUjw10=:QpFJvCcS58Sd3l/liFWB5KOxe2KSj2H6oM6J00vPM5M=;
X-ME-Sender: <xms:mMP1aiXThfwsuTrckyvDNGaYKe-apvviZAyhg0Ae8AMVYARi_onkow>
    <xme:mMP1apb4WFgdoJcRw59RSXVmyyuJBI2enov0nwdM4Ezb_w-TOtmg7uEroPc3LUZ3H
    ayaSunT543I9lWRFx4LIM8LWal-iabylMdGB5cCQE1D66Elz8C01tE>
X-ME-Proxy-Cause: dmFkZTFSmrUQX6bVW+lydj2wLsCuvaSKIx7UJ4HZRXOwisKCAL64G7eTFeLIwxo2T5imjf
    E1T6qbM/BpAj3rqGX7z/WvswXxFcRdzeCXGFLaUKXMMCfRQjNd1u0uFGorpgeWiaCcwvut
    z3Yv2eiVJdW58Aeq1cotcHaZ52EAnYL87aE6+8qn7JtG48eGsTjG5u4OA3wp7Sfct0hPl6
    SJDUdXRl9Cp8oPKmtjGBmtHsBuFdoplTXhuvisAGQwC1Vl4MnT6XIgyth+NfI4Td55nldD
    Gyc31cN9GH9jT3czwpKGByIajJOn4jOEuqZDft6XCP0PJ1RDN5ohH/x11Qe4XbGdlpD9Bi
    D56KnFCMSvcirQwaOYWvKT3yEGTRCa2GXjvhrXOyUbOtNJhcYJmv/mZdKsc0omGFwtHoL1
    ZkKG/RRWMfHUFxSWX1ntYPunZlC++v21L/7td61gFdlBMiQIgffRJiD4V6POoDLDEgTFUQ
    qLkBCOWSAKbdoishupBjm/gVDsjPbYVtEFSRUCDHEOb1xpXvwmyd1YcBXdVJHQO5JfUhsl
    HbYFkwCvwU7fLtFehoAetiILiInkyZX35SSJZx3I+2ihzpc1jP5mRs09gVazpURvT131hO
    5MSiT4pcVHLXcLK6h8mKLFX/3Z8vTZd+SuwiYcvj5SIZIjvgFSDgssRisahw
X-ME-Proxy: <xmx:nMP1ak-egndCZ57bWUj3sKD_G9xgJaCR7wv7-Th42nK5bwH2bvZN8Q>
    <xmx:nMP1akoYo7PrCKZAkPmeWaoUQZXQtHTMUgGLRbP4QtbRmof8uDNWrQ>
    <xmx:nMP1ahPdIaqFM8xIN7rde2bXAYz3_nLjAgCk8jEliTPnIkGGn51udg>
    <xmx:nMP1aq6QcTmNrtWmoW4WwRUC7OR_XhZlbvh63W9H89hpDWjtKomLVg>
    <xmx:oMP1aiZgXBRRtMTvaCTvs1d8MGU9Z8LHyeZ9oDKxj_7O-wQc2k1st61T>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6C4DC32A0099; Thu, 12 Nov 2026 08:48:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: An903QizF2Ds
Date: Thu, 12 Nov 2026 14:47:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>, linux-mm@kvack.org
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Jason Gunthorpe" <jgg@nvidia.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Matthew Wilcox" <willy@infradead.org>,
 "Malin Jonsson" <malin.jonsson@est.tech>,
 "Richard Weinberger" <richard@nod.at>,
 "Russell King" <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Message-Id: <ae1a379b-89be-4284-b65e-4a6cf6aeaabe@app.fastmail.com>
In-Reply-To: <20261112112528.1116405-2-arnd@kernel.org>
References: <20261112112528.1116405-1-arnd@kernel.org>
 <20261112112528.1116405-2-arnd@kernel.org>
Subject: Re: [PATCH v2 1/6] ARM: remove support for highmem on VIVT
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_054827_003154_B5FCC947 
X-CRM114-Status: UNSURE (   9.77  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026, at 12:25, Arnd Bergmann wrote:
> --- a/arch/arm/mach-omap2/Kconfig
> +++ b/arch/arm/mach-omap2/Kconfig
> @@ -135,7 +135,7 @@ config ARCH_OMAP2PLUS_TYPICAL
>  	bool "Typical OMAP configuration"
>  	default y
>  	select AEABI
> -	select HIGHMEM
> +	select HIGHMEM if !CPU_CACHE_VIVT
>  	select I2C
>  	select I2C_OMAP
>  	select MENELAUS if ARCH_OMAP2

I'm not sure where this comes from, it was probably a mistake during
rebasing. None of the V6/V7 CPUs can be built with CPU_CACHE_VIVT, so
I've dropped this part.

     Arnd

