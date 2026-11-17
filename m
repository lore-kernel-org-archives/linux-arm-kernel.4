Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521A4606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L1MEjRv5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G64rw3CY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0qKcuyhzLFuBHbczAbqx5crwyCe5DTKBouONLeSXJ7A=; b=L1MEjRv58Ko2k+sHS7obZC9zKt
	5kgKrzQlmKTDkhid3jrgX7B4kCGU+JP4k7IxmZ2rQpx5bpUSOQJwb8AfOBo5X870vP6d9C2NCeYjH
	gq2qJ/5Sf5khjUxAb+AFfJzpRyFGeO8n6ALW15QVyoCT5KNopz06Hv02+CMXwgTY6SudS6K2XZ4+X
	g7UjH0BNFHIyXyaekxzdc6jxnx6a/p81Lo3Kj4WGNz1dCBiPghfQ6NPz9tlSQfCMDSBgXWha1SjDc
	UjRaHA4zuDo9vm+x0UrvZe7Ae82OrEniMWV3aAA75ZGrsiKw2y2X2d2Kyn5Dv4mhkmZrJnS7ODn/u
	UNypeU0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJ1S-00000005sKB-3rxa;
	Tue, 17 Nov 2026 13:14:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJ1L-00000005sI2-1tea
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:14:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D39A161DA8;
	Tue, 17 Nov 2026 13:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E991F000C9;
	Tue, 17 Nov 2026 13:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921286;
	bh=0qKcuyhzLFuBHbczAbqx5crwyCe5DTKBouONLeSXJ7A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=G64rw3CYHmgxRV/7GES39h1YULxbfVBT+cug1THdGAri/RqGKaMXNzkikasyR7m7O
	 c7YS74i8mNWKuefEWuDB5xLPkDpyCWy321NqP7jfxtknrk8xl6sOq37Ipub/fE6EaL
	 L3hOeyVbZt8N9E48dqn6qcFUEA/ccSwXT+MVKtIOFN6VmMSIt+AQ5h52ueJyQng8EK
	 /5lPSC8APo+at6ba3BJOUVelxnSSpbUda5mHJgXHy+j5avTqXyNkFUMKxQ7XFYRcsI
	 tVVwf4jvnuo3uMDIO/x5uqHpCU2rLUoGF3py7u1FAbVXjXYZV1+ZTOjo0Xo4hBCbS8
	 fVqdWv/zaS7pQ==
Subject: Re: [PATCH net-next v4 4/8] net: xilinx: tsn: parse endpoint DMA
 channel configuration
From: netdev-bot+sashiko@kernel.org
To: srinivas.neeli@amd.com
Cc: nagadheeraj.rottela@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, michal.simek@amd.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 edumazet@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, git@amd.com, neelisrinivas18@gmail.com
Date: Tue, 17 Nov 2026 13:14:44 +0000
Message-ID: <179492128482.3136.14229628808606591959@kernel.org>
In-Reply-To: <20261113-patches_v2_external-v4-4-56bb26f042a4@amd.com>
References: <20261113-patches_v2_external-v4-4-56bb26f042a4@amd.com>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The driver requires the number of tx_chanN entries in "dma-names"
  to equal "xlnx,num-priorities", but the DT binding does not encode or…

--

net: xilinx: tsn: parse endpoint DMA channel configuration

This patch counts the tx_chanN and rx_chanN entries in dma-names and
allocates the conduit netdev with that many TX and RX queues. It parses
the tx-queues-config child node to map each logical TX queue to a TX DMA
channel. Probe also requires the TX channel count to equal
xlnx,num-priorities on the parent IP node.

> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> index b6458bb0ba0fd..9458db38255d4 100644
> --- a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c

[ ... ]

> @@ -69,15 +88,180 @@ static const struct ethtool_ops ep_ethtool_ops = {

[ ... ]

>  static int xlnx_tsn_ep_probe(struct platform_device *pdev)
>  {

[ ... ]

> +	ret = of_property_read_u32(ip_np, "xlnx,num-priorities", &num_prio);
> +	of_node_put(ip_np);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "missing xlnx,num-priorities\n");
> +
> +	if (num_prio < TSN_MIN_PRIORITIES || num_prio > TSN_MAX_TX_QUEUE)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "invalid xlnx,num-priorities %u\n",
> +				     num_prio);
>  
> -	ndev = alloc_etherdev(sizeof(*ep));
> +	if (num_tx_dma_channels != num_prio)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "TX channel count %u must equal num-priorities %u\n",
> +				     num_tx_dma_channels, num_prio);

[Severity: Low]

Is this equality check stricter than what the binding in
xlnx,tsn-endpoint-ethernet-mac.yaml allows?

The binding says the following and nothing more:

  - each dma-names item matches "^(tx|rx)_chan[0-7]$"
  - there are 2..16 items, with at least one TX and one RX entry
  - each queueN under tx-queues-config maps to a distinct TX channel
    listed in dma-names

Taken together, these rules only require the TX channel count to be at
least xlnx,num-priorities. They don't require it to be equal.

For example, this DT looks valid against the schema:

    xlnx,num-priorities = <2>;
    ...
        dma-names = "tx_chan0", "tx_chan1", "tx_chan2", "rx_chan0";
        tx-queues-config {
            queue0 { xlnx,dma-channel-num = <0>; };
            queue1 { xlnx,dma-channel-num = <1>; };
        };

But xlnx_tsn_ep_probe()->ep_count_dma_channels() counts three TX
channels, and probe then fails with:

    TX channel count 3 must equal num-priorities 2

The commit message says equality is the intended rule. Should the binding
state or enforce that in the xlnx,num-priorities or dma-names
descriptions? Or should the driver accept extra TX channels that no queue
uses?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-patches_v2_external-v4-0-56bb26f042a4%40amd.com

