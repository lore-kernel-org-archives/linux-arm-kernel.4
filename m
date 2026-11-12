Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2055606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SHEgfOl3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5ky110j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bod2fYjJCJ/zNm0nl1K1p9Czrsk1VBanjiZ5HhgkltQ=; b=SHEgfOl3FBJRH8
	SQ4s7SdGXsSNrWfVwYLKR8gx2nXNDMA/ftkuE3mPvP5aQemPLTH+HDn+3DqC/RCCndX862gadw8ub
	vDQTPx18IsYt/5wXGYpOLtOET597uEC8cvkarokFhjkjHKu6+COdeA5Cjg937qm+PX0MBvgH/7bWZ
	nLb+G3K0o1IgUAYq+6YdNQhCPHaG+y7PKzadTndvRAKphcM0aGb4CNMtELozI2kNLGROU9bvuP0yM
	A/Xoe6eBPKFWZkVUZxI0/Rwe9L94+JkplUkbg3zzoaURLJWvqq9UMmLYeEwKuieick8+rXAjHqNmk
	aYGUMsrGj8hYR7rF4joQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYOO-0000000AjHU-3FCo;
	Thu, 12 Nov 2026 17:15:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYOG-0000000AjEa-14Gn;
	Thu, 12 Nov 2026 17:15:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 42B7F612CB;
	Thu, 12 Nov 2026 17:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2594C1F000CD;
	Thu, 12 Nov 2026 17:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794503711;
	bh=Bod2fYjJCJ/zNm0nl1K1p9Czrsk1VBanjiZ5HhgkltQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=B5ky110jdpYs5SfFrTKrIaca4oew0zLhaFuQFEJirqxd+arCWMO5jkvo/cDWuYbtz
	 A7JQ0lIgp2VnxfTeK9b7fyWz86kRI3yoUA4XOptVxcMVfeoRst9cc2SXx0z6I05622
	 /MMOoCXtdmbXTmaixwTLEuD2anHjSfq8dywr00wGn9QYtuhQn+Gqgo5LO3F+XdircR
	 PZexJrIo8nx9zmmIrN8dJT/y6qQmf8aWCE0sK/BQrBhlnBIg+grBH9XtJAI4QGWOPp
	 8hNYN/cvF2KnXxEk4iF9PeMTjy0FOckIjw2oe+hLFiourwVXwzU4yjjhEtHEBMZZqs
	 vnwYSrWMve1jQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v16 4/9] clk: realtek: Add support for gate clock
From: Brian Masney <masneyb@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
 cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261112052544.555563-5-eleanor.lin@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
 <20261112052544.555563-5-eleanor.lin@realtek.com>
Date: Thu, 12 Nov 2026 12:14:56 -0500
Message-Id: <179450369605.1227210.5445208801694313971.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=3357; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=e49TvxolP6L1T5LscrA2AM2/vKJFH1vxN6KTH7igYO0=;
 b=kA0DAAoWt9LdJ11+wIcByyZiAGr19BTI+AOXz+uiRxsvfH0H0q8czbJh2FmwRneJqVqUXzTAQ
 Yh1BAAWCgAdFiEEpG0ycFhlqj3e3CkEt9LdJ11+wIcFAmr19BQACgkQt9LdJ11+wIdOSgEAmUUh
 W4xuOZQlI0JNCq7x1llMInQFCi+rckL0i26m8woA/3CfME6/3cmli54H/Eg/UfAYIml3NLBbMom
 toJ7+l5YC
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

> Introduce clk_regmap_gate_ops supporting enable, disable, and is_enabled
> for standard regmap gate clocks. To accommodate hardware designs, the
> enable and disable operations handle a 'write_en' flag, which asserts an
> adjacent write-enable bit (bit_idx + 1) simultaneously when modifying the
> gate bit.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v16:
> - Remove Brian's reviewed-by tag.
> - Replace 'CLK_HW_INIT' with 'CLK_HW_INIT_HW' and 'CLK_HW_INIT_FW_NAME' macros
> to avoid relying on unstable internal CCF global names.
> - Drop all unused NO_PARENT macro and 'rtk_clk_regmap_gate_ro_ops'.
> ---
>  drivers/clk/realtek/Makefile          |  1 +
>  drivers/clk/realtek/clk-regmap-gate.c | 59 +++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-gate.h | 54 ++++++++++++++++++++++++
>  3 files changed, 114 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.h
>
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 6fbe6e07b760..9397d677f52d 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -2,5 +2,6 @@
>  obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  
>  clk-rtk-y += clk-rtk-common.o
> +clk-rtk-y += clk-regmap-gate.o
>  clk-rtk-y += clk-regmap-pll.o
>  clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-regmap-gate.c b/drivers/clk/realtek/clk-regmap-gate.c
> new file mode 100644
> index 000000000000..12539e11647c
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-gate.c
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/export.h>
> +#include <linux/regmap.h>
> +#include "clk-regmap-gate.h"
> +
> +static int rtk_clk_regmap_gate_update(struct clk_hw *hw, bool enable)
> +{
> +	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
> +	unsigned int mask = BIT(clkg->bit_idx);
> +	unsigned int val = enable ? mask : 0;
> +
> +	/*
> +	 * Hardware specific design: to modify the gate bit, the adjacent
> +	 * write-enable bit (bit_idx + 1) must be asserted simultaneously.
> +	 */
> +	if (clkg->write_en) {
> +		mask |= BIT(clkg->bit_idx + 1);
> +		val |= BIT(clkg->bit_idx + 1);
> +	}
> +
> +	return regmap_update_bits(clkg->clkr.regmap, clkg->gate_ofs, mask, val);
> +}
> +
> +static int rtk_clk_regmap_gate_enable(struct clk_hw *hw)
> +{
> +	return rtk_clk_regmap_gate_update(hw, true);
> +}
> +
> +static void rtk_clk_regmap_gate_disable(struct clk_hw *hw)
> +{
> +	rtk_clk_regmap_gate_update(hw, false);
> +}
> +
> +static int rtk_clk_regmap_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
> +	int ret;
> +	u32 val;
> +
> +	ret = regmap_read(clkg->clkr.regmap, clkg->gate_ofs, &val);
> +	if (ret < 0)
> +		return ret;

This becomes a bool in clk_core_is_enabled(). Either return 0 or 1.

Brian

-- 
Brian Masney <masneyb@kernel.org>

