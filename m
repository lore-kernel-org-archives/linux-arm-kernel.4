Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C1D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w58E5oYW;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=RQNfh+VH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UHmDH4xQTawnQx2c62U2+yzNLbTZSXgZeWsOYcq/ojk=; b=w58E5oYWqhiUIC
	ZoziJm2Wh51aOh1guoW1j2goWU5WRIYNwxCV1WBjm7u8fZQs/4RiV+Y6tkDcEdoMA85mqwp/+hz7f
	yFs3IIoBGcazIMyiynjhhfnwQZnkKcjRR2egrWNpc7HnIJeOHsLkXFtGmvkkPUDqVajvmrzuiVrzC
	1wg3fcdTcaZvfzV8GgDUCnqlgHDwUAFFgOxtWomdGbT8njsJQ8/1tGCEGXUYgJVwBhPgKrvUc20zW
	elH/pNuH+KmOpkOOrHTgnzvtgAcizV6ujlMN8IGhga/oWWs1g+RNjjm2nX6/bsOIysnQEj7PW9NIL
	kvUB3GSFDX0j3+QRDaYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWBZ-000000043Yw-16c5;
	Mon, 23 Nov 2026 15:42:29 +0000
Received: from mail-m12883.netease.com ([103.209.128.83])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWBV-000000043TF-1ZXZ;
	Mon, 23 Nov 2026 15:42:28 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55b0ebc65;
	Mon, 23 Nov 2026 23:42:11 +0800 (GMT+08:00)
Message-ID: <fd14d6c1-d9a4-41f9-b1c0-96c3006d40a1@rock-chips.com>
Date: Mon, 23 Nov 2026 23:42:08 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 James Le Cuirot <chewi@gentoo.org>, stable@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: dw-rockchip: Clear stale link down interrupt before
 unmasking it
To: Niklas Cassel <cassel@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
References: <20261123121217.1107902-2-cassel@kernel.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261123121217.1107902-2-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2091269ec03a4kunm304402a287d7ac
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQxpDVhpJSh9OGEweSE5NH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=RQNfh+VHuuBsHD9f3Wr2F5htjBdHrAM2nyTGba3J3eDhvG54DTy+OlB1qfSRz3OiQ+6hvlroa6vZ5XIjWDbRd2Ixpk22eDa06ICTxenhMVyX4rrMVge3H1kZdmaM3wcr/+2iv4PlWEaUH/ncRZ+qoaBMgGuhcPsAx701rm256kk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=UHmDH4xQTawnQx2c62U2+yzNLbTZSXgZeWsOYcq/ojk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_074226_823048_8BFCD53F 
X-CRM114-Status: GOOD (  20.69  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

在 2026/11/23 星期一 20:12, Niklas Cassel 写道:
> PCIE_LINK_REQ_RST_NOT_INT is set by smlh_req_rst_not, which according to
> the RK3568 TRM "is asserted after power-on reset until first link up".
> The bit is thus already pending when the driver unmasks the interrupt
> after resetting the controller, both in probe and in .reset_root_port(),
> so the interrupt fires as soon as it is unmasked, even though the link
> is up. Since each recovery resets the controller again, this results in
> an endless loop, as seen on a Quartz64 Model B (RK3566):
> 
>    pcieport 0000:00:00.0: Recovering Root Port due to Link Down
>    pcieport 0000:00:00.0: Root Port has been reset
>    pcieport 0000:00:00.0: AER: device recovery successful
>    pcieport 0000:00:00.0: Recovering Root Port due to Link Down
> 
> Clear the bit before unmasking the interrupt, and in .reset_root_port()
> only unmask it once the link is back up, like in probe. Also keep the
> interrupt masked while .reset_root_port() resets the controller, so the
> link down caused by the reset itself is not reported.
> 

This looks right to me ,

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Fixes: b376b3ff9cb0 ("PCI: dw-rockchip: Implement .reset_root_port() and use for link down")
> Reported-by: James Le Cuirot <chewi@gentoo.org>
> Closes: https://lore.kernel.org/linux-pci/08cc96c5171fc969b074371692e6d95d46eba60b.camel@gentoo.org/
> Cc: stable@vger.kernel.org
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 24 +++++++++++++------
>   1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index ab2e26699409..2ef7ae97eb10 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -686,6 +686,18 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
>   	return IRQ_HANDLED;
>   }
>   
> +static void rockchip_pcie_rc_unmask_link_down(struct rockchip_pcie *rockchip)
> +{
> +	u32 val;
> +
> +	rockchip_pcie_writel_apb(rockchip, PCIE_LINK_REQ_RST_NOT_INT,
> +				 PCIE_CLIENT_INTR_STATUS_MISC);
> +
> +	/* unmask hot reset/link-down reset */
> +	val = FIELD_PREP_WM16(PCIE_LINK_REQ_RST_NOT_INT, 0);
> +	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
> +}
> +
>   static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>   				      struct rockchip_pcie *rockchip)
>   {
> @@ -739,9 +751,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>   		return ret;
>   	}
>   
> -	/* unmask hot reset/link-down reset */
> -	val = FIELD_PREP_WM16(PCIE_LINK_REQ_RST_NOT_INT, 0);
> -	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
> +	rockchip_pcie_rc_unmask_link_down(rockchip);
>   
>   	return ret;
>   }
> @@ -898,6 +908,9 @@ static int rockchip_pcie_rc_reset_root_port(struct pci_host_bridge *bridge,
>   	u32 val;
>   	int ret;
>   
> +	val = FIELD_PREP_WM16(PCIE_LINK_REQ_RST_NOT_INT, 1);
> +	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
> +
>   	dw_pcie_stop_link(pci);
>   	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
>   	rockchip_pcie_phy_deinit(rockchip);
> @@ -938,16 +951,13 @@ static int rockchip_pcie_rc_reset_root_port(struct pci_host_bridge *bridge,
>   		goto deinit_clk;
>   	}
>   
> -	/* unmask hot reset/link-down reset */
> -	val = FIELD_PREP_WM16(PCIE_LINK_REQ_RST_NOT_INT, 0);
> -	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
> -
>   	ret = dw_pcie_start_link(pci);
>   	if (ret)
>   		goto deinit_clk;
>   
>   	/* Ignore errors, the link may come up later */
>   	dw_pcie_wait_for_link(pci);
> +	rockchip_pcie_rc_unmask_link_down(rockchip);
>   	dev_dbg(dev, "Root Port reset completed\n");
>   	return ret;
>   
> 
> base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f


