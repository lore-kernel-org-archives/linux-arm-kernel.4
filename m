Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E03606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ioCY2jVt;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WZGRhatw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QMtWRUnLzfziwojXuMxZ243VsWEOXksnuHBb40BXUy8=; b=ioCY2jVtBGX7wC
	1Trqc4Rm+K+DVIBRq6qJaj+xoxYE6mS2nlPQg8LDFp1I6fxVT2a/FrSplsRoTLHsYxrx9CzU0KtSs
	WO0GCNIwCObOUqL42GkzbTENpL7KjKFA+1BTKbOe93+2Px3uecVQSCsKyqShz1zWpoLR/Hlp7Og7W
	B037CuF0XH6jfgiZmFthcmTd2WsRzxv85MelFbxuWHZrNS5oGh/9z8KsiBRsmLAEyN3Yz5zOvUmii
	FU531oNVtpCT21/yt8iVsl4ncuiSonkmVIjggKGT3LqTm3o0WETLXRhZ2rip3B4XyPd+EiCiTIeRR
	jw5OShD+lyhPQm3Yf70g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYON-0000000AjGt-0yTR;
	Thu, 12 Nov 2026 17:15:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYOD-0000000AjET-2sBA;
	Thu, 12 Nov 2026 17:15:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1B4745F55;
	Thu, 12 Nov 2026 17:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5821F000C7;
	Thu, 12 Nov 2026 17:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794503708;
	bh=QMtWRUnLzfziwojXuMxZ243VsWEOXksnuHBb40BXUy8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WZGRhatwCDsqP0M0RMxDetxdTFeZQrU5buo1r/jlN+MM3BgxCYQ71O2ZHZnK8TO5w
	 1XK6/koViRVNFicnKuCmfwWLlco4yLxoDasOLY+D80FxKrsGNMlFSzugE/99JpA7+P
	 YaC+pMYvoIHeSkUqeHhI4ZLtUEVmOfeeibb5uZjRna87WXWnlReFnqOLgjU1L8h8Am
	 iwqA+O/bGISXGajHPenN+X/um0+rfbmMl0pZT3TbnVkbETv9kWIT6iNasUgEWsAsTW
	 GOdlDXdrPKAGM1/MkequZ6fH2NgN3rb4Kf2qmFF6N5SqIki27ccgeYlJL1IRhScIAE
	 pBqSRXho3rSmg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v16 3/9] clk: realtek: Add support for phase locked
 loops (PLLs)
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
In-Reply-To: <20261112052544.555563-4-eleanor.lin@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
 <20261112052544.555563-4-eleanor.lin@realtek.com>
Date: Thu, 12 Nov 2026 12:14:56 -0500
Message-Id: <179450369604.1227210.16414330828743652541.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=10989; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=YA5/sfOho0byDKcBJWtH5gDuPjkv1SXjsISXQrUtzGk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+fhFuijy3pFT5R8kmnZ3P4iUqnn5c5KOhMXHmyXTzK
 3sLOf+ZdZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjAR8RmMDAfNXjtxFkes2ifw
 tifJWadpQfT25tLvAqcXf5+tfXbt4+kM/8NOCBzSnvmmJaXLebl3S3AYk6uuLzMH14utR11TMvI
 NmAE=
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

> Provide a full set of PLL operations for programmable PLLs and a read-only
> variant for fixed or hardware-managed PLLs.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v16:
> - Remove Brian's reviewed-by tag.
> -  Introduce 'expected_parent_rate' validation in '.determine_rate()' and
> '.set_rate()' to safely enforce the fixed input rate requirement.
> - In determined_rate, replacing the floor/ceil algorithm with a closest-match
> search within [min_rate, max_rate] boundaries.
> - Improve comments for spinlock. 
> - Add '.is_enabled' callback to 'rtk_clk_pll_ro_ops'
> ---
>  drivers/clk/realtek/Makefile         |   2 +
>  drivers/clk/realtek/clk-regmap-pll.c | 219 +++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-pll.h |  53 +++++++
>  drivers/clk/realtek/freq_table.c     |  62 ++++++++
>  drivers/clk/realtek/freq_table.h     |  24 +++
>  5 files changed, 360 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-pll.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-pll.h
>  create mode 100644 drivers/clk/realtek/freq_table.c
>  create mode 100644 drivers/clk/realtek/freq_table.h
>
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 13000ed4ba11..6fbe6e07b760 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -2,3 +2,5 @@
>  obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  
>  clk-rtk-y += clk-rtk-common.o
> +clk-rtk-y += clk-regmap-pll.o
> +clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-regmap-pll.c b/drivers/clk/realtek/clk-regmap-pll.c
> new file mode 100644
> index 000000000000..e43e78a36647
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-pll.c
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/export.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +#include "clk-regmap-pll.h"
> +
> +#define TIMEOUT 500
> +
> +static inline struct rtk_clk_regmap_pll *to_rtk_clk_regmap_pll(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
> +
> +	return container_of(clkr, struct rtk_clk_regmap_pll, clkr);
> +}
> +
> +static int wait_freq_ready(struct rtk_clk_regmap_pll *clkp)
> +{
> +	u32 pollval;
> +
> +	/*
> +	 * Optional register: return success if not provided.
> +	 */
> +	if (!clkp->freq_ready_reg)
> +		return 0;
> +
> +	return regmap_read_poll_timeout_atomic(clkp->clkr.regmap, clkp->freq_ready_reg, pollval,
> +		(pollval & clkp->freq_ready_mask) == clkp->freq_ready_val, 1, TIMEOUT);
> +}
> +
> +static bool is_power_on(struct rtk_clk_regmap_pll *clkp)
> +{
> +	u32 val;
> +
> +	/*
> +	 * If the PLL does not provide a power register, it is considered
> +	 * to be always powered.
> +	 */
> +	if (!clkp->power_reg)
> +		return true;
> +
> +	if (regmap_read(clkp->clkr.regmap, clkp->power_reg, &val))
> +		return false;
> +
> +	return (val & clkp->power_mask) == clkp->power_val_on;
> +}
> +
> +static void rtk_clk_regmap_pll_disable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	unsigned long flags;
> +
> +	if (!clkp->seq_power_off)
> +		return;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);
> +
> +	regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_off,
> +			       clkp->num_seq_power_off);
> +
> +	spin_unlock_irqrestore(&clkp->lock, flags);
> +}
> +
> +static int rtk_clk_regmap_pll_is_enabled(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);
> +
> +	ret = is_power_on(clkp);
> +
> +	spin_unlock_irqrestore(&clkp->lock, flags);
> +
> +	return ret;
> +}
> +
> +static int rtk_clk_regmap_pll_determine_rate(struct clk_hw *hw,
> +					     struct clk_rate_request *req)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	const struct rtk_freq_table *ftblv = NULL;
> +
> +	if (clkp->expected_parent_rate &&
> +	    req->best_parent_rate != clkp->expected_parent_rate)
> +		return -EINVAL;
> +
> +	ftblv = ftbl_find_closest_by_rate(clkp->freq_tbl, req->rate,
> +					  req->min_rate, req->max_rate);
> +	if (!ftblv)
> +		return -EINVAL;
> +
> +	req->rate = ftblv->rate;
> +
> +	return 0;
> +}
> +
> +static unsigned long rtk_clk_regmap_pll_recalc_rate(struct clk_hw *hw,
> +						    unsigned long parent_rate)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	const struct rtk_freq_table *fv;
> +	unsigned long flags;
> +	u32 freq_val;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);
> +
> +	if (regmap_read(clkp->clkr.regmap, clkp->freq_reg, &freq_val)) {
> +		spin_unlock_irqrestore(&clkp->lock, flags);
> +		return 0;
> +	}
> +
> +	freq_val &= clkp->freq_mask;

ftbl_find_by_val_with_mask() performs the mask operation as well, so
this is redundant. Just pick one way.

> +
> +	fv = ftbl_find_by_val_with_mask(clkp->freq_tbl, clkp->freq_mask,
> +					freq_val);
> +
> +	spin_unlock_irqrestore(&clkp->lock, flags);
> +
> +	return fv ? fv->rate : 0;
> +}
> +
> +static int rtk_clk_regmap_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +				       unsigned long parent_rate)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	const struct rtk_freq_table *fv;
> +	unsigned long flags;
> +	int ret;
> +
> +	if (clkp->expected_parent_rate && parent_rate != clkp->expected_parent_rate)
> +		return -EINVAL;
> +
> +	fv = ftbl_find_by_rate(clkp->freq_tbl, rate);
> +	if (!fv || fv->rate != rate)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);
> +
> +	if (clkp->seq_pre_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_pre_set_freq,
> +					     clkp->num_seq_pre_set_freq);
> +		if (ret)
> +			goto unlock;
> +	}
> +
> +	ret = regmap_update_bits(clkp->clkr.regmap, clkp->freq_reg,
> +				 clkp->freq_mask, fv->val);
> +	if (ret)
> +		goto unlock;
> +
> +	if (clkp->seq_post_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_post_set_freq,
> +					     clkp->num_seq_post_set_freq);
> +		if (ret)
> +			goto unlock;
> +	}
> +
> +	if (is_power_on(clkp)) {
> +		ret = wait_freq_ready(clkp);
> +		if (ret)
> +			goto unlock;
> +	}
> +
> +unlock:
> +	spin_unlock_irqrestore(&clkp->lock, flags);
> +
> +	return ret;
> +}
> +
> +static int rtk_clk_regmap_pll_enable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	if (!clkp->seq_power_on)
> +		return ret;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);
> +
> +	if (is_power_on(clkp))
> +		goto unlock;
> +
> +	ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_on,
> +				     clkp->num_seq_power_on);
> +	if (ret)
> +		goto unlock;
> +
> +	ret = wait_freq_ready(clkp);

This can wait up to 500 us with interrupts disabled. Should this move to
a prepare lock instead with a mutex?

> +	if (ret)
> +		goto unlock;
> +
> +unlock:
> +	spin_unlock_irqrestore(&clkp->lock, flags);
> +
> +	return ret;
 +}
> +
> +const struct clk_ops rtk_clk_pll_ops = {
> +	.enable         = rtk_clk_regmap_pll_enable,
> +	.disable        = rtk_clk_regmap_pll_disable,
> +	.is_enabled     = rtk_clk_regmap_pll_is_enabled,
> +	.recalc_rate    = rtk_clk_regmap_pll_recalc_rate,
> +	.determine_rate = rtk_clk_regmap_pll_determine_rate,
> +	.set_rate       = rtk_clk_regmap_pll_set_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_ops, "CLK_REALTEK");
> +
> +const struct clk_ops rtk_clk_pll_ro_ops = {
> +	.is_enabled     = rtk_clk_regmap_pll_is_enabled,
> +	.recalc_rate = rtk_clk_regmap_pll_recalc_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_ro_ops, "CLK_REALTEK");
> diff --git a/drivers/clk/realtek/clk-regmap-pll.h b/drivers/clk/realtek/clk-regmap-pll.h
> new file mode 100644
> index 000000000000..f6fac6b4ac90
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-pll.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_CLK_PLL_H
> +#define __CLK_REALTEK_CLK_PLL_H
> +
> +#include <linux/spinlock.h>
> +#include "clk-rtk-common.h"
> +#include "freq_table.h"
> +
> +struct reg_sequence;
> +
> +struct rtk_clk_regmap_pll {
> +	struct rtk_clk_regmap clkr;
> +	const struct reg_sequence *seq_power_on;
> +	u32 num_seq_power_on;
> +	const struct reg_sequence *seq_power_off;
> +	u32 num_seq_power_off;
> +	const struct reg_sequence *seq_pre_set_freq;
> +	u32 num_seq_pre_set_freq;
> +	const struct reg_sequence *seq_post_set_freq;
> +	u32 num_seq_post_set_freq;
> +	const struct rtk_freq_table *freq_tbl;
> +	u32 freq_reg;
> +	u32 freq_mask;
> +	u32 freq_ready_mask;
> +	u32 freq_ready_reg;
> +	u32 freq_ready_val;
> +	u32 power_reg;
> +	u32 power_mask;
> +	u32 power_val_on;
> +
> +	/* Expected input rate for the preset frequency table; zero disables check. */
> +	unsigned long expected_parent_rate;
> +
> +	/*
> +	 * Serialize the multi-step register sequences in .set_rate() against
> +	 * .enable()/.disable(). CCF protects them with different locks
> +	 * (prepare_lock vs. enable_lock), and regmap only guarantees atomicity of
> +	 * individual register accesses.
> +	 */
> +	spinlock_t lock;
> +};
> +
> +#define __rtk_clk_regmap_pll_hw(_ptr)  __rtk_clk_regmap_hw(&(_ptr)->clkr)
> +
> +extern const struct clk_ops rtk_clk_pll_ops;
> +extern const struct clk_ops rtk_clk_pll_ro_ops;
> +
> +#endif /* __CLK_REALTEK_CLK_PLL_H */
> diff --git a/drivers/clk/realtek/freq_table.c b/drivers/clk/realtek/freq_table.c
> new file mode 100644
> index 000000000000..0f977a3fc902
> --- /dev/null
> +++ b/drivers/clk/realtek/freq_table.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/types.h>
> +#include "freq_table.h"
> +
> +#define IS_FREQ_TABLE_END(_f) ((_f)->rate == 0)
> +
> +const struct rtk_freq_table *ftbl_find_closest_by_rate(const struct rtk_freq_table *ftbl,
> +						       unsigned long rate,
> +						       unsigned long min_rate,
> +						       unsigned long max_rate)
> +{
> +	const struct rtk_freq_table *best = NULL;
> +	unsigned long best_delta = ULONG_MAX;

From sashiko: #include <linux/limits.h> for ULONG_MAX.

There's some other sashiko feedback on these files and I'm not going to
duplicate that.

Brian

-- 
Brian Masney <masneyb@kernel.org>

