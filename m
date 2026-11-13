Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D5C606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RPUtFerq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=NAOhlLRz;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=BDKArjiA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3Gv2/MKpyRqwLVCQK8qd3m6Sf9ERO4AXWX6+f6IJg18=; b=RPUtFerqrQABsn
	YInFKTro5l/sbit+XEfPdmGHfHRTFSJMjxt088BBx+N8B/cPf6H1BnGH2bvwIZGYXoLct876saRxX
	pO8QdhEpL2COuUhr4eh5du3XC/ADvDsh4ziyoV19OSfZE5t1VhYEScLPAJO6NgCMkEZ2itFOtCrgc
	SLYY+Y66iHnltV4I7vl1ih5ZuHYJSlryGYfZOKxgE+brYQcYh9gL2vq5GsWebHAqmNC26YcKQaLst
	9feMd+4XtMbYGaF/MErtPLfj52qr9yA6Ut5aUNwEgNrKd+oRR4ZwEv3QwL1eA0dDZ9IkPhWyTMfRb
	SwGV6JinNVPDBLIF1NLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqyh-0000000Cpaj-3Pu6;
	Fri, 13 Nov 2026 13:06:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqyb-0000000CpZt-1bvY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 13:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3Gv2/MKpyRqwLVCQK8qd3m6Sf9ERO4AXWX6+f6IJg18=; b=NAOhlLRzFyfrFIcLI6XiAp946R
	8fUDApPclDVVikNobMIxDNpVXoSJnbEZSeOLfkPWuqfqYhDBhH4jKhFAcCwyeMcKhtv0WWvxMD+Ub
	A6yqgXD5rrLcloiFpspiHxUprRxtBD6pCF9lJ8cT0To5E62C0vFRdIv+HajdbAXmGiOA9PinGMnCX
	+6mgnIHONEYeW8c6tlwVFCI4AVXH7Ig4+A8UA2JYBD64xGRWqKb1oMXSYvtD6VujWgNzDWmAEuWBJ
	8f7OQT9XN0CTHtMCArI6Sjm27gyL6v73Pj7SsmwzUkrVnwRh5Ru2xoAsBtJPBkVQqnKjQP4fYxy97
	+eoyxy2Q==;
Received: from mail-wm2-x0a.google.com ([2a00:1450:4864:31::a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqyX-0000000BHg4-2Hjx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:05:56 +0000
Received: by mail-wm2-x0a.google.com with SMTP id 5b1f17b1804b1-4b769975b2bso2925225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 05:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1794575151; x=1795179951; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Gv2/MKpyRqwLVCQK8qd3m6Sf9ERO4AXWX6+f6IJg18=;
        b=BDKArjiAh8ZmkQfAu0dWxynglUATjkt7BP3u1m/+Q9619N0q80IxouMM7uRPsTpyGi
         KMoW6WfwlXmhMK3pg46FHU9JDpsrFV0YXtbjAZcIxKuRrqWNmMhR00wwoniLUODsAlHu
         3HFBU4nZY90Mb9EG5qPIbId/diqh+OBiitsIWm/SRbfkeMW4krFI46RVwefjtDUyuqWy
         gUr/g1s13RTGLUfDHeKv37xWjpQccCJXhHmWFNLINETx8261KdVpouLzFX5P3fcoi9Hl
         cnQ4MSd+r6fbnOq+7T3QBnHGLyLIFC6FBFHuPuGDyFCes1TRHOOZIAR86KlvbBuDOgcw
         7SRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575151; x=1795179951;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Gv2/MKpyRqwLVCQK8qd3m6Sf9ERO4AXWX6+f6IJg18=;
        b=x27VCBMfXRIhfQW9GWuahw2fxXRjGqJuEgOJiz25Uh4JcCSPVv85qaaQj0U7SdsNjl
         GHqxuqDVjw9o2Y3lkYdTCOQUwuqgdzvjJd2094ZN4fLamgTbGsYfnEXUCP52QCOYhpcr
         SnCM25QpY3gIZ5O4hzD4SKuYQ3hv/eOX04tscL/syVlwLz7zBe8E3i/X+mhWu26NXC/a
         LVNSdR9IGgmm5IAKoigzQXXhrw/H3pHugTRzBOp6LDYOP0jtS5eSP56b0XT1lsyzFSLw
         QmThmA6ql01ZE6MTUf626rQqQ94hOOOo/mumQVduE3hWahFyW3bveSda/L6FNYMthpCw
         h1eA==
X-Forwarded-Encrypted: i=1; AL+hErEAiXBel+pfkP2PWZlIJDGevVh4RcRQ+W8bU7xqNroBkPlw/33ONopVg4+bKoXxz4uZ4ArvVgWdMG1p4Lf65B9K@lists.infradead.org
X-Gm-Message-State: APuU4Z95dJIWUbr2dsvog2Df09ouQfZWuVRQ3gK6mhgmaR+Wvktmzi95
	Pq/O7NYPkPhWENdkZ+kWMORxCMePnHxlB5NNCbby6BTurf0XI7R0R3Is04tQwKQpKLA=
X-Gm-Gg: AYBFou1mDHQt1hMr5bxhEpBp+7eZcsfdNvUhKtWg8mo7l48Bt/UbsX5Zcqd0rU+mVjH
	PZjLOVzz/IfLVbWFKS/Na63738RxVTrOC4ENmG2YuVfFaglYzPLQyKsSL20i9kF64d/KpAZMakT
	i7ijAAZjLHNEAM9KbfyRYfTbl6tTXztG0etgPEidfAQAGMAjXdWLJEaeHiiD+FZJxDVGOU4KC1L
	4i/JESnxuR6tbspGSwb7l+GNvQ44ata66cOMTPhJ6bDmR702u6FWrHF4OPJBolQ4PZFi3GxZuBq
	XUBrx8NulK9R8R8w+1L9jD+drCLAdCdLVRxhW8gEkRqeslxfJN453/eAPCWy/esgIDIs0nIZMBx
	3D3hF2DEI0XUSHe3nWhEf5Ov/4zdhhmpJ4EmK8glbOUQjGxcPA6S17FgoKTr7jVisbnIndmxb5F
	pX4SF3xHgaN0GuzB5QLVvZV+8bC4Dj8DF0PHlXD/toEl553OW/sjaDd+XpDe67V0Yzk6HjpQ7mc
	suhOQ6GdgxnDLbeasfpBPJsIGzGkJ3IvP9C/xmotEPip8XYOeDXBxTWH9c5wP8Cuglx+fUepUyV
	uuvOn1vTb3gnm8xrL2rlOmLqZOeanNfxXccEyLEnf9G+tOILFQ4LlK4fYqHe02BWcGBNljukNSA
	gTOI9eKP89L+dCgamSl7Q63B7WtZAcx+rY0Bi4wYHQNhqTI/IgTT9rds85qzUQSdfUPcwPw==
X-Received: by 2002:a05:600c:4e56:b0:4ac:aae6:6400 with SMTP id 5b1f17b1804b1-4bb55a48042mr50442305e9.13.1794575150222;
        Fri, 13 Nov 2026 05:05:50 -0800 (PST)
Received: from ?IPV6:2003:e6:6714:e500:cb5f:91bd:76cb:96be? (p200300e66714e500cb5f91bd76cb96be.dip0.t-ipconnect.de. [2003:e6:6714:e500:cb5f:91bd:76cb:96be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm25742635e9.4.2026.11.13.05.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 05:05:49 -0800 (PST)
Message-ID: <c6c39058-ebb2-433a-ab0e-5e35f5ccae24@9elements.com>
Date: Fri, 13 Nov 2026 14:05:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] nvmem: aspeed: Add read-only AST2600 OTP support
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>, srini@kernel.org
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, ryan_chen@aspeedtech.com,
 billy_tsai@aspeedtech.com, neal_liu@aspeedtech.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
 <20261113034213.158390-2-prasanth.padarthi10@gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20261113034213.158390-2-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_130553_667876_D0CBF824 
X-CRM114-Status: GOOD (  45.78  )
X-Spam-Score: -0.2 (/)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 4:42 AM, Prasanth Kumar Padarthi wrote:
> Expose permitted AST2600 OTP data through NVMEM using the existing SBC
> node. Serialize controller transactions, bound completion polling and
> reject reads into the configured secure prefix.

This only repeats what the code does. Please explain *why*. Who uses the 
data and which cells?

> 
> Adapt the read sequence from ASPEED's downstream driver, preserving its
> attribution. Register the driver for ASPEED review and restrict raw OTP
> access to root.

If you mean the MAINTAINERS hunk, just say so.

> 
> Link: https://github.com/AspeedTech-BMC/linux/blob/769f62b7baa84d6998723b0ea60280e380183553/drivers/soc/aspeed/ast2600-otp.c

No DCO Sign-off (neither from you nor Neal). And given that you've used 
the downstream driver as base it'd be cool if you can keep Neal as 
Co-developed-by in (with Neal's agreement).

> ---
> Tested on ASRock Rack B650D4U, AST2600 A3, OpenBMC Linux 6.18.24:

Please test against the base commit you've used (i.e. 7.4-rc3). Using a 
vendor / OpenBMC tree here is not useful at all.

> - Repeated, paired and cross-pair reads matched.
> - Four concurrent readers completed 40 matching reads.
> - Bytes 8172..8183 matched a separate vendor-derived reader.
> - Synthetic pre-MMIO timeout, failure latching and rebind recovery passed.
> Host fault-injection tests passed all 42 polling-timeout cases.
> 
>   MAINTAINERS                 |   1 +
>   drivers/nvmem/Kconfig       |  12 ++
>   drivers/nvmem/Makefile      |   1 +
>   drivers/nvmem/ast2600-otp.c | 259 ++++++++++++++++++++++++++++++++++++
>   4 files changed, 273 insertions(+)
>   create mode 100644 drivers/nvmem/ast2600-otp.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb3..c92ea8e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2813,6 +2813,7 @@ F:	Documentation/devicetree/bindings/arm/aspeed/
>   F:	arch/arm/boot/dts/aspeed/
>   F:	arch/arm/mach-aspeed/
>   F:	arch/arm64/boot/dts/aspeed/
> +F:	drivers/nvmem/ast2600-otp.c
>   N:	aspeed
>   
>   ARM/AXIADO ARCHITECTURE
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index d2f5bb2..cdcd071 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -164,6 +164,18 @@ config NVMEM_APPLE_SPMI
>   	  This driver can also be built as a module. If so, the module
>   	  will be called apple-nvmem-spmi.
>   
> +config NVMEM_ASPEED_AST2600_OTP
> +	tristate "ASPEED AST2600 OTP support"
> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	help
> +	  Read-only access to the AST2600 OTP data region. The configured
> +	  secure prefix is not exposed. Fuse programming is not supported.
> +	  The controller reads paired 32-bit words through command registers.

This is implementation-specific and doesn't help whether to enable the 
option. Drop.

> +	  Access to raw OTP data is restricted to root.
> +
> +	  If built as a module, the module will be called ast2600-otp.
> +

"If unsure, select N"?

>   config NVMEM_BCM_OCOTP
>   	tristate "Broadcom On-Chip OTP Controller support"
>   	depends on ARCH_BCM_IPROC || COMPILE_TEST
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 5e70bad..9fac69d 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_NVMEM_APPLE_EFUSES)	+= nvmem-apple-efuses.o
>   nvmem-apple-efuses-y 			:= apple-efuses.o
>   obj-$(CONFIG_NVMEM_APPLE_SPMI)		+= apple_nvmem_spmi.o
>   apple_nvmem_spmi-y			:= apple-spmi-nvmem.o
> +obj-$(CONFIG_NVMEM_ASPEED_AST2600_OTP)	+= ast2600-otp.o

Maybe call the file "nvmem-aspeed-otp" or so? Would be nice if we can 
extend the driver for AST2700 support later on.

>   obj-$(CONFIG_NVMEM_BCM_OCOTP)		+= nvmem-bcm-ocotp.o
>   nvmem-bcm-ocotp-y			:= bcm-ocotp.o
>   obj-$(CONFIG_NVMEM_BRCM_NVRAM)		+= nvmem_brcm_nvram.o
> diff --git a/drivers/nvmem/ast2600-otp.c b/drivers/nvmem/ast2600-otp.c
> new file mode 100644
> index 0000000..94b1225
> --- /dev/null
> +++ b/drivers/nvmem/ast2600-otp.c
> @@ -0,0 +1,259 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) ASPEED Technology Inc.
> + *
> + * ASPEED AST2600 OTP Controller driver
> + * Read sequencing adapted from ASPEED's downstream ast2600-otp driver.

This comment feels unnecessary. It's already been said in the commit 
description.

> + */
> +
> +#include <linux/align.h>

align could be removed if you use round_down() or word & ~1 maybe?

> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/of.h>

You don't call any of_ functions. Replace with mod_devicetable.h.

> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

unused. devm_kzalloc comes through platform_device.h.

> +#include <linux/string.h>
> +
> +#define AST2600_OTP_PROTECT_KEY		0x00
> +#define AST2600_OTP_CMD			0x04
> +#define AST2600_OTP_ADDR		0x10
> +#define AST2600_OTP_STATUS		0x14

The SB Controller driver checks for the OTP_PROTECTED bit. What happens 
if OTP protection is enabled?

> +#define AST2600_OTP_COMPARE_1		0x20
> +#define AST2600_OTP_COMPARE_2		0x24
> +
> +#define AST2600_OTP_CMD_READ		0x23b1e361
> +#define AST2600_OTP_CMD_WRITE_MODE	0x23b1e362
> +#define AST2600_OTP_UNLOCK_KEY		0x349fe38a
> +#define AST2600_OTP_STATUS_DONE		0x6

Describe the bits here. Either two BIT() or GENMASK(2, 1).

> +#define AST2600_OTP_TIMEOUT_US		100000

Where does this come from?

> +
> +#define AST2600_OTP_DATA_WORDS		0x800
> +#define AST2600_OTP_SIZE			(AST2600_OTP_DATA_WORDS * sizeof(u32))
> +#define AST2600_OTP_CONF0_ADDR		0x800
> +#define AST2600_OTP_CONF0_SEC_SIZE		GENMASK(21, 16)
> +#define AST2600_OTP_SEC_SIZE_UNIT		(32 * sizeof(u32))
> +
> +struct ast2600_otp {
> +	void __iomem *base;
> +	/* Serialize the complete unlock, read and relock sequence. */
> +	struct mutex lock;
> +	bool failed;
> +};
> +
> +static int ast2600_otp_wait_complete(struct ast2600_otp *otp)
> +{
> +	u32 status;
> +	int i, ret;
> +
> +	/* Allow the command to start before sampling the idle flags. */
> +	udelay(1);

You could use read_poll_timeout too?

> +
> +	/* Match the downstream sequence: observe both idle flags twice. */
> +	for (i = 0; i < 2; i++) {

This is not a valid reason. Do you really have to poll twice? Is this an 
erratum? If so, please cite it.

> +		ret = readl_poll_timeout(otp->base + AST2600_OTP_STATUS,
> +					 status,
> +					 (status & AST2600_OTP_STATUS_DONE) ==
> +					 AST2600_OTP_STATUS_DONE,
> +					 1, AST2600_OTP_TIMEOUT_US);
> +		if (ret) {
> +			/* Do not reuse a controller with an outstanding command. */
> +			otp->failed = true;

That'd disable the device on a single timeout. Do we really have to do 
this, or would it be enough to retry on the next access? If you want to 
keep it, then a dev_err() would be good instead of failing it silently.

> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int ast2600_otp_prepare_read(struct ast2600_otp *otp)
> +{
> +	static const u32 mode_addresses[] = { 0x3000, 0x5000, 0x1000 };
> +	int i, ret;
> +
> +	ret = ast2600_otp_wait_complete(otp);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Restore the macro's default read mode, as in otp_soak(ctx, 0).
> +	 * These writes target volatile mode registers, not OTP fuse cells.
> +	 * No fuse programming command or programming timing is used.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(mode_addresses); i++) {
> +		writel(mode_addresses[i], otp->base + AST2600_OTP_ADDR);
> +		writel(0, otp->base + AST2600_OTP_COMPARE_1);
> +		writel(AST2600_OTP_CMD_WRITE_MODE, otp->base + AST2600_OTP_CMD);

Setting the OTP back to default doesn't need write mode if I understand 
the datasheet correctly.

> +		ret = ast2600_otp_wait_complete(otp);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ast2600_otp_read_pair(struct ast2600_otp *otp,
> +				 unsigned int aligned_word,
> +				 u32 *word0, u32 *word1)
> +{
> +	int ret;
> +
> +	/* The hardware reads two words starting at an even word index. */
> +	if ((aligned_word & 1) || aligned_word >= AST2600_OTP_DATA_WORDS)
> +		return -EINVAL;

You're already passing an aligned index everywhere which makes this code 
redundant. It also blocks the read for CONF0, so please drop this check 
and use read_pair() for CONF0 too.

> +
> +	writel(aligned_word, otp->base + AST2600_OTP_ADDR);
> +
> +	writel(AST2600_OTP_CMD_READ,
> +	       otp->base + AST2600_OTP_CMD);
> +
> +	ret = ast2600_otp_wait_complete(otp);
> +	if (ret)
> +		return ret;
> +
> +	*word0 = readl(otp->base + AST2600_OTP_COMPARE_1);
> +	*word1 = readl(otp->base + AST2600_OTP_COMPARE_2);
> +
> +	return 0;
> +}
> +
> +static int ast2600_otp_read(void *context, unsigned int offset,
> +			    void *val, size_t bytes)
> +{
> +	struct ast2600_otp *otp = context;
> +	u8 *buf = val;
> +	unsigned int word_index;
> +	unsigned int aligned_word;
> +	unsigned int secure_size;
> +	__le32 pair[2];
> +	u32 conf0;
> +	u32 word0, word1;
> +	size_t chunk, skip;
> +	int ret;
> +
> +	if (!bytes)
> +		return -EINVAL;

OTP could be empty too?

> +
> +	if (offset % sizeof(u32) || bytes % sizeof(u32))
> +		return -EINVAL;
> +
> +	if (offset >= AST2600_OTP_SIZE ||
> +	    bytes > AST2600_OTP_SIZE - offset)
> +		return -EINVAL;
> +
> +	mutex_lock(&otp->lock);

guard(mutex)(&priv->lock); ? Requires <linux/cleanup.h>.

> +
> +	if (otp->failed) {
> +		ret = -EIO;
> +		goto out_unlock;
> +	}
> +
> +	writel(AST2600_OTP_UNLOCK_KEY, otp->base + AST2600_OTP_PROTECT_KEY);
> +
> +	ret = ast2600_otp_prepare_read(otp);
> +	if (ret)
> +		goto out_lock;

The secure region size is fixed once programmed. Maybe read it once in 
probe instead of on every access? With nvmem_keepout, this would clean 
up the read path a bit.

> +
> +	/* Configuration word 0 describes the unreadable secure data prefix. */
> +	writel(AST2600_OTP_CONF0_ADDR, otp->base + AST2600_OTP_ADDR);
> +	writel(AST2600_OTP_CMD_READ, otp->base + AST2600_OTP_CMD);
> +	ret = ast2600_otp_wait_complete(otp);
> +	if (ret)
> +		goto out_lock;
> +
> +	conf0 = readl(otp->base + AST2600_OTP_COMPARE_1);
> +	secure_size = FIELD_GET(AST2600_OTP_CONF0_SEC_SIZE, conf0) *
> +		      AST2600_OTP_SEC_SIZE_UNIT;

You can also keep out the secure region by using nvmem_keepout.

> +	/* Conservatively deny the entire secure prefix, including its header. */
> +	if (offset < secure_size) {
> +		ret = -EACCES;
> +		goto out_lock;
> +	}
> +
> +	while (bytes) {
> +		word_index = offset / sizeof(u32);
> +		aligned_word = ALIGN_DOWN(word_index, 2);
> +
> +		ret = ast2600_otp_read_pair(otp, aligned_word,
> +					    &word0, &word1);
> +		if (ret)
> +			goto out_lock;
> +
> +		pair[0] = cpu_to_le32(word0);
> +		pair[1] = cpu_to_le32(word1);
> +		skip = (word_index - aligned_word) * sizeof(u32);
> +		chunk = min(bytes, sizeof(pair) - skip);
> +
> +		memcpy(buf, (u8 *)pair + skip, chunk);
> +		buf += chunk;
> +		offset += chunk;
> +		bytes -= chunk;

NVMEM already returns the data in the correct order if I see this right. 
You can store the readl() results directly into a u32*buf var. That'd 
make the pair/skip/chunk code and endianness conversion unnecessary.

> +	}
> +
> +	ret = 0;
> +
> +out_lock:
> +	writel(0, otp->base + AST2600_OTP_PROTECT_KEY);
> +	/* Flush the protection write before another reader takes the mutex. */
> +	readl(otp->base + AST2600_OTP_PROTECT_KEY);

for what are you reading the otp key register here?

> +out_unlock:
> +	mutex_unlock(&otp->lock);
> +	return ret;
> +}
> +
> +static int ast2600_otp_probe(struct platform_device *pdev)
> +{
> +	struct nvmem_config config = {};
> +	struct nvmem_device *nvmem;
> +	struct ast2600_otp *otp;

Can we name this priv maybe?

> +
> +	otp = devm_kzalloc(&pdev->dev, sizeof(*otp), GFP_KERNEL);

Maybe assign &pdev->dev as struct device * variable and use that one 
instead?

> +	if (!otp)
> +		return -ENOMEM;
> +
> +	otp->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(otp->base))
> +		return PTR_ERR(otp->base);
> +
> +	mutex_init(&otp->lock);

devm_mutex_init?

> +
> +	config.dev = &pdev->dev;

Same here with the var.

> +	config.name = "ast2600-otp";
> +	config.id = NVMEM_DEVID_AUTO;
> +	config.owner = THIS_MODULE;
> +	config.type = NVMEM_TYPE_OTP;
> +	config.read_only = true;
> +	config.root_only = true;
> +	config.word_size = sizeof(u32);
> +	config.stride = sizeof(u32);
> +	config.size = AST2600_OTP_SIZE;
> +	config.reg_read = ast2600_otp_read;

These can already be set in the config struct before.

> +	config.priv = otp;
> +
> +	nvmem = devm_nvmem_register(&pdev->dev, &config);

And here.

> +	return PTR_ERR_OR_ZERO(nvmem);
> +}
> +
> +static const struct of_device_id ast2600_otp_of_match[] = {
> +	{ .compatible = "aspeed,ast2600-sbc" },

The SB Controller driver has "additionalProperties: false" set and 
doesn't allow nvmem properties.

Please add "$ref: /schemas/nvmem/nvmem.yaml#" and 
"unevaluatedProperties: false" as a separate patch.

Tan

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ast2600_otp_of_match);
> +
> +static struct platform_driver ast2600_otp_driver = {
> +	.probe = ast2600_otp_probe,
> +	.driver = {
> +		.name = "ast2600-otp",
> +		.of_match_table = ast2600_otp_of_match,
> +	},
> +};
> +module_platform_driver(ast2600_otp_driver);
> +
> +MODULE_AUTHOR("Neal Liu <neal_liu@aspeedtech.com>");
> +MODULE_AUTHOR("Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>");
> +MODULE_DESCRIPTION("ASPEED AST2600 read-only OTP NVMEM driver");
> +MODULE_LICENSE("GPL");
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4


