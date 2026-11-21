Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4B4606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 20:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cYMAH3Ny;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flsBhDyS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9YX7pTGaC1zV8yzyJOH/LMlC9n2f+DZig6xlLRVKyi4=; b=cYMAH3NyxCPPdXlLDAH6+H6wYU
	0uffzINmnwa6Omt8VKJ3lkFBzvEaHG3aFS3I2Cz4YCmsXf5ICBlr+Uhwm9T32PX9anEB6v/raQeXg
	SUBfRg8ncZE30x0rKJfpQcJLnJB+BVE25WcLfdh8xIqE6gtzcMV9ZKqwf5I2nw3w5DWiNvCWyeqn3
	iOTwASVZEdoauP3tVoEqadJQ3Re7eSmIBCMMbBiJ9uZrQKVx2jJMttwj6DC/GmuttiHeZ6yac4jmg
	Wkv2FJrYwGQV+YYkJhpKe9ROYcjWpGPaBx+Qi8enyJFPqJhv7fDCZ4HCf0he0taPRrWYrHPn8qtyU
	tUa7Ezdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrbA-00000000BOn-2hLp;
	Sat, 21 Nov 2026 20:22:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrb0-00000000BHX-2xcf;
	Sat, 21 Nov 2026 20:22:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D5D7161448;
	Sat, 21 Nov 2026 20:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F561F000C0;
	Sat, 21 Nov 2026 20:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795292521;
	bh=9YX7pTGaC1zV8yzyJOH/LMlC9n2f+DZig6xlLRVKyi4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=flsBhDySGPpD4+8BCO7aQee/pjQO56ZTKoWngMKOCsaxlqA3X0wklqVM2aE4xCeH7
	 /8/y2nhZVjf+81/um9VqkeE9LcyVV1l3hm8yQaA/ECRUDG50te8avO26hl4ZSvj+h4
	 tSl77nj3o9kaPUhVjFfkJDZLhNU8nYfgqqiVffidFyOowVykaIwULM9rtTP9FkQfn8
	 iaDD0xMGF96rtzbX3BfF1PcbN7pEVPnS9rTkk7HQ9hJBPbIHytj1pnNb7lCC46sq6s
	 QthW4z3lnv0ilZyCLnckRc3BZ/uNBE0yRcvAzcMt8pmirM9NEjDkN/8qgr7KyQmfli
	 xYHfuithJ+DhA==
Subject: Re: [PATCH net-next v7 2/3] net: ethernet: mtk_eth_soc: skip page_pool
From: netdev-bot+sashiko@kernel.org
To: sandeeph@loljews.com
Cc: netdev@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 daniel@makrotopia.org, mason-cw.chang@mediatek.com, frank-w@public-files.de,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Sat, 21 Nov 2026 20:22:00 +0000
Message-ID: <179529252030.3135.14253171645574966538@kernel.org>
In-Reply-To: <patch-7f000e4c3d9e69480484b3283b01c6dc@loljews.com>
References: <patch-7f000e4c3d9e69480484b3283b01c6dc@loljews.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The subject "net: ethernet: mtk_eth_soc: skip page_pool" leaves
  out when the page_pool is skipped.

--

net: ethernet: mtk_eth_soc: skip page_pool

This commit adds a condition in mtk_rx_alloc() so that a page_pool is
only created for an RX ring whose ring->buf_size fits in
MTK_PP_MAX_BUF_SIZE. Larger rings fall back to the existing
netdev_alloc_frag()/mtk_max_lro_buf_alloc() path. With the current MTU
limits this condition always passes. It only takes effect once the
9K jumbo support that follows is applied.

Link: https://github.com/mediatek/mtk-openwrt-feeds

> net: ethernet: mtk_eth_soc: skip page_pool

[Severity: Low]
This isn't a bug, but could the subject say when the page_pool is
skipped?

Read on its own in the shortlog, or during stable/backport triage,
"skip page_pool" reads as if page_pool is being removed from the driver
entirely. The change in mtk_rx_alloc() is actually a per-ring check:

	if (mtk_page_pool_enabled(eth) &&
	    ring->buf_size <= MTK_PP_MAX_BUF_SIZE) {

Something like "skip page_pool for RX rings larger than
MTK_PP_MAX_BUF_SIZE" would describe the change.

The earlier patch in the series, "net: ethernet: mtk_eth_soc: fix the
RX", also seems to have a subject that was cut short.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/patch-7d2c457e68de6b53b7348d1bdbeadcec%40loljews.com

