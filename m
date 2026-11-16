Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFC5606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 00:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4tRX+3rx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m6BaEmd6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=; b=4tRX+3rxt5TVf3NNq6/CMX3nxG
	UvjPqVBf+EGxY4TDS9G2GbEd41OyIafH2jnML5UTXJliQbN7xUtbChKPe1BUtHuAWQhJPFMGsprFZ
	bWmbFq5Db65IDl6g/qhM6aNRz2oOQqMaCkpIN92Db79q6wNky3eiG4siIq0yitLkYtm3VD648WaRk
	0XU7yysUrU8RxSSwu77SVDdmALFnBvJEAX/P3F0odH87lS8/F63DSl6j043nfKz8U7N3wRmEQLqpl
	dJygZJ2QfLf0ybA1fTJQMLb2WLKGh4o42saCFwZJvUcmcjJJWOQSL/uVrkE4Rimw7j3H5vK0jROpZ
	8XNtMqBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSkyL-00000000q23-3FrF;
	Mon, 16 Nov 2026 00:53:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSkyK-00000000q13-15va
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 00:53:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CDEC344F92;
	Mon, 16 Nov 2026 00:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EA11F000C5;
	Mon, 16 Nov 2026 00:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794790402;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m6BaEmd6/6JVCZV3/nQyBbu3lsT24dNLmn6+nc7NS4ubLXA+uzYCP5oXtFurSwoOx
	 Pi/Nh651Dp6dbgc+q/ez4Fiaa4RwxdHNuQWkSbjkc2G8DSbZSmER4rx4sPZ+R2j9D8
	 RkThNnuip/lW1JXPgCFKhplRBsHNnMp8h7OcAtxVyuVgj60a1c3IqYvy+3ZMzxDKVI
	 0nPH6CeOpLKvMeQ+NYYVA2Xns0b/fpKUxNx0GxAbTbOHj82+kX9+u7rtUJ6xZP6EHB
	 if9ceRzE01sRr+J+SevQD48PfwAzSkccJrGWk8QmJ9ourWP+g6iL8P6wN+i1natAGy
	 m0EimnnPdPLCg==
From: netdev-bot+sinfo@kernel.org
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: preserve RX checksum capability when
 offload is disabled
Date: Mon, 16 Nov 2026 00:53:21 +0000
Message-ID: <179479040161.3291.5723238689308327095@kernel.org>
In-Reply-To: =?utf-8?q?=3C20261115-submit-stmmac-rx-checksum-capability-v1-v?=
 =?utf-8?q?1-1-ea26fa3689be=40gmail=2Ecom=3E?=
References: =?utf-8?q?=3C20261115-submit-stmmac-rx-checksum-capability-v1-v1?=
 =?utf-8?q?-1-ea26fa3689be=40gmail=2Ecom=3E?=
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

