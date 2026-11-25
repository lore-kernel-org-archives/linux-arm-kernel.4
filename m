Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E27606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gO+0kgcr;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=eXkohKX7;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=CZTMgU8u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sUQMKO7LilW2w6ufZE8mk27aCEqDFRdOrzRnrwN2leY=; b=gO+0kgcrj8h06g
	gIGIRRmMuezzE2p8IXEoamXdIoDT/OonIDgjtTAYL7DZmin3wclibntyDGUn1xmOWLwPab3CE19eo
	uWsoa3e+U7UMh7PDcKeiXxVFf0ItOnDTqXu2/NtJU8EnzCTAhqGVmRTYCzugcgabBXjjSrkCCYQ/t
	poBv4yqgq9XJYi89I5D6GdD4jS7JMCY5tFLjBrw7miH2dgAMKsbuvdiWkNWNxZd0NASHwIWjPB0OS
	usNqVbjya+ZrkXkQAoGqlTpFQYJo2qKkce1KvvQoSIxWieFWx2XXjy7UteKbMj/yDZ78P4n/iiJME
	NljJAUO6EmvkxzGC56VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7dg-00000008vDW-1ib8;
	Wed, 25 Nov 2026 07:42:00 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7dd-00000008vDC-2rMa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:41:59 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 59E0014003F4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 02:41:56 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 02:41:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1795592514;
	 x=1795678914; bh=sUQMKO7LilW2w6ufZE8mk27aCEqDFRdOrzRnrwN2leY=; b=
	eXkohKX7GhP2NuuJOp0waTc53+TQdHh9z/I1NX7MGoVGR39n0u04a4H/G8Mewr0Q
	SYfthWKDyDC47lSbu7Q2WVIXuLRjcyQxs2bcUY6O7UCxfsD2eG17A0UNSVdNrYnQ
	A9zXC2YlAbi7SuCHVrBB0AQHKDBvAcBnur3k9xU5E387FGDNp7Tf46S6b0iGMViQ
	QwkYIkJ1RpvCo/kWixio+/6UDPfSNJDlrpatlbp6FTdiRNGnhzSclK+3fhk8y7UA
	df4rLYN7LM+4qsQF48Ob3tAyoqsu8tCGURT5IXp0EkIS7IoT5oiUZNLkctXLVLlD
	SkX7UEn/G9qzWwtPnM8xfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795592514; x=
	1795678914; bh=sUQMKO7LilW2w6ufZE8mk27aCEqDFRdOrzRnrwN2leY=; b=C
	ZTMgU8uZtf0uw0OvoM/4bJ8POwIbFFqDgkgAxK3ci1ElZEUcHoLfRMrmMOkwcArO
	XfGFegX2xtEyoXaB0VtUaPvRpGNfF4IccnhXxpQyWxY2Qpmds8dEyg4ZC+Xc+sOA
	EWN+N5+xnsDvj081A5h0bZt/AID2cCRPp0K0xcHUJ59RqDadi/Ty/AniJPP7xffh
	++pMoIJALiGEckRnScEcHoIwJVTLRntYpNqbVMRA4aLYkoDkxCgvEHYoQ+gA02fD
	IuRyLeowk9HIPiSDAbQ9diPvG2Me9gHOPkbLdKiX5yGUL9hJ5roNfM582MzE+gu4
	peNFtKTAZX9y0cx6ncoRA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795592514; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm3:rsa-sha256:CIFytMiEbLYL4GYPltkc34A3N6zQUnWSbSBLu+7wJDg0HfY
	4uVaiS1ijW8wN3s7mF8h8gwUuPlcYjkKc3H9GHQMjHHK1lynuw9s33zfISPvq9cq
	VvmOHum67A7WnrxOQx3dkxmmwchYAJ1g+bDiQSyLTAl2XNqOCztAmlTSzMrnAl0f
	hBMEpwo1B4efovTvUiI4Syr/19VRxjcJr51qC3H3evw0x1INM52BtWSvCUYJ85qP
	nhmTZ6a7TQMl2hbxk3WYdQiQ+KBwbabaV2KaFuEGM0OyBE2g99IZqDSRu+b1b0Ak
	Puix1e6G4jMAGp9FCKc2Z7LXV7/BWaYP364SMrg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:lK+FIkXps6mc5Mb7q3GyVU2aH/l5Zp+2smZ5ROVNZdM=:gtOez/TCn1Zm2sPYGVfyUbMuqoBXdDR2I6sZGA/wUOI=;
X-ME-Sender: <xms:PZEGa5dGPV0RA-v4VEPBa1uiDw78FeTYGREu5-HrYYr6m7eJtVSJ6A>
    <xme:PZEGayCMRaHl1vkNlk8Nc_WC7QxQ0MOPL3prAOCn4GwRcPvQkR7eXYWKIn8epAALd
    00xYUNs_XWmQ0xLgw_RH8tOO111XBbOtkc6mXQcREQNyq98na9er6irCg>
X-ME-Proxy-Cause: dmFkZTFuQuQ1vusds7s5aDcjN/zVZNCjnILCZfnoCQsGGq9OnABW8KSd5xsr0hv+s5Stm0
    8rb4U0xSHjPemQqolhbDc/BuhMYaKlBhQ9KS6+gn3P7uOgZqFBrcY8X8y8VHi5o3X2p+3D
    UWiZG6fZXaE98H4KOOdff3QWn/FgBhtF4yw85DpaET9rVuuscX5ctw7ghp4bq8p4tkc1ap
    hcfvYT9xZiWkDILwNSmlJwX03eGbfK0lu6PrEo0qKYDPqBmWC0nxcmm37Jv1WakBVGZ2qD
    N8XZPiBkgDG9kykmEgTfhWOHIQL1uqzjGYdqQ5YOGEZT3XP+6ZZ+oLX3VDwGdoYkC/C5SL
    4TphOpGqsEaN8KxX49HORPODab7wEmNi7KZud3Xw6yrRLWccyKR2CwR6IfzJQpurJONUJC
    xyZIhWH0Xn9KgDoVcZ44VBgBpaHvUaK9xUVJCHY7qgVIX8IdPTJxoBdZH9oighKQgyGuAp
    XQPWmhhn8TRthBTB7pF6xrdExWUmiDCnE7m9Op8m0l/Dm3xoIHFOasLYsQdjhN9psToIvf
    h7ORg1QeCAlZKxQXvEuakTScZQIvh6iA+fin6e3Uqd3slcWeK9ggp+SLNEiyn4TwzY5BUW
    dgNUB4Ug7ahLgn2trVrPFUcLFnj/fY170k/yDmTJHs+v/ecIu8pf1uu/P4Fw
X-ME-Proxy: <xmx:PpEGa1CsKWHJnwLAXDt6PIA2SrKCwuTH7ffc_PR2dCjycCMe769qjw>
    <xmx:PpEGayk5t5e-RB8_VefG68Q4PN5hIjYjhMFyESbZVGMzD3ick0hp8Q>
    <xmx:PpEGa2zqtgkH1vegr-YcXsajJ6-46O3U7FYUWj8gjUrD9SOipLx6Ng>
    <xmx:PpEGa8T197EOdsymi3ZYHOqBhhKS8pzJ-w1_AtVbQGzSPnMu3rFLxA>
    <xmx:QpEGa-huiDrLqSj7H7Pnn2kfyxGJkXEsbBGww71WxMHp-hdVe0SU6vAE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id EE80032A0099; Wed, 25 Nov 2026 02:41:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: Agd2DpBFo5o-
Date: Wed, 25 Nov 2026 08:41:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Brad Hawthorne" <brad@sim.vu>, "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org
Cc: "Vladimir Murzin" <vladimir.murzin@arm.com>,
 "Linus Walleij" <linusw@kernel.org>, envzhu@gmail.com,
 linux-kernel@vger.kernel.org
Message-Id: <a1b6d899-b392-45c2-85f2-67bb07fcaf5d@app.fastmail.com>
In-Reply-To: <20261125025852.1160075-2-brad@sim.vu>
References: <20261125025852.1160075-1-brad@sim.vu>
 <20261125025852.1160075-2-brad@sim.vu>
Subject: Re: [PATCH 1/2] ARM: v7m: clear CONTROL.FPCA before the boot SVC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_234158_046360_B467569B 
X-CRM114-Status: GOOD (  15.20  )
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
> __v7m_setup writes CONTROL only after the SVC it uses to enter Handler
> mode. If the boot loader ran FP code, CONTROL.FPCA can still be set,
> so the SVC stacks an extended frame, and its EXC_RETURN has FType
> clear. Since commit 72cd4064fcca ("ARM: 8830/1: NOMMU: Toggle only
> bits in EXC_RETURN we are really care of"), that EXC_RETURN is saved in
> exc_ret, which every return to user space uses, so each return expects
> an extended frame that ret_to_user never builds. init then starts with
> a corrupted stack.
>
> Write CONTROL to its reset value, 0, before the SVC. That clears FPCA,
> and also selects the main stack, which the code after the SVC reads.
>
> Tested under QEMU (mps2-an505) with a boot shim that runs a VMOV
> before jumping to the kernel: without this patch init loses its
> arguments; with it init starts with them. It also boots on an RP2350
> board.

Should this perhaps be addressed by documenting the state of
the CPU core in Documentation/arch/arm/booting.rst?

We already have similar requirements for normal CPUs there, in
particular about errata workarounds and the state of MMU, cache,
privilege level, instruction set etc, so this seems like something
that should be handled by the loader as well.

     Arnd

