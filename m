Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCCA606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nvaac+On;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ldprS0uN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yZ3I9vRuX9ylJnvAv8Fd/DK7PqgzivRoTz54b66hM4s=; b=nvaac+OnMzIYjVurJmEMmDqeuJ
	j1jlrxl5sPdnVAu6ql4zLu0o/eVr5k+j338zQ255l+5rqWgZYY66yM+3fMhTn4gAbSD98nFC089XK
	IMvXMtyxv1+lPWfFlK3I0Wlf8XTROVflfVgG2dmgVu1GA4lG0GKAP7Ipcg6762PlMCNjwMhnHlKhN
	q08BNi89d0grIpY/cQ0ZlFSvwajbqIwqjs6VJMpf6uRy40blZ36Y2vi6tfV0SKvMlHn/RLNmMQIdf
	g8OlRT6lv7Ey9uKLhQPDHoKOCuwpO1bsbC0lKZs3CLVmmfU0QSJiqt2wqh4pInHm/SGzZQ/lX5Yyn
	2tz0pCKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN6W-00000006bir-0pvZ;
	Tue, 17 Nov 2026 17:36:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN5Z-00000006awx-0ERO;
	Tue, 17 Nov 2026 17:35:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CA4EF45F96;
	Tue, 17 Nov 2026 17:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437971F00923;
	Tue, 17 Nov 2026 17:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936924;
	bh=yZ3I9vRuX9ylJnvAv8Fd/DK7PqgzivRoTz54b66hM4s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ldprS0uNwFt+H1U3be8E2gOLAGnw8BZl5s5GVpiNWByV+Ly/0OSD22JIeeAxEMp/g
	 vajUIU0EUhPQ6Grik6d7HoZo4QrEZCG/qbdNGA2DeRmLimaYUz3G22jERtSf0rlEsJ
	 XdkI0kkGlwRriDnm0fVfu4H+JZKAVemm7juPMN6KScB8unOvuReiocyYvXxlLxcjrI
	 jGnyjhxSnD1caR+wZ8oWP9VduidgsFBMr6HkihNTcuMyt0h8DBOB+F4f0IMukeKkOM
	 aNCUusgK+8Is7lqQdWI9scgMjEIbl0y4zrdB5uLRljVPhKN+GZHQu7GSdlgYDZS3NS
	 pDxvT9nAn7D5Q==
Subject: Re: [PATCH 9/9] arm64: dts: rockchip: Enable the RK3588 PHP SMMU
From: netdev-bot+sashiko@kernel.org
To: aiyengar1990@gmail.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, david.wu@rock-chips.com,
 dlemoal@kernel.org, cassel@kernel.org, fancer.lancer@gmail.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, praan@google.com,
 will@kernel.org, robin.murphy@arm.com, iommu@lists.linux.dev,
 shawn.lin@rock-chips.com, sebastian.reichel@collabora.com
Date: Tue, 17 Nov 2026 17:35:22 +0000
Message-ID: <179493692280.3136.14096741635369747694@kernel.org>
In-Reply-To: <20261113-mmu600-php-v1-9-231196049a3b@gmail.com>
References: <20261113-mmu600-php-v1-9-231196049a3b@gmail.com>
X-sashiko-severity: Critical
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 1 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Critical] This patch enables mmu600_php on every RK3588 board, but the
  kernel cannot restore the SMMU after deep suspend.
- [High] This patch's commit message says "the SMMU has its clock", and
  the earlier series commit "arm64: dts: rockchip: Add the clock and…
- [Low] The mmu600_php node that this patch enables has `clocks = <&cru
  ACLK_MMU_PHP>;` and `resets = <&cru SRST_A_MMU_PHP>;`…

--

arm64: dts: rockchip: Enable the RK3588 PHP SMMU

This commit removes status = "disabled" from the mmu600_php node in
rk3588-base.dtsi. That enables the arm-smmu-v3 instance in front of the
PHP masters (GMAC, SATA, USB3 host2) on all RK3588 boards. The commit
message notes that PD_PHP loses power in deep suspend and that arm-smmu-v3
system sleep support is needed.

Link: https://lore.kernel.org/r/20260929034510.2023173-1-praan@google.com

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index cb0a39f637887..0c3d59a391826 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -574,7 +574,6 @@ mmu600_php: iommu@fcb00000 {
>  		clocks = <&cru ACLK_MMU_PHP>;
>  		resets = <&cru SRST_A_MMU_PHP>;

[Severity: High]

The commit message says "the SMMU has its clock". Does anything actually
enable ACLK_MMU_PHP for the SMMU?

The arm-smmu-v3 driver has no clk_get()/clk_prepare_enable(), reset_control
or pm_runtime handling. The node has no power-domains, so genpd pm_clk
does not apply. The platform core does not enable DT clocks by itself
either.

In drivers/clk/rockchip/clk-rk3588.c the clock is a plain gate with no
flags:

	GATE(ACLK_MMU_PHP, "aclk_mmu_php", "aclk_php_root", 0,
			RK3588_CLKGATE_CON(34), 8, GFLAGS),

Its only enable references come from its children ACLK_GMAC0/1,
ACLK_SATA0/1/2 and ACLK_USB3OTG2. Two things can turn it off:

- clk_disable_unused at late_initcall_sync, when no master is bound
  (modular drivers, or a board that enables only some PHP masters).
- The last master disabling its ACLK on runtime suspend or remove.

The SMMU driver still touches the hardware after that. It issues CMDQ
TLBI/CFGI plus CMD_SYNC on unmap and on flush-queue timeouts, it runs the
eventq/gerror handlers, and at reboot it runs:

arm_smmu_device_shutdown()
    arm_smmu_disable_action()

That usually happens after the consumer masters have already shut down.

Could this cause CMD_SYNC timeouts or a stalled bus access? The "Add the
PHP GRF clock on RK3588" commit in this series describes a similar hang
for pclk_php_root.

The earlier commit "arm64: dts: rockchip: Add the clock and reset of the
RK3588 PHP SMMU" says the clock was added "so the SMMU keeps its clock
while its masters are idle". Does that need clock handling in the driver
(plus a binding update), or the gate marked as critical or
ignore-unused, rather than only the DT property?

[Severity: Low]

Will this node pass dtbs_check now that it is enabled? The binding in
Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml does not define
clocks, resets or power-domains, and it has:

additionalProperties: false

No patch in the series updates this binding, although the dwmac, ahci and
grf bindings are updated.

Also, the "Add the clock and reset..." commit says the reset is added "as
for the PCIe SMMU". The sibling mmu600_pcie node, which uses the same
compatible, has neither clocks nor resets.

>  		#iommu-cells = <1>;
> -		status = "disabled";

[Severity: Critical]

The commit message says:

  PD_PHP is powered off in deep suspend and the SMMU resumes from reset
  in bypass, so this needs arm-smmu-v3 system sleep support [1].

Is that support in the tree this patch applies to? No earlier patch in
the series seems to add it.

In drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c, arm_smmu_driver has no
.pm:

static struct platform_driver arm_smmu_driver = {
	.driver	= { ... },
	.probe	= arm_smmu_device_probe,
	.remove = arm_smmu_device_remove,
	.shutdown = arm_smmu_device_shutdown,
};

The only code that programs the stream table, the queues and SMMUEN is
arm_smmu_device_reset(), and only arm_smmu_device_probe() calls it. The
syscore op added to drivers/soc/rockchip/grf.c earlier in the series
restores only the PHP GRF StreamID registers.

With this node enabled, the PHP masters get IOMMU DMA domains and their
drivers program IOVAs. Those masters are usb_host2_xhci, gmac1, sata0 and
sata2, plus gmac0 and sata1 from rk3588-extra.dtsi.

After a deep suspend cycle, does the SMMU stay in its reset bypass state
while stmmac, ahci and xhci keep using descriptor rings and buffers at
their old IOVAs?

If so, the IOVAs would be treated as physical addresses. On gmac RX the
frame contents come from the network and would be written to whatever RAM
or MMIO sits at that address. TX and SATA/USB reads could leak arbitrary
memory.

PD_PHP is also defined only in drivers/pmdomain/rockchip/pm-domains.c and
the dt-bindings header. No DTS references it, and mmu600_php has no
power-domains property, so genpd cannot order an SMMU save and restore
either.

Before this patch the node was disabled and these masters used direct
DMA, so suspend did not hit this problem. Should enabling this node wait
until the arm-smmu-v3 sleep support in [1] is merged?

>  	};

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-mmu600-php-v1-0-231196049a3b%40gmail.com

