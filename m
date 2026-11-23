Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5A9606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 23:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S+rdfmtq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VtT4P/63
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RVYWyJ0BbdnmcUI8iJP5vn29b8A6FEyws7roKgl4Zrw=; b=S+rdfmtqdhkBk9Bf9sXI9uTNl2
	JlUgjSToMxF9PCg1N9EhWYGvBWmBDyfYLODwn7Tzmh++vM1SxvhBt6opFe0TWTTHCOT6CYntnJNrE
	BphOXUZNnhkHy9ID8Tmzi8DAYkcsw745uzBY2HZUr4uvpUFUmDqPt5LGiExz07laP+qTMXZ233baN
	S2TO3qHxW+Ri/rJGQHTQTo3/zodtMLyxsw+a8J2U7g4/AS/OefHQDUOY9PxwPSeC/ZPpoKy2MVAWh
	jhV9o4WIdAXTGxjDlAciTumAFZnUGXVdXLOzj/cgUugi6UFuF6566oien6o9kkMTMbuFIRxIhnkvk
	f2OovRvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdFd-0000000599s-3JmU;
	Mon, 23 Nov 2026 23:15:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdFb-0000000599D-1lCR;
	Mon, 23 Nov 2026 23:15:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BFC0760D63;
	Mon, 23 Nov 2026 23:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359221F000C6;
	Mon, 23 Nov 2026 23:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795475705;
	bh=RVYWyJ0BbdnmcUI8iJP5vn29b8A6FEyws7roKgl4Zrw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VtT4P/63Nkq/acjtwT73fxjyj1N63Gg6ufoBKvQxPnpIo0BULHhRzz6rzBSK6bevd
	 me0u7ZGCBjHRvzxQMigSPx0YpZ+O16wAV4zg9IxgvGHNFJD4THyJ0XXUrtMfpXGYAD
	 63yyheWgI/PpNOODO9ngy73aDmyJwgUTti+gUCvGoyrj8Uo5w2GDf16pwvN8dBfIan
	 ZBUFfFLgXwVBk/7T/x6ON9nWoNmU3llVF1qHGkneUkQbXpB0I3NNUUhWG1XQU+bQ+P
	 O1SWmYTFVTJ5wTQdBweyyzGb/57zSdrv87+gArSRFwvU80Tx5i2hhaoZIkKrh/i0Og
	 iKnBOjs7Vl1eg==
Subject: Re: [PATCH net-next v8 2/3] net: ethernet: mtk_eth_soc: skip page_pool
From: netdev-bot+sashiko@kernel.org
To: sandeeph@loljews.com
Cc: netdev@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 daniel@makrotopia.org, mason-cw.chang@mediatek.com, frank-w@public-files.de,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 23:15:03 +0000
Message-ID: <179547570374.3135.12912377110085443536@kernel.org>
In-Reply-To: <patch-512286e3bf3d34c81957126ab22d02fe@loljews.com>
References: <patch-512286e3bf3d34c81957126ab22d02fe@loljews.com>
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

- [Low] The subject line 'net: ethernet: mtk_eth_soc: skip page_pool'
  leaves out the condition.

--

net: ethernet: mtk_eth_soc: skip page_pool

This commit adds a check in mtk_rx_alloc() so that an RX ring only gets
a page_pool when ring->buf_size fits within MTK_PP_MAX_BUF_SIZE. Rings
larger than that use the existing netdev_alloc_frag() and
mtk_max_lro_buf_alloc() path. The commit message says the check always
passes with the current MTU limits and only matters once 9K jumbo
support is added.

Link: https://github.com/mediatek/mtk-openwrt-feeds

> net: ethernet: mtk_eth_soc: skip page_pool

[Severity: Low]
This isn't a bug, but the subject doesn't say when page_pool is skipped.
In a shortlog or a backport scan, it reads as if page_pool is being
removed from the driver.

The patch only adds a per-ring check in mtk_rx_alloc():

	if (mtk_page_pool_enabled(eth) &&
	    ring->buf_size <= MTK_PP_MAX_BUF_SIZE) {

At this commit the check changes nothing on SoCs that use page_pool. The
non-HWLRO rings are sized from ETH_DATA_LEN, so buf_size stays around
2K. That is well below MTK_PP_MAX_BUF_SIZE, which is about 3520 with 4K
pages.

The HWLRO rings are larger. They only exist on NETSYS v1 SoCs
(mt2701/mt7622/mt7623/mt7629), and mtk_page_pool_enabled() is already
false there.

Could the subject say when page_pool is skipped? For example, "skip
page_pool for RX rings larger than MTK_PP_MAX_BUF_SIZE".

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/patch-51fa5ed3bc801edb3f29b61ca7888382%40loljews.com

