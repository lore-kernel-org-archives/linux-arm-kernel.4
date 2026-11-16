Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501D6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YfWIG7ry;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dtrr7gO0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=; b=YfWIG7ryP8RGjtBCv6244sd6Bf
	NoJ1LNuFPxTDJ8kXl2wG5s7t3hvu4PruaqBUhNx++HU9ygLWEC3rg9Cx5tKMN9c/tTf3+89F5YeTm
	HcGX7eHEDyri4ziIklwmBaK1wMLh1qFlQZYfrm9o2NLEzOiaZDBK+cQuXOAVD0pj0t6j4LIF6+sDv
	+q6ykWWkxmD4ioDUIngS8Rf7ir2lM6GxP1/9kj71ieT4fuI4AbbC29hsfO/uJpTyYGK8U2USXTgma
	UCm1oHrero5XI98Gyx1iQTMmpwF0a/aEwtC/7X7c1TMCzm7WgW3sfOh8b0j8zjebw4tEuFN1IMGv2
	HULwjMBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStTJ-00000001rbS-1C26;
	Mon, 16 Nov 2026 09:57:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStTH-00000001rak-3F4H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:57:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EDA143708;
	Mon, 16 Nov 2026 09:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124181F000C4;
	Mon, 16 Nov 2026 09:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794823075;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Dtrr7gO0sedVdRES1cOcZqUPJJmPoNWt5retd61kAK/f3VXeb2DjCr0v3U+5xnFPU
	 B7cAYcAPMcRX13oAF3QKLb2FrocpE6zR5oooLe9VLZOYEPZyYTBrLJ3NVH4K3ex98w
	 PwrQsj2rc0Jl7Jl8gKx2W4USKQPLDcMXS6vWs3L1Ikv4NQ2ht1f+C01kmJrBzLtmNq
	 ewE0n4+aH5CpN7wXOwYFVSAfGouJzzDPeOCTlBRP1eja1jCL/WA9ieLkRtvUpZOEPR
	 ztjDCMc6jkfb77iTDRaZsR6Usb3dGF5u6goilC7G/RvBro4dl1BGFZgph0NkKOUpTF
	 n3v9SYrJFredA==
From: netdev-bot+sinfo@kernel.org
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 tomm.merciai@gmail.com, dinghui@lixiang.com, dinghui1111@163.com
Subject: Re: [PATCH net] net: stmmac: stop Tx NAPI before disabling the queues
Date: Mon, 16 Nov 2026 09:57:53 +0000
Message-ID: <179482307356.3291.12672863901613657171@kernel.org>
In-Reply-To: <20261116-tm-stmmac-eth-s2idle-v1-1-bbe165b743b5@bp.renesas.com>
References: <20261116-tm-stmmac-eth-s2idle-v1-1-bbe165b743b5@bp.renesas.com>
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

