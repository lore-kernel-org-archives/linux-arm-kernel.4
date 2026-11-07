Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17447606A336
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tgw34C9M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oM5eh/s+Pspuu1PUdwzvcQsHh+H6EmixK49kWJ77C90=; b=tgw34C9M93VH3I
	Mgd8Zrf6ctw/wNMvdHfY/H56LwsdvT85N4F/XzISfyU0uys+wwjteHxxGevzlDS1NFvKjqcNaPPQG
	q9nnAApUyvhxmK4uRoCLERog8/qSN3iUnB6k1zbzdzQThq84N1DFebW35E5BQS0HctFnYX4LzOXaN
	QUAE7hnIc9dSXlmprY25iKxFUm3DsqH6ensLg9PayTXsnR7z1sAYpQZIJsds9Ne8eqxKb1yCIKMKG
	RHjfZv1lHwZzHCLETZFkdVxNdgKHVQoKAJWpH4fTEVvCraP3jnSHv2Pc2vOOlA2vkKwXPs5u9HSZl
	Db0vrssYI4odrMo4gy4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjPK-0000000F08f-2rR7;
	Sat, 07 Nov 2026 16:36:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjPI-0000000F08T-3vsO;
	Sat, 07 Nov 2026 16:36:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EECEE4487D;
	Sat,  7 Nov 2026 16:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23661F008A2;
	Sat,  7 Nov 2026 16:36:41 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 9/9] PCI: dw-rockchip: Add system PM support
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com
In-Reply-To: <20261105-rockchip-pcie-system-suspend-v9-9-a2e55846649e@collabora.com>
References: <20261105-rockchip-pcie-system-suspend-v9-0-a2e55846649e@collabora.com>
 <20261105-rockchip-pcie-system-suspend-v9-9-a2e55846649e@collabora.com>
Date: Sat, 07 Nov 2026 22:06:40 +0530
Message-Id: <179406940043.65886.12399286680610211664.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2514;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=8365VW6X0RcfnFpRVJgWusqFqAVt4w96wEE77tPrWjE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq71OZbVmkYD9JMJROI0BZDcoNwWxrcAtLcQwbj
 0t0/rTYQ2GJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCau9TmQAKCRBVnxHm/pHO
 9bzuB/9qHp6yNX81ggnW8qnKGqz2yTTtqcKvB0xahmmLZBSKgA5YOzM1wRR1HdjHlfU3ijEyr1P
 U9rY0H5/Zh44dXLHoRPwFTBIU14FHK5reN6PV5U9wfXkMbmZ9QqBerln+1dw9JYUoMEaZG0xtqm
 4zeUJc5pY+dYx23nV9udXC1gLaPvJq1cAlNba0qIK7Hmh0K4zFvmDSDY73MUzlDfYQ2zE3wQJSp
 GuXDhmfyl/29yvSzvywp3smDG/YUyF729MzW3EI7GQrwe9MqJWSvkkT1N4oRlL5iWpikg+8QYpQ
 WYfMP+sCtFR/EG+8bj7/Bg4h7cNMeIu1Amku3NJyW6Dn9EPA
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-05 14:33 +0100, Sebastian Reichel wrote:
> Add system PM support for Rockchip PCIe Designware Controllers.
> 
> I've tested this on the Rockchip RK3576 EVB1, the Radxa ROCK 4D
> and the ArmSom Sige5 boards.
> 
> While I haven't experienced any issues, most of my tests have been done
> without any devices attached (i.e. default board without any extras), so
> there _might_ still be some problems. As system suspend does not work at
> all right now, I think it makes sense to get at least the basic
> configurations working as soon as possible as it will allow us to catch
> regressions by enabling system suspend in CI systems like KernelCI.
> 
> Co-developed-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 102 ++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index a603475d4450..39faefaf568d 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -124,6 +124,7 @@ struct rockchip_pcie {
>  	struct gpio_desc *rst_gpio;
>  	struct regulator *vpcie3v3;
>  	struct irq_domain *irq_domain;
> +	u32 intx;
>  	const struct rockchip_pcie_of_data *data;
>  	bool supports_clkreq;
>  	struct delayed_work trace_work;
> @@ -807,6 +808,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>  
>  	pp = &rockchip->pci.pp;
>  	pp->ops = &rockchip_pcie_host_ops;
> +	pp->suspend_poweroff = true;
>  
>  	ret = dw_pcie_host_init(pp);
>  	if (ret) {
> @@ -1030,6 +1032,100 @@ static int rockchip_pcie_rc_reset_root_port(struct pci_host_bridge *bridge,
>  	return ret;
>  }
>  
> +static int rockchip_pcie_suspend(struct device *dev)
> +{
> +	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
> +	struct dw_pcie *pci = &rockchip->pci;
> +	int ret;
> +
> +	if (rockchip->data->mode == DW_PCIE_EP_TYPE)
> +		return 0;
> +
> +	if (pci->suspended)
> +		return 0;

This check looks wrong. 'suspended' flag is only set at the end of
dw_pcie_suspend_noirq() and is used as an indication to glue suspend callbacks
to turn off the resources or not. here is no way this can be set at the start
of tne glue suspend callback.

I'll drop this check while applying.

- Mani



