Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29194606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bemZEBhO;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=cgC+Y2WX;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kE/mRSPY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tb236Dm5vjk3jIJHIZtBKJRyeMEkcz2Hz6AmSpXUM38=; b=bemZEBhOW2rXnu
	kpm209x4rDykGyCQkde2eCYmqmLypOovzUTu7dx0WHC7S6hU+/AQ1sVwJmxgcg/UjC761iqhGMRAy
	PHP/9LYqFJtgIOK+NjbjVbfXg5q7XL0sBcNbx9dDkHPQCjMSnOyLIEh6q/0laoecFWwXnGgAPc7wS
	Dtbnsz7taQuNCUDy9Iu4z0Ggv1TaNzcCPebSbUuoOfSh3AOYmKjIM6VXeS6Sn91pLbtxBxypYI3FI
	4h28O5eHH/sO7VSIklNRut8f+Mj1DkMoHHYy6fv0bsdb7XzmEkgUBKnqvsliwJoJocT9wF7NQdMUW
	URUEPrXyKI//XajHz1mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhVV-000000039vl-2OQ1;
	Tue, 10 Nov 2026 08:47:09 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhVS-000000039uE-3Cep
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 08:47:08 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F153114000C1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:47:04 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 03:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794300417;
	 x=1794386817; bh=tb236Dm5vjk3jIJHIZtBKJRyeMEkcz2Hz6AmSpXUM38=; b=
	cgC+Y2WXxO/XaImP2Gm48Wap91NQSiNuC5bPDsseRWrORVRfmbbWXNQosdG5qKP/
	hl7uhyaxlhnj2qvg0FJGGYqsrVfkRvwFhB+uz8/ad2rq3j9nrobXhl4bnUUESCSN
	T0U5W6qYyKx2vLFLMMhDYcE5TdpGVsbSeLJxM4JmLQizdUdU3NAuP4VboagSHVxS
	bPWd/LYM0ebOe3n6OZhXv+8KZcVqqCgkO2hNRSoAOmN6nApW8F++nP7OL+Jghd1z
	pv66YhkWVPXQ1emlHL2qpc3rc/c+PvBBIK+qcapDm2uNmPGNxQyZ3Oyd+m+Iad7s
	XuxC1IjAIyaFtuGGL4DoQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794300417; x=
	1794386817; bh=tb236Dm5vjk3jIJHIZtBKJRyeMEkcz2Hz6AmSpXUM38=; b=k
	E/mRSPYeLWtnTujMQqC+6MeTrE+UKfjRBdR8AX8oroox+S1B0gYbl08nb+pcRFWP
	dZLPqck94q+klISPxktsroSmqOP7Z/2DLr3haN8K+aTPWurrEXBonJR6JORXcPTS
	ZPswAFAcZLo5kBsg+5vIHkAJitT6sLiq5hgG/L+dmMQzscTiqI/jmaVRRqx2+XIo
	Th9MTu2LiBJhHy/Byeqs1Qx9aN86VSkuvuHEjysASJD5QdzXDdXJKGmjP9zS/qjp
	ijm3wcGvpM95upb80dfIuR9dP7F0hEoCzvypNwmwiRX+k1ig6BlcVu+a0Lb2IdMj
	sAfV6w58gdUr9wsdji2PQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794300417; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:CV1QzkRU3bdxqJwCwrxsrZtnt6PlClII65zxbV/LIfDRRPk
	/9rcJcaxx0j2mMT8T31HtYsYKaSAt/VEUVGlAzeGBNgIhpxH3Pkf2mr/5HkhkDUA
	CPDnA4vQv/ZtxydY66+scIDEvxsrhbxbT13y7EM3nB4kvTLtlQb3SmeVMupcwEQn
	mtLvDwrnkEBLJxk4ZYhMkg6lnG8PB+GfYR+lmM6Kn/OYLmpMUeX7tYGL52ubfbOa
	ZbgFtANaj7gznL2q6Pq0hQ3UzdJQwIY9bdaNSGY7zZqWfCAV0+B10/4WN/AkgEM9
	PFj0fOaMOJJ4Fjtp1bryN03zvLAHCnQRP4ZzHEQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:lERdrb9Ixmt/09H167x565OA+x+60OUGjeylKHspBT4=:/J/XjW7Q6CFdj+SNsM8IKlFX81NAeeVIkFwzukOjqaM=;
X-ME-Sender: <xms:-tnyapZWpF7wmx-xErevIPpESn9od4WYUbneta5UlMF1DyZKOrXa7w>
    <xme:-tnyarN1mrP318EQ7eZAOCEin2fmQvn7aELTkSzMqyVL64lXEQJ2yMdc0iXja-5Gj
    d7-nprKmtLa84fScPVNtjUXWSgO9N11d5RbPOPKdjqQ4DN3wewilaxX>
X-ME-Proxy-Cause: dmFkZTErx1dxoqSf6te9rXHPqp0f1SJG/nfdWjOU7ZalO87A+EP4qML1q0Z0D8gxg/nRWC
    rvfIBrNbS4wqwUNlWo/9KOxDTwGOhlIXs8DwpTnxQBvdJ3XFf8AYcyH9uv5L2alR1WEZZY
    YAOY30rhi9AKJC/pO2DdYe1oePMkSIa3oFgFKmZGPqe1XxtwiCj1GPkRLFipZntZWM+KeB
    //2NuoZILEAf0rhOOLud9ax/noqUHj31GklZ/DeCrl5G8BdmbpNh8Mme3/E7sFzUdMddXc
    gvZ8RE5e+VmIGYI8lt8iNh/6COeH4R247RPHZyeSvx7zMUO4KASDH+ZWhqu71g/24fjEmI
    +VlonHM3LwH9lX8bzfkCxMXcl4KHEfqgf7CE05e5nPpb/S5YEQCcptGJyQg6OZ1igs50+Q
    lcBBM7acbUOoBx+F6ko9cMQJIrV82q7SQ3QikYVWRL2vanSAs5ZHI5ymDoIqZf76vuZG3t
    /6exr7ZlBOE1DMvqyYM0HB4FryKT1nQ3820ZBtrU0/rpK6SivFbfRI4vB8QLKpOKAG3cOK
    NJKaspt85Zu4Gv41H3Tjmv+br8SL1kbryf3eyDw3xImDq2XrkWZASsGdjknHNxOpeEAHJ5
    jWG3cIpSozZ1BvcfbolW73Kdtw2oqERaIbQK3jB9y5sQBDNsFx6WfAGVZXog
X-ME-Proxy: <xmx:_dnyahLRQ_SqIpxW5ldaasvoRJZw1y8bu-mOJoR4YiYu1EifSHjXGQ>
    <xmx:_dnyaqWHhl3huLu3H0ff75gGpVGetik4mBPIsIQFydiUv_9glx_SSg>
    <xmx:_dnyauN3-clC1hcF9Et2ItV1Eo2XlWhsETg2vEftAmFAa-55UjXTxA>
    <xmx:_dnyaukE-5Vt6vurldhKktgim6GhalK9eXVaAPjAJstnvs7nSAbjqA>
    <xmx:AdryaksipLQyu4Nqkx8C9EgX_qlE2hcaQ_6UpkzGv2xMfKSJ-gW7ioKC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id F034E32A0099; Tue, 10 Nov 2026 03:46:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A4QaHkHhrVgc
Date: Tue, 10 Nov 2026 09:46:29 +0100
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
Message-Id: <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
In-Reply-To: <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
 <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
 <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
Subject: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_004707_053350_EB3C2AF6 
X-CRM114-Status: GOOD (  15.54  )
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

On Tue, Nov 10, 2026, at 09:27, Krzysztof Kozlowski wrote:
> On 10/11/2026 09:23, Arnd Bergmann wrote:
>> On Tue, Nov 10, 2026, at 09:02, Krzysztof Kozlowski wrote:
>>> On Mon, Nov 09, 2026 at 08:22:33PM -0500, Brian Masney wrote:
>>>>
>>>> - I create a new shared immutable branch based on v7.4-rc1 and I can put
>>>>   the first two dt-bindings patches in that. I merge this into clk-pile
>>>>   (feeds clk-next) with --no-ff. The DTS folks will merge this immutable
>>>>  branch as well.
>>>> 
>>>> - I can then merge patches 3 and 5 into clk-pile.
>>>>
>>>> - The DTS folks will take patch 4.
>> 
>> If the clk driver is required to boot, I would
>> suggest having a branch with the two clk patches that
>> can get merged (not applied) into both the clk tree
>> and the soc/newsoc branch to put the other patches
>> on top.
>
> There is a build dependency - DTS needs clock binding
> header - so it has to be second, unless the dependency
> is decoupled.

Ok, I see. Let's go with Brian's suggestion then.

For reference, I'd also be fine with the alternatives
we mentioned. We've done all of those before:

1. Include the actual clk driver in the immutable
   branch to cover both compile-time and (potential)
   runtime dependencies.

2. Merge the initial clk driver through the soc tree
   alone with an Ack from Brian.

3. Decouple the dts from the binding, using only
   numeric clk IDs for the initial merge in 7.5,
   start using the binding in 7.6.

4. Merge the clk driver in 7.5 through the clk tree,
   merge the rest in 7.6 through the soc tree.

      Arnd

