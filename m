Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9496F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 22:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p8sPr1RI;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MzC3q/kC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OH+0WymoBgcUXGycaB4LMqft3m6k34R9ciQ53jyzM9o=; b=p8sPr1RI8ENQPGNCB8ShUttDS1
	6/vMy1KX8diWqL/ca1QeyIDA42uVMTOaMGbBc8yRWC1awUl38Fl99tbOeCa17DHRiFn+4NDf4cK7x
	ny+4jnyXYTJzOQ1CM0gtb/8n0Kv8ZR+d3vj+uVNTBJ0fBWg+JGN1u3avhb8chuM6+naRa7ePNWdVT
	6/+FkNl18yP4a2UX2AvlJbMVLbe5LzcXvW71Bk8rlfk6dKhYTGuuRLjXLD1HWelpbCfDqS0JhDrvi
	iSxcOinrmxyviECkklk3TIv1m0B7UcwOl6CHWE44myVj/7BTdVhKDPQbxGn6wZBjqEndGkd2PqeA4
	d3My5pUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdLN-0000000BAWO-18oS;
	Thu, 12 Nov 2026 22:32:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdL3-0000000BAK8-0fW1;
	Thu, 12 Nov 2026 22:32:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E499540792;
	Thu, 12 Nov 2026 22:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C3F1F000CD;
	Thu, 12 Nov 2026 22:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794522732;
	bh=OH+0WymoBgcUXGycaB4LMqft3m6k34R9ciQ53jyzM9o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MzC3q/kClS6U+kXLRaoowhQjOzZ63Z0TSjrBiLo+2gXsCGgsZg/DvhPVGPzQN0ab3
	 Wm8lXXAOcEv3RbykuHY8mMukhtoSIq2GT1ZcL7yOWJ1WvxiWo/VuhBIiCwjb6cgOTc
	 RlNbBw4eAT2IwrqW5kkDKAbkwbCOuym1fZqAmnnJ7rFlxDMKytJnZgk0y8wY1wwv4t
	 r3ougT1O1IWbiWG6vYwfqF/fEj18XVAETxLyvyznpH8x9OXfritCFEvi9HY7qoTeuw
	 EKqTf1fXoBgEb0PPlG3UC6QC6KCysBDHpr8PEhr4u5ueCUpgcxoUk9PEh/oejeQSNt
	 313pXofxZFk9g==
Subject: Re: [PATCH net v9 05/10] can: dev: add close_candev_cancel_restart_sync()
From: netdev-bot+sashiko@kernel.org
To: 1579567540@qq.com
Cc: mkl@pengutronix.de, kernel@pengutronix.de, mailhol@kernel.org,
 heiko@sntech.de, socketcan@hartkopp.net, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 wg@grandegger.com, linux-can@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 stable@vger.kernel.org
Date: Thu, 12 Nov 2026 22:32:11 +0000
Message-ID: <179452273127.488853.12768732215259424178@kernel.org>
In-Reply-To: <20261111-rockchip-canfd-restart-close-v9-5-6643f3825ba3@qq.com>
References: <20261111-rockchip-canfd-restart-close-v9-5-6643f3825ba3@qq.com>
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

- [Low] The patch adds close_candev_cancel_restart_sync() as a static
  inline in include/linux/can/dev.h and moves close_candev() onto it.

--

can: dev: add close_candev_cancel_restart_sync()

This commit adds a static inline helper, close_candev_cancel_restart_sync(),
to include/linux/can/dev.h. The helper synchronously cancels the CAN core
bus-off restart work, and close_candev() now calls it. Drivers can then
wait for recovery to finish before they tear down IRQ and hardware
resources, and echo skb cleanup stays in close_candev().

> diff --git a/include/linux/can/dev.h b/include/linux/can/dev.h
> index 346faddee02eb..2a286f906394b 100644
> --- a/include/linux/can/dev.h
> +++ b/include/linux/can/dev.h

[ ... ]

> @@ -115,6 +116,22 @@ struct can_priv *safe_candev_priv(struct net_device *dev);
>  
>  int open_candev(struct net_device *dev);
>  void close_candev(struct net_device *dev);
> +
> +/**
> + * close_candev_cancel_restart_sync() - cancel bus-off restart synchronously
> + * @dev: CAN network device
> + *
> + * Call before tearing down resources used by the restart callback.
> + * The driver must quiesce restart work producers before calling
> + * close_candev() for the final cleanup.
> + */
> +static inline void close_candev_cancel_restart_sync(struct net_device *dev)
> +{
> +	struct can_priv *priv = netdev_priv(dev);
> +
> +	cancel_delayed_work_sync(&priv->restart_work);
> +}

[Severity: Low]
This isn't a runtime bug, but should this patch carry a stable tag? The
alternative would be for the following Rockchip fix to list it as a
prerequisite.

The next patch in the series, "can: rockchip_canfd: cancel bus-off restart
before closing the device", has Fixes: ff60bfbaf67f and
Cc: stable@vger.kernel.org. It calls the new helper at the start of
rkcanfd_stop() in drivers/net/can/rockchip/rockchip_canfd-core.c:

    close_candev_cancel_restart_sync(ndev);

This commit has no Cc: stable tag, and the Rockchip fix does not name it
as a dependency.

If stable picks up only the tagged Rockchip fix, would the backport fail
to build? close_candev_cancel_restart_sync() would be undefined there.

Documentation/process/stable-kernel-rules.rst gives this form for
prerequisites:

    Cc: <stable@vger.kernel.org> # x.y.z: <sha>: <subject>

Other patches in the series already state their backport dependencies.
The earlier core patch "can: dev: check netif_running() before bus-off
recovery" is also tagged for stable.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-rockchip-canfd-restart-close-v9-0-6643f3825ba3%40qq.com

