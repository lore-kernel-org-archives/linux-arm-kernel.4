Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32FA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v7bsvQqD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZceTKAIe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y1VdEYkOFsdjBJ4FhwL8M9gh2t6rskpg0TRoh1e25yA=; b=v7bsvQqDv7cdJXiZKX5mU+UwYr
	ROGVaswcgy5QKA+Z15mC31ADQUvIa71ZeT4NCcxAjhISRMFaZsKfifXQpDlXNSy+j8Nwz+i6ibgAc
	lLr6ArP/bS7fmLR3ZvST4DJ3zNanwSeDoCim6+mO1Qv3hZJ5AsGeeTduRhY7juVGWeL49pi5T01UC
	9ZHGPBXIJEihP3Qo5b3ngC9uGXp20uMq+bYp+ANVU8pe+fuMR71+PZvRdrvOHHL1PhONXjHdRlFZb
	jxWSSArCgOE9rD4d3ucphMfh477FDcNugFdxiY9Y9HDxwq1FuEY42DC0OQ7LxvmYmwQlBHk4dbz66
	sfViiodw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPBY-00000002XvR-1DhV;
	Mon, 23 Nov 2026 08:14:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPBV-00000002Xv7-2oGx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 08:13:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4144E4192C;
	Mon, 23 Nov 2026 08:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE48A1F000CF;
	Mon, 23 Nov 2026 08:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795421636;
	bh=Y1VdEYkOFsdjBJ4FhwL8M9gh2t6rskpg0TRoh1e25yA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZceTKAIeBcgVkkVLqhcltRBe/mvkHF0yq1cHkYA7Xr6s5K7iBpNALqzO0V/e/o8LM
	 wjzPq6dsbfD7uPAeO8Oagu+bn6fXAGMdNvqwktcrmSgBu4FEF6YiOcv5xQl9JbHtFJ
	 TJJhOeIWLfbGfaVc9n7aa3cBpy2cAjXRcnGNiQFhY5lv54HP44bP+lleKXhxi4Ji9W
	 KpAIu7nevQdoaNeMmNS9UIZvQzkhgDuMeL6y5iLpFFgZHGXrnIGh8DT3m0eUr2GrQp
	 6/gitOqrTvz03EtIhV2yEIKHmg4ucWZEPawky2v/r9o+yzHm1SvC+04/PWSRCnhmm7
	 1aRX6IocvcFWQ==
Subject: Re: [PATCH net v4] net: stmmac: preserve RX checksum capability when
 offload is disabled
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Date: Mon, 23 Nov 2026 08:13:55 +0000
Message-ID: <179542163545.3135.9945110205092257108@kernel.org>
In-Reply-To: <20261122-submit-stmmac-rx-checksum-capability-v1-v4-1-b729bef2695d@gmail.com>
References: <20261122-submit-stmmac-rx-checksum-capability-v1-v4-1-b729bef2695d@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] When stmmac_set_features() fails to enable RX checksum on a
  running interface, it returns -EIO before applying the split-header…
- [Medium] Toggling RX checksum offload on a running interface still
  changes the IPC bit while the MAC receiver, the MTL RX FIFO and the RX…
- [Low] On a MAC that advertises RX COE but does not keep the IPC bit set
  (the case the original d2afb5bdffde3 check handled), the patch retries…

--

net: stmmac: preserve RX checksum capability when offload is disabled

This commit keeps stmmac_hw_setup() from throwing away the detected RX
checksum type when the IPC bit reads back clear after a disable. The
requested state is now passed straight to the rx_ipc callbacks. After a
failed enable, a new rx_csum_failed flag masks RXCSUM in feature
negotiation until the next MAC reset, and open and resume now reconcile
features before RX starts.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a685ce4638f61..739c6aca447ed 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3675,25 +3675,51 @@ static bool stmmac_tso_channel_permitted(struct stmmac_priv *priv,
>  	return !(priv->dma_conf.tx_queue[chan].tbs & STMMAC_TBS_AVAIL);
>  }
>  
> +static int stmmac_set_rx_csum(struct stmmac_priv *priv, unsigned int rx_csum)
> +{
> +	int ret;
> +
> +	if (!rx_csum) {
> +		WRITE_ONCE(priv->hw->rx_csum, 0);
> +		stmmac_rx_ipc(priv, priv->hw, false);
> +		return 0;
> +	}
> +
> +	ret = stmmac_rx_ipc(priv, priv->hw, true);
> +	if (ret <= 0) {
> +		WRITE_ONCE(priv->hw->rx_csum, 0);
> +		priv->rx_csum_failed = true;
> +		return ret ?: -EIO;
> +	}
> +
> +	WRITE_ONCE(priv->hw->rx_csum, rx_csum);

[Severity: Medium]
The commit message says:

  Check the result of an enable before allowing RX to mark packets
  CHECKSUM_UNNECESSARY, including when the checker is first enabled on a
  running interface.

When stmmac_set_features() calls this on a live interface, is RX still
running? The IPC bit changes while the MAC receiver, the MTL RX FIFO, the
RX DMA ring and NAPI all keep going.

Frames already in the RX ring or FIFO were received with IPC off. If NAPI
handles them after the WRITE_ONCE() above, could they be marked
CHECKSUM_UNNECESSARY even though the engine never checked them?

The descriptor status does not seem to show whether the engine ran:

- dwmac4_wrback_get_rx_status() sets csum_none only for
  RDES1_IP_HDR_ERROR or RDES1_IP_PAYLOAD_ERROR.
- RDES1_IP_CSUM_BYPASSED only increments a counter.
- enh_desc_coe_rdes0() decodes status 0x4 as good_frame.

stmmac_rx() and stmmac_dispatch_skb_zc() then do:

	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
	    (status & csum_none))
		skb_checksum_none_assert(skb);
	else
		skb->ip_summed = CHECKSUM_UNNECESSARY;

The disable path has the same problem in the other direction.
stmmac_rx() reads coe once per poll:

	int coe = READ_ONCE(priv->hw->rx_csum);

A poll already running on another CPU keeps the old non-zero coe for its
whole budget. Frames the MAC receives after IPC is cleared could then also
be marked CHECKSUM_UNNECESSARY.

On TYPE1 COE cores, would frames that straddle the toggle also get a
length that is off by 2 bytes? stmmac_get_rx_frame_len() strips the
appended checksum bytes based on the sampled coe, not on the IPC state
the frame was received under.

The readback shows the checker is on from this point on, but not that
frames already queued were checked. Would RX need to be quiesced around
the IPC change to close the window, for example by stopping RX DMA and
NAPI and draining or reinitialising the ring before publishing rx_csum?

> +	return 0;
> +}
> +
> +/* Recheck the wanted features if this reset clears or uncovers a failure. */
> +static bool stmmac_init_rx_csum(struct net_device *dev)
> +{
> +	struct stmmac_priv *priv = netdev_priv(dev);
> +	bool was_failed = priv->rx_csum_failed;
> +	unsigned int rx_csum;
> +
> +	priv->rx_csum_failed = false;
> +	rx_csum = dev->features & NETIF_F_RXCSUM ? priv->plat->rx_coe : 0;
> +	if (stmmac_set_rx_csum(priv, rx_csum))
> +		netdev_warn(dev, "RX IPC Checksum Offload disabled\n");
> +
> +	return was_failed || priv->rx_csum_failed;
> +}

[ ... ]

> @@ -4216,6 +4244,12 @@ static int __stmmac_open(struct net_device *dev,
>  		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
>  		return ret;
>  	}
> +	if (stmmac_init_rx_csum(dev)) {
> +		netdev_update_features(dev);
> +		if (priv->rx_csum_failed)
> +			netdev_update_features(dev);
> +	}
> +	stmmac_hw_start(dev);

[Severity: Low]
Some MACs report RX COE but do not keep the IPC bit set, which is the
case d2afb5bdffde3 handled. On those MACs, does this retry the enable on
every open and resume, and fail each time?

On the first open, stmmac_init_rx_csum() fails, sets rx_csum_failed and
warns. netdev_update_features() then masks RXCSUM out of dev->features.

On the next ifdown/ifup, or on resume, the sequence looks like this:

__stmmac_open()
  stmmac_init_rx_csum()
    was_failed = true
    priv->rx_csum_failed = false
    stmmac_set_rx_csum(priv, 0)   succeeds, RXCSUM not in dev->features
    returns true
  netdev_update_features()
    stmmac_fix_features()         no longer masks RXCSUM
    stmmac_set_features()
      stmmac_set_rx_csum(priv, rx_coe)
        rx_ipc(true) reads back 0, returns -EIO
    __netdev_update_features()
      netdev_err "set_features() failed (-5); wanted ..., left ..."
      returns -1, so netdev_features_change() sends NETDEV_FEAT_CHANGE
  netdev_update_features()        masks RXCSUM again

stmmac_resume() follows the same path.

Before this patch, the capability was cleared once with a single
netdev_warn(). With this patch, every ifup and every resume would log a
netdev_err() from the core and send an extra NETDEV_FEAT_CHANGE
notification. Is that intended?

The commit message says "a reset can restore offload if it is still
wanted", but it does not mention this behavior on hardware where the
enable always fails.

[ ... ]

> @@ -6400,18 +6434,18 @@ static int stmmac_set_features(struct net_device *netdev,
>  			       netdev_features_t features)
>  {
>  	struct stmmac_priv *priv = netdev_priv(netdev);
> +	bool running = netif_running(netdev);
> +	unsigned int rx_csum;
> +	int ret;
>  
[ ... ]
> +	rx_csum = features & NETIF_F_RXCSUM ? priv->plat->rx_coe : 0;
> +	if (running && rx_csum != priv->hw->rx_csum) {
> +		ret = stmmac_set_rx_csum(priv, rx_csum);
> +		if (ret)
> +			return ret;
> +	}

[Severity: Medium]
If stmmac_set_rx_csum() fails here on a running interface, the early
return skips the split header update and the hw_vlan_en and
stmmac_set_hw_vlan_mode() changes requested in the same call. Open and
resume run a second netdev_update_features() to recover, but is there
anything like that on this path?

For example:

1. The interface is opened with RXCSUM off, so rx_csum_failed stays
   false.
2. An admin runs "ethtool -K eth0 rx on rxvlan off".
3. stmmac_fix_features() does not mask RXCSUM. stmmac_set_rx_csum() fails,
   sets rx_csum_failed and returns -EIO before hw_vlan_en is updated.
4. __netdev_update_features() logs the error and leaves dev->features
   unchanged. VLAN stripping stays on in hardware and in dev->features,
   while wanted_features asks for it to be off.
5. Repeating "ethtool -K eth0 rxvlan off" over netlink does nothing,
   because ethnl_set_features() only calls __netdev_update_features() when
   the requested wanted bitmap differs from the old one.

The VLAN change stays pending until an unrelated netdev_update_features()
call, a reopen or a resume.

The v3 changelog says "Keep a failed enable from blocking unrelated
feature changes", but that seems to cover only open and resume.

Should this path also run feature negotiation again, or apply the
remaining changes before it returns the error?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122-submit-stmmac-rx-checksum-capability-v1-v4-1-b729bef2695d%40gmail.com

