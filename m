Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D36A606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DGF8wufi;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iIpirNXJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=; b=DGF8wufi/ayOCo7Wmb4Van0FqK
	ZZHGD9/tR5aH8fTqEB2UpbXwkLKrc7M/YluOgmWzs3OgJgWqg/pnRoPJ5kTKpE2sepYtqxJqeGa+w
	P7vFZL+mOGele48GgN2ccOi4vhepoFkXaI7nAhJP5JCSQHLK7wLnPulLmZENKWSR1ELfuWWzmJWYO
	5eorSZHxakvF92dySNKXdOpIAQW8dHQsi2wfORJ7oZCSlTaAfpbARTOaSaE1whz2JQCwfRs3eGWsJ
	y83ILaBrdT6DgOlnG12XxTX5FbOiue/s/w6lPYP8GgwuyxFuoiaZ22+za6GgpgWTSSW9mrpG/vkF0
	TE6oC9VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQgN-0000000FS4S-1mub;
	Fri, 20 Nov 2026 15:37:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQgM-0000000FS4K-1wJa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:37:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D7EDB611A5;
	Fri, 20 Nov 2026 15:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E3D1F000C6;
	Fri, 20 Nov 2026 15:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189065;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iIpirNXJtQZkiCo/Wk/r2y9TuMHQo0NFCaoXmz8Y9G/yH6AqDiSX9pNOUjBCyE6LI
	 S1owu12Dg8N+DN49V3MjAYeqwWIAiiwgGzFbvEgDY4OkAplya2KOlVAUFOTUsVI7Xp
	 LpCoTr6aRLEcPoXSVWh4b/FePwFzL47SIDAgrUu9dUovpl8BgIjONL2BCg5DnKQ30N
	 8vIe608azmw74AxVUiwtuMnBa23rauZrkzEN0MBuO7unMJ0VdZoNHzmMO5QM5d5mgp
	 8hEb5V/9jVsqaxq6KuwbtT1/MjhZtKy+SV+Qmj1xvnBHC1h/iT9e2ZBPihRkdEh5Il
	 heypCanFDQ98w==
From: netdev-bot+sinfo@kernel.org
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 LABBE Corentin <clabbe.montjoie@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net-next 0/2] net: stmmac: handle RX checksum and wire
 errors on sun8i
Date: Fri, 20 Nov 2026 15:37:43 +0000
Message-ID: <179518906382.3291.11090310469167736540@kernel.org>
In-Reply-To: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
References: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
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

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

