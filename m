Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E1160A262E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KI3VxviY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j+G1a8qa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mvvPC3+ird2JdQYl0sF3n5jlmtsAooRx8KFT06CTW34=; b=KI3VxviYW3Wsum256L7HfMqs4K
	w9q0Lvz0eavtwCO0D4egD5h1yohwI27Ew+wmTvQ9UiaVjh5sXQqL0ml4p78Gjo354jtUuyOfW3QPP
	hBD790FJFyHNfZ+qgBGMz/GsbgNwNrkjbe4osn5kEvuDtWIi5hGrcUfakbVGj2gL1KyPwlWLbLfqf
	hX7I0snGJPccbeGy1sYkcSQb1fGAzKnQe+L9jRbzG9Z4QW2oI2y1t2iZ4NAbEtx5M4eme75zJmGUP
	1HIciYr+uwMPItkR1ZzpOrEORw6WNK0lHJWuEnUe4egxytpTRufb/4V96Tnr6zg8ugMq0HGjeBCQ1
	FluOidCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkeG-00000003kT8-2xwk;
	Tue, 10 Nov 2026 12:08:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkeD-00000003kQy-0GbA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:08:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E00B638E6;
	Tue, 10 Nov 2026 12:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1571F008A2;
	Tue, 10 Nov 2026 12:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312500;
	bh=mvvPC3+ird2JdQYl0sF3n5jlmtsAooRx8KFT06CTW34=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=j+G1a8qaRKmHtc0tyGyBhCVBNpLlwbaGuKfie9D9F5mh/d6EF9kq6ikn+pbZE0DQQ
	 Dj/DRcqpTk1kDHRfdx26w10ANGn44UeeiCAJHQazDIujfDhRStVhLF9/GZgroPheYa
	 XoUTK/JMV+AuYDTgYrPl2Hf6TssF7Ud4/NERc0Hrur+ybT0XwrasVCfm3A49mFTY3d
	 bE8GkpRs0m7h3FfUbw10lz9yIjlTzsGPt+ubXAZJLgnHATD+KVSZ5KnIhIpLVlKEDa
	 yfWPMnx+OD1DZMFkskA7carVW8VSiWY5Nu8Dsb7TJ98cIsVQiVlUMWcimD+6BYwzcz
	 N2dYgJ3J5o3yA==
Subject: Re: [PATCH net-next v6 RESEND 4/4] net: stmmac: hold RTNL when
 reading descriptor rings in descriptors_status
From: netdev-bot+sashiko@kernel.org
To: dinghui1111@163.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dinghui@lixiang.com, xiasanbo@lixiang.com, yangchen11@lixiang.com,
 liuxuanjun@lixiang.com
Date: Tue, 10 Nov 2026 12:08:18 +0000
Message-ID: <179431249895.994134.1654344406959828487@kernel.org>
In-Reply-To: <20261106090507.1020751-5-dinghui1111@163.com>
References: <20261106090507.1020751-5-dinghui1111@163.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit fixes a NULL pointer dereference that a user can
  trigger, but its message has no Fixes: tag (and no Cc: stable).
- [Low] stmmac_rings_status_show() reads its loop bounds before taking
  RTNL.

--

net: stmmac: hold RTNL when reading descriptor rings in descriptors_status

This commit takes RTNL around the descriptors_status debugfs reader so it
is serialized against the control-plane paths that free the descriptor
rings. It also skips queues whose rings are NULL, which happens when the
interface stays IFF_UP after a failed internal reopen.

> Skip such queues with a hint instead of dereferencing a NULL pointer
> in stmmac_rings_status_show().
>
> Signed-off-by: Ding Hui <dinghui@lixiang.com>

[Severity: Low]
This fixes a NULL pointer dereference that can be triggered from debugfs,
but the commit has no Fixes: tag and no Cc: stable. Should they be added so
the affected stable trees pick this up?

The state described above comes from stmmac_change_mtu() when the reopen
fails:

stmmac_change_mtu()
    __stmmac_release(dev);
    ret = __stmmac_open(dev, dma_conf);
        init_error:
            free_dma_desc_resources(priv, &priv->dma_conf);

free_dma_desc_resources() frees the rings and sets dma_rx/dma_erx and
dma_tx/dma_etx to NULL. IFF_UP stays set.

Before this patch, stmmac_rings_status_show() checked only IFF_UP. It then
passed the NULL ring to sysfs_display_ring(), which dereferences p->des0. A
reader that raced with ndo_stop, an MTU change, an XDP change or an XSK
change could also read DMA memory while it was being freed.

There are two candidate targets. One is the commit that added the
unsynchronized descriptors_status reader. The other is the commit that
added the MTU-change reopen path:

Fixes: 347007968744 ("net: ethernet: stmicro: stmmac: permit MTU change with interface up")

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index cd4631efe47ab..10d33a43db947 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6748,8 +6748,10 @@ static int stmmac_rings_status_show(struct seq_file *seq, void *v)
>  	u8 tx_count = priv->plat->tx_queues_to_use;
>  	u8 queue;
>  
> +	rtnl_lock();
> +

[Severity: Low]
Are the loop bounds still read outside the lock? rx_count and tx_count are
set in the declarations, before rtnl_lock() is taken:

    u8 rx_count = priv->plat->rx_queues_to_use;
    u8 tx_count = priv->plat->tx_queues_to_use;

stmmac_reinit_queues() (ethtool -L) runs under RTNL. It releases the rings
and then updates both fields:

stmmac_reinit_queues()
    stmmac_release(dev);
    ...
    priv->plat->rx_queues_to_use = rx_cnt;
    priv->plat->tx_queues_to_use = tx_cnt;
    ...
    ret = stmmac_open(dev);

Suppose the reader loads the counts and then blocks in rtnl_lock() while
set_channels runs. The loops then use stale bounds.

If the count shrank, the reader prints "Descriptor ring not allocated" for
queues that no longer exist. If it grew, live queues are skipped without
any message. This is also a data race that KCSAN could report, since the
fields are written under RTNL.

The rx_queue[] and tx_queue[] arrays are sized by MTL_MAX_*_QUEUES, so the
accesses stay in bounds. Only the debugfs output is affected.

The commit message says RTNL now synchronizes this reader with the control
plane. Would it make sense to read rx_queues_to_use and tx_queues_to_use
after rtnl_lock() as well?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106090507.1020751-1-dinghui1111%40163.com

