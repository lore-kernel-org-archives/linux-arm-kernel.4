Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C0C606AD6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 20:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qn/bzgh/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D934ShSO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DM5l0Pfmg26v1twgLSCXrEPpD+W/7qp0faXl0JQa9FI=; b=qn/bzgh/l4HEx/
	MOqF8b9umkN08+J/x133DT3z/CAlv3RNsbXDb0ttJTD7W/1n9ayai9pOgGZSFEHCXv66Pq/u3BcYJ
	n6HZfL9aLzM0jhfHeaJe8WgoaloOZe0SB9KK0i8nLpqskn23c3z7VXxo35E0cjSElzT/x7Ql2mVSK
	J8lZKK7g735D9FnMa2qi/7KPQ/4nFjjxmychB2VdXoVrR69y8mhrTRsC6pmy2seu00xeYXiBCeaEk
	unys6RVNTF23Ol6fpLOyDPHhg1rUZzqz+uThcm0kXfbI8nGItPbBdcJcYgMFDHKZ6WgfSNH7Bj3Ud
	darQozSU7iK9t6MqponA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsTo-00000004z1k-0fIC;
	Tue, 10 Nov 2026 20:30:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsTm-00000004z1L-2jDt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 20:30:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E96543969;
	Tue, 10 Nov 2026 20:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D811F0089F;
	Tue, 10 Nov 2026 20:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794342606;
	bh=DM5l0Pfmg26v1twgLSCXrEPpD+W/7qp0faXl0JQa9FI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=D934ShSO+lyR7iZIfUw0lnk/ThUaqyU5sRBmb2Z4WuYW3F4KXdAS7Y0PZttHz1po7
	 6D2OlNlfJsTGU+8FbaDRwLDfwMJaHnMvcFDpLxPraOGEWd20BWRYtu33BOFj4YOziI
	 6oCrRyTGe0FR8HLIbBQ7v220CDHpvAZWS8LFsdOGiQg5oufi96S8xNiU+YkmC0WXKN
	 PnFl9/vUvesBVFdGeywTSrhqfUXhr8hGt/NM1+KvU+J+DM4IgYR7KrNhmMIc9hRdK1
	 YaPMduE+Zl1lMtJBxmqLU3Y4uUrBaCkRRZtIFcO+7QwiNDcRcg+7vp4EwM6grKjntQ
	 bT8sREwJawVdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D828C39D6573;
	Tue, 10 Nov 2026 20:30:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: stmmac: release MDIO node if bus data allocation
 fails
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179434260468.42011.3541882891013618336.git-patchwork-notify@kernel.org>
Date: Tue, 10 Nov 2026 20:30:04 +0000
References: <20261108110231.315004-1-vulab@iscas.ac.cn>
In-Reply-To: <20261108110231.315004-1-vulab@iscas.ac.cn>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: maxime.chevallier@bootlin.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, horms@kernel.org,
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 08 Nov 2026 11:02:31 +0000 you wrote:
> stmmac_mdio_setup() takes a reference on the MDIO device tree node and
> stores it in plat->mdio_node before allocating plat->mdio_bus_data. If
> that allocation fails, the function returns -ENOMEM and the caller
> jumps to error_put_phy, which only drops plat->phy_node, so the
> reference on the MDIO node is leaked.
> 
> Release the reference before returning, using an error label so that
> the cleanup stays in one place.
> 
> [...]

Here is the summary with links:
  - [v2] net: stmmac: release MDIO node if bus data allocation fails
    https://git.kernel.org/netdev/net-next/c/8959c2030f5c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



