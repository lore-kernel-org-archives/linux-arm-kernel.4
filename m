Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86422606A682
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 05:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eFf0nD89;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MaJmLHh7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kc1WDNzqnWa7MzsqOAzEg3sXZ0FXTjUIsij2hS/psy8=; b=eFf0nD89Db//ay09kZ0F8DiWN4
	M60XEc7jDiRYpWtkb5PPcxWddxGw9Y2Rjf8U+5U1P6waDdN0Ta9n+nt4gxfmVPef78mGZ+xDPtt/D
	7SP6lIuS2ppncgCURiuR3eQJ5b+pbNyFgn9TqAI14sP0EunIfUhs7uj/t0RCWdkM5BH/B4NbNYu7Y
	PZ4wsLRBDzPpQZFhbEcpWG+yqbx+gjyHyw3pakFFM1IVNIoWZF/JmI50WfRH7Y3Dbxb4zURAFkzv7
	xU4n51gv9SWttZF+XrVPmzmIWYq0MBqKxOijzH/aw9cOWwEWObKs9hpaCc7AcNjOSK8WcQ5/YaUUG
	FYFLj7eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMFH-00000002H7j-3dtv;
	Mon, 23 Nov 2026 05:05:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMFG-00000002H7c-0FJO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 05:05:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 39A4F602D3;
	Mon, 23 Nov 2026 05:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B6C1F000CA;
	Mon, 23 Nov 2026 05:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795410336;
	bh=kc1WDNzqnWa7MzsqOAzEg3sXZ0FXTjUIsij2hS/psy8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MaJmLHh73l7lNwukwY22xJ7TRPlLyjsKgI6pQH3BWlzUQYCqKS6z5xd9rP6LXTe4s
	 NDRy/Kdzc1QCkY8khTw91OdWz9E38XGfiyjbKlxz8VJ5GJ67k+MKXBnHvkIvbKOKaF
	 i2lEzuClX9n2A2rFbOC9dLOcP1RpTiq8BWLsqKx+XxtKkv1X5Sd0Oad+NJ+u/P21sq
	 49uho1bKuptVA/znJFwH0qo+mIZ2gDReW9eyAr9MNFyAomkqcRBhLZVmhNXE/GQ+qM
	 PP2dqtmReItxuqsTqV3WiwPpCl/jS0oqf12gHVKteZHYIFda+sKvbxAr/zQOX3Lx67
	 Bz2PZVJKjrvJw==
Subject: Re: [PATCH v8 net-next 4/9] net: dsa: netc: tie setup resources and
 reset to DSA setup/teardown
From: netdev-bot+sashiko@kernel.org
To: wei.fang@oss.nxp.com
Cc: xiaoning.wang@nxp.com, andrew@lunn.ch, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 richardcochran@gmail.com, linusw@kernel.org, linux@armlinux.org.uk,
 wei.fang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Nov 2026 05:05:35 +0000
Message-ID: <179541033517.3135.5228725617878780083@kernel.org>
In-Reply-To: <20261119030534.1892935-5-wei.fang@oss.nxp.com>
References: <20261119030534.1892935-5-wei.fang@oss.nxp.com>
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

- [Low] The patch changes how netc_switch_pci_init() handles a failed
  probe-time FLR, and the commit message does not say so.

--

net: dsa: netc: tie setup resources and reset to DSA setup/teardown

This commit adds netc_switch_reset() so that every netc_setup() after the
first one does a PCIe FLR and starts from a clean hardware state. It also
converts the setup-path devm_ allocations to explicit alloc and free.
These are released in netc_teardown() and on the error paths.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc_main.c
> index 1225ff8153d44..f724f95add36b 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c

[ ... ]

> @@ -1042,7 +1161,10 @@ static int netc_switch_pci_init(struct pci_dev *pdev)
>  	void __iomem *base;
>  	int err;
>  
> -	pcie_flr(pdev);
> +	err = pcie_flr(pdev);
> +	if (err)
> +		return dev_err_probe(dev, err, "FLR failed\n");
> +

[Severity: Low]
This hunk changes probe behaviour, and the commit message doesn't say so.
Before, the return value of pcie_flr() was ignored and probe always went
on. Now any FLR failure in netc_switch_pci_init() makes probe fail.

The commit message only says:

  The probe path already performs a FLR in netc_switch_pci_init(), so the
  first setup will skip the reset because the priv->configured flag is
  not set.

and later:

  The NETC switch does not support multi-switch yet, so there is no
  functional problem today. This only reworks the driver so that
  multi-switch can be added later without hitting these issues.

Both passages read as if the probe path is unchanged.

pcie_flr() can fail in three ways:

  - -ENOTTY when pci_dev_config_accessible() fails
  - an error from pci_dev_reset_iommu_prepare()
  - an error from pci_dev_wait() after PCIE_RESET_READY_POLL_MS times out

In any of these cases, a NETC switch that bound before this patch would
now fail to probe.

Failing probe is probably the right behaviour, since the driver relies on
a clean post-FLR state. Could the commit message mention this change, or
could it go into its own patch? The hunk is still the same at the end of
the series.

>  	err = pcim_enable_device(pdev);
>  	if (err)
>  		return dev_err_probe(dev, err, "Failed to enable device\n");

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119030534.1892935-1-wei.fang%40oss.nxp.com

