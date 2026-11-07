Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FF7606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kyP+cKzi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zs5FfJViCFg/tM0lVAlPjBKrGvPI56RE48ujfmXXqM0=; b=kyP+cKziZzq1K5
	EUJpYYHocCpF4Uz2z4JBeqfn8jCYxLX8dxAENsF6Fuhl0QJkfzIo2viD1W54Yjw3eupNJr5gjtuLd
	4NWB5DzDDt9s8Dv7dy3u73KMLa018NoL+2fCr7WGC1SbJuKIhrd7ekVZlUUrEk+f9hiuIQJo6aW8o
	XfFx47sHPysJEYZQ3Cq/YwzM6i1MY8snC/7b6IXM5HrKq8XkJN7LnNAcenZqPf2vVa8lgeq4h26KK
	8ZEc9z4/i+5pjZbBfJDwGZMSdsutY8zllhdOxLozKb/J6fQlCKe0Tq3CLxyfzUUTVYmPoEgLk278t
	kS9yqLtacAdodZsazJhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjLe-0000000Ezd2-0pQT;
	Sat, 07 Nov 2026 16:32:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjLc-0000000Ezcr-48b0;
	Sat, 07 Nov 2026 16:32:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 764014377C;
	Sat,  7 Nov 2026 16:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4345F1F0089F;
	Sat,  7 Nov 2026 16:32:55 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 7/9] PCI: dw-rockchip: Add pme_turn_off support
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com
In-Reply-To: <f047dcbe-efa2-4c60-8436-6d001c936467@rock-chips.com>
References: <20261105-rockchip-pcie-system-suspend-v8-0-0434b4f373bc@collabora.com>
 <20261105-rockchip-pcie-system-suspend-v8-7-0434b4f373bc@collabora.com>
 <f047dcbe-efa2-4c60-8436-6d001c936467@rock-chips.com>
Date: Sat, 07 Nov 2026 22:02:49 +0530
Message-Id: <179406916971.65886.13520937092317191699.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4382;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=S1IECqqIrwBd3k3Fr5mAm2lihZFlAHgQLQIBZRJ7QRA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq71KyRfVqWX3CtO7dsMROvebs50h6vcEg5IdS2
 W1rMFiBT2mJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCau9SsgAKCRBVnxHm/pHO
 9UrwB/4+I1ES4Zd9C/2fFs3eQQeARV9e13XPiWzamhcfg0B8YXrs08INU7QM1wwo2fAwGiM90Yt
 OyWU7QYBHJrwCenz4vxvgYe7Gor3kwPrs88ger4KB29Uu+KzyT+nRIaZqNCTtoCnyUTjHLqNzYQ
 M51/zfs8KLMv7HhcsWImH6auTs9cxZWFgH1ujGtPgWD+KpkzQfeMd8OWE38L/quU1r4mdSMaLcM
 W46aHmHXsGLSXvwHngIPXkmXsPGRUcARMPfguJzNLp48Ro5E6k+LyovvAOv0inS6HT3eMu6FbF/
 upDXISlYDN8EU3NYI+jJ8SRHzhhOWEweNZTXb6RcvyB8c99h
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

On 2026-11-05 08:51 +0800, Shawn Lin wrote:
> 在 2026/11/05 星期四 7:47, Sebastian Reichel 写道:
> > Prepare Rockchip PCIe controller for system suspend support by
> > adding the PME turn off operation.
> > 
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 47 +++++++++++++++++++++++++++
> >   1 file changed, 47 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > index 0e26abc50920..7933c50df340 100644
> > --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > @@ -47,6 +47,10 @@
> >   #define  PCIE_CLIENT_ENABLE_LTSSM	FIELD_PREP_WM16(BIT(2), 1)
> >   #define  PCIE_CLIENT_DISABLE_LTSSM	FIELD_PREP_WM16(BIT(2), 0)
> >   
> > +/* Interrupt Status Register for Received Messages */
> > +#define PCIE_CLIENT_INTR_STATUS_MSG_RX	0x04
> > +#define  PME_TO_ACK			BIT(9)
> > +
> >   /* Interrupt Status Register Related to Legacy Interrupt */
> >   #define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
> >   
> > @@ -71,6 +75,11 @@
> >   #define  PCIE_CLKREQ_READY		FIELD_PREP_WM16(BIT(0), 1)
> >   #define  PCIE_CLKREQ_NOT_READY		FIELD_PREP_WM16(BIT(0), 0)
> >   #define  PCIE_CLKREQ_PULL_DOWN		FIELD_PREP_WM16(GENMASK(13, 12), 1)
> > +#define  PME_READY_ENTER_L23		BIT(3)
> > +
> > +/* Message Request Register */
> > +#define PCIE_CLIENT_MSG_GEN		0x34
> > +#define  PME_TURN_OFF			FIELD_PREP_WM16(BIT(4), 1)
> >   
> >   /* RASDES TBA information */
> >   #define PCIE_CLIENT_CDM_RASDES_TBA_INFO_CMN	0x154
> > @@ -439,8 +448,46 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
> >   	return 0;
> >   }
> >   
> > +static void rockchip_pcie_pme_turn_off(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
> > +	struct device *dev = rockchip->pci.dev;
> > +	u32 status;
> > +	int ret;
> > +
> > +	/* 1. Broadcast PME_Turn_Off Message, bit 4 self-clear once done */
> > +	rockchip_pcie_writel_apb(rockchip, PME_TURN_OFF, PCIE_CLIENT_MSG_GEN);
> > +	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_MSG_GEN,
> > +				 status, !(status & BIT(4)), PCIE_PME_TO_L2_TIMEOUT_US / 10,
> > +				 PCIE_PME_TO_L2_TIMEOUT_US);
> > +	if (ret) {
> > +		dev_warn(dev, "Failed to send PME_Turn_Off\n");
> > +		return;
> > +	}
> > +
> > +	/* 2. Wait for PME_TO_Ack, bit 9 will be set once received */
> > +	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_INTR_STATUS_MSG_RX,
> > +				 status, status & BIT(9), PCIE_PME_TO_L2_TIMEOUT_US / 10,
> > +				 PCIE_PME_TO_L2_TIMEOUT_US);
> > +	if (ret) {
> > +		dev_warn(dev, "Failed to receive PME_TO_Ack\n");
> > +		return;
> > +	}
> > +
> > +	/* 3. Clear PME_TO_Ack and Wait for ready to enter L23 message */
> > +	rockchip_pcie_writel_apb(rockchip, PME_TO_ACK, PCIE_CLIENT_INTR_STATUS_MSG_RX);
> > +	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_POWER_CON,
> > +				 status, status & PME_READY_ENTER_L23,
> > +				 PCIE_PME_TO_L2_TIMEOUT_US / 10,
> > +				 PCIE_PME_TO_L2_TIMEOUT_US);
> > +	if (ret)
> > +		dev_err(dev, "Failed to get ready to enter L23 message\n");
> > +}
> 
> 
> This is a question for the DWC core: should we change
> dw_pcie_host_ops::pme_turn_off() to return a value instead of silently
> ignoring a failure?
> 
> Looking at pcie-designware-host.c, we have:
> 
> if (pci->pp.ops->pme_turn_off) {
>      pci->pp.ops->pme_turn_off(&pci->pp);
> } else {
>      ret = dw_pcie_pme_turn_off(pci);
>      if (ret)
>          return ret;
> }
> 
> The handling feels asymmetric. If ->pme_turn_off fails, shouldn't we 
> abort dw_pcie_suspend_noirq as well?
> 

Sure. The initial callback implementations were just broadcasing PME_Turn_off
message and didn't check for PME_To_Ack. So they ended up being void. But for
PME_To_Ack and L2/L3 Ready timeouts, we should definitely return failure and
abort suspend as the link may not enter L2/L3.

> Other than that, this patch looks good to me in current shape,
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
> 
> We can further discuss the callback's return value issue on top.
> 

It can be done as a separate series.

- Mani



