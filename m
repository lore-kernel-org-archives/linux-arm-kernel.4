Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B0A606BAE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 02:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WqxikWVS;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qiit7JZW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GX6NMgzIRw89DK00cR/AHQm10bN7NFOig+LbXAxw8pE=; b=WqxikWVSbaN//E
	1pRFl/59tRoislZ4pEqcKsQd+Ms4MWIVSZn6iXnDGod4cIaF0k8k8CPAu1dKsc0AkEj4xdkfpawIL
	dNc4jOtitQrg/Fxf9bMzabVWUdYPAbZGhgP/8UjpOvDdVchUSa+5ib7SBn+jWQoL42Dm+cGgVEsCX
	7EEOmIWpAMNnrIEnDmLzhqcAGr0Z3QkDf60Xi3/wMH1bweYjR0wb++7K2OUK45GttbdXS3ptSvwxA
	sXCJpFIku7k7aBqdcgaokwCnSK+yD3+nmbUY1aSZzqX5Lovetg/AY3oi0si8lvK4yN+ryFGmVwoB5
	nzV+HCUNjkIzfGf+w3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQc0v-00000002DEw-0BJg;
	Tue, 10 Nov 2026 02:55:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQc0u-00000002DEq-1Qlc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 02:55:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB1A94581C;
	Tue, 10 Nov 2026 02:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CFD1F008A4;
	Tue, 10 Nov 2026 02:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794279311;
	bh=GX6NMgzIRw89DK00cR/AHQm10bN7NFOig+LbXAxw8pE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Qiit7JZWphnyULcjmDZtQY1+3Ad1ZuI7Nrngu8wNHQfGz6824RHRLxsyvWbSoj1Gd
	 NRhjRjWRi2aXENblbSiI2QR6Jn6eiVjtbxXnvu+bjYGpo9dIri/Pg+ek4pXJAHk7r4
	 OUp1h8Ye1xhoeGFnOppGyZvHMvKvcZj/4cTE4wZDp9SCoyI4S9VbK4oLHCOw5ZwKhN
	 bYUhpkQDPaIpXLehAr3EQrgYReSttWewDFtZwA/ZgQDmC4VVpFyvVeD4IYDgXCZUr4
	 //asiNGRJjtektg93joQSxSpFpsBQ62rZ1n5xYVMYoI4I59NJxe3OiO1zNZU28TAGZ
	 YRqSjQo9V4UbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9B240391AFCB;
	Tue, 10 Nov 2026 02:55:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: dma: use dmaengine_desc_set_callback()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179427931017.3612825.1887357709243075778.git-patchwork-notify@kernel.org>
Date: Tue, 10 Nov 2026 02:55:10 +0000
References: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>
To: Frank Li <Frank.Li@oss.nxp.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, radhey.shyam.pandey@amd.com,
 michal.simek@amd.com, stephan@gerhold.net, loic.poulain@oss.qualcomm.com,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, Frank.Li@nxp.com,
 andre.przywara@arm.com, liyouhong@kylinos.cn, joe@dama.to, arnd@arndb.de,
 phucduc.bui@gmail.com, yiconghui@gmail.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, vkoul@kernel.org
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  2 Nov 2026 14:19:16 -0500 you wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across net drivers.
> 
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> [...]

Here is the summary with links:
  - net: dma: use dmaengine_desc_set_callback()
    https://git.kernel.org/netdev/net-next/c/e281e85235cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



