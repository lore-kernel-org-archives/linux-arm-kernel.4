Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EFC606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 21:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ld7mkT9J;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=R3tgwmdJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vzam9azfkf4B2QjTL0Ocw4FvWfNSsyoxxQWc2bs79yk=; b=Ld7mkT9JHvpG6m
	tVqLxS4savfbTkHSe3gvTmuofW+e5fi9E1gYh9Jaj+jMOgIi5lgSdRxTysKIMLd+JaUuuXohJoqJe
	9A0aOIPdKzEc2TYIH3L+a9811/mNTHfIBx1bubwS6GFAV6T3+QcZ+SisDSl7xuv94GUbrC9jK189Q
	eGVTghpIycd4Jg6uUYOUejf3hRutAssgrEMQRVuIH4Z3j4mP/fEgeFSI3kevY0/DdLwjAV2kEwlNk
	skDfEpt2RtOg+a6sZU/DXiRBZ9Z3WGejLt1S4sNojcumsbjCJkpN20UM1TAXuP1VU786ZwOf/ehkb
	2xX3EgvZwLxtvdPSWisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUA1n-0000000DW0F-307u;
	Thu, 19 Nov 2026 21:50:47 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUA1j-0000000DVzl-2bRW;
	Thu, 19 Nov 2026 21:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=vzam9azfkf4B2QjTL0Ocw4FvWfNSsyoxxQWc2bs79yk=; t=1795125043; x=1796334643; 
	b=R3tgwmdJVc/udqxibQh9Jp3Ifc4xoN6n6TSpvIgjtTgJu0NvGyQ+VIOmt1yhO0ZyKyt4cXKg5JZ
	LubTEOLct1zU/Za8oMS8BSYUA/Cm35/0yC+roPm6hHjc3N+fKbnYRbXmDZ2kFQa3HdRFggSLSIi7s
	2SHI1mz9U1Olh1lnGVbL1/0HkEw0sRwWNlv0u/MS/fZRwTob9xPLwLhZWaH97SsxBGi9uagqofYB6
	SVMFKKv5lb7d6Bb9iWH+poKrgMLFCABhGmf5q9cgUjBHjjGKOmRaZt6aOgYBaWaAGcJUpgv4y14Qo
	3w7WHpi1IOoW75VNvqCsIhu403aCrMn+gDgA==;
Date: Thu, 19 Nov 2026 22:50:17 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Paul Walmsley
 <paul@pwsan.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Sandy
 Huang <hjc@rock-chips.com>, Heiko =?UTF-8?B?U3TDvGJuZXI=?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>, Ulf Hansson
 <ulfh@kernel.org>, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 5/6] [RFT] ARM: OMAP2+: Convert to
 dev_clk_get_from_provider()
Message-ID: <20261119225017.15a7b5cc@kemnade.info>
In-Reply-To: <683b5b189409e5ee04100044fb615b01cb877f3d.1795094688.git.geert+renesas@glider.be>
References: <cover.1795094688.git.geert+renesas@glider.be>
	<683b5b189409e5ee04100044fb615b01cb877f3d.1795094688.git.geert+renesas@glider.be>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_135043_690979_7E826BA8 
X-CRM114-Status: GOOD (  18.52  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 19 Nov 2026 14:40:38 +0100
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> OMAP2+ clock handling uses of_clk_get_from_provider() to obtain clocks
> used for power management, so the latter show up as "deviceless" in the
> consumer column of the clk_summary file in debugfs.
> 
> Fix this by using dev_clk_get_from_provider() instead, letting us pass
> the consumer device, too.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> 
> The first change is probably OK.  The second change may fail if anything
> in the oh->od->pdev->dev chain is not available yet at this point.

Test on OMAP3:

$ diff -u clk-old clk-new
--- clk-old	2026-11-19 22:44:59.810807920 +0100
+++ clk-new	2026-11-19 22:26:52.862531880 +0100
@@ -1,17 +1,17 @@
                                  enable  prepare  protect                                duty  hardware                            connection
    clock                          count    count    count        rate   accuracy phase  cycle    enable   consumer                         id
 ---------------------------------------------------------------------------------------------------------------------------------------------
- oscillator                          0       0        0        26000000    0          0     50000      Y   deviceless                      of_clk_get_from_provider 
+ oscillator                          0       0        0        26000000    0          0     50000      Y   deviceless                      dev_clk_get_from_provider
                                                                                                            deviceless                      no_connection_id         
- secure_32k_fck                      0       1        0        32768       0          0     50000      Y   deviceless                      of_clk_get_from_provider 
+ secure_32k_fck                      0       1        0        32768       0          0     50000      Y   deviceless                      dev_clk_get_from_provider
                                                                                                            deviceless                      no_connection_id         
-    wdt1_fck                         0       0        0        32768       0          0     50000      Y      deviceless                      of_clk_get_from_provider 
+    wdt1_fck                         0       0        0        32768       0          0     50000      Y      deviceless                      dev_clk_get_from_provider
                                                                                                               deviceless                      no_connection_id         
     gpt12_fck                        0       1        0        32768       0          0     50000      Y      48304000.timer                  fck                      
                                                                                                               48304000.target-module          fck                      
-                                                                                                              deviceless                      of_clk_get_from_provider 
+                                                                                                              deviceless                      dev_clk_get_from_provider
                                                                                                               deviceless                      no_connection_id         
- dummy_ck                            0       0        0        0           0          0     50000      Y   deviceless                      of_clk_get_from_provider 
+ dummy_ck                            0       0        0        0           0          0     50000      Y   deviceless                      dev_clk_get_from_provider
                                                                                                            deviceless                      no_connection_id         
  mcbsp_clks                          0       5        0        0           0          0     50000      Y   deviceless                      mcbsp_clks               
                                                                                                            deviceless                      mcbsp_clks               
[...]
Regards,
Andreas
> ---
>  arch/arm/mach-omap2/omap_device.c | 2 +-
>  arch/arm/mach-omap2/omap_hwmod.c  | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-omap2/omap_device.c b/arch/arm/mach-omap2/omap_device.c
> index 77a75b0b9ae69c85..5695e0c8f2392eca 100644
> --- a/arch/arm/mach-omap2/omap_device.c
> +++ b/arch/arm/mach-omap2/omap_device.c
> @@ -73,7 +73,7 @@ static void _add_clkdev(struct omap_device *od, const char *clk_alias,
>  
>  		clkspec.np = of_find_node_by_name(NULL, clk_name);
>  
> -		r = of_clk_get_from_provider(&clkspec);
> +		r = dev_clk_get_from_provider(&od->pdev->dev, &clkspec);
>  
>  		rc = clk_register_clkdev(r, clk_alias,
>  					 dev_name(&od->pdev->dev));
> diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
> index 03cd523dff874bb0..5e4123014909d4ac 100644
> --- a/arch/arm/mach-omap2/omap_hwmod.c
> +++ b/arch/arm/mach-omap2/omap_hwmod.c
> @@ -147,6 +147,7 @@
>  #include <asm/system_misc.h>
>  
>  #include "clock.h"
> +#include "omap_device.h"
>  #include "omap_hwmod.h"
>  
>  #include "soc.h"
> @@ -796,7 +797,7 @@ static struct clk *_lookup_clkctrl_clk(struct omap_hwmod *oh)
>  				clkspec.args[0] = addr - provider->addr[0];
>  				clkspec.args[1] = 0;
>  
> -				clk = of_clk_get_from_provider(&clkspec);
> +				clk = dev_clk_get_from_provider(&oh->od->pdev->dev, &clkspec);
>  
>  				pr_debug("%s: %s got %p (offset=%x, provider=%pOF)\n",
>  					 __func__, oh->name, clk,


