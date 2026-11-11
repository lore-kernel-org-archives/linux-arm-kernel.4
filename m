Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F23B606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y3JidIT0;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=L6KxIxNR;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=z3G7NLTa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NVcjCF7rhlArp5otZJmKV4IJZw6ysmYorRuSaEeq39g=; b=Y3JidIT0QLjQH/
	2IU0+uRGOPda6TGSuQJWhSrMGmAP0mpS+ZRu7KPg+g+mGlnsgwdJ6Mua5TSB51PxBgW00y9oKnWt9
	k9ytd00dpnbvXVW1HiNq+m7oLG88HM2BI0kYTNe+iAsadH5v6F09t+g26o8+GOoVQguS2FJybHOcS
	zHkVnTR1dnbM4WXmf3gutFjBcaZx9WipsSPFgPEKhQcSyxDW3Rc0AvLmzX4HeblNs+CMycnLcALdq
	RmNW7i3lAR/8vSu1lipowa5fsg0rs30+kBLzIn7V/ZiiR+naScRmD4+uthiOICIGWRBPJqJLdX/mq
	gn/+2Cevn/rP7A4gnKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2hq-00000005tqe-0Htb;
	Wed, 11 Nov 2026 07:25:18 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2hl-00000005tnd-0O7k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 07:25:17 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6DCDE14000DB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 02:25:11 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 11 Nov 2026 02:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794381908;
	 x=1794468308; bh=NVcjCF7rhlArp5otZJmKV4IJZw6ysmYorRuSaEeq39g=; b=
	L6KxIxNRMIcT1yT8IYRVjrM1dMK0OHipnX7SBWFUu71YQOzhbqw8kD32AMagYsxM
	/7q9FfW+vjnU2GeG47XwS8Cj+1W9W3BFw81X7owPMUTKvd0avsi6g8cSmSWUdasV
	yRDoGtF4tDgp+Yj5fcC1bPxc8D3Tmy+zo2EcAEvjj5Ljoe/gCiVRQ6aCPFtgkhfz
	Omu0cVoMvngHHLJdx909PloYIcGENdAcvuHiM69SsCEy3lpcsBqn3wWKht+p6DwY
	XjyQYMDyvg1ubEI3cjmCFJdqYsyARcfKMc550mnu5eCnXRUO7uUlvo3WfLtDJP+2
	H8JKN1TGRG3Qm5JkB4xRwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794381908; x=
	1794468308; bh=NVcjCF7rhlArp5otZJmKV4IJZw6ysmYorRuSaEeq39g=; b=z
	3G7NLTaXAr257e6nfrvQiJ5KtR0mo50tUYXwPqZxFPIJA2+Fzxmq6CzX9KR8kY9V
	J2nipRlboQBEde/WLECAOPHSV1TJJa+WVzzj0YUXZ0ihlFCS9YLxmjIlFcOzeAX3
	Zkz46DdVhXa2qIslJxh3RaQL850oJ66nD5VUX5O+6ua/iPxPo27m8WG+igO0ldwn
	ImTYGbAm+P6FF9RwLmZeYt9RVzK44EBznOvz5EV3saKweGJsRaK+FlCmnpMLzDH7
	Khs26XQk8DP/D6gdlwCCgBUsoABuUpaJU92y3O5hjNR/dwCx0Jpc9fKxEqEWScVY
	aWVHebOUAUoIVWVZGsKDg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794381908; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:mj9CjtLnV90zQUTg8/l6H9Jn0qI/ToiRv6c9mLf5/rmHfkg
	lBtVVZw17bqnKaxJyntb0ad9gLtqdbbFmNYj8qn4RHh6h1LFUXlAiwszS1cjlVQZ
	u46rvVTRGTLFO2Lzr7OtL8mz+d11LM32QhoNL5Yci1ZYu4n3MaDU+tdo/RsuTB6r
	7CcaVJ5eDBnzoG+O6A3Lb/EZhtB6D7XvaTU+I2tQNO4VmLIJNzygaTQYJSI0E5MP
	WhhlaTWKfpb7Sr9wTvdjIx61EYCNWQbYeiFvMEu3qW0bII9tQ0iv0ymKWOj6C7G0
	nAfJfV245yIC/OrEMbNMQKDXIpeqB4fDWbgXzuw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:aOfYtNPU96Z48LF9ydAMuDHYASQYrZPzhjyCB5ZCr1c=:2yjuHutRCW9OHoxGJi/02rI6GR6G1quC71CFLlLGLq4=;
X-ME-Sender: <xms:URj0atABPQVf9F9exXwZzYSqEnJ9f-pxWVMiy9pfQdvjEQIRgk5Q8A>
    <xme:URj0amV56fGn6DWP25wI5vi7z2YWvQXZHL1-cML8p1OF0BDTdUVfBTExwA25iC1sm
    Z8Te1SgtuaUoH0NXiq4SSLLxgeaN47thJEyuRd_VbURXx_E7NHMTsE>
X-ME-Proxy-Cause: dmFkZTF7R6okZh2Um8O2WFtGaPAzaWVyclW81RVuzBi6m9cZ7TmARRe/JEnJbrNlQQQItw
    loi6AILktE/emObVpnQOoJts39kbNO1tE9lDjVx7eBlNPDZcfgBtPhHI3gUzBX1klyBSPO
    m6wo3qyh4zLIjDtKLWuqShj+TyOAqZ1v7Q59pZa+MRJi70q1m10xXXOnjOuHBwh8BdGtZX
    wBfT3GIm3IRhkBPNEN08cAsscmQrJAEEGmmw4+yOHAVXTj+TMYx50JKq2fPV2177t7u1Vf
    WVqJ3r+WUsPyWckx9pQux4tjABMOv7+kiwRfFGlX/GNxjIHpQDzrrLJGKc6LFG6ajvAPJ5
    Md6xNFl92qKVOA0xTnzKgygItofKMsYM55O/5UyjPG9pyCTktHg3Sc50fWnr6IoKR6x9B8
    wjlc7OohIm/BnEx5XUudMFUoGMRiZE7UtKpzd7/9ZYz2ri81eE1Vy0GNSjhXEtFtaHOJRX
    qYsSTjFUjq4o1UUV/VjotQu+YrIYkBUzWp4ve48LTdJlOQvcod01SGgrVol8ayMykdGm09
    AcHZ0cz0NGrBkOYDmG2Yjmk93K+Vp4/479OATgyw29KkniRs5I7Y5pBfveunfckfp4BQMO
    x+4Blg8R1FLPw6Sz5a7EhCLM99FFHZWnDeo4IlFjHjoMFdpNPw2IAnZ/sqUg
X-ME-Proxy: <xmx:Uhj0avU8SAPt3d4gASF4NFBLkMm8amAYgIXuNDXK8So34t3xOeb-Gg>
    <xmx:Uhj0ahkwS2kIQ_Q6ALLD1IiQ3TrGc19mEahy2EkZxQe5hYbgnzGALQ>
    <xmx:Uhj0aiB_hI8ws9ayA3Xhf7y-QnRgJq-z1b53kgAshEejKAm5CPBgRA>
    <xmx:Uhj0aoje2PeJLHbkBCrJ7dsGlL4Us62S-Sqmz8hdwrKPt4drqbPq2w>
    <xmx:VBj0ajZRqbiMqgfKsse5I8mHR6L9OtNHjFFh_fe-bgeC5_H-4UVFpH2q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 27A2332A0097; Wed, 11 Nov 2026 02:25:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A3PuoE8hdPmN
Date: Wed, 11 Nov 2026 08:24:44 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>, "Nicolas Schier" <nsc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Sasha Levin" <sashal@kernel.org>
Message-Id: <09d5963c-4255-4da0-8c36-5624696ab633@app.fastmail.com>
In-Reply-To: <20261109-arm-test-kprobes-rename-v1-1-663cdbbb90c7@kernel.org>
References: <20261109-arm-test-kprobes-rename-v1-1-663cdbbb90c7@kernel.org>
Subject: Re: [PATCH] ARM: kprobes: Rename test-kprobes.ko to test-kprobes-arm.ko
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_232513_572174_A093165C 
X-CRM114-Status: GOOD (  11.81  )
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

On Mon, Nov 9, 2026, at 07:46, Nathan Chancellor wrote:
> When scripts/modules-check.sh is fixed to normalize the module's name
> like name-fix-token does in scripts/Makefile.lib before checking that it
> is unique [1], there is an error due to lib/tests/test_kprobes.ko and
> arch/arm/probes/kprobes/test-kprobes.ko having the same module name.
>
>   error: the following would cause module name conflict:
>     arch/arm/probes/kprobes/test-kprobes.ko
>     lib/tests/test_kprobes.ko
>
>   $ modinfo arch/arm/probes/kprobes/test-kprobes.ko 
> lib/tests/test_kprobes.ko | grep name:
>   filename:       arch/arm/probes/kprobes/test-kprobes.ko
>   name:           test_kprobes
>   filename:       lib/tests/test_kprobes.ko
>   name:           test_kprobes
>
> Rename arch/arm/probes/kprobes/test-kprobes.ko to test-kprobes-arm.ko to
> make its module name unique and clear up the error.
>
> Reported-by: Sasha Levin <sashal@kernel.org>
> Closes: https://lore.kernel.org/20261108225808.1809266-1-sashal@kernel.org/
> Link: https://lore.kernel.org/20261103110411.11698-1-info@daylightlinux.ch/ [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

