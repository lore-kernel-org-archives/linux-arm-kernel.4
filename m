Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20DD606F933
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hj46hzfF;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SgK6q3gB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rrZ72aMFXIt9J0eJiunU6ye5nEAGfTC6WD38knv82lM=; b=hj46hzfFq8+IqHr+3UWwXlL1FQ
	KZvYAtXVGwA8mGKflNdJ7P6bhrZgeCkpcNNCcGcVADF/QTFUpJAGcf6ahXORT3xFDpRP8VY1N6QCG
	72QyYQ8bduGIlmlLRNI+jsVYG0/SN3/cna0LtoR3x1QCvG6Go7yAuhsolvp1y8LX9QrxP7qyDtdTN
	nAI/+GcY5D+J/sDw4xBJbDgUrC/NI/nMkjNlQkuStb7EA5j9CZtu3yvbrVeN8BDR9Exe4O9SZvxrp
	XR+I+wz82bBS18q5Nx/2qIM27VMQuxY1gveu9ij2RUP4lIvlI3/xbcdIHz91hCTwFo6cczpWJBf/B
	ZnNDsT/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRq38-0000000CeRg-3GPL;
	Fri, 13 Nov 2026 12:06:34 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRq33-0000000CeQO-3RTr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:06:33 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so1620346a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:06:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794571588; cv=none;
        d=google.com; s=arc-20260327;
        b=JqGYX4WVBDNHhqfO8Dq43pR4QCWrppbZY8NsMx6DvQlV5/uhkFloWA/CLbnzYEvtRc
         iBvbdfQRGljANeCg2f6nySwxgeoVZkMpxHwXFJ7lEIs6sRwSX3Fx0nqwngEeAlzM5HFf
         3yRYReI3XQFXLt9FdvrsNThFJyEFe1HOZdyskoDecJngpwR3BH1IoCn3LAyqnkUjc7ta
         Bwp84f1zF5iGpqmt8836YHh3XjFJ7HG5s71EmEzZQOP0AjWDwGsUaE0hhObLBSu3sJmJ
         0k0jWlxvt1KykIGI0YUvkW5veqJCkKsCViMKovHMD0egpHAtXHQfNfv8gqLjIFfbYtG3
         0cAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rrZ72aMFXIt9J0eJiunU6ye5nEAGfTC6WD38knv82lM=;
        fh=VPcj08olkE2ESiEbglURx0YI/yzQe+7c/dcx2msEHSY=;
        b=aEwde1sHw0QvEAUqP9tXZ/+5GixQ0791PzSkSFlP8xSDU64AmNewSD+N764W+jjVTR
         sMK/gJjaLx8KZs61V27j4opqBAKAAn/+PKSF7CzpyGtjzB0oC9MB8+kLjwgYKAmLbRZa
         fRS0CsQqAjC9La62y+AoiCH6SNudnbI/9f1Nn0btXRMhOHrcER+RDNPpXvFgJ7rtuCK9
         T51eYzj0/kbybF16/If5arG1tikTyHNNvnVoYm9FGWgq/nD2Sc/ChECovtF2KGc76CYr
         KRxMSyiklmQ3NDSummZiJQh6Tvt6RKIW9ZnAjINOrM5mH8jMPBf2Csw4CMHVK1lW2GuR
         4dlQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794571588; x=1795176388; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrZ72aMFXIt9J0eJiunU6ye5nEAGfTC6WD38knv82lM=;
        b=SgK6q3gB+y8fuQptujGmBCPDzS3jKFo64Vh8Em1J1IE0cx/RHwrb/LPMZUPnk6uvYJ
         fk9IottVgIXibQPMbVVUzPQZnHe7ESgOU/ywfODWr4rh0I6itVdoPeX+X7B9VKGJYUKU
         yYfESZuGtTQABy8npus/XNwd2A1sDclhyxmTGOnO1sy0HFWCgX1Yg5lzW7XNZyX/zhxx
         iWrqCahO1L0OaQXPIHRaOsk7/gxrmkvRtEXuzhdq7VgVyd7YsXOpIhBrX2LCMq5Z7q9A
         ffBzf0GcfnP2LV4QpUZRMKlSg/mr6nL0pz4sLmbHppWYgE4Mh7lIH2gNfl0rLim8diEx
         usMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571588; x=1795176388;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rrZ72aMFXIt9J0eJiunU6ye5nEAGfTC6WD38knv82lM=;
        b=GSz9O+w3gtFOIhKA2HHP78oTkSATTMXOI4ML5hLw5whLCQBE21OYtixXxvgFDIqN+a
         XpWVt0N2GEUAj9cKKuaOwBZvwIq3YjJ5uts4JH4yJxKpPnRMif4bq30Pz5Eljfjnq9Eq
         GVYZtGt++7jmUmXLJDoyJCiZXKYp+1QFhjs0PSxKHuR1gk5JRODdBfow8v66vUX9nk88
         s074jhqTrFaThNFOET+XTgK/31SfvFlFSmZwpvJ686c/pg8Xi1Glch+7E35heT4km26A
         0aF3Za7Tr8FyH7YpNr+nmC2oylDNCgPHr7lThGNf+cnk6xSInaGZ6y36si1mnOOqvCVN
         PPyg==
X-Forwarded-Encrypted: i=1; AL+hErHXvVTRkaY/v8Z/soVKsI5mBaBPogH+vQ2BhyBOOmRbsY2yaZWtWrFW/9JlaXWfgKzS3mzkzgrym0nYQhRGcvoP@lists.infradead.org
X-Gm-Message-State: APuU4Z+7UzL7/l5FUCobNbDmH7h3PrmhXpVeaaXtDN7ipoziHgHhhXkZ
	GdCxG0f3dIfe2Bzcb1TIx3xXlJP+pkOmHm2ifA+w84ue2h81/6889a/rkUM8SfRoU8vqTbFcq2W
	vO9bh9r7qS+/fuA9pTx4bwwSkfszQwzF2FfTCBCc+kg==
X-Gm-Gg: AYBFou0tPYuKOtSQsFrXB8xn1cM3pF1pG1SdCL0KtvuM8aCemS1J/u9onU+af+L86OJ
	0D398w4II0gj3reSSGnJT2KZgyHHXz609gyuXHspFKQe2yGzg9t5yn1DmXK2+ww+t2caXqAIbac
	BC70JU4+RMz69O9zh2KacraoNgcJiYkWsS/dq441e0bDxz+uepMpjhAOUResBtfaiRJzviH60GD
	17fRHNENZ636uK39GTHFEZhkRVdnUsuR36ouOWNRTgpClb+PtAJg19ggF4OyCCJa3TV7G0Zm06C
	xDAYB6tleYhnuSbJtEDPFK+MNbzbvvQh1ZeoLFKP/ifoypiULup9l5vBxd4gD7NB1GuDHfDugr2
	iNtVV6OsJ+xgtHSpHL46d9T3wye3t9dWPYyKmOJUteC1l86ImQ4usW50cnWuPUtDUvwsZqw==
X-Received: by 2002:a05:6402:2350:b0:6b7:6f9:2ef7 with SMTP id
 4fb4d7f45d1cf-6b7c0bc5f30mr1834438a12.11.1794571587568; Fri, 13 Nov 2026
 04:06:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CGME20261113104850epcas5p4ef9292af100475b1f12a2601bf5e1a84@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-8-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-8-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:06:15 +0000
X-Gm-Features: AclHuK_PX8mgp8O_dlqBWaitzb8guO9jt4s7fw--0eo5yJf4LliJ6Zz_ShncF-Q
Message-ID: <CADrjBPoAVMdxgU4P+shh+9O5rGJp+m3sRQMDd2c-7zbJ8qhiBQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/14 RESEND] clk: samsung: exynos8855: add block top
 and peric clock support
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_040631_981861_1E4AAB00 
X-CRM114-Status: GOOD (  17.56  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Raghav,

Nice to see you got the auto clock mode working on this SoC. Great
Work! See some inline comments below

On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Register compatible and cmu_info data to support clocks.
> CMU_TOP & CMU_PERIC, these provide clocks for TOP & PERIC
>
> Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  drivers/clk/samsung/Makefile         |    1 +
>  drivers/clk/samsung/clk-exynos8855.c | 1130 ++++++++++++++++++++++++++
>  2 files changed, 1131 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-exynos8855.c
>
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index b3e994bd525d..99c2c304ff48 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK) += clk-exynos8895.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynos990.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynosautov9.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynosautov920.o
> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynos8855.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-gs101.o
>  obj-$(CONFIG_EXYNOS_ACPM_CLK)          += clk-acpm.o
>  obj-$(CONFIG_S3C64XX_COMMON_CLK)       += clk-s3c64xx.o
> diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
> new file mode 100644
> index 000000000000..dcf58f2459b0
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos8855.c
> @@ -0,0 +1,1130 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 Samsung Electronics Co., Ltd.
> + * Author: Raghav Sharma <raghav.s@samsung.com>
> + *
> + * Common Clock Framework support for Exynos 8855 SoC.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/samsung,exynos8855.h>
> +
> +#include "clk.h"
> +#include "clk-exynos-arm64.h"
> +
> +/* NOTE: Must be equal to the last clock ID increased by one */
> +#define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
> +#define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
> +
> +#define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
> +#define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
> +
> +#define EXYNOS8855_DRCG_EN_OFFSET       0x104
> +#define EXYNOS8855_MEMCLK_OFFSET        0x108
> +
> +/* ---- CMU_TOP --------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_TOP (0x13900000) */
> +/* PLL */

IIUC in clk-pll.c you are using PLL_LOCKTIME_PLL_SHARED* - 4 for the
PLL_CON8 register offset? I was expecting to see those registers
defined here

> +#define PLL_LOCKTIME_PLL_SHARED0                            0x8
> +#define PLL_LOCKTIME_PLL_SHARED1                            0x10
> +#define PLL_LOCKTIME_PLL_SHARED2                            0x18
> +#define PLL_LOCKTIME_PLL_MMC                                 0x20
> +#define PLL_LOCKTIME_PLL_SHARED3                            0x28
> +#define PLL_LOCKTIME_PLL_SHARED4                            0x38
> +#define PLL_LOCKTIME_PLL_MIF_SWITCH                         0x30
> +#define PLL_CON0_PLL_MMC                                    0x1c0
> +#define PLL_CON3_PLL_MMC                                    0x1cc
> +#define PLL_CON0_PLL_SHARED0                                0x100
> +#define PLL_CON3_PLL_SHARED0                                0x10c
> +#define PLL_CON0_PLL_SHARED1                                0x140
> +#define PLL_CON3_PLL_SHARED1                                0x14c
> +#define PLL_CON0_PLL_SHARED2                                0x180
> +#define PLL_CON3_PLL_SHARED2                                0x18c
> +#define PLL_CON0_PLL_SHARED3                                0x200
> +#define PLL_CON3_PLL_SHARED3                                0x20c
> +#define PLL_CON0_PLL_SHARED4                                0x280
> +#define PLL_CON3_PLL_SHARED4                                0x28c
> +#define PLL_CON0_PLL_MIF_SWITCH                             0x240
> +#define PLL_CON3_PLL_MIF_SWITCH                             0x24c
> +
> +/* MUX & DIV */
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_AUD_CPU                   0x1000
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_AUD_NOC                   0x1004
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL0_SWITCH             0x1008
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL0_NOCP               0x100c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_DSU_SWITCH                0x1010
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL1_SWITCH             0x1014
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK0                  0x1018
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK1                  0x101c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK2                  0x1020
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK3                  0x1024
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK4                  0x1028
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST_TOP             0x102c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST                 0x1030
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST_CPU             0x1034
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST_MIF0            0x1038
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSIS_NOC                  0x103c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSTAT_NOC                 0x1040
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSTAT_BYRP                0x1044
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_DPU_NOC                   0x1048
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_G3DCORE_SWITCH            0x104c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_M2M_NOC                   0x1058
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_M2M_JPEG                  0x105c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_M2M_GDC                   0x1060
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_MIF1_NOCP                 0x1064
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_MFC_NOC                   0x1068
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_MIF0_NOCP                 0x106c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_NOCL0_NOC                 0x1070
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_NOCL1A_NOC                0x1074
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_NOC                 0x1078
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_MMC_CARD            0x107c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_IP                  0x1080
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_AUD_CPU                   0x1800
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_AUD_NOC                   0x1804
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH             0x1808
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL0_NOCP               0x180c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_DSU_SWITCH                0x1810
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH             0x1814
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK0                  0x1818
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK1                  0x181c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK2                  0x1820
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK3                  0x1824
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK4                  0x1828
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST_TOP             0x182c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST                 0x1830
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSIS_NOC                  0x1834
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST_CPU             0x1838
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST_MIF0            0x183c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSTAT_NOC                 0x1840
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSTAT_BYRP                0x1844
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_DPU_NOC                   0x1848
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_G3DCORE_SWITCH            0x184c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_M2M_NOC                   0x1858
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_M2M_JPEG                  0x185c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_M2M_GDC                   0x1860
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_MIF1_NOCP                 0x1864
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_MFC_NOC                   0x1868
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_MIF0_NOCP                 0x186c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_NOCL0_NOC                 0x1870
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_NOCL1A_NOC                0x1874
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_NOC                 0x1878
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_MMC_CARD            0x187c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_IP                 0x1880
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_GIC                 0x10c4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_NOC                 0x10c8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_GIC                 0x18c0
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_NOC                 0x18c4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_NOC                   0x1050
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_UFS_EMBD              0x1054
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_NOC                   0x1850
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_UFS_EMBD              0x1854
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_RGBP_NOC                  0x1084
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_YUVP_NOC                  0x1090
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_ALIVE_NOC                 0x1094
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSIS_DCPHY                0x1098
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSIS_OIS                  0x109c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_ICPU_NOCD_0               0x10a0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_ICPU_NOCD_1               0x10a4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_GNPU0_NOC                 0x10ac
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_GNPU0_XMAA                0x10b0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_SDMA_NOC                  0x10b4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_DNC_HTU                   0x10b8
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_DNC_NOC                   0x10bc
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PSP_NOC                   0x10c0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_G3D_NOCP                  0x10cc
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_USI_NOC                   0x10d0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_USI_IP                    0x10d4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL0_DBG_NOC            0x10d8
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_BOOST_RCO                 0x10dc
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_MIF0_SWITCH               0x10e0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_MIF1_SWITCH               0x10e4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_NOCL1B_NOC                0x10e8
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL2_SWITCH             0x10ec
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST_MIF1            0x10f0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSTAT_MCSC                0x10f4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_G3D_HTU                   0x10f8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_RGBP_NOC                  0x1884
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_YUVP_NOC                  0x1890
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_ALIVE_NOC                 0x1894
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSIS_DCPHY                0x1898
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSIS_OIS                  0x189c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_ICPU_NOCD_0               0x18a0
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_ICPU_NOCD_1               0x18a4
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_GNPU0_NOC                 0x18a8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_GNPU0_XMAA                0x18ac
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_SDMA_NOC                  0x18b0
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_DNC_HTU                   0x18b4
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_DNC_NOC                   0x18b8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PSP_NOC                   0x18bc
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_G3D_NOCP                  0x18c8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_USI_NOC                   0x18cc
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_USI_IP                    0x18d0
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL0_DBG_NOC            0x18d4
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_NOCL1B_NOC                0x18d8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH             0x18dc
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST_MIF1            0x18e0
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSTAT_MCSC                0x18e4
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_G3D_HTU                   0x18e8
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_USB_NOC                   0x1088
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_USB_USB20DRD              0x108c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_USB_NOC                   0x1888
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_USB_USB20DRD              0x188c
> +#define CMU_TOP_CONTROLLER_OPTION0_CMU_CTRL                  0x800
> +
> +static const unsigned long top_clk_regs[] __initconst = {
> +       PLL_LOCKTIME_PLL_MMC,

and also here

> +       PLL_LOCKTIME_PLL_SHARED0,
> +       PLL_LOCKTIME_PLL_SHARED1,
> +       PLL_LOCKTIME_PLL_SHARED2,

[..]

> +/* Register CMU_TOP early, as it's a dependency for other early domains */
> +CLK_OF_DECLARE(exynos8855_cmu_top, "samsung,exynos8855-cmu-top",
> +              exynos8855_cmu_top_init);
> +
> +/* ---- CMU_PERIC --------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_PERIC (0x15400000) */
> +#define CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_IP_USER            0x600
> +#define CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_MMC_CARD_USER      0x610
> +#define CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_NOC_USER           0x620
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_I2C                    0x1000
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_UART_DBG               0x1004
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI00                  0x1008
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI01                  0x100c
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI02                  0x1010
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI03                  0x1014
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI04                  0x1018
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI09_USI_OIS          0x101c
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI10_USI_OIS          0x1020
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_NOCP                   0x1800
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_UART_DBG               0x1804
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI00_USI              0x1808
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI01_USI              0x180c
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI02_USI              0x1810
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI03_USI              0x1814
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI04_USI              0x1818
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI09_USI_OIS          0x181c
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI10_USI_OIS          0x1820
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI_I2C                0x1824
> +#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_CMU_PERIC_IPCLKPORT_PCLK    0x2004
> +#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_SYSREG_PERIC_IPCLKPORT_PCLK 0x2060
> +#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_UART_DBG_IPCLKPORT_PCLK     0x2064
> +#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_USI00_USI_IPCLKPORT_PCLK    0x206c
> +#define CMU_PERIC_CONTROLLER_OPTION0_CMU_CTRL                  0x800
> +

If you don't define all registers (like QCH, etc.) in the CMUs that
can be powered off, enabling power domains on this SoC might cause you
to lose state configured by the bootloader (and quite possibly also
suffer weird hard to debug timing/clock issues when enabling power
management).

Since auto clock mode is now used (and QCH registers are used by auto
mode), I think it makes sense to define all the CMU registers that
need their state preserved here.

Thanks,

Peter

