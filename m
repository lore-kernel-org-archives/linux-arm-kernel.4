Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EACE606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Svg8MDJk;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ZXmX7RJK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GkcCvQ0Cm1Qyej4YW35+cOV6C99poT4s5onAksaynHE=; b=Svg8MDJk3Ogrq6
	BcVmLHOBtmNRiqDdbiI2gKyvo+a+gPTgWLeU9ArhkBc3JUdoyXmp9wpzWLe9oD8H5XLT7eGx/XXea
	5Br1CjHxIo61xzyrJThCmw1BaNovGJxZYhCz43w43FLfUIzNcG5AZh5nVmDrkie6b1wBBMADSxt+1
	AuT5H2dvv3fBgcxq+9DiPbk/nwwOftaCzr2ACb/dMWRfleoMBIeMkXn5LCgBuYYy3Zuz/WT++uaSV
	Nu04jKbRQDjxW8SQjZGmaYyqVycCvO9k52YGbXpFSbdiozVC97gKbuQa0Cn5iCImfGf08WhqY26RO
	WrdoTXd6G6V54gpbwJxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2Db-00000005pSJ-3vet;
	Wed, 11 Nov 2026 06:54:03 +0000
Received: from mail-m6050.netease.com ([210.79.60.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2DY-00000005pQl-2xDj;
	Wed, 11 Nov 2026 06:54:02 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 544548e9e;
	Wed, 11 Nov 2026 14:53:54 +0800 (GMT+08:00)
Message-ID: <21a44f7b-e33c-4feb-a6ba-6d08bc796606@rock-chips.com>
Date: Wed, 11 Nov 2026 14:53:52 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 "finley.xiao" <finley.xiao@rock-chips.com>
Subject: Re: [PATCH 4/5] arm64: dts: rockchip: add the PCIe power domain to
 the RK3588 PCIe SMMU
To: aiyengar1990@gmail.com, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Niklas Cassel <cassel@kernel.org>
References: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
 <20261110-smmu-v3-pcie-pd-v1-4-628819ca44b9@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261110-smmu-v3-pcie-pd-v1-4-628819ca44b9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1c962725603a4kunmb3379dd7965f5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCT0pJVh0aGUJMSE5CQk5OHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ZXmX7RJKYwKpIGWxpcLGSdUNUfljyXvYiUtUbnsd6Phb8U97ZPSlESLvBbJzV8hWLtqOLLINOhn9P6waG42+wYWblD1kQZXqhbC50WlpggnfPocO8Xuj/NTbo3b2d0qqYsy7f9rFLq9MUTPEl7lBAdF+V7UrJIHQskw2aZytPko=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=GkcCvQ0Cm1Qyej4YW35+cOV6C99poT4s5onAksaynHE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_225401_371683_A5171BA5 
X-CRM114-Status: GOOD (  17.29  )
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

Hi Arun

在 2026/11/10 星期二 15:11, Arun Iyengar via B4 Relay 写道:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> The MMU-600 for the PCIe controllers (mmu600_pcie) is enabled for every
> RK3588 board, but its node does not describe that it lives in
> RK3588_PD_PCIE. It only works today because TF-A leaves the domain on at
> boot and, on most boards, an enabled PCIe controller holds it on later.
> 
> On a board that disables all PCIe controllers using that domain (the
> Orange Pi 5 with its M.2 slot in SATA mode is one), genpd powers
> PD_PCIE off as unused after boot while arm-smmu-v3 is still bound. Then
> at reboot arm_smmu_device_shutdown() writes CR0 and polls CR0ACK on the
> unpowered block, which stalls the bus: the kernel never reaches
> "reboot: Restarting system" and the board only comes back once the
> watchdog fires.
> 
> Describe the power domain, so genpd keeps it on for as long as the SMMU
> is bound.
> 
> Fixes: da92d3dfc871 ("arm64: dts: rockchip: enable the mmu600_pcie IOMMU on the rk3588 SoC")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index aa69fd3793fd..bcd342c025c9 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -560,6 +560,7 @@ mmu600_pcie: iommu@fc900000 {
>   			     <GIC_SPI 367 IRQ_TYPE_EDGE_RISING 0>;
>   		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
>   		#iommu-cells = <1>;
> +		power-domains = <&power RK3588_PD_PCIE>;

As RK3588 TRM Table 7.1 desribes, both of mmu600_pcie and
mmu600_php live under PD_PHP.

>   	};
>   
>   	mmu600_php: iommu@fcb00000 {
> 


