Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2141606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XDH0gud7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JDHL8669
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Sj0o3JVl3N+FI+aU/iGHx1e6wE1R4ZNeqwLA3Bi3IL8=; b=XDH0gud7OcE7Qa
	QEcJASZPuqrstJDAV/yxIs6L9rpnrJMRVKl9tQd/yS1GlxBtobQluUQgmAWvb4CKedmuDhzHCEjQf
	qlQAFW67IBfIVSYD8NOxuIXi0e+pD9x1QPM1qGrNTN2eZ/uzh5M1YdqGX/k4ZmICgP0u4vjVkdgtr
	SPUqWPyT2rxHGQCotdxMQFldJ2EsF5Fd0pWbTYEvyp3okqpRq0E4vXO0hALYsN3xOTnnBDfNyQWST
	10JbGYXAdkSaIib6wYXk84urimb5TTWAM7JcSvQOv0y4QQ7cREB8+Ca3Dp6cWdovIt9ZLpw1hVRHn
	rk/Igtxsg80DA34XpTpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYOH-0000000AjF5-01cF;
	Thu, 12 Nov 2026 17:15:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYOB-0000000AjEI-43Ul;
	Thu, 12 Nov 2026 17:15:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14CE462366;
	Thu, 12 Nov 2026 17:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12FB1F000C6;
	Thu, 12 Nov 2026 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794503706;
	bh=Sj0o3JVl3N+FI+aU/iGHx1e6wE1R4ZNeqwLA3Bi3IL8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=JDHL8669Tu5KOw63GwH3OlFzLyXjBomwYG4WEJV1G14b+g7CGDBEMAEYIPuTJEL9K
	 Z/T8tHvPLlL40nCvTpDg+ZFgTx2ZnQ1xnfR8gOyG9+sDEdjgqVvUysr1QIAyP+/Za4
	 aWnmeP0/DhXeuKP8MSGdQESjzOFiE2IGg78ke2T5f7axCE5oMOT0UJd6jhQzW/Pv/f
	 SVB4Aww4VVz2OopQCc1FGIkH4OyHXXd7hiX/cd5MqnKSTnM5IvhFb/LjN7knvAATCz
	 1A7WSHzomxL/v0oNAD2hHhe2K9Pa0VfCkfj7Zm/O5oNUlpn4KJHU7uWOhxJgsovm5P
	 ykuyAJv8n4LRg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v16 2/9] clk: realtek: Introduce common probe()
From: Brian Masney <masneyb@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
 cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>, Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261112052544.555563-3-eleanor.lin@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
 <20261112052544.555563-3-eleanor.lin@realtek.com>
Date: Thu, 12 Nov 2026 12:14:56 -0500
Message-Id: <179450369604.1227210.1514039416965256446.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=7910; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=yBTYZt2B9XOGCU44T0YYZapPjsjMGHfpkuF9t3RXyMI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+fhGM6+qO/Zgk9T70eu7Jjok3lU/c76qdcHTFgTmvX
 AvF7ab1dpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCROzcYGSZEFNqpSbIfquhy
 ZrlY4uHjF52ucWObsK2L/BGBttQfPxj+is+5JL4tS2L2lCID998nz8zafvHbus/sC4QvCYTMu3H
 qKi8A
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

> Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
> and add the clock provider.
> 
> Additionally, if the "#reset-cells" property is present in the device tree,
> it creates and registers an auxiliary device using the provided aux_name.
> This allows the dedicated reset driver to bind to this device, enabling
> both clock and reset drivers to share the same regmap.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> ---
>  MAINTAINERS                          |  1 +
>  drivers/clk/Kconfig                  |  1 +
>  drivers/clk/Makefile                 |  1 +
>  drivers/clk/realtek/Kconfig          | 29 ++++++++++
>  drivers/clk/realtek/Makefile         |  4 ++
>  drivers/clk/realtek/clk-rtk-common.c | 84 ++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-rtk-common.h | 37 ++++++++++++
>  7 files changed, 157 insertions(+)
>  create mode 100644 drivers/clk/realtek/Kconfig
>  create mode 100644 drivers/clk/realtek/Makefile
>  create mode 100644 drivers/clk/realtek/clk-rtk-common.c
>  create mode 100644 drivers/clk/realtek/clk-rtk-common.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c51f9fc157c8..54873a33038b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23541,6 +23541,7 @@ REALTEK CLOCK DRIVERS
>  M:	Cheng-Yu Lee <cylee12@realtek.com>
>  M:	Yu-Chun Lin <eleanor.lin@realtek.com>
>  S:	Supported
> +F:	drivers/clk/realtek/*
>  F:	include/dt-bindings/clock/realtek*
>  
>  REALTEK OTTO WATCHDOG
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 37a8e35d4178..eb9256459251 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -532,6 +532,7 @@ source "drivers/clk/nuvoton/Kconfig"
>  source "drivers/clk/pistachio/Kconfig"
>  source "drivers/clk/qcom/Kconfig"
>  source "drivers/clk/ralink/Kconfig"
> +source "drivers/clk/realtek/Kconfig"
>  source "drivers/clk/renesas/Kconfig"
>  source "drivers/clk/rockchip/Kconfig"
>  source "drivers/clk/samsung/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 52d138d4ffc8..3930bf20667b 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -156,6 +156,7 @@ obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
>  obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
>  obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
>  obj-y					+= ralink/
> +obj-$(CONFIG_COMMON_CLK_REALTEK)	+= realtek/
>  obj-y					+= renesas/
>  obj-$(CONFIG_COMMON_CLK_ROCKCHIP)	+= rockchip/
>  obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> new file mode 100644
> index 000000000000..e8deccf93f94
> --- /dev/null
> +++ b/drivers/clk/realtek/Kconfig
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config COMMON_CLK_REALTEK
> +	tristate "Clock driver for Realtek SoCs"
> +	depends on ARCH_REALTEK || COMPILE_TEST
> +	default ARCH_REALTEK
> +	help
> +	  Enable the common clock framework infrastructure for Realtek
> +	  system-on-chip platforms.
> +
> +	  This provides the base support required by individual Realtek
> +	  clock controller drivers to expose clocks to peripheral devices.
> +
> +	  If you have a Realtek-based platform, say Y.
> +
> +if COMMON_CLK_REALTEK
> +
> +config RTK_CLK_COMMON
> +	tristate "Realtek Clock Common"
> +	select AUXILIARY_BUS
> +	select REGMAP_MMIO
> +	help
> +	  Common helper code shared by Realtek clock controller drivers.
> +
> +	  This provides utility functions and data structures used by
> +	  multiple Realtek clock implementations. It also provides the
> +	  infrastructure to spawn reset controllers via the auxiliary bus
> +	  where required.

Drop the prompt text because this isn't meant to be user selectable.

> +
> +endif
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> new file mode 100644
> index 000000000000..13000ed4ba11
> --- /dev/null
> +++ b/drivers/clk/realtek/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
> +
> +clk-rtk-y += clk-rtk-common.o
> diff --git a/drivers/clk/realtek/clk-rtk-common.c b/drivers/clk/realtek/clk-rtk-common.c
> new file mode 100644
> index 000000000000..7df6d04bb95a
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include "clk-rtk-common.h"
> +
> +static int rtk_reset_controller_register(struct device *dev, const char *aux_name,
> +					 struct regmap *map)
> +{
> +	struct auxiliary_device *adev;
> +
> +	if (!of_property_present(dev->of_node, "#reset-cells"))
> +		return 0;
> +
> +	if (!aux_name) {
> +		dev_err(dev, "DTS requires reset controller, but aux_name is missing\n");
> +		return -EINVAL;
> +	}
> +
> +	adev = devm_auxiliary_device_create(dev, aux_name, (void *)map);
> +	if (!adev)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static const struct regmap_config rtk_clk_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +};
> +
> +int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	struct clk_hw *hw;
> +	int i, ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = devm_regmap_init_mmio(dev, base, &rtk_clk_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	for (i = 0; i < desc->num_clks; i++)
> +		desc->clks[i]->regmap = regmap;
> +
> +	for (i = 0; i < desc->clk_data->num; i++) {
> +		hw = desc->clk_data->hws[i];
> +		if (!hw)
> +			continue;
> +
> +		ret = devm_clk_hw_register(dev, hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register hw of clk%d\n", i);
> +	}
> +
> +	ret = rtk_reset_controller_register(dev, desc->aux_name, regmap);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register reset controller\n");
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					  desc->clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add clock provider\n");
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_probe, "CLK_REALTEK");
> +
> +MODULE_DESCRIPTION("Realtek clock infrastructure");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/realtek/clk-rtk-common.h b/drivers/clk/realtek/clk-rtk-common.h
> new file mode 100644
> index 000000000000..de3f23120b53
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2016-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_COMMON_H
> +#define __CLK_REALTEK_COMMON_H
> +
> +#include <linux/clk-provider.h>
> +
> +#define __rtk_clk_regmap_hw(_p) ((_p)->hw)
> +
> +struct device;
> +struct platform_device;
> +struct regmap;
> +
> +struct rtk_clk_regmap {
> +	struct clk_hw hw;
> +	struct regmap *regmap;
> +};
> +
> +struct rtk_clk_desc {
> +	struct clk_hw_onecell_data *clk_data;
> +	struct rtk_clk_regmap **clks;
> +	size_t num_clks;
> +	char *aux_name;

Can this be const?

Brian

-- 
Brian Masney <masneyb@kernel.org>

