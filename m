Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42DC606A8B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C4jKFqde;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=lIQ24iap;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=z7uYGf1b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hW2E8kdKpJ+xUhN2MQnavUZAOOSD3qe4wipNiYEXhF0=; b=C4jKFqdeqIm6CY
	rNhb6L70leGqFvrkSN3amxvsXD2Alv+JsWIXDvN8oa6mjTuxd8O68yib8NyORV3yuqY3dq4wqPu/6
	80cUlwX67Bs2NkDQIAOKxg47Tsurdzq3aX0wgqngtTdTPtfwlpq48P3O165iCsk5mm1wLvJvZIs/+
	ZA3tqkFcXdzQdV6m+/xndloaULgWPUOWT1D9/2LtWuiWmJugfYIIzsBWxx0ggKDnCRr4A8Mf7fwgP
	Qfn2sqL6yrH4Euv6fyeXzcVxNtX636YPlCsiKdSPl4bdJj+tfZARdr0d2TvsW0Dmec5Re1R4VPPjs
	Y6T2ng4h5Akuu9t66uBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVo7-0000000AGai-2sh5;
	Thu, 12 Nov 2026 14:29:43 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVo4-0000000AGZd-01Gr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:29:42 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 1B5821D00154
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 09:29:39 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 09:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794493775;
	 x=1794580175; bh=hW2E8kdKpJ+xUhN2MQnavUZAOOSD3qe4wipNiYEXhF0=; b=
	lIQ24iapvAOQZVZ6ydsaVLJRRfDklhCsnX5aWzqcvZWpSm74aBJ3q6Hx1/B43cz6
	tghk4YVJTkzKPWelDxsaEZY/pHj+fcFEMBrnFUtmfDZry4L3GXILayeDk4pzccI1
	ECii1eSH/CovFmPj+EMEATyhjfyAjeucokX2VUTCrxEPfifLvwNaLA9ec4MJ5TB8
	EcVx21Qhzn3cJlk+0VZk39O28/xQ7euIhAlhMHLb20RHuohj5BMiWbGvmsnCC16x
	pdAqGH25Y+55iotIA8JG1IqixS7kapCE/OzUsvxgkhYnm45oW52yuIyr9BJjFVwC
	Yyz3yDYwVlbKgF29hdvj6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794493775; x=
	1794580175; bh=hW2E8kdKpJ+xUhN2MQnavUZAOOSD3qe4wipNiYEXhF0=; b=z
	7uYGf1bjt1U31PectUTsNVtzl+fZ0kQ7hAuBKicVJQ3Nf8+yoxbOLYyKH0vLxDEF
	IInberIjgAPtJucmqLnasoEPxPqTfm1P8DCWSvitqDypwjCtX1lmMMo3jRR7SEKi
	u6xLhpA8nIKkwB7M8hdZWfV/wVK+i3pauW2fGangVw/eo+qh98B2K5AXoy0gAPVi
	hQ90gk2UPTnkGy6PAwygBCnUgHdw/2e+1B0ZU1pjci+/G6jHYpQdXtN+ytooCzfo
	pokIWr9EvwywYrdU/UuRI0LobiXq/TReVtpmUPPYSuVzl71honacR5AR9+upsLXl
	G4yGZmGQ26rFrVUgRi9fw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794493775; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:hVYDdCmAQ/caPAdifS8rxncx7P7OLcVIyhJDsE9TdCXJjEg
	y1w5oZrJ94Xu31uZpNmfuz3omxehU0c3jfU28C5FIOhQZeJ88dqpqdHkQq5JVsV6
	9EKLQPQTeA5ZIzPFaTrSzcFq0b0xccKgER9BJbG94hMkQLrGgpyUx8X0PFihOCDB
	OSH4pyuAywoc+SQ91CvYnpmKrlW3ON1Syg69ngCoRUveShTwEkd8LfR2JApxtM+R
	Zw+E9M5bMIAq/xMM850exkc1wcY0ibcy3IkDiGVFkQtZmSZZ5HvuGaUQ8dTIYZEL
	dCackSTygg1fI9Qx/7c4KKalx5rmx7/PbDf5bFQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:KLKsz76cCoX4bOmDJGRV1iSPAdKOSqbFzYrIdbKT5DU=:t7kJO9uHylXzRNb/saffCqXhmz3H9h9mv/zp8RPQLpw=;
X-ME-Sender: <xms:Ss31as8XlTp6Rf0ylYvh2uYDxjtKqqxbZArthPyjH3T6fDJ52m26aA>
    <xme:Ss31avjwQTXEKWQ0d-EMKq16Z8kYuiIYW1i8TieVKZxmiw1AKaQnV1ekUWXHqMkmi
    fJR7benYkgPmJf07qMa1xjl-L8mzZxL0udrYJyngAZfNUpIKYOvEjWQ>
X-ME-Proxy-Cause: dmFkZTF2xlVBsTh7U0+KvcObs9lebmg4eeF4qotrVTF4RJE/4rVxnvYFU+GvGJ0J78d3gI
    BKJeLU6Si+YOg+wV9ocag27R2ErF1ahBsw81IPIsdo2TzZkvh+s9Zuzsv5K0e8PyxSxPEO
    0NEK/ykQ5eI7J8+aYgpoK09BsOeJ55ra6nlere87u9LJF3Hb47gWCKSc+1B+aapWOPtBa3
    qlwiHoznyMBeqjKfbUvnRiEAsE7tClJykrOnNbX+BJznQUkPg2aWw1FwD9g3vhOfWnSPkK
    728R4pfNK8cNCiT/OMyWFmeTExafPquSHVmgz8VCtEIZce4WrUMol2SBW21gKHHeYv88Ph
    MA/L+Mydzg8WJe7Y5Pn1h5Ox6usNldsxgBT9+ttA3Yo06NmzNUvGqKzz12IM3IRGz1dNCV
    Bkn6dhbNhoeLqVXg7Yckdou2t2EiuFb0QoCEIHSfZnv/P3sT9363SK1jgXdfuAxSRifqlq
    p15XI4Fmu3U913n2/jfO57kzfdLZTx4DnfVb0FV55OyAR0FRgDYm3G5emo1sYWul1+xLJM
    QeUGr7GcxlSsvOADcJWaAyalDt4nivh2F8GmKLi18TZXjGy8n3cQdI64CFo6PtnK5+kycL
    tambxqkz2bsvSEBGzAu79v20sOxZAJuU7n6aqQZKh0Ot2dzuMjZj8eNGOauQ
X-ME-Proxy: <xmx:Tc31aghH90_vDLqZUJG0Y60jMs0hPyIl52yEifSg5QBpUMIyGG8RZQ>
    <xmx:Tc31apfhJNW-s6mLeYNDN9yh56rKHDyLEXRI0e7JDIK0PQ5jAss4oQ>
    <xmx:Tc31an0neS0kqsvncjRPK7yaTmZ-mkrR9EQvCHc4HK7m4eN7DXmsiQ>
    <xmx:Tc31atrt3VmIh5W6ll5oUBQ4fIl3lK-kHW_7sXw9RuFQ4Z8xJfYWYg>
    <xmx:T831ajLG6GO3pgBdNoZwdHYtHcO0A2pz-6dM0EambJ8miToDE4E4JE19>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id DA43032A0099; Thu, 12 Nov 2026 09:29:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: ACPK2aFADPe-
Date: Thu, 12 Nov 2026 15:29:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: "Christian Brauner" <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Message-Id: <d9b0cca7-5c28-4a48-97c9-36d64e46ee9c@app.fastmail.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-6-8d1275885d9c@igalia.com>
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
 <20261105-tonyk-syscall_table-v9-6-8d1275885d9c@igalia.com>
Subject: Re: [PATCH v9 06/15] mips: Remove duplicated syscallnr.sh
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_062940_096139_2717C0D3 
X-CRM114-Status: UNSURE (   9.72  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026, at 21:05, Andr=C3=A9 Almeida wrote:
> The common scripts/ already have a script for generating the numbers of
> syscalls file. Use it and drop the custom script.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/mips/kernel/syscalls/Makefile     |  7 +++----
>  arch/mips/kernel/syscalls/syscallnr.sh | 26 --------------------------
>  2 files changed, 3 insertions(+), 30 deletions(-)

Acked-by: Arnd Bergmann <arnd@arndb.de>

