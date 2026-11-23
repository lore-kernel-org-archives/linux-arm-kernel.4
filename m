Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B6F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 22:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wuE+vSO/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=pl3VJraO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uG+Qr7dBqxde6e6CrYVj5rbF/dxo3B1Cf2kSUU+32ss=; b=wuE+vSO/5OnFNGt6+YZpWrhfOS
	zBxzYL/ecLMSqzSQXhY974rbLoFGEMygquFPyY80/CUzrKJtBu7n2PLJT4tQQKS6K5QHW+HrxwVO5
	2A0N4DU+KgrYjvUSSXijhj90jXGGSH3WXZyBnqZFsgONDeBaOXIyseKxbqT7g1mUdHWOY93c7xHF9
	fvtzk1qaCO5JhN8N4IMXeXj1DLOnxq0+EZ1tfeLPaMdaS3ge0OdKlpFScFJEKFiwoy5pSXIkTt+jm
	4+3CbbITHH1k1F4TBi3Mnwqk9xYemdi2fdMclWpnYgqDPWSQlSzCsOkquT0vGrHDUxEMPXur1ckGl
	oEon0vmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcSw-000000054XN-054N;
	Mon, 23 Nov 2026 22:24:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcSs-000000054W1-2pWi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 22:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uG+Qr7dBqxde6e6CrYVj5rbF/dxo3B1Cf2kSUU+32ss=; b=pl3VJraOztDbR20nPZg4I0YChI
	59cIrO/hcjjwl/r7vM+XBpMfBQvC+iF0oWjT4NFe+R1lQwDWbkQT7snBzSagcicijS6GKYu96p55p
	ss9tkZ6jEJMaxYGupCefwlYHmLPpz8OTtimgCZJxEoDSckgaP/VfT3VWCp+p6D7B8V5w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVcSh-000udF-WB; Mon, 23 Nov 2026 23:24:36 +0100
Date: Mon, 23 Nov 2026 23:24:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: filipp.dunsky@gmail.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 4/5] net: cortina: Add CS7542 CPU network
 datapath
Message-ID: <560efd8b-44a6-4b3f-9f88-d1a891b4f253@lunn.ch>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-4-fdb5e8c2d508@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-b4-cs7542-ethernet-v1-4-fdb5e8c2d508@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_142447_962516_1DA99268 
X-CRM114-Status: GOOD (  15.54  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> +static bool internal_buf;
> +module_param(internal_buf, bool, 0444);
> +static int napi_budget = 16;
> +module_param(napi_budget, int, 0444);

No module parameters.

Also, this napi budget is lower than typical. Why?

> +
> +static inline u32 ni_rd(struct cs_ne *ne, u32 off)
> +{
> +	return readl(ne->ni + off);
> +}

No inline functions in a .c file. Let the compiler decide.

> +static int cs_ne_open(struct net_device *ndev)
> +{
> +	struct cs_ne_port *port = netdev_priv(ndev);
> +	struct cs_ne *ne = port->ne;
> +	unsigned long flags;
> +	int ret;
> +
> +	/* RTNL also protects the final probe activation. */
> +	if (ne->rx_stopping)
> +		return -ENODEV;
> +	if (READ_ONCE(ne->txq.fault))
> +		return -EIO;
> +
> +	ret = phylink_of_phy_connect(port->phylink, port->np, 0);
> +	if (ret) {
> +		netdev_err(ndev, "phylink connect failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	port->rd = ni_rd(ne, NI_CPUXRAM_CPU_CFG_RX(port->id)) & NI_XRAM_PTR_MASK;
> +	napi_enable(&port->napi);
> +	ret = request_irq(port->irq, cs_ne_rx_irq, 0, ndev->name, port);
> +	if (ret) {
> +		napi_disable(&port->napi);
> +		phylink_disconnect_phy(port->phylink);
> +		return ret;
> +	}
> +	spin_lock_bh(&ne->txq.lock);
> +	if (ne->txq.fault) {
> +		spin_unlock_bh(&ne->txq.lock);
> +		free_irq(port->irq, port);
> +		napi_disable(&port->napi);
> +		phylink_disconnect_phy(port->phylink);
> +		return -EIO;

Please put cleanup at the end and use goto statements. That is the
general pattern in the kernel when there is more than one thing to
cleanup.

> +	}
> +	WRITE_ONCE(port->opened, true);
> +	ne->txq.stopping = false;

I've not looked at the details, but such flags are often not
needed. They generally indicate there is not a full understanding of
the driver API. Please review them, and see if they are really needed.

    Andrew

