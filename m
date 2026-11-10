Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A43606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MXlo83g5;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Ub1Vz6pg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2tnTx+Y1fIgKicxn0toiFZfZX4oNt2OFXzdiYm7aVCA=; b=MXlo83g5UOgIrw
	/raW1Wocon2Q3RoDMy8nkw85+B+dJz5tczgpRwPiqQrBcjlPQ2MayYjYNlxooCrW1RbM/pxivraAa
	itpkvLIRgeLxAKsZF/u9LcH+SuO7plAKWhHbQq8mN/tT7pIhk3cihqBHyadzUC94SaQgnZdBV+tyi
	d6BvaNWQCX2nTMrNVzgrGvc/VRAvjj+QRi/T8XvScyV9FV20i7V49NDGhp+LeRa60j3uKVpATmzst
	f91snXIg+g5Z+GUKEqYlnYBPF2SpRoPcg9i8D7PoI6wkLNiQGvxaRno+y3oakeUVryCXR1MD2nGVh
	vAGWpameGr+hNn59uw6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhPX-0000000392t-2H6M;
	Tue, 10 Nov 2026 08:40:59 +0000
Received: from mail-m1085.netease.com ([154.81.10.85])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhPT-0000000390Y-3Vob;
	Tue, 10 Nov 2026 08:40:59 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5423d7e15;
	Tue, 10 Nov 2026 16:40:46 +0800 (GMT+08:00)
Message-ID: <7e053777-31ee-4127-af53-0820e852d375@rock-chips.com>
Date: Tue, 10 Nov 2026 16:40:44 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Simon Xue <xxm@rock-chips.com>, "finley.xiao" <finley.xiao@rock-chips.com>
Subject: Re: [PATCH 0/5] iommu/arm-smmu-v3: power domain and clock of the
 RK3588 PCIe SMMU
To: aiyengar1990@gmail.com, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Niklas Cassel <cassel@kernel.org>
References: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1c49deb4a03a4kunme182f695684554
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTxgYVk8dSRkfTh5OTx9ITFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Ub1Vz6pg4k6UDZWkqzesWeqUcDzAnME4g7qqjqvvetdVS/Ss/SwQXxpNyBNYMdrUu/8p/ufPvd5dmdHK4QSGnWfq3IjAecSeG3pCLk7ElJpWWcjAWfAbiW1rMa5gcgNzalcqvN8CF4cWUxh29xpvhKY4L5PyMUWV01V2VvR56Bg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=2tnTx+Y1fIgKicxn0toiFZfZX4oNt2OFXzdiYm7aVCA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_004057_246488_862DEF63 
X-CRM114-Status: GOOD (  26.25  )
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

Cc: Simon and Finley

在 2026/11/10 星期二 15:11, Arun Iyengar via B4 Relay 写道:
> The MMU-600 in front of the PCIe controllers of the Rockchip RK3588
> (mmu600_pcie) is enabled for every RK3588 board, but its node describes
> neither the power domain it lives in (RK3588_PD_PCIE) nor its clock
> (ACLK_MMU_PCIE). Both are held by any enabled PCIe controller, which is
> why nobody noticed: on a board that enables no PCIe controller in that
> domain (an Orange Pi 5 with its M.2 slot in SATA mode, or any RK3588
> board without PCIe), genpd powers the domain off and the clock framework
> gates the clock as unused after boot, while arm-smmu-v3 stays bound.
> At reboot, arm_smmu_device_shutdown() then writes CR0 and polls CR0ACK on
> the dead block, the interconnect stalls, "reboot: Restarting system" is
> never reached and the board only comes back ~90 s later when the
> watchdog fires.
> 
> Patches 1 and 2 allow power-domains and clocks in the arm,smmu-v3
> binding (arm,smmu.yaml already allows both for the earlier SMMUs).
> Patch 3 makes the driver get and enable the clocks of its firmware node
> before the first register access, for as long as it is bound; nodes
> without clocks (and ACPI/IORT systems) are unaffected. Patches 4 and 5
> describe the power domain and the clock in rk3588-base.dtsi. Both DT
> patches are needed: with the power domain alone the clock is still
> gated and the shutdown still hangs.
> 
> Related: Pranjal Shrivastava's "iommu/arm-smmu-v3: Add runtime PM
> support" v11 (2026-09-29, 20260929034510.2023173-1-praan@google.com,
> not merged) adds pm_domain-based runtime PM and resumes the SMMU around
> shutdown, but has no clock handling. This series is compatible with it:
> once it lands, the clocks from patch 3 should move into its runtime
> suspend/resume callbacks.
> 
> Tested on an Orange Pi 5 (RK3588S) with the M.2 slot in SATA mode and
> the root filesystem on the SATA SSD, where every reboot used to hang:
> three consecutive reboots printed "reboot: Restarting system" and the
> boot loader started 0.6 s later (previously ~89 s, from the watchdog);
> clk_summary shows aclk_mmu_pcie enabled with iommu@fc900000 as consumer
> and pm_genpd_summary shows PD_PCIE on; the SMMU probes as before and
> SATA keeps running at 6.0 Gbps without errors. With patch 4 alone
> (power domain, clock still gated) the reboot still hung at
> "arm-smmu-v3 fc900000.iommu: shutdown" on the serial console. Boards
> with PCIe enabled are already in the state these patches describe.
> 
> This series was developed with Claude (Anthropic) as a coding assistant:
> it wrote the code and the commit messages, and I reviewed and tested
> every change as described above.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Arun Iyengar (5):
>        dt-bindings: iommu: arm,smmu-v3: allow a power domain
>        dt-bindings: iommu: arm,smmu-v3: allow clocks
>        iommu/arm-smmu-v3: enable optional clocks
>        arm64: dts: rockchip: add the PCIe power domain to the RK3588 PCIe SMMU
>        arm64: dts: rockchip: add the clock of the RK3588 PCIe SMMU
> 
>   Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 10 ++++++++++
>   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi            |  2 ++
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c              |  7 +++++++
>   3 files changed, 19 insertions(+)
> ---
> base-commit: 2cf4be57b301ed2d7af82e70cff5dfd96894d8de
> change-id: 20261110-smmu-v3-pcie-pd-a2f127b81d8f
> 
> Best regards,
> --
> Arun Iyengar <aiyengar1990@gmail.com>
> 
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 


