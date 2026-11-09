Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DED606D808
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bVbD4JXS;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bHtejUzT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9iiWUMRW68xMPGfjZ+AcEwv9KLUF/IxUzNqoAU1lF5U=; b=bVbD4JXSPcBv3JnNal1YJEFJbW
	kuOqfZCXphysjAYOZftpqwt4EJW4/9MIIWGjT/Y4T4H7KaZ5YH6VnTBtYmglp9C4Ka5r0j0GKtYP4
	jXA5yHA0OASJ1KmO3PMtYxQ6Ttejbk5NdaDjsADZ4VXdwg7K+DVrnwqONWMMaMtfRqM6sM6EAtfjo
	viBI5d+7uCiFqRTZ0O/S+llRQNuC6Sb3sTxNspboTWIp/azzqv0MPoEcDbe2ie6CA/b0lj5FB68vR
	LAtRc0z5aSMY13r4v2T5xYe0nYXFUi+vW14QluxckKFj+Qh8gwLqovXaFR6E9LbC8vfsCJNJy8tES
	n8gTrOSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQM1U-00000000Igb-2L1b;
	Mon, 09 Nov 2026 09:50:44 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQM1R-00000000If4-23YI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:50:43 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-36e795af1d4so556032eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 01:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794217841; x=1794822641; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9iiWUMRW68xMPGfjZ+AcEwv9KLUF/IxUzNqoAU1lF5U=;
        b=bHtejUzTI8BUwcvLB6bGt6QNnK6xfStfT4SbpnSEtfkwZpKVi4RsjXgepuN6VqBmY6
         pNII0SEMWUXLIUVGy1arBuRdCPfOkrZ4hQ/y1S89pBMs4R9et6JxN9NLHB4lmaUFf0Yl
         1rY0Vk3lpeW8qA98L130PdcNY7IPnISWLox6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217841; x=1794822641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9iiWUMRW68xMPGfjZ+AcEwv9KLUF/IxUzNqoAU1lF5U=;
        b=ecnDcZTY01wqX9qcByoORwVW2hx74vdZCcGkiKk1UMyLil96MhsqCLe7jzsUd3PgW/
         WNxdykZ8Phyl5w3lvak5ZQLESF1JdHOoJzKtD6Bn05Jvmuh2/0379KaRRmuT7LFFAzJU
         GTS+s5Wf5993jhExLtBFuCTHZkwj3hKOGXR6jsgjcRIDlPcnAJhK7YnJN/b1O0AH1s1f
         J0Q/GZg2TdIFAomLP9OyQaUdkd7HP0lG3Hpb9ntkUdhueF6Kzs4V0pXLMkOrx14SHjDW
         lY5qwdOqDiu5E1ZlH0SDxH1fg6gOMo6Z5d2JXDmAIjA222N0XBPld+cK5I62XZfh06iR
         WSbA==
X-Forwarded-Encrypted: i=1; AL+hErE3iJ4fRYlPclwfccwBeCNCllDPg9uyJnMIu1u3nejTHZ9HdOfUw17DHp5lN3ZSNpRrZbSkh/IQYOjQl450Bpnd@lists.infradead.org
X-Gm-Message-State: APuU4Z/Hf56VULyR1JOVWS43maUMJGs4mLiBaIZAcNLY+vx7HcGkkFCy
	XZYIyuCG2e0bx2W410jtAwzCSqTykolwEdQH7dKZPuJ1clX0WqqZvvdnX953/oSjjA==
X-Gm-Gg: AYBFou16Re101sgQkC5JzpEHcOZ4vBGxFqwvNRIkdcePy69unpzuEeG8JUXCiWMYOGg
	Pfttj5mPy0UjpRIi+L9Z/SaOTaknSQPv0ILf732J3+poFt3k3FI+q0U5nSKhQtYTlKGDawpb3X0
	KDfBcm/FrHliTtSHeiAxepQM/jg/q/TIjl58uH8LpYPgd8eFWVNfV2HG8vZv/FiVwpkz2HdN4P9
	vtau8q29oiOEy8pvMX2j42EskClD2zfjO1O21VDuiR5dMFLgtAuc3JihzZLglIPl1pzKMIBBEgV
	Rk28JtlXW9w5FxUIrbxfFUkJhdXlpzxzYK+Lcic+cm8CU994n8QileVUg3WxZm6Hl4PpF7epERx
	vHLPYe57JJSBvcnIV9i4O0R+qbSA0MKqxT2mjSI1dVAyu5HSGLhfWD3HuLXRBYfx512EJaPpdw7
	3xex5sFUrOCrSVpjtdE6xCa3IcUItl6FrPZifR7y6P9Jx60vsHW+QtYmwLmZlB40wS/HbtoMtBQ
	Xd5kbMFoUlKNqR20UdMdPeKfm97mDRy48u0hMrjGnRsmtBTDuvOTF0xVgNE8b+hjsF5N1NEeHxR
	iKXC3R8x2VEDT1/azEMUOuNslQ6PTiyp6+CVyz2hI+/WUCpRi7I6UiZaQqa2UNaJepxyq6A83zR
	LHeKMvg==
X-Received: by 2002:a05:7300:f407:b0:36f:fc3e:fb95 with SMTP id 5a478bee46e88-370f74a3b54mr9301081eec.17.1794217840410;
        Mon, 09 Nov 2026 01:50:40 -0800 (PST)
Received: from google.com ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372660f385bsm12674477eec.20.2026.11.09.01.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:50:39 -0800 (PST)
Date: Mon, 9 Nov 2026 17:50:36 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clocksource/drivers/timer-mediatek: Convert to OF
 probing
Message-ID: <20261109095036.GA722431@google.com>
References: <20261002072115.169250-1-l.scorcia@gmail.com>
 <20261002072115.169250-3-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002072115.169250-3-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_015041_732247_D733C084 
X-CRM114-Status: GOOD (  29.41  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 02, 2026 at 09:19:27AM +0200, Luca Leonardo Scorcia wrote:
> MediaTek APXGPT general purpose timer driver is registered via
> TIMER_OF_DECLARE to be loaded early in the boot process. It depends on
> a reference 13 MHz clock that is assigned via the clocks property of
> its DT node.
> On platforms like mt8516/mt8167 this clock is provided by a driver that
> is loaded using OF probing and becomes available only later during boot.
> This leads to a silent EDEFER error during timer init, which is not
> recovered by TIMER_OF_DECLARE and GPT clocks are not registered at all.
> 
> Since those clocks are not critical for boot, convert the timer-mediatek
> to OF probing and drop the TIMER_OF_DECLARE instructions.

I think this is now triggering some lockdep warnings.

[  +0.000084] BUG: sleeping function called from invalid context at ./include/linux/percpu-rwsem.h:51
[  +0.000086] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1, name: swapper/0
[  +0.000079] preempt_count: 0, expected: 0
[  +0.000050] RCU nest depth: 0, expected: 0
[  +0.000051] locks held by swapper/0/1: 1, last CPU#3:
[  +0.000060]  #0: ffffff80c15d1138 (&dev->mutex){....}-{4:4}, at: __driver_attach (./include/linux/device.h:1109 drivers/base/dd.c:1046 drivers/base/dd.c:1299)
[  +0.000142] irq event stamp: 250728
[  +0.067364] hardirqs last  enabled at (250727): tick_oneshot_mode_active (kernel/time/tick-oneshot.c:128)
[  +0.009480] hardirqs last disabled at (250728): sched_clock_register (kernel/time/sched_clock.c:189)
[  +0.009301] softirqs last  enabled at (250642): __do_softirq (kernel/softirq.c:703)
[  +0.008427] softirqs last disabled at (250637): __do_softirq (kernel/softirq.c:703)
[  +0.008433] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           7.4.0-rc1-next-20261105-04243-gd86019357887 #373 PREEMPT>
[  +0.000018] Tainted: [W]=WARN
[  +0.000005] Hardware name: Google Hana (DT)
[  +0.000007] Call trace:
[  +0.000005]  show_stack (arch/arm64/kernel/stacktrace.c:499) (C)
[  +0.000018]  __dump_stack (lib/dump_stack.c:94)
[  +0.000015]  dump_stack_lvl (lib/dump_stack.c:120)
[  +0.000015]  dump_stack (lib/dump_stack.c:129)
[  +0.000013]  __might_resched (kernel/sched/core.c:9195)
[  +0.000018]  __might_sleep (kernel/sched/core.c:9124)
[  +0.000014]  cpus_read_lock (./include/linux/percpu-rwsem.h:51 ./include/linux/percpu-rwsem.h:77 kernel/cpu.c:490)
[  +0.000013]  static_key_enable (kernel/jump_label.c:222)
[  +0.000016]  enable_sched_clock_irqtime (kernel/sched/cputime.c:33)
[  +0.000014]  sched_clock_register (kernel/time/sched_clock.c:243)
[  +0.000014]  mtk_gpt_init (drivers/clocksource/timer-mediatek.c:338)
[  +0.000014]  mtk_timer_probe (drivers/clocksource/timer-mediatek.c:356)
[  +0.000014]  platform_probe (drivers/base/platform.c:1508)
[  +0.000012]  really_probe (drivers/base/dd.c:? drivers/base/dd.c:707)
[  +0.000014]  __driver_probe_device (drivers/base/dd.c:869)
[  +0.000014]  driver_probe_device (drivers/base/dd.c:899)
[  +0.000014]  __driver_attach (drivers/base/dd.c:1300)
[  +0.000014]  bus_for_each_dev (drivers/base/bus.c:383)
[  +0.000013]  driver_attach (drivers/base/dd.c:1318)
[  +0.000013]  bus_add_driver (drivers/base/bus.c:782)
[  +0.000013]  driver_register (drivers/base/driver.c:174)
[  +0.000014]  __platform_driver_register (drivers/base/platform.c:996)
[  +0.000016]  mtk_timer_driver_init (drivers/clocksource/timer-mediatek.c:372)
[  +0.000017]  do_one_initcall (init/main.c:1419)
[  +0.000015]  do_initcall_level (init/main.c:1481)
[  +0.000014]  do_initcalls (init/main.c:1497)
[  +0.000012]  do_basic_setup (init/main.c:1517)
[  +0.000013]  kernel_init_freeable (init/main.c:1732)
[  +0.000013]  kernel_init (init/main.c:1622)
[  +0.000014]  ret_from_fork (arch/arm64/kernel/entry.S:870)

> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  drivers/clocksource/timer-mediatek.c | 36 ++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index e20075b09fab..a9e7ff6908a3 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -13,6 +13,9 @@
>  #include <linux/clocksource.h>
>  #include <linux/interrupt.h>
>  #include <linux/irqreturn.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
>  #include <linux/sched_clock.h>
>  #include <linux/slab.h>
>  #include "timer-of.h"
> @@ -215,8 +218,7 @@ static irqreturn_t mtk_gpt_interrupt(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -static void
> -__init mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
> +static void mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
>  {
>  	writel(GPT_CTRL_CLEAR | GPT_CTRL_DISABLE,
>  	       timer_of_base(to) + GPT_CTRL_REG(timer));
> @@ -281,7 +283,7 @@ static struct timer_of to = {
>  	},
>  };
>  
> -static int __init mtk_syst_init(struct device_node *node)
> +static int mtk_syst_init(struct device_node *node)
>  {
>  	int ret;
>  
> @@ -339,5 +341,29 @@ static int __init mtk_gpt_init(struct device_node *node)
>  
>  	return 0;
>  }
> -TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
> -TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
> +
> +static int mtk_timer_probe(struct platform_device *pdev)
> +{
> +	int (*timer_init)(struct device_node *node);
> +	struct device_node *np = pdev->dev.of_node;
> +
> +	timer_init = of_device_get_match_data(&pdev->dev);
> +	return timer_init(np);
> +}
> +
> +static const struct of_device_id mtk_timer_match_table[] = {
> +	{ .compatible = "mediatek,mt6577-timer", .data = mtk_gpt_init },
> +	{ .compatible = "mediatek,mt6765-timer", .data = mtk_syst_init },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver mtk_timer_driver = {
> +	.probe = mtk_timer_probe,
> +	.driver = {
> +		.name = "mediatek-timer",
> +		.of_match_table = mtk_timer_match_table,
> +	},
> +};
> +module_platform_driver(mtk_timer_driver);
> +
> +MODULE_DESCRIPTION("MediaTek Timer driver");
> -- 
> 2.43.0
> 

