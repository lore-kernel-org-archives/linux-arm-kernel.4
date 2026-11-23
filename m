Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC99C606A68C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Neo6i2zm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l69/63Y5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=; b=Neo6i2zmwZiPb1C9ykbIj95gp6
	mjVcQo+1A38uTJGvBjeIcMP2O7+3F3kVhPtzc/h54GfMOY0r1dOF4d6o/cx6jryUOpuBf3RyP4Huo
	wO+fGIVKZX0abp1YI/jgWf9e0txW4lX1ywsxwyJ1RVL3J6/R/9EEgJ9BIFpMVVZNkr77aO2Xr+PT3
	7D2iWd4ef1ed0g2zgcejjewrFeSNPGfe837dQ26sdBbDqZwUkWOXX5YIhgNbH6IETtn/vuYtxV2L1
	Wvm+mP3m8yN6gavqAKTShqVqQLaBF3c+9Qjr8gs/1DLzBHAxo/zyGiBAaKnqqBplFph5mFmCvjtA2
	T1O7c6wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUFx-00000003bU3-3Abe;
	Mon, 23 Nov 2026 13:38:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUFw-00000003bTn-2n4B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 13:38:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 08CEB41A1F;
	Mon, 23 Nov 2026 13:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CDA1F000C4;
	Mon, 23 Nov 2026 13:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795441131;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l69/63Y5yercBM3LgpuDLVV2mxOopXrHKvW4zJj31uVfZn2SHyZCTaxG3zKJNyBqu
	 cS7+0ql0yzQ1BF8r/qlw/p9nhhzRIp/83dGLe+2VQ0JZS/IEyShYrxkf2cw5GFQHKZ
	 p9Cn3GbMfaz0nUcSGN5awI15a+PNoZn/Kt1SYAK7GsIq0ym+OBM+4HVTbGXuO2UTnj
	 SDKy4adYBAyQ3/jZj5bPbTf1i59VgD6MqHSp+uYZwn1br090hUBNKIYlW/S/qIxX61
	 X5d/m2lEqAdqz8CYnLpthDNTe97KJ6YhW5vhLyi3+eepdwPqq7OKwyV2TI3AO6xpMn
	 a8VO71S8rq86g==
From: netdev-bot+sinfo@kernel.org
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: fix uninitialized axi_blen array
Date: Mon, 23 Nov 2026 13:38:50 +0000
Message-ID: <179544113068.3294.543571005115003901@kernel.org>
In-Reply-To: <20261123131326.7105-1-jszhang@kernel.org>
References: <20261123131326.7105-1-jszhang@kernel.org>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

