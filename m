Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D064606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 03:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z/sYn6cb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CpRIDKdx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7lnqcJxB3Woa0yeWDWouhsD+g9Rsq2yVgwq1W8KzE0Y=; b=Z/sYn6cbC+UQMq
	ZCY2cGNB61Tou0N6vP1T/Ij9B9ue8dy0uSY0PRzkocIkZHdmK9DDFGYaV3q9NANfutzOjJjUoHvR4
	AzYJIstmff35nHyC2U0V9wekTmeYlcwTQH+Ib/r6BRtWPoPxpXzI9AiRSAEnWUabyPIutQm017xKf
	yjRxarCjpbOaTddkGdTUOHJCHib74qsXsTNtwe4dlf7mwDlpZB9ZCE86gLMhvPIQjuk1RIxODih3b
	WswDK+PDfluq6IKa4R+WrVkCvN7IPmZYproVrqTGlycpl9lrV1SLTvCaRrfOaHboT7tKcunQf7q/n
	UVLn8MmtCjsLBlEqJwQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhdK-0000000BYPF-0r39;
	Fri, 13 Nov 2026 03:07:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhdI-0000000BYP5-2r1F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 03:07:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C492A44E20;
	Fri, 13 Nov 2026 03:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 705611F000C4;
	Fri, 13 Nov 2026 03:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794539239;
	bh=7lnqcJxB3Woa0yeWDWouhsD+g9Rsq2yVgwq1W8KzE0Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CpRIDKdxb1p6z9nn6ICnv673v/iG5r1io7Hs0XPt5e+GbjftAh+qCuwsj6NQB9pdV
	 LR9KHQc1EEMjq/S6XYVoCEr9f20V8gqu4bWUGF0J2AiL2qDH8ZmZHzWJInzjFqzcSS
	 4psmiv1E0b1YSzmnUEH7Qy7837B0N4UwNE9RH+TVM3HxOgAPWrtslhIJCGAtTm7J+t
	 GauGL/YtmcW5H2H/MmI+QOy+fXpMruvoKIcr9cZeS4Oxl5yjD2A5wgcdarPmmKJvgZ
	 ICAZlM7HOtN5GJbvCre80L7cXZTLyphf9cyhMFws+4Yfjq8Ybb1b8XtN1iOWi4aiZJ
	 qn/Gi7aCKMSDA==
Date: Fri, 13 Nov 2026 03:07:11 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Conall O'Griofa <conall.ogriofa@amd.com>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <git@amd.com>, Sai Krishna Potthuri
 <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v5 05/16] iio: adc: xilinx-xadc: Use bitfield helpers
 and bit macros
Message-ID: <20261113030711.3deb9cde@jic23-hlaptop>
In-Reply-To: <20261110050201.1850399-6-dileepkumar.nagavarapu@amd.com>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
	<20261110050201.1850399-6-dileepkumar.nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 10:31:50 +0530
Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com> wrote:

> Replace open-coded bit manipulation with FIELD_GET(),
> FIELD_PREP(), BIT(), and GENMASK() helpers.
> 
> Using the kernel bitfield helpers improves readability and
> makes bit operations less error-prone.
> 
> No functional changes intended.
> 
> Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Sashiko seems to have found an issue. Looks plausible to me.
https://sashiko.dev/#/patchset/20261110050201.1850399-1-dileepkumar.nagavarapu%40amd.com

> ---
>  drivers/iio/adc/xilinx-xadc-core.c | 50 ++++++++++++++++++------------
>  drivers/iio/adc/xilinx-xadc.h      | 29 +++++++++--------
>  2 files changed, 46 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
> index 66c6f3319ca0..eb63675464bb 100644
> --- a/drivers/iio/adc/xilinx-xadc-core.c
> +++ b/drivers/iio/adc/xilinx-xadc-core.c
> @@ -11,6 +11,8 @@
>   *  - AXI XADC interface: Xilinx PG019
>   */
>  
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
>  #include <linux/clk.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> @@ -47,28 +49,28 @@ static const unsigned int XADC_ZYNQ_UNMASK_TIMEOUT = 500;
>  #define XADC_ZYNQ_REG_CTL		0x18
>  
>  #define XADC_ZYNQ_CFG_ENABLE		BIT(31)
> -#define XADC_ZYNQ_CFG_CFIFOTH_MASK	(0xf << 20)
> +#define XADC_ZYNQ_CFG_CFIFOTH_MASK	GENMASK(23, 20)
>  #define XADC_ZYNQ_CFG_CFIFOTH_OFFSET	20
> -#define XADC_ZYNQ_CFG_DFIFOTH_MASK	(0xf << 16)
> +#define XADC_ZYNQ_CFG_DFIFOTH_MASK	GENMASK(19, 16)
>  #define XADC_ZYNQ_CFG_DFIFOTH_OFFSET	16

As part of this patch I'd expect the changes to FIELD_PREP()
and FIELD_GET() to remove the need for these offsets.

This one is no longer used for example. I'd expect almost all
if not all the _OFFSET defines to be dropped.
Many of them weren't used in the first place. I didn't track
down if any are still used after this patch.

>  #define XADC_ZYNQ_CFG_WEDGE		BIT(13)
>  #define XADC_ZYNQ_CFG_REDGE		BIT(12)
> -#define XADC_ZYNQ_CFG_TCKRATE_MASK	(0x3 << 8)
> -#define XADC_ZYNQ_CFG_TCKRATE_DIV2	(0x0 << 8)

>  
> @@ -822,7 +832,7 @@ static int xadc_preenable(struct iio_dev *indio_dev)
>  	int ret;
>  
>  	ret = xadc_update_adc_reg(xadc, XADC_REG_CONF1, XADC_CONF1_SEQ_MASK,
> -				  XADC_CONF1_SEQ_DEFAULT);
> +				  FIELD_PREP(XADC_CONF1_SEQ_MASK, XADC_CONF1_SEQ_DEFAULT));
>  	if (ret)
>  		goto err;
>  

Sashiko calls out there is another write of CONF1 later in the function that still
seems to be using the prior approach rather than FIELD_PREP().

> diff --git a/drivers/iio/adc/xilinx-xadc.h b/drivers/iio/adc/xilinx-xadc.h
> index fb911ed87600..f5bf2d08eedc 100644
> --- a/drivers/iio/adc/xilinx-xadc.h
> +++ b/drivers/iio/adc/xilinx-xadc.h
> @@ -9,6 +9,7 @@
>  
> -#define XADC_CONF2_DIV_MASK	0xff00
> +#define XADC_CONF2_DIV_MASK	GENMASK(15, 8)
>  #define XADC_CONF2_DIV_OFFSET	8

Similar to above, I'd expect us to not need the _OFFSET defines
after moving to FIELD_PREP/GET()



