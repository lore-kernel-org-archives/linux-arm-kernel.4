Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABCC606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gP1Hy8yL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCPTuUqF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YW/wH69a6msdALwLu/bQnPmudlA0vz81wQd6TeQpf3U=; b=gP1Hy8yLyUb+aow6+YvNOYKHir
	vSWF24ktDeurxVTQOeq66KzPb+lSgWQ4sPAMPldpBFdVJhuqGfWYWAZMehjFIKMfE8N0w9d4R1UmF
	n0rhVdeIzvOBfANTzQF3kP0YhzQrR1hcgblnza6tkKldG/K82yUmT05RPoHYKTJrjeeFeJ5i5Vuth
	PGHe569XhZe4Lrs2K25zT/hD62ptMNuVUa6w2tr5yE3DkJuyOVrCNzgw3tb3z/kDQedJI2g46YDKs
	h8fYAdJvVwfcDuhjCirp3jA+a/T+BUhwZURZ3jsmsUoDZOOeCr5lwYVvj/mwcgfl8dB1c3dbd7eOv
	lfKs489w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC9c-00000009qNB-1vse;
	Wed, 25 Nov 2026 12:31:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC9Z-00000009qMi-423W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:31:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BA3C61222;
	Wed, 25 Nov 2026 12:31:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CD31F000C4;
	Wed, 25 Nov 2026 12:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795609872;
	bh=YW/wH69a6msdALwLu/bQnPmudlA0vz81wQd6TeQpf3U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MCPTuUqFt3zw+UNyh4BYvuzxLB6B+IDc/VhwWdBapfXfjl2RlXZhCqHwlsMK0RHVi
	 si3afs8RfkmgO8Wrcu6gnRJTLfcrFt2v9zGhfw7uygp65S+ZSO6YgCyKRdpOV1TbSv
	 iEEy4HEnbzBeOXZ5iOrD9qcik3oRyHFQL80dfEnMLvJMbkZbwIG8ryrpjjT9IW4/Cu
	 lT/o65ghUXTn7K0VRXmjNEX4cI1ORjj13/OYxLLgk3oIap4HvAQoFovW7OgZitwTUj
	 XiuPR9ExMyYnsSvl3lAE85FE9dU9JXPIPuriV72A7ojjLnjnlRJ0uhI5bwDgSbtFB/
	 w+qKdZTHIU0JQ==
Subject: Re: [PATCH net-next v12 4/4] net: stmmac: rework stmmac_rx to support
 XDP rx multi-buff
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, Jose.Abreu@synopsys.com, boon.leong.ong@intel.com,
 horms@kernel.org, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bpf@vger.kernel.org, nb@tipi-net.de
Date: Wed, 25 Nov 2026 12:31:10 +0000
Message-ID: <179560987080.3135.9418981958235641169@kernel.org>
In-Reply-To: <20261121-stmmac-rx-mb-v12-4-3ae2f3bce174@oss.qualcomm.com>
References: <20261121-stmmac-rx-mb-v12-4-3ae2f3bce174@oss.qualcomm.com>
X-sashiko-severity: Medium
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch makes __stmmac_dvr_probe() always add
  NETDEV_XDP_ACT_RX_SG to ndev->xdp_features.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch
  extends it.

--

net: stmmac: rework stmmac_rx to support XDP rx multi-buff

This reworks stmmac_rx() to collect every descriptor of a frame into an
xdp_buff. The XDP program now runs on the whole frame, which may be
fragmented, and the skb is built with __xdp_build_skb_from_buff(). It also
saves the in-progress xdp_buff across NAPI polls and advertises
NETDEV_XDP_ACT_RX_SG.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ca4c7fb11b73f..b657701f51f90 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -6023,120 +6038,79 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)

[ ... ]

> +		ctx.desc = p;
> +		ctx.ndesc = np;
> +
> +		skb = stmmac_xdp_run_prog(priv, &ctx.xdp);
> +		/* For Not XDP_PASS verdict */
> +		if (IS_ERR(skb)) {
> +			unsigned int xdp_res = -PTR_ERR(skb);
> +
> +			if (xdp_res & STMMAC_XDP_CONSUMED) {
> +				__xdp_return_buff(&ctx.xdp, true);
> +				rx_dropped++;
> +			} else if (xdp_res & (STMMAC_XDP_TX |
> +					      STMMAC_XDP_REDIRECT)) {
> +				xdp_status |= xdp_res;
> +			}
> +			goto next;
> +		}

[Severity: High]
This is a pre-existing issue, but now that multi-buffer frames can reach
XDP_TX, does it widen a race on the RX page_pool's lockless alloc cache?

XDP_TX frames go to a TX queue picked by CPU number, not by the RX queue
that owns the page_pool:

stmmac_xdp_xmit_back()
  stmmac_xdp_get_tx_queue(priv, smp_processor_id())
      while (index >= priv->plat->tx_queues_to_use)
          index -= priv->plat->tx_queues_to_use;

Completion then runs in that TX queue's tx_napi:

stmmac_tx_clean()
  xdp_return_frame_rx_napi(xdpf)
    __xdp_return(..., napi_direct=true)
      page_pool_put_unrefed_netmem(allow_direct=true)
        page_pool_recycle_in_cache()

allow_direct is already true, so page_pool_napi_local() is skipped. That
means pool->alloc.cache and pool->alloc.count are written without a lock.

Meanwhile the owning rx_napi on another CPU uses the same cache through
stmmac_rx_refill(), __xdp_return_buff(&ctx.xdp, true), and
page_pool_put_full_page(..., true) in stmmac_build_xdp_frags().

Here is one example. With multi-MSI and ethtool -L rx 4 tx 2, rx_napi 2
(hinted to CPU2) sends XDP_TX on TX queue 0. The tx_napi for TX queue 0
runs on CPU0 and recycles pool 2 pages while rx_napi 2 refills from pool 2
on CPU2. IRQ affinity changes can cause the same overlap.

Can these unsynchronized updates give the same page to two RX descriptors,
or lose pages? Before this patch only the linear head page went through
this path. Now every buf1/buf2 frag page of a multi-buffer XDP_TX frame
goes through it as well.

[ ... ]

> @@ -8218,6 +8199,7 @@ static int __stmmac_dvr_probe(struct device *device,
>  	ndev->hw_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM |
>  			    NETIF_F_RXCSUM;
>  	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
> +			     NETDEV_XDP_ACT_RX_SG |
>  			     NETDEV_XDP_ACT_XSK_ZEROCOPY;

[Severity: Medium]
Should NETDEV_XDP_ACT_RX_SG be advertised while the driver still refuses
the setups where multi-buffer XDP is needed?

stmmac_xdp_set_prog() in stmmac_xdp.c still rejects every program once the
MTU is above ETH_DATA_LEN, including programs loaded with
BPF_F_XDP_HAS_FRAGS. It also still turns SPH off:

	if (prog && dev->mtu > ETH_DATA_LEN) {
		...
		NL_SET_ERR_MSG_MOD(extack, "Jumbo frames not supported");
		return -EOPNOTSUPP;
	}

stmmac_change_mtu() also refuses a jumbo MTU while XDP is attached:

	if (stmmac_xdp_is_enabled(priv) && new_mtu > ETH_DATA_LEN) {
		netdev_dbg(priv->dev, "Jumbo frames not supported for XDP\n");
		return -EINVAL;
	}

The commit message says as much:

  "it does not enable XDP jumbo support by itself."

The in-tree AF_XDP selftest in tools/testing/selftests/net/lib/xsk/test_xsk.c
turns on its multi-buffer tests based on this flag:

	if (query_opts.feature_flags & NETDEV_XDP_ACT_RX_SG)
		ifobj->multi_buff_supp = true;

Those tests include testapp_send_receive_mb(), testapp_xdp_metadata_mb(),
testapp_adjust_tail_grow_mb() and similar ones. They set the MTU to
MAX_ETH_JUMBO_SIZE (9000) and attach a program in DRV mode. On stmmac one
of those two steps is refused, depending on which comes first. So these
tests would go from SKIP to FAIL with this patch.

Could NETDEV_XDP_ACT_RX_SG be left out until the MTU and program checks
accept frags-capable programs at jumbo MTU?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121-stmmac-rx-mb-v12-0-3ae2f3bce174%40oss.qualcomm.com

