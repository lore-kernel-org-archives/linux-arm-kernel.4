Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D36606B1DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 06:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SSl6sK4I;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CrqQPXQG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=SSl6sK4IKBtTkmhKLJj3GBXpLg
	PHS4UQtbAeOOXWEshBk7YRaMDWoALO9V6ENTSz29M/xRb6HJwMhs6TPQGAHbDBa1euivsTI25cWf8
	FFIZrVMk1VfTcskewX8QKbG0VaG3eWPvjqSbBf28nemEynxUpib2RNBWxAcicBYa3Z7MYeWPzQPGe
	W4jM7KtPhXFlgroQh4k1vDTEJVPpOTPdQQJrL9aUmaP9tf4LbqTt/ggIGD57Q4PDKMZA9LyK0BC4v
	iAmn2inNGjMHJGTT2i7GtwSH+BmCkTvkl77AgiPhr7zoQD1d4dSB6cSxEDLYrBXtot84kBtPH/ynW
	YBlF9ZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfcg-00000002hkm-1gha;
	Tue, 10 Nov 2026 06:46:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfcf-00000002hkZ-1ifn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 06:46:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EA2F0411DB;
	Tue, 10 Nov 2026 06:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19FD21F0089F;
	Tue, 10 Nov 2026 06:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293184;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CrqQPXQGnk9uKXeQ3D08WLx/5U/8RZFKCGNPdKi1VOVeeDSWbooDRBUw2vCTkYpxZ
	 RzJqKLDT0JcgUebIgOgcLTRmIOEBHiOTZCHxH1qsJPKFudh87JENWOAeTfcVP6cQQC
	 nScUBw8YyTHTd0Cla47ox33NoLy9Z25w+bX3g2xP8u+Bn6VU1B2jdwoad5v7OuNFAz
	 +qiaE7s04TlbbLTgsA+7dJ8mZCmqrXR7Mhu5okLtDKAcp7QTcfhYdIrD2Egul2F6uz
	 4SamrxXw29y3zC7znJBVjV41DJtXTaYgWI3cXKoKY7eTSKv55ebG6uH2a7Hbl9aP5o
	 y0/quJToWhkzA==
From: netdev-bot+sinfo@kernel.org
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, danishanwar@ti.com,
 rogerq@kernel.org, jan.kiszka@siemens.com, diogo.ivo@siemens.com,
 haokexin@gmail.com, horms@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 net 0/4] net: ti: icssg: Fix device_node handling in
 prueth_probe()
Date: Tue, 10 Nov 2026 06:46:23 +0000
Message-ID: <179429318364.488859.2256720144223130993@kernel.org>
In-Reply-To: <20261110064118.1138-1-laixiangwu@cmss.chinamobile.com>
References: <20261110064118.1138-1-laixiangwu@cmss.chinamobile.com>
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
   (e.g. found by code inspection). If it was triggered please include
   the symptoms, like the stack trace or error messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

