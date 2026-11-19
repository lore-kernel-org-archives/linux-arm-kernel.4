Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59A2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 14:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OfuIj3K9;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=EoIUktnj;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=h2KrdnBD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=01otf33RxSte8QwJA3GEyoCTItE4iig/ZqEIZE6AbO8=; b=OfuIj3K99auSC9
	ZOFtH9eW6BP1DmqGP27lGXeq6Eas+ovSHndpqvi1tSXn1daV7WG0knpwcfYsBM8u0fzn4QRZdT5en
	M0UkZHVVUyUO3xYBHeC08NdzfQwbZJt+Uz25lp4SbOwAreMZqwxMMYdZYx+euhaw4Ge0subddPzQI
	IvgAyrc7nF+KgUjB43/NHlw3Ckzqeq/T+LGYOTyGnLWQmB32vp2yiSfw5zC6ZjtfkKz0ELN7wInBr
	0li4muQaaoAb+5oKbdvORM+cq0cE9jmxkPgi479lVvl0iOw72RkpSGjSx7p3+cMBf3SbjgWyylz5x
	l6znfi3uwYmtfv1vfEMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2yt-0000000CCPs-0EXW;
	Thu, 19 Nov 2026 14:19:19 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2yn-0000000CCOH-4901
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 14:19:18 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5CBD01400130
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:19:12 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 19 Nov 2026 09:19:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795097944;
	 x=1795184344; bh=01otf33RxSte8QwJA3GEyoCTItE4iig/ZqEIZE6AbO8=; b=
	EoIUktnjNoXwzv8dS6zIUjbqeifiPckygpbEgoj6jRRcoK34T29u7nMhNhKYF9Ao
	ElQgRp6/UiJLdioJ1Uw9NXUq7InWrJaGXtRicuvCwlls4sPG1fy9/9w8de14d6Xz
	prFerkCzfFFyNUj0VQJ+Cf2CxZY8xlK+OQAIkBSQas51pKRvZ+vjIwkb2MXQ9eTw
	JZFc2e9hYG4Qh3ayGiM7DygA6+zYV2Bq3C7k+rjrTb6z41AgPe+FkYRRtKZNbrFR
	Qfvm9/6S8rXBlcbkmXKLRHhtY9t0y4/LJ+aam+11oeTEHiIEp2opVuqZOjrxkY5s
	+XnBwBeSuYGeoALqdmqasA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795097944; x=
	1795184344; bh=01otf33RxSte8QwJA3GEyoCTItE4iig/ZqEIZE6AbO8=; b=h
	2KrdnBD4oHFdj0rLXsqfNDuxtnGUP1LJU9wXMuoBdjK/QRcMkLk+AJDyvGZ2H5Xr
	48tJ97KYUHNWFeyM5skPiEgwGj3pwCeu974bBNVs1CEev1RdXwl+Xs3+/Cax9Jmn
	i3TnZAp+mg7tXKmNIo33v+QH2mjFlfUZXMYIN9iv7HusnVkP6h74oXSuBMV7W8D+
	QOQa6v81f1H0N0/P55oyG9719WJJPyqU/e3BXpjJR77L8RHNRcfYvV9o3jGE7wX7
	AIFSJ67ZuUJHsEStMbTuapuPQManwvq6Cd7QNdbOliG8Z2WpH1HkNts0qSmBfls6
	YTrXsm+S+ZyvUsDy9ZT7A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795097944; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:NHpMkMyHMZtLniKELvhwQStwL8975AY3yQJntFVO3NejGBb
	P01+A6zxp+Ml3re6wW1Ga404mWVG3onHHx29oOcx3YsTwAhUgokxRXYa6PzU2TlL
	+2LpC8FmBm9g0qoyu02xgnhtr046WkWuimbM4VrcMdpqfuIkeIYNeEQohkrJPAfg
	xJUcT0Q3U8BpBLaJmHtnQpnx1Nokq1zS1cXpVR8HjDXBGY8144uCGEFYVs7Z3tWQ
	jHJiZECzYUSulKcpkH5deOUspkapMWP4tw0xPC/htkGQqa5AjYyrHdVAN5RciAvW
	9VAHQdT/XFJQydpH2B74EQaedECly8hXaHi5DCg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:krR0+YczFIO3+zdXy7Z/za6sK29LTPNQ/dPu1fbwuUE=:wrF4KQUa30FhL8Dr9keH2zmryDL7ZnCEKnekfBbv8Pk=;
X-ME-Sender: <xms:UAX_aqUwwYD29dnpJKfOnOqiOeeYmLycCx51Wm7kuD7rCfg4ezzOFw>
    <xme:UAX_ahbIoC1FHKNXhWwlYyrtoGYG6NDcIafBcpMy1XDFy9PlgvU26tzm92-8QQUmf
    nwGCPwhmW-x9JRJ1fJtprwt4vDrkhCCZ3ElJaNNBTtgddvtEqurPMmV>
X-ME-Proxy-Cause: dmFkZTERVl3HBLVOrb/B5W9SlCiGjcntYqbjfg2rc15q2Ityk3ssPrEgzYujGztlf0+i5y
    IUePtGtYcnB/oLsKiZjiV9ueq+oUrcMKwKJTDDqxuPSA/hy/FzPBrOKEcnLDWsbGzDryD9
    Zg2g9MKRlsfGLNeDKBJjkfK6s7NMH7UNYZ1eklYmKbno76Im0PjniL5ON/XVUGePe810Lf
    CQZIof1fML+kMgA208+AsvWtltCKuIDdFaCpFOAd7MCUoa/+TmRphnpjHilFEddz3Bk4Pj
    J4ICYtjHSS4AVOVCSDLUmQ3hWo8yqZ8bbxZsj8jM19cSWbJWi6uwTJLEghGJx01Fkmo2aQ
    JWkIMc+IzNqIgGCokQFd6rtQfeU/H9NOcj86/7PGyNR47Iq5ERKUDJPD0/dX7+2Pczq+cQ
    DHWPzBfYOke+EsTg8eEpWMH1X+cbPwywgCFSzVBCePBDne0z74e+y46Wpnm2y7RCppAbsE
    6xkC4pU+s2LwHUVGWzSC6viDczmwndPe7y1YDFaeJ+qWsVHmH5pfpOvv6WSzW8oslzvApA
    bISG02sOsFYEvdO5nq3Yzd3ZX+GXyIW5MslSF3U06KM6NA2quAwNJWkseqHCG/Mc4l7s3D
    cuILIX4Y2T/8DXDGBxUqYcB1/n/pTANF8nbNX4gwHawqOLMsipIvdVUXAulA
X-ME-Proxy: <xmx:VAX_aolMXSEpB77rIdMNX6Sq20r5bJvHfE0yr2-ifV9atgGlX1bj5Q>
    <xmx:VAX_alADAXppjckRX-rOXY3QsRH9NwwF9Zvxqx3SskCN6nIayoEI2w>
    <xmx:VAX_arLB30Ba-F0LXA5lIoXGOV_V6KNAv33Xgyx4azBpodr9T5bZoQ>
    <xmx:VAX_agxsLKnP0wF2ZPyiHy_qXWqwmJkxhT4jXtBqAjcvKcrJim1Alw>
    <xmx:WAX_atkZJp_YLsE5qL5ixsu0-xtRySH1ySqOzfHN1s8DsOLObf2lzhMq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D0F9D32A0099; Thu, 19 Nov 2026 09:18:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A-12XcIUUc5R
Date: Thu, 19 Nov 2026 15:18:26 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Long Zhao" <longzhao@ambarella.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>
Cc: "Jerome Brunet" <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
 "Brian Masney" <masneyb@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 devicetree@vger.kernel.org, "Long Zhao" <zl020895@163.com>,
 linux-kernel@vger.kernel.org, "Linus Walleij" <linusw@kernel.org>
Message-Id: <1148990d-dfa6-489d-99f8-4bf4417b2c4c@app.fastmail.com>
In-Reply-To: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
References: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
Subject: Re: [PATCH v12 0/6] arm64: add Ambarella CV75 SoC support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_061914_611190_D3EEFE5C 
X-CRM114-Status: GOOD (  14.65  )
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026, at 11:13, Long Zhao via B4 Relay wrote:
> Add the Ambarella CV75 SoC and EVK support: the board binding, the
> RCT clock binding and driver, ARCH_AMBARELLA, the devicetree and
> MAINTAINERS.
>
> Apply the patches in this order:
>
> 1. board binding
> 2. RCT clock binding and clock ID header
> 3. ARCH_AMBARELLA
> 4. RCT clock driver
> 5. CV75 SoC and EVK device tree, plus defconfig
> 6. MAINTAINERS
>
> The ambarella vendor prefix and the CV75 secure scratchpad syscon
> binding are already in linux-next. This series does not repeat
> either of them.
>
> GPIO, UART and pinctrl bindings and drivers are separate series.
> This devicetree references those compatibles.
>
> Tested on the CV75 EVK. The board boots. That boot used a local tree
> that also includes the GPIO, UART and pinctrl patches.

I merged this into the soc/newsoc branch now, which may get
additional SoCs from other vendors for the merge window. This
should be in linux-next starting tomorrow.

I also pushed the contents out in two branches:

https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=newsoc/ambarella

contains all six patches, while

https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=ambarella/common

contains only the first three and can be merged into the other
subsystems. As expected, I got warnings about the uart and gpio
device bindings not being present, as they are getting merged
through other trees:

WARNING: DT compatible string "ambarella,cv75-uart" appears un-documented -- check ./Documentation/devicetree/bindings/
#152: FILE: arch/arm64/boot/dts/ambarella/cv75.dtsi:76:
+				compatible = "ambarella,cv75-uart", "snps,dw-apb-uart";

WARNING: DT compatible string "ambarella,cv75-gpio" appears un-documented -- check ./Documentation/devicetree/bindings/
#177: FILE: arch/arm64/boot/dts/ambarella/cv75.dtsi:101:
+				compatible = "ambarella,cv75-gpio", "arm,primecell";

     Arnd

