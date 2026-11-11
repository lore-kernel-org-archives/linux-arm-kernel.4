Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05A7606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NE/1CqGU;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=bmsQEOzU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tMdgjX8bYijLnolxyoTC/q9AKx2reNTEQu7tjnwBrUk=; b=NE/1CqGUyR6nUQ
	wy/Z9AT5fuO6KHDglM1ot1jB1n5/VX+xKlxmn2xFD0L5o7TAzVQLB3Zd4zNNfEG7GoYZkz3Wd4R++
	tVhrPj7FoJstKwzMRxYQd7hO1t6PxOTn8qDXYKvaJmgB/w9EMdrdjM8Y/kBZXNOr2coRpJ1uxMhWL
	0pU8CPe6KLGEJNUtW66kNtSOzu1Q+oJEXZcB5iWxchGOmtFj13Rb64JMGFlErjBtx00FqCMV9zRti
	Q4iu5x3O2m5bwirAMLtTKe9vZMQqfFithwD4nD6PbH0mO/DzHCucLaLcxNO1cIP55xurRMA7BBuLz
	bPJq+YO9dZ+BEvBCcxbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Hm-000000067mj-1Jhl;
	Wed, 11 Nov 2026 09:06:30 +0000
Received: from mail-m83218.xmail.ntesmail.com ([156.224.83.218])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Hi-000000067lx-04Nf;
	Wed, 11 Nov 2026 09:06:28 +0000
Received: from [172.16.12.11] (gyproxy-mailtls2-entmail-virt217.gy.ntes [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 544afe262;
	Wed, 11 Nov 2026 17:06:11 +0800 (GMT+08:00)
Message-ID: <20e74412-e4d5-40bb-9565-249f029324a3@rock-chips.com>
Date: Wed, 11 Nov 2026 17:06:10 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 14/16] arm64: dts: rockchip: add NPU core domain
 clocks and resets to rk3576
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, ulfh@kernel.org,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, sidong.yang@furiosa.ai,
 u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com,
 shawn.lin@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net,
 leonard@lausen.nl, jeff.hugo@oss.qualcomm.com, rfoss@kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261108065917.135194-1-gahing@gahingwoo.com>
 <20261108065917.135194-15-gahing@gahingwoo.com>
From: Finley Xiao <finley.xiao@rock-chips.com>
In-Reply-To: <20261108065917.135194-15-gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1c9db8bbe03a8kunm0e16dd9f3b1c8b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTEIfVkIfTUtNGUMaSE0aS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=bmsQEOzUtCVRFu14odnqTs+fbRAN150MTPhXy26iN1vXi9lISKGIld9fP4bwih8bhnZXxhlw2jJ/5ikLqqUDLJ13t7MhEsYXsBxUc/UqdChMjyufdvzqRPn7EVrtcZBoUO8Twfo0YLGib0/0uTkv8pnEenLBwOO+hEL6oFopsTE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=tMdgjX8bYijLnolxyoTC/q9AKx2reNTEQu7tjnwBrUk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_010626_692734_5F8E2DE8 
X-CRM114-Status: GOOD (  15.22  )
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


在 2026/11/8 14:59, Jiaxing Hu 写道:
> The two NPU cores of the RK3576 share the CBUF and the DSU, so PD_NPU0
> and PD_NPU1 also need the three clocks that PD_NPUTOP already lists.
>
> Also add a BIU reset to each NPU power domain. The pmdomain driver cycles
> it when the domain powers on, so the bus interface works.
>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>   arch/arm64/boot/dts/rockchip/rk3576.dtsi | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> index 7828736bf9ac..508ed48b7bee 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1159,14 +1159,22 @@ power-domain@RK3576_PD_NPUTOP {
>   						power-domain@RK3576_PD_NPU0 {
>   							reg = <RK3576_PD_NPU0>;
>   							clocks = <&cru HCLK_RKNN_ROOT>,
> -								 <&cru ACLK_RKNN0>;
> +								 <&cru ACLK_RKNN0>,
> +								 <&cru CLK_RKNN_DSU0>,
> +								 <&cru ACLK_RKNN_CBUF>,
> +								 <&cru HCLK_RKNN_CBUF>;
   1. CLK_RKNN_DSU0 is the parent of ACLK_RKNN0/1 (see clk-rk3576.c).
   The common clock framework enables a clock's parents
   automatically, so DSU0 is already held during the switch window
   through the ACLK_RKNN0/1 entries the nodes already list; adding
   it explicitly is redundant.

   2. Per the design, a power domain switch only performs the idle
   request handshake and the QoS save/restore accesses, and those
   paths only require ACLK_RKNN0/1 and HCLK_RKNN_ROOT - exactly what
   the nodes already list. The CBUF clocks are not on the switch
   flow's access path, and the clk_ungate_mask support in the driver
   (0x1a/0x1c on PMU_CRU_GATEDIS_CON0 for npu0/npu1) keeps the shared
   paths alive during the switch window anyway - that is what the
   g_mask support was added for.
> +							resets = <&cru SRST_A_RKNN0_BIU>;
>   							pm_qos = <&qos_npu_m0>;
>   							#power-domain-cells = <0>;
>   						};
>   						power-domain@RK3576_PD_NPU1 {
>   							reg = <RK3576_PD_NPU1>;
>   							clocks = <&cru HCLK_RKNN_ROOT>,
> -								 <&cru ACLK_RKNN1>;
> +								 <&cru ACLK_RKNN1>,
> +								 <&cru CLK_RKNN_DSU0>,
> +								 <&cru ACLK_RKNN_CBUF>,
> +								 <&cru HCLK_RKNN_CBUF>;
> +							resets = <&cru SRST_A_RKNN1_BIU>;
>   							pm_qos = <&qos_npu_m1>;
>   							#power-domain-cells = <0>;
>   						};

-- 
Best regards,

底层平台中心 肖锋（Finley Xiao）
************************************************************************************
瑞芯微电子股份有限公司
Rockchip Electronics Co., Ltd.
福建省福州市铜盘路软件大道89号软件园A区21号楼 350003
No.21 Building, A District, Fuzhou Software Park, Fuzhou, Fujian 350003, P.R. China
Tel: 0591-83991906-8602 Mobile: 18506057603
************************************************************************************


