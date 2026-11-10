Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC37606C6E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 18:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bvrfqg9W;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ta1a7Ygq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4+1Tsq8nYIjmil4QjhvYH8s+1A1/eonDKZveiRe56qY=; b=bvrfqg9W6B/OBz
	ceDIP7ghdCBmL9is+i5/774MI6b+9MTE3AWfcFIaoM2fDEQk8wRTOFl9VStAVXB9UDgEIO7IKkfVn
	gw8D1MwzPPAQKEaB9Sn0aVtKYzBlOsHcv36hXn8cYg15PsRPAY+Nv/IraIFUPLq9vT7wGk4HFLHjW
	XCYZCX3xaO3cYEfOZOt5K7SLvVLUZUsTYetu3pnyxBjYUN9iLV93jaH9uwXn60/pDJbc8/6l5IbBw
	FTPoar4Wmf3T0J1fT8bM8vMxPE7N2dRhTrXnlj6lHkBlUAlt5Y3OEzpdiP51xHxpDkwbKQJvc2KAP
	ty6OZ6xqZH6MxYiZxKGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqlO-00000004onr-3GNz;
	Tue, 10 Nov 2026 18:40:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqlN-00000004onL-3h7U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 18:40:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F38463AFF;
	Tue, 10 Nov 2026 18:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC92B1F008A1;
	Tue, 10 Nov 2026 18:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794336008;
	bh=4+1Tsq8nYIjmil4QjhvYH8s+1A1/eonDKZveiRe56qY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ta1a7YgqDfFIKub674USszRkP4081wNq3URyD5ACm3kWUnFA3QcCfIumRqMiixB5g
	 4HSkSWWf1OuqxAa9+rhzt6S6fJEakbkOVNOFWcxe+1lEGcQGKGYUyN8IyrmTepOoa+
	 X2V7PyVCi5r4/rp+F8Iz12Z/wYHpTXhj3a9ZdNXGQcIxI4ar0Xb7U1awHTvROoDIfD
	 dD9ce63CGFeCuw1YsBwzmcqOpHPnoX16I24ktEIdH9sCtUi61s8F8Voxnkn+wilfLZ
	 NZOqYVPH3r1rv6U/mg+gVJYOnQzK4uk7hCB6hlYZwW2lkRuX53lRZLPPXZiSiLidUA
	 mzG7jF6W/GQDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9B16C39D6091;
	Tue, 10 Nov 2026 18:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: ptp: fix support for PTP_EXTTS_REQUEST2
 ioctl
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179433600717.4186528.13915971392066859083.git-patchwork-notify@kernel.org>
Date: Tue, 10 Nov 2026 18:40:07 +0000
References: <20261104052504.1886335-1-jjc@jclark.com>
In-Reply-To: <20261104052504.1886335-1-jjc@jclark.com>
To: James Clark <jjc@jclark.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, jacob.e.keller@intel.com,
 kory.maincent@bootlin.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  4 Nov 2026 12:25:04 +0700 you wrote:
> Commit 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags to
> ptp_clock_info") modified the PTP core to validate the supported flags
> of external timestamp requests, rather than relying on each driver to
> check them.
> 
> stmmac_enable() and dwmac1000_ptp_enable() ignore the flags, and
> neither stmmac_ptp_clock_ops nor dwmac1000_ptp_clock_ops was given any
> .supported_extts_flags. Since PTP_EXTTS_REQUEST2 always implies
> PTP_STRICT_FLAGS, the core now rejects every PTP_EXTTS_REQUEST2 for
> this driver with -EOPNOTSUPP, where before that commit the same
> requests succeeded. Only the PTP_EXTTS_REQUEST ioctl still works.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: ptp: fix support for PTP_EXTTS_REQUEST2 ioctl
    https://git.kernel.org/netdev/net/c/b66fca408bf8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



