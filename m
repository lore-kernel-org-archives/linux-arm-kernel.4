Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2D2606A68D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2owEu3/d;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=fMcs1UMz;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=5DcRjJch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/Fa3M3vnnHaT+PoaAOv/uZEYk0K7/wV2EEVJ6Q3DJtw=; b=2owEu3/d8HkP1W
	MsaRmWODyKyOI+VFP2hPMLmy9U7B5DIs6Fz6vMrHmPRCXvj1q0BebwQGlDuScNUAb2ZHiUiIqj3dc
	YEefOCRHDo2hUUunJJ0eOCAgkLzMusGb0WS4jCdhJkQ+gupIP3FwEqdTmfe0xOTi91fZjvn3726kp
	nW7Rc+SKN8tbKowtO9ExV6VX/6Lif2xAq4jkJQCBQlXB8WE4T4qUkhq+davmLsATRpXFSZdNI0/GX
	GVuiR4Ls6Pd1UyFByZAyIz/5teZ5VCZtiJr7hRkNYXZ/z1fSFD1Ioi1/ndMdUti42tcxchKvo41Jl
	P3eIQ4dBMee/U2nu79ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7iK-00000008vid-0gaG;
	Wed, 25 Nov 2026 07:46:48 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7iI-00000008vgh-3J0n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:46:48 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9606B14003F3
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 02:46:45 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 02:46:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1795592803;
	 x=1795679203; bh=/Fa3M3vnnHaT+PoaAOv/uZEYk0K7/wV2EEVJ6Q3DJtw=; b=
	fMcs1UMzhSn6F7HHhrNFXWz7OJZ9t3yMEb0+IfnIAuKROJ3mHThXf415w0D6XH8g
	EYLl6dW3nFQ+hnyyPBwr+qj2kaGnie5rEtKW2YL07+fIH17+Fl/TJZk9h+5FVLcG
	mQrZY1KtxAvvqjPBsJoK+3MgxSnnOElmMvLcU5c7bqluHlWwun3ODnIj5Fz6ZcG8
	GJwn/yuqHlJRJM+pdQ0X98Tlnm5nQbyLBz35iVeWH0NgP+hmerGQbMWDtrrBmhv5
	xuQPP5DWUaiMPNu1joCiovc1wwwWyV6bUQ8Rjeo3pGTkF3krJOk9gMAbKTGlWJWO
	E2hhVZ1zR2TgRTZU14lv5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795592803; x=
	1795679203; bh=/Fa3M3vnnHaT+PoaAOv/uZEYk0K7/wV2EEVJ6Q3DJtw=; b=5
	DcRjJchEVpZHEVYuHrFY99GrPe8T+wzV8ES0VCvVtPO8lrCVY/XmPVCA4SAqCjgf
	DEX7kWzOiPMuZuxFytOdWl04To+lFKljDHQ0kp9yabej2VUrclWNNzOH6zvxV1of
	S2TloX8xN/CRMzL4JrIAphdceXIpwwg5m1pSBG9Kx/XEm39gmyxSmFMmi0AClLYl
	IPZGicQbEwWQsMQDkVJCq6C/Zm7sRpcAIKBkQPoixn66Oa8sRJLqIqTXOWdPniSX
	l9fBqgJxQgVP0QODWjLKAxoeVNN3yLCXgcJkRJ++O6LcCbbScTYJvUiSmpL+GVzE
	CtBgosTtUPdu/hVE9oETg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795592803; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm3:rsa-sha256:ZCKGsDLnyaY9RoLZjmMXnCb/VeXp8i6/NmwyjPXWOIdmfgX
	N/jowWBfh7UwjVJ7BzeawP/Yjnlpf9svFCbA5rZ2kmb5a0mFoWOCegULKtCKSTWr
	pJVTdboKBimEy5iDpQ5HLGEEHPwjL7udnYhxjbVZdZhzF36V2vLwLQ9CuA1F9uGD
	SqFXkvVEyP6z7EZeTptqqZ8g317Wf0LXcTEywnfvFf52Jx0eK81y/X0xVtMOHYFU
	eczcONIwzNmOuPjS/xzgQQmrjxV7DE+cXl7jtesBrkioWqvBMLBfe/3fKr0AvRYt
	wqGDXseYqXM6k7sNkboptBFWWAREfn0AkQkYcgg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:vnpUfb/G7peRRbjeLfZHUeI7xrhjGC9JWCUrrfFhzUY=:pBU6EGqzsIoykPfTbVuCQ1+7dJaFGJbvpLet8/j6NQQ=;
X-ME-Sender: <xms:YJIGa0QrWD66QL2Q2k0GbjXsZH7c00rAiLHMcae4VLF-yShKV1cBDQ>
    <xme:YJIGa8lXqHiwDzn9lInfiWRkCXrLSV9I48SUqCgn-GLClwOG67TB3-ySti2ZRYQtR
    uLOZBLLexTQt8coYzy4VowDlO_wpvfKbqQFQcty6HM9o-beZn6HJKDF>
X-ME-Proxy-Cause: dmFkZTFAHQpZI/xmWqJkf4qQaZjnb70DL1t7aSXRqp9Q8WoLR6vC15YgWWXBRiS5ZLaOzO
    c9hHHmQI5HNBWDQMzQcrTs9jHrOYRIKd+uhSZmO8admFQC+kFohj4ITWiIB9hj8u2qYxnu
    NVsSbLNcXnTirufoO0WsPjOBgeJu+LrRutMwK3XzBd60Y1xB0yCyLRuWcbKGZf0TZ5b7et
    uhwgLjyzHR2Llz2kgxgDI/msY4OAAE0arvpkKCBxW170lxwUgSq7h7SH0XdQugMpa/7hKF
    Omcjso9yY5sKA7I+X+Khd0SdWBeWQZ9FhJFp6iuFLkesOk7Zmpz0U1B1sDW6AI0yL6b9LJ
    7e3q3UP9Onu4o6HDgUmCfvQBgr4Zy/9ne2h/tcb7AVjqKoGc2PJg0tp4b272W9nFw4kHes
    G235t2Jt0EMuHYN14F5Jz/8drDZWYnIDz9HUHbifOZsmLPqczQl+y9zPk2EZU4xqVN3olu
    djE7OhYEL8srUZwJ789MlWBbTnn1Zy1H6GdBnABNFk36bPTsCSn8kQgFKTgqgr/vCepqM0
    k7G/8bMB4rSEOVo0r5aFt42ZBUIEu/FnBXt9gJz4Qd/qe2vLceyPAWkufAOcr65+CSuVBH
    u0sTsjq14MvtdYfpIyhLV7Vk9QSKfnwam7PFwMPfpGl5d/z5Cp7s/q9MEqzA
X-ME-Proxy: <xmx:YpIGa0Eui39VJkfEZzkiKtxxheu9VSTXolwdP0lL7fvHZJbtDJAXjw>
    <xmx:YpIGaxBZLlNACdqF2LfhGfPa2HJCSp79OivD44YqpgOvKxkdPmbKhg>
    <xmx:YpIGa3-mQ1JjsFjufibAXjl32JrqJ3Rbo8eQZhCsuGrTKHzneeVMVQ>
    <xmx:YpIGa9BtZVFLO856pX7aPwU_SoXYO_qhdn1hl6o-GgjZQ6PqcY5mbQ>
    <xmx:Y5IGa2ZyJMx_8qTKWf4PiTn_zMa3EbfgXjskwJV04zO0h3LPqHWVF6Rn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B573832A0099; Wed, 25 Nov 2026 02:46:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A8zX0SkmuZaR
Date: Wed, 25 Nov 2026 08:46:20 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Brad Hawthorne" <brad@sim.vu>, "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org
Cc: "Vladimir Murzin" <vladimir.murzin@arm.com>, linux-kernel@vger.kernel.org
Message-Id: <9abcbb45-7408-4eab-9bc7-ca353f53b9dc@app.fastmail.com>
In-Reply-To: <20261125025757.1159931-1-brad@sim.vu>
References: <20261125025757.1159931-1-brad@sim.vu>
Subject: Re: [PATCH 0/5] ARM: NOMMU: fix PMSAv7/v8 MPU setup on M-class
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_234646_918081_054F2E3C 
X-CRM114-Status: GOOD (  11.02  )
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

On Wed, Nov 25, 2026, at 03:57, Brad Hawthorne wrote:
> With CONFIG_ARM_MPU=y, a Cortex-M3 kernel under QEMU (mps2-an385)
> panics before its console comes up. Patch 1 fixes that: the M-class
> region base register has VALID and REGION in its low bits, so the
> R-class probe selects a region that does not exist. After that,
> allocate_region() can return one region too many (2),
> mpu_setup_region() accepts a number one past the end (3), and
> try_split_region() can return a base not aligned to its size (4).
> Patch 5 fixes the same off-by-one as patch 3 in pmsa-v8.c.

I had a look at these and they all make sense to me, thanks for
addressing these issues!

     Arnd

