Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8466E606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=COIHPOOU;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=0gFHoSPL;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=oVgS44sO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6uZDabLxQxlRNvlzS0DFbXpCPUyPpFV7CJaGTp2FAAM=; b=COIHPOOUco+pT7
	xYaicuQqrEfMujyFtbAcv1kxw/IL8O9wKRdwJtoDq+EUFoH0g9tgurAnd4uMTaazYgiI2MTCSLvBV
	BgRwjzTRFgufUEGkudalyjLYgFsDZhwxVW7Izp+9yjeaVTDaixqHtsbvW/S/AWGOswQv6XTFVkOWA
	L8e5lBZ9LTd8Ir6JoMZgoUSCZ+Efa0oUBdyEkb9Zp5n3pbLX/vAlJICiF5wJzOKQ809eJe+hSdLcx
	uER7Um8IhJDzhmcJ6iAjjD0sDM3Y3QDSew0ZO3YYbUZFmo/JDuI77NVSuO8SKkyQLHKv1DGXD1ly1
	l21ob5tVMeeR1jOpbGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0nz-0000000BlsR-3CDJ;
	Thu, 19 Nov 2026 11:59:55 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0nt-0000000BlrP-2d4l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:59:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795089588; bh=6uZDabLxQxlRNvlzS0DFbXpCPUyPpFV7CJaGTp2FAAM=;
 b=0gFHoSPLLegbnPVMyrf+7x7YWiJlcvivP+Y8oJwp1JtaCoVrSv/Fnp4fOl6as8wCw6QLk2N3y
 k6bwl5OvmYgCg94mdU/AlAo/QQk6VzW1w2Eq3O4RoD/rqNgIYXEmMgnSGSNLl6e9ViR0ODiEKPv
 zB08bjOw617WvQ8fObsuf1w9Z6k2kylimIR2SXlWr3MAGIgUuAvy4qGURsbSwnyFeXAA3X7948o
 qGKYApgS6bBWOWMQgEtV9EQWdVBg14uzI4TgZxiLseRo7/8fEW+l9YbwzzwSsIv15Vrc+tCtmDm
 Q1K5J66GSqcz2TWID4HdaNHbGHP5lOOWHMzpBxXZLjfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795089588; bh=6uZDabLxQxlRNvlzS0DFbXpCPUyPpFV7CJaGTp2FAAM=;
 b=oVgS44sOpyTv/x77QyhcUQRmQPMs+miZCe2L9sPbEjfKZXLg94ydvWECs+6gmZl03wzWtd19s
 PUApBtwqAUPby1j2Yp6DphV1udkIN6Opm0sMZbTmOnRAV+AXv5Wlf69cLykKBBcRjhcfQTlE7Ox
 EorzXqUoF0wVNbrZyn8Vylc=
CFBL-Feedback-ID: 6afee4a18179ba28676bf0a4:5f8657ad80648509a22aabaf6d528548
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6afee4a18179ba28676bf0a4
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <34dbd46a-29cc-4b86-b9cb-9477dc0a4da8@kwiboo.se>
Date: Thu, 19 Nov 2026 12:59:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: clock: rockchip: Add RK3572 CRU
To: Cunhao Lu <1579567540@qq.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261117-add-board-ok3572-c-clk-v6-0-cabad6610c5f@qq.com>
 <20261117-add-board-ok3572-c-clk-v6-1-cabad6610c5f@qq.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20261117-add-board-ok3572-c-clk-v6-1-cabad6610c5f@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_035949_983088_38B6C411 
X-CRM114-Status: GOOD (  19.82  )
X-Spam-Score: -2.0 (--)
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Cunhao Lu,

On 11/17/2026 8:06 AM, Cunhao Lu wrote:
> From: Elaine Zhang <zhangqing@rock-chips.com>
> 
> The RK3572 CRU uses the PMU0 GRF for the AUPLL reference mux.
> Describe the controller and define its clock and reset IDs.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> [adapted to mainline rockchip clock and reset handling (xin24m input,
>  don't introduce CLK_NR_CLKS)]
> Signed-off-by: Cunhao Lu <1579567540@qq.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> Changes in v6:
> - Improve readability.
> 
> Changes in v3:
> - Close the reset ID gap while preserving each named reset's register
>   mapping.
> - Remove CLK_NR_CLKS from the clock binding.
> - Fix the indentation of the CRU binding example.
> ---
>  .../bindings/clock/rockchip,rk3572-cru.yaml        |  57 ++
>  include/dt-bindings/clock/rockchip,rk3572-cru.h    | 560 ++++++++++++++++
>  include/dt-bindings/reset/rockchip,rk3572-cru.h    | 713 +++++++++++++++++++++
>  3 files changed, 1330 insertions(+)

[snip]

> diff --git a/include/dt-bindings/clock/rockchip,rk3572-cru.h b/include/dt-bindings/clock/rockchip,rk3572-cru.h
> new file mode 100644
> index 000000000000..b917f72165ae
> --- /dev/null
> +++ b/include/dt-bindings/clock/rockchip,rk3572-cru.h
> @@ -0,0 +1,560 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
> + * Author: Elaine Zhang <zhangqing@rock-chips.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_ROCKCHIP_RK3572_H
> +#define _DT_BINDINGS_CLK_ROCKCHIP_RK3572_H

[snip]

> +#define ACLK_CRYPTO_NS				525
> +#define CLK_PKA_CRYPTO_NS			526
> +#define PCLK_DDR_MON				527
> +
> +/* Secure clocks */
> +#define ACLK_CCI				600
> +#define SCLK_DDR				601
> +#define CLK_STIMER0_ROOT			602
> +#define PCLK_SECURE_S				603
> +#define HCLK_SECURE_S				604
> +#define ACLK_SECURE_S				605
> +#define CLK_PKA_CRYPTO_S			606
> +#define PCLK_KLAD				607
> +#define HCLK_CRYPTO_S				608
> +#define HCLK_KLAD				609
> +#define ACLK_CRYPTO_S				610
> +#define PCLK_OTPC_S				611
> +#define CLK_OTPC_S				612
> +#define PCLK_WDT_S				613
> +#define TCLK_WDT_S				614
> +#define HCLK_TRNG_S				615

Are these secure clocks meant to be used as SCMI clock ids? Why a gap from
527 to 600? If I am not mistaken SCMI ids should similar to Linux clock ids
start at 0 and be a consecutive series.

> +
> +#endif
> diff --git a/include/dt-bindings/reset/rockchip,rk3572-cru.h b/include/dt-bindings/reset/rockchip,rk3572-cru.h
> new file mode 100644
> index 000000000000..a88af7665dae
> --- /dev/null
> +++ b/include/dt-bindings/reset/rockchip,rk3572-cru.h
> @@ -0,0 +1,713 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
> + * Author: Elaine Zhang <zhangqing@rock-chips.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_ROCKCHIP_RK3572_H
> +#define _DT_BINDINGS_RESET_ROCKCHIP_RK3572_H
> +
> +/* CRU-->SOFTRST_CON01 */
> +#define SRST_ARESETN_TOP_BIU                     0
> +#define SRST_PRESETN_TOP_BIU                     1
> +#define SRST_ARESETN_TOP_MID_BIU                 2
> +#define SRST_HRESETN_TOP_BIU                     3

Please drop the unnecessary/redundant RESETN in all constants. The SRST
prefix is already a short for Software Reset.

Please see [1] for the header I prepared for U-Boot mainline RK3572 support,
it should have all these symbols cleaned up, to match naming patterns used
for all currently supported Rockchip SoCs.

[1] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/blob/rk3562/include/dt-bindings/reset/rockchip%2Crk3572-cru.h

Regards,
Jonas

[snip]

> +#endif

