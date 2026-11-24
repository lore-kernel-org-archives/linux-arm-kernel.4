Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97540606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OZYINb7A;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VclK5N1A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tZicJN8WSvhii4IUoQLB2IJqpXlbaB7rrJrQ3BqZbkM=; b=OZYINb7AGI3KfYtNt1kaCd/W9b
	fClVIvoAs/tgBDn2o9yP60IYbf8tZQIr8PvTOcpIpuJWeF2HcuBeNbCAyB4ve95qM4x7SdvvBQOqC
	ha2+sPrrMLcFJ65Ico2bumZJJTCHbpdvWVK8zBao9nEVTpVekq8De5jihGkLgpipiqLrzE4gM7TKl
	j1KgyCbLy3Hkn4jq9c5Wa4rm0YgmY2qfCIptcxPlVuoaGttFlS/oUj9nQTrn0sFQNfCY0xtLlKwhj
	p6I53NwcdWdYipKxCeGkZdHhtHfnenJ44KLuLM4i/0VxMzTAyrr7ci31VOidScK75FonRbUwUgrHF
	IEAaXIng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu4U-00000007J04-4BP6;
	Tue, 24 Nov 2026 17:12:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu4T-00000007Iz8-1zaQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:12:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 98B8B60E8E;
	Tue, 24 Nov 2026 17:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227561F000D0;
	Tue, 24 Nov 2026 17:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540363;
	bh=tZicJN8WSvhii4IUoQLB2IJqpXlbaB7rrJrQ3BqZbkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VclK5N1AUX7DTqF7jzIbm3VG+FBxriINu/7v1LZqHYNcEMYH47kgVIPWLcbqIWogf
	 lO87PK3T2sE+iAVfg7veEHPYvXFsaOCrBTQb23rAabjZHGKjQ06Zosg8SDc0K3GVUU
	 ej7R/5NkQNghALpIthFdi0fjfPI9Bv1i6oxF4hrVNIPOQZ6klNLcF+TlFTf8p9JdF3
	 AzFANgjSahL56QC+qe3V+WuPeB/X+D4Coc08sz1YlbGtP2zbH0ZpEPCK0BBPNPeejO
	 W+JYvpjje4cZEY7rFoSDFOtzWo+qwYQZhW5ex4McaEk+5E+jWaFgrgdJIHzemBxIG/
	 a4vgwlLsHOZ8w==
Date: Tue, 24 Nov 2026 12:12:38 -0500
From: Brian Masney <masneyb@kernel.org>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: cs7542: Add global PCIe controls and network
 engine reset
Message-ID: <awXFhjXhZ-e_QM_R@x1g10>
References: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
 <20261124-b4-cs7542-global-controls-v1-2-12548785df2c@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124-b4-cs7542-global-controls-v1-2-12548785df2c@gmail.com>
User-Agent: Mutt/2.4.3 (2026-10-09)
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

Hi Fil,

On Tue, Nov 24, 2026 at 12:50:59AM +0300, Fil Dunsky wrote:
> Register PCIe gates and controller resets through the early global
> provider. Add the network engine composite reset using the same syscon
> regmap, with the existing 1 us/1000 us readback polling and partial-domain
> status error from the posted NE reset driver. Keep the PCIe reset pulse
> delays and all provider-registration failure cleanup. NE pulse reset
> remains unsupported; the Ethernet consumer needs assert/deassert/status.
> 
> Both independent consumers can use this common provider without a
> PCIe-host dependency or a resource-less network reset child.
> 
> AI assistance: Codex prepared this draft from the posted CS7542 series.
> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>  drivers/clk/Kconfig      |   7 +-
>  drivers/clk/clk-cs7542.c | 211 ++++++++++++++++++++++++++++++++++++++++++-----
>  2 files changed, 195 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 47b5265fe..cba07bed3 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -59,13 +59,16 @@ config LMK04832
>  	  Low-Noise JESD204B Compliant Clock Jitter Cleaner With Dual Loop PLLs
>  
>  config COMMON_CLK_CS7542
> -	bool "Cortina Systems CS7542 strap-selected clocks"
> +	bool "Cortina Systems CS7542 global clocks and resets"
>  	depends on OF && HAS_IOMEM
>  	select MFD_SYSCON
> +	select RESET_CONTROLLER
>  	help
>  	  Read the boot straps of the CS7542 global control block to provide
>  	  its APB, CPU and AXI clocks. This driver does not change PLLs or
> -	  dividers. It is built in because the APB clock is needed by timers.
> +	  dividers. It also provides the three PCIe clock gates and resets,
> +	  and the exclusive network engine and DMA-LSO/SSP reset domain.
> +	  It is built in because the APB clock is needed by timers.
>  
>  config COMMON_CLK_APPLE_NCO
>  	tristate "Clock driver for Apple SoC NCOs"
> diff --git a/drivers/clk/clk-cs7542.c b/drivers/clk/clk-cs7542.c
> index 4e6c1e98a..17b7109a9 100644
> --- a/drivers/clk/clk-cs7542.c
> +++ b/drivers/clk/clk-cs7542.c
> @@ -1,24 +1,29 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/* Cortina Systems CS7542 strap-selected clocks */
> +/* Cortina Systems CS7542 global clocks and reset domains. */
>  
>  #include <linux/bitfield.h>
>  #include <linux/clk-provider.h>
> +#include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/printk.h>
>  #include <linux/regmap.h>
> +#include <linux/reset-controller.h>
>  #include <linux/slab.h>
>  
>  #include <dt-bindings/clock/cortina,cs7542-clock.h>
> +#include <dt-bindings/reset/cortina,cs7542-reset.h>
>  
>  #define CS7542_GLOBAL_STRAP	0x0c
>  #define CS7542_STRAP_SPEED	GENMASK(3, 1)
> -#define CS7542_NUM_CLKS		3
> +#define CS7542_NUM_FIXED_CLKS	3
> +#define CS7542_NUM_CLKS		6
>  
>  /* Rates from the GPL vendor kernel's get_platform_clk(). */
> -static const unsigned long cs7542_rates[][CS7542_NUM_CLKS] = {
> +static const unsigned long cs7542_rates[][CS7542_NUM_FIXED_CLKS] = {
>  	/* APB, CPU, AXI */
>  	{ 100000000, 400000000, 133333333 },
>  	{ 100000000, 600000000, 150000000 },
> @@ -33,14 +38,142 @@ static const char * const cs7542_clock_names[] = {
>  	[CS7542_CLK_APB] = "cs7542-apb",
>  	[CS7542_CLK_CPU] = "cs7542-cpu",
>  	[CS7542_CLK_AXI] = "cs7542-axi",
> +	[CS7542_CLK_PCIE0] = "cs7542-pcie0",
> +	[CS7542_CLK_PCIE1] = "cs7542-pcie1",
> +	[CS7542_CLK_PCIE2] = "cs7542-pcie2",
> +};
> +
> +#define CS7542_PORTS	3
> +#define CS7542_NUM_RESETS	4
> +/* NI, FE, TM, SCH, QM, DMA-LSO/SSP, NI XRAM; never reset SDRAM (bit 4). */
> +#define CS7542_NE_RESET_MASK	(GENMASK(3, 0) | BIT(5) | BIT(16) | BIT(17))
> +#define GLOBAL_RESET	0x04
> +#define GLOBAL_CONFIG	0x10
> +
> +struct cs7542_gate {
> +	struct clk_hw hw;
> +	struct regmap *map;
> +	u32 mask;
> +};
> +
> +struct cs7542_control {
> +	struct reset_controller_dev rcdev;
> +	struct regmap *map;
> +	struct cs7542_gate gates[CS7542_PORTS];
> +	struct clk_hw_onecell_data *clks;
> +};
> +
> +static int cs7542_gate_prepare(struct clk_hw *hw)
> +{
> +	struct cs7542_gate *gate = container_of(hw, struct cs7542_gate, hw);
> +
> +	return regmap_update_bits(gate->map, GLOBAL_CONFIG, gate->mask, gate->mask);
> +}
> +
> +static void cs7542_gate_unprepare(struct clk_hw *hw)
> +{
> +	struct cs7542_gate *gate = container_of(hw, struct cs7542_gate, hw);
> +
> +	regmap_update_bits(gate->map, GLOBAL_CONFIG, gate->mask, 0);
> +}
> +
> +static int cs7542_gate_is_prepared(struct clk_hw *hw)
> +{
> +	struct cs7542_gate *gate = container_of(hw, struct cs7542_gate, hw);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(gate->map, GLOBAL_CONFIG, &value);
> +	return ret ? ret : !!(value & gate->mask);
> +}
> +
> +static const struct clk_ops cs7542_gate_ops = {
> +	.prepare = cs7542_gate_prepare,
> +	.unprepare = cs7542_gate_unprepare,
> +	.is_prepared = cs7542_gate_is_prepared,
> +};
> +
> +static int cs7542_reset_update(struct reset_controller_dev *rcdev,
> +			       unsigned long id, bool assert)
> +{
> +	struct cs7542_control *ctl = container_of(rcdev, struct cs7542_control, rcdev);
> +	unsigned int value;
> +	u32 mask, target;
> +	int ret;
> +
> +	if (id >= CS7542_NUM_RESETS)
> +		return -EINVAL;
> +	mask = id == CS7542_RESET_NE ? CS7542_NE_RESET_MASK : BIT(6 + id);
> +	target = assert ? mask : 0;
> +	ret = regmap_update_bits(ctl->map, GLOBAL_RESET, mask, target);
> +	if (ret || id != CS7542_RESET_NE)
> +		return ret;
> +	return regmap_read_poll_timeout(ctl->map, GLOBAL_RESET, value,
> +				       (value & mask) == target, 1, 1000);
> +}
> +
> +static int cs7542_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	return cs7542_reset_update(rcdev, id, true);
> +}
> +
> +static int cs7542_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	return cs7542_reset_update(rcdev, id, false);
> +}
> +
> +static int cs7542_reset_status(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	struct cs7542_control *ctl = container_of(rcdev, struct cs7542_control, rcdev);
> +	unsigned int value;
> +	u32 mask;
> +	int ret;
> +
> +	if (id >= CS7542_NUM_RESETS)
> +		return -EINVAL;
> +	mask = id == CS7542_RESET_NE ? CS7542_NE_RESET_MASK : BIT(6 + id);
> +	ret = regmap_read(ctl->map, GLOBAL_RESET, &value);
> +	if (ret)
> +		return ret;
> +	value &= mask;
> +	if (id == CS7542_RESET_NE && value && value != mask)
> +		return -EIO;
> +	return !!value;
> +}
> +
> +static int cs7542_reset_pulse(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	int ret;
> +
> +	if (id >= CS7542_NUM_RESETS)
> +		return -EINVAL;
> +	if (id == CS7542_RESET_NE)
> +		return -EOPNOTSUPP;
> +
> +	ret = cs7542_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;
> +	usleep_range(10000, 12000);
> +	ret = cs7542_reset_deassert(rcdev, id);
> +	if (ret)
> +		return ret;
> +	usleep_range(10000, 12000);
> +	return 0;
> +}
> +
> +static const struct reset_control_ops cs7542_reset_ops = {
> +	.assert = cs7542_reset_assert,
> +	.deassert = cs7542_reset_deassert,
> +	.status = cs7542_reset_status,
> +	.reset = cs7542_reset_pulse,
>  };

The reset driver goes under drivers/reset.

Also you posted 4 different patch series for clk drivers for this same
SoC. Please post them all together as one to make the review easier.

Brian

