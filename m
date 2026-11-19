Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EF2606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o43jUghL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KqEuCO9Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IxjtbWG22D3H0LD2xyy6Ek7u5QBa/mRGy/Vj/Al56Uc=; b=o43jUghLiywUw+
	Fxta/HNhWI1jKjtlG/B/Pz74x6uTqYptw4XjsAWd+iCX/Gb5TGEeB+fDSHtjtPGBJ8EUwqt4wsXv4
	Kccuo0QysLmtKRa72OWA35g8hwy+vncqTyoYh+fTS91DsA7aHnk2OzmMb+QO50D3ilKlT38jG+RCg
	LIpZ50rullWEUSjePI0eHX1PCmCYuuKKTFW2z5M0NP+8HT9l6jHSR5lDNqLPRWR1oQmjFLq32Ny7g
	y/gF31lUN3131DY56rcIZN+ie5D023jnGGne9OMQtx4SsbZmzf1wxMroFV6522bqiJDmfJf5NEcFs
	fH7iO7PMT7peb+s99rRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7g2-0000000DBOU-3nO0;
	Thu, 19 Nov 2026 19:20:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7g1-0000000DBO7-1Jwk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 19:20:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BB666247D;
	Thu, 19 Nov 2026 19:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A6B1F000C5;
	Thu, 19 Nov 2026 19:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795116008;
	bh=IxjtbWG22D3H0LD2xyy6Ek7u5QBa/mRGy/Vj/Al56Uc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=KqEuCO9ZWwrB2uwDzwq9segyOQeOUmu2o9b/LzED7rWOHP9xVOhryBKY9qQ+mwurt
	 760d9sKR7qJf86XZrw1Ys3+kKeCY3S65cysFyVqAolQfwbY2Cwuo7bw4fMU76oRcko
	 59FMTc4IkvmP/qVPY/Z+waP21a/S14MEwU21ZFiltVm126f8ZtCYP+NvYajvZIOEJk
	 lryGNRqy6cQcdExVIM48LDN30oPk0o3qrtphCgSupMM9ijRh9ukaKETAveb2JKpyU+
	 z6ApKsdmzgR59lm1EJ+CFSoBJpgYHWfY5IxoJSjsOF18THPqJt8Qvuz14h5hw2pODH
	 Rc1sOD8qpe/EQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 3/6] clk: stm32: Add STM32MP25 SYSCFG clock driver
From: Brian Masney <masneyb@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 patrick.delaunay@foss.st.com, yannick.fertre@foss.st.com, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261118-ups_mp25_clk_syscfg-v3-3-935de791a4ce@foss.st.com>
References: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
 <20261118-ups_mp25_clk_syscfg-v3-3-935de791a4ce@foss.st.com>
Date: Thu, 19 Nov 2026 14:20:00 -0500
Message-Id: <179511600099.284394.14789205221596558006.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=5087; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=NUz9r9Je5FkkaO9SUloJr0wbmOONkOdtBuVqAan6A4M=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL+ez+aol28/wv3bts+1ZV2MWEJTCdeZB54fcAqvojZo
 yt4ldCtjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZiUMjI0NY30d0j4yJf1t13
 PybOObY62/n4B2vVf10FiTaXrgV2LWVkWHVK7dpXgan9yZc5Hlu6phyzdhZepxJaw7KTYa/RFdN
 gHgA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Gabriel,

> On STM32MP23x and STM32MP25x, the LTDC pixel clock is selected in the
> SYSCFG DISPLAYCLKCR register among the DSI PHY byte lane clock, the LVDS
> PHY pixel clock (reset value) and the LTDC kernel clock, the latter
> being the one needed by the RGB (DPI) output.
> 
> The SYSCFG node is described as the provider of this clock, but no
> driver registers it, so the selection can't be changed from its reset
> value and a display connected to the LTDC RGB output can't work.
> 
> Add a driver registering this clock as a mux. The SYSCFG node is bound
> to the STM32MP2 SYSCFG driver, so this driver is an auxiliary driver,
> probed from an auxiliary device which shares the SYSCFG node. The mux
> parents are taken from the "clocks" property of the SYSCFG node, which
> remains the clock provider.
> 
> Co-developed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  drivers/clk/stm32/Kconfig                |  13 ++++
>  drivers/clk/stm32/Makefile               |   1 +
>  drivers/clk/stm32/clk-stm32mp25-syscfg.c | 125 +++++++++++++++++++++++++++++++
>  3 files changed, 139 insertions(+)
>
> diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
> index 5dbd75cde657..18289816f030 100644
> --- a/drivers/clk/stm32/Kconfig
> +++ b/drivers/clk/stm32/Kconfig
> @@ -39,5 +39,18 @@ config COMMON_CLK_STM32MP257
>  	help
>  	  Support for stm32mp25x SoC family clocks.
>  
> +config COMMON_CLK_STM32MP25_SYSCFG
> +	tristate "Clock driver for stm32mp25x SYSCFG clocks"
> +	depends on COMMON_CLK_STM32MP257
> +	depends on SOC_STM32MP2 || COMPILE_TEST
> +	select AUXILIARY_BUS
> +	select MFD_SYSCON
> +	default COMMON_CLK_STM32MP257
> +	help
> +	  Support for the clocks provided by the stm32mp25x SYSCFG, i.e.
> +	  the LTDC pixel clock source selection between the LTDC kernel
> +	  clock (RGB output), the LVDS PHY pixel clock and the DSI byte
> +	  lane clock.
> +
>  endif
>  
> diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
> index e04727b59449..8088d172651f 100644
> --- a/drivers/clk/stm32/Makefile
> +++ b/drivers/clk/stm32/Makefile
> @@ -2,3 +2,4 @@ obj-$(CONFIG_COMMON_CLK_STM32MP135)	+= clk-stm32mp13.o clk-stm32-core.o reset-st
>  obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o reset-stm32.o
>  obj-$(CONFIG_COMMON_CLK_STM32MP215)	+= clk-stm32mp21.o clk-stm32-core.o reset-stm32.o
>  obj-$(CONFIG_COMMON_CLK_STM32MP257)	+= clk-stm32mp25.o clk-stm32-core.o reset-stm32.o
> +obj-$(CONFIG_COMMON_CLK_STM32MP25_SYSCFG)	+= clk-stm32mp25-syscfg.o
> diff --git a/drivers/clk/stm32/clk-stm32mp25-syscfg.c b/drivers/clk/stm32/clk-stm32mp25-syscfg.c
> new file mode 100644
> index 000000000000..41f40325a10f
> --- /dev/null
> +++ b/drivers/clk/stm32/clk-stm32mp25-syscfg.c
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) STMicroelectronics 2026 - All Rights Reserved
> + * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/limits.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/printk.h>
> +#include <linux/regmap.h>
> +
> +#define SYSCFG_DISPLAYCLKCR		0x5000
> +#define DISPLAYCLKCR_DPIVSLVDS		GENMASK(1, 0)
> +
> +/*
> + * The LTDC pixel clock source is selected in SYSCFG_DISPLAYCLKCR among
> + * the DSI byte lane clock, the LVDS PHY pixel clock (reset value) and
> + * the LTDC kernel clock, which is used with the RGB (DPI) output.
> + *
> + * The parents are listed in the DPIVSLVDS field order, while .index refers
> + * to the "clocks" property of the SYSCFG node, ordered "ltdc", "lvds", "dsi"
> + * so that the inputs missing on a SoC can be omitted at the end of the list.
> + */
> +static const struct clk_parent_data clk_pix_ltdc_parents[] = {
> +	{ .index = 2 },	/* dsi */
> +	{ .index = 1 },	/* lvds */
> +	{ .index = 0 },	/* ltdc */
> +};
> +
> +struct stm32mp25_syscfg_mux {
> +	struct clk_hw hw;
> +	struct regmap *regmap;
> +};
> +
> +static inline struct stm32mp25_syscfg_mux *to_syscfg_mux(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct stm32mp25_syscfg_mux, hw);
> +}
> +
> +static u8 stm32mp25_syscfg_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct stm32mp25_syscfg_mux *mux = to_syscfg_mux(hw);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(mux->regmap, SYSCFG_DISPLAYCLKCR, &val);
> +	if (ret) {
> +		pr_err("%s: failed to read the parent: %pe\n",

You have the struct dev in the probe function below. Save a pointer to
the dev in struct stm32mp25_syscfg_mux, and then you can use dev_err()
here.

With that fixed:

Reviewed-by: Brian Masney <masneyb@kernel.org>

-- 
Brian Masney <masneyb@kernel.org>

