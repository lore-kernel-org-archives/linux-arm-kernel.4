Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEBA606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FiOuw4Gj;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uCGwR6kS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/xql7PxzylbnNqUypNzqY66e+XcyUxvn+W/FfLvEXM8=; b=FiOuw4Gj2Cs9CV
	amQM68mRZgkEx/Tbwdmf+RPByuyQTtnWYSJBXdmX0ArcIeCyiSkLSUWNk2oE0SnYt68wOMOjFXi1H
	eS26DScONTagOxFjGsFEPd+IeExSbIEo5mFMILjhMMZbaabTSGK+cCkdGIS1WYfTbY6UbxNf7LZIL
	CR9DWBfVXAarIuG4jS3Z69SRmchPEt/QL+QFPP8NG3dPaqVStr8J1cHaPb3zGSkMQtIqktcUmnpYe
	9VvWWUWgFPU8423KXUyoppsHJFUyIHEL3H+Ch+8G32g6kZLtkt0T3nCfhB18g4D6B9/O9zGlpnwuP
	KBkERymTrHXe/DxLM+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWK7n-0000000BKk5-0hDz;
	Wed, 25 Nov 2026 21:01:55 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWK7h-0000000BKjl-3WkA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:01:53 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso7403273a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 13:01:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795640508; cv=none;
        d=google.com; s=arc-20260327;
        b=SltVxcFW6orx/H6s5QZe6b9h0WyzaA2onp3ob1fetb3kcJcu2dExGtgK3cZ35iG1zs
         J3HfX9OaS0W4ybzGfIWDCp3G5MnX/LXK4tE2yek0J7mvlM0yrDiLEARE9/RHp0b7cV+c
         RxkpKQL+3gYkSEnt0QaA7ziKrWBw1WzGHml5QqJMdQ0qYnAsov0UtH4Zzyk7VoYhk3XO
         PlA6J65xfa3U1u7NaG76esIjB28w79oVKrlCQCRP8+YWjvq4EtlKma7G7o/etQJ1UAIm
         aV5bBeJeoXJs/xqm/3+Brh25cqgJf1UM/YLxNAvIeu+xhsbmhN32Ni9Nfm6D+xv3hwCS
         eDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/xql7PxzylbnNqUypNzqY66e+XcyUxvn+W/FfLvEXM8=;
        fh=DrrZ+OUs3ME02PCQTQDr1SERwVCk3UQFkq9DC1d93ag=;
        b=gfBSJiGZLqD/jGDAinLhD14tWDrayixZo4sPAzI3J39qTdEvPC4r5kH83D1eCm6qgN
         WwBfryhK3PnLKKuReQooeTEPzK7NkZPJdLdciap8YnLbeTL8/xfqBkyN5MGByJMfIJ8i
         6HulXY8mMbVNkGMkUvZkw3kzwSXKZ/hm4tPLRq4l1hZieuGdvelwzcrQUWkv+03rDgFj
         JtiwpCIF2w0sif/fOBxgpciKijC49ZHjtsGpnf/En8PrlPpBikJLOyU4eSRY+TbALrUK
         NgLhtM4hbUGRyY28ME0/6Mfyr2oRfe/2zUHcmLtIn4J+ZBKcruaFm3uP8cQMptNlTJCQ
         kPUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640508; x=1796245308; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/xql7PxzylbnNqUypNzqY66e+XcyUxvn+W/FfLvEXM8=;
        b=uCGwR6kSbfN5Mvip480fVQYY3FR74vI62PHT5bf47tfqmw4Dv9O1NiLPZUeqZ6iFeb
         N77Ie213lWlHVpcWDm9ZiWUfB1tcRpt2phKcyWHr9yE5NM6Qou42ObCM4XpXFsh/4CUU
         eLrgLnVa5MezNVEYGxxH92WRi8dZtaLE94pwS7hV7jB8HBQNAY5jazzO0dfYfWAZ+Njj
         zJJlg4XyQu5lCexTgRdLerUBdNrCOcq38yUWduwSNHM+M5MWiaIEZsrtSHHp152ahsRd
         AZMpu8L917TLq/oTDwdNAcSMGnYPgvFcPNRPwySpMt9Vy1QB2Ht8qKD6ARDJLgXxQPbU
         ozGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640508; x=1796245308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/xql7PxzylbnNqUypNzqY66e+XcyUxvn+W/FfLvEXM8=;
        b=vsRKoz1cHBgG6RDo6l+KTyqW+C+5xi6BwjgT+SIHgNGhNtAZKKS6Wx1UQf6PWpywJ0
         NsN6u3ViJ6kk6s89fvkpFqL3En/YsBBlDpbLppyhaxHhA6eyJ4WGEYyUP6yZfM4jClNG
         +xtEbHwliErb8aSMiFeTw4E/wv8mhtyufuPgFqQpbatXleF2Ri66o3ZDGGMf+O9iEmba
         6SBJc4kIMAhIkXF1jgoA4iCBzCHylok4FS0QHe3ThVRCBgEjAxAr8vrkrZeuPJrcXkiP
         Yg2nmZe6BSbZr4J6QZ54UbYmKSf/WoPf0J9PY9T9JJ5DfUEe3grTP8VKhwSqDnIXAh8A
         /wcA==
X-Forwarded-Encrypted: i=1; AL+hErEzXkeuxuq2niiRssba74G0b6PyDd4jju+mTAIxF01V2U9F/uY4i21D+kTbKl64ru3c9L/cB+g6MuSxPESWuT/w@lists.infradead.org
X-Gm-Message-State: APuU4Z9Mgi70zTZEUKOB3OiVXEApgle8B8BkrfZExmn1NETuiglpjO0l
	cudvcjd/fad+WmwKkRvrRtuJ5nA0GXNZ9/xAIXmF9Tu5Lm3U+NfFIccAFvqgbgNm+/fp464bUtL
	8psMi8ov7JHCGEOdSza5r6NeZZwCbRvZv27Su0xdrfw==
X-Gm-Gg: AZFdTZevXcbmI0bKdwEcPl+ymFs8FkxNf+TqjcZ9sKa4zgSb+dLxoOfbKviYaggizyk
	YwtudvviYzDBiBEP5T3qiMPFXHL+6zulYVvWf/KYLmHyVd9TJB2yiqDCO3pjjBpJ1CYocp+Ghf0
	OOFmIGt/HsXGuNhqJ9ht6JrL0eAkSi5gH8q4RWK4UihVxNHD/T4YcH8doIMmH+vS/bV3Gq1crCy
	ZwIFztwZkZjuddySUQDBTvjk+IeixXbg42j8Q1awLmH+cPk7L6mzAGq+0Oef7QRMBr9KPkfiaYG
	3psW19CZzs82VjUnf/b6j6dUcy/VGq0M6l7985CuZsymYANOxbnN3Wvx3fzwzK/Qq+ZDSmsKqmt
	LQhcyN6VD6dyGbbW6OZaKxog8gNRbVC6HLAKakPiWZ6KBkk+IhSN9/G8ZaU6bbhWTVLuEQPQ=
X-Received: by 2002:a05:6402:3222:b0:6b2:2339:370d with SMTP id
 4fb4d7f45d1cf-6ba37ec485cmr16187328a12.39.1795640507528; Wed, 25 Nov 2026
 13:01:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-samsung-pinctrl-busclk-v1-1-6732c10a7f48@linaro.org>
In-Reply-To: <20261123-samsung-pinctrl-busclk-v1-1-6732c10a7f48@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 25 Nov 2026 21:01:35 +0000
X-Gm-Features: Aa3M54oXxYlXaOdRYB1cQuxq3Qps4EcCjGoYfXvMRW_bw_T0X2BdIFPg-0Amxy4
Message-ID: <CADrjBPr9UJ0NzJ1tT2KY=H2ar4vUZBrzQvwfuT_Q_fSUe5x8KQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: keep bus clock enabled
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_130150_061635_E50EE622 
X-CRM114-Status: GOOD (  32.38  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 23 Nov 2026 at 15:59, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> With CONFIG_PROVE_RAW_LOCK_NESTING=3Dy, lockdep reports:
>
>     [ BUG: Invalid wait context ]
>     irq/130-1-0025/196 is trying to lock:
>     (enable_lock){....}-{3:3}, at: clk_enable_lock+0x68/0x110
>     other info that might help us debug this:
>     context-{5:5}
>     locks held by irq/130-1-0025/196: 1, on CPU#0:
>      #0: (&irq_desc_lock_class){-.-.}-{2:2}, at: irq_finalize_oneshot
>     Call trace:
>      _raw_spin_lock_irqsave+0x60/0x98
>      clk_enable_lock+0x68/0x110
>      clk_disable+0x34/0x68
>      exynos_irq_unmask+0xd8/0x1c0
>      unmask_threaded_irq+0x58/0x80
>      irq_finalize_oneshot.part.0+0x98/0x108
>      irq_thread_fn+0x68/0xc0
>      irq_thread+0xd0/0x1e0
>      kthread+0x118/0x138
>      ret_from_fork+0x10/0x20
>
> The driver enables the optional bus clock ("pclk") around each register
> access using clk_enable() and clk_disable(). Both acquire the clock
> framework's enable_lock, which is a spinlock_t. On PREEMPT_RT,
> spinlock_t turns into a sleeping lock and must not be acquired in hard
> interrupt context or while holding a raw_spinlock_t. Most register
> accesses happen in such contexts:
>
> * The IRQ core invokes the irq_chip callbacks .irq_mask(),
>   .irq_unmask(), .irq_ack() and .irq_set_type() with the raw_spinlock_t
>   irq_desc::lock held.
> * exynos_irq_demux_eint16_31() is a chained interrupt handler and runs
>   in hard interrupt context.
> * The gpio_chip callbacks don't sleep, so GPIO consumers may call them
>   in hard interrupt context or with a raw_spinlock_t held.
>
> Lockdep reports this only when enable_lock is contended, because
> clk_enable_lock() tries spin_trylock_irqsave() first and lockdep
> doesn't check the wait context of trylocks.
>
> Enable the bus clock once during probe instead, keep it enabled for as
> long as the driver is bound, and drop all per-access clk_enable() and
> clk_disable() calls. Also revert samsung_pinmux_setup() back to void
> and drop the now-unused pclk member of struct samsung_pinctrl_drv_data.
>
> This reverts only the per-access clk_enable()/clk_disable() portion of
> commit f9c744747973 ("pinctrl: samsung: support a bus clock"). The
> driver still has to acquire and enable the bus clock: without a
> consumer, the clock framework turns off unused gate clocks on kernels
> or DTs without automatic clock gating, and gs101's alive GPIO clocks
> don't set CLK_IGNORE_UNUSED.
>
> The in-tree DTs provide this clock for Google Tensor gs101 only. Since
> commit 298fac4f4b96 ("clk: samsung: Implement automatic clock gating
> mode for CMUs"), the gs101 clock driver registers this clock as an
> automatically gated clock, for which the enable and disable operations
> are no-ops, so keeping the clock enabled doesn't stop the hardware from
> gating it. Without automatic clock gating (in older kernels, and with
> old DTs whose CMU register range size is not 0x10000), the clock stays
> enabled for as long as the driver is bound.
>
> The DT binding requires this clock for Exynos8890 as well, but the tree
> contains neither a DT nor a clock driver for Exynos8890.
>
> Fixes: f9c744747973 ("pinctrl: samsung: support a bus clock")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/pinctrl/samsung/pinctrl-exynos.c  |  80 ----------------------
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 106 +++---------------------=
------
>  drivers/pinctrl/samsung/pinctrl-samsung.h |   2 -
>  3 files changed, 9 insertions(+), 179 deletions(-)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/s=
amsung/pinctrl-exynos.c
> index c45da9f13411..8adfeae96566 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -13,7 +13,6 @@
>  // the Samsung pinctrl/gpiolib driver. It also includes the implementati=
on of
>  // external gpio and wakeup interrupt support.
>
> -#include <linux/clk.h>
>  #include <linux/device.h>
>  #include <linux/interrupt.h>
>  #include <linux/irqdomain.h>
> @@ -69,12 +68,6 @@ static void exynos_irq_mask(struct irq_data *irqd)
>         else
>                 reg_mask =3D our_chip->eint_mask + bank->eint_offset;
>
> -       if (clk_enable(bank->drvdata->pclk)) {
> -               dev_err(bank->gpio_chip.parent,
> -                       "unable to enable clock for masking IRQ\n");
> -               return;
> -       }
> -
>         raw_spin_lock_irqsave(&bank->slock, flags);
>
>         mask =3D readl(bank->eint_base + reg_mask);
> @@ -82,8 +75,6 @@ static void exynos_irq_mask(struct irq_data *irqd)
>         writel(mask, bank->eint_base + reg_mask);
>
>         raw_spin_unlock_irqrestore(&bank->slock, flags);
> -
> -       clk_disable(bank->drvdata->pclk);
>  }
>
>  static void exynos_irq_ack(struct irq_data *irqd)
> @@ -98,15 +89,7 @@ static void exynos_irq_ack(struct irq_data *irqd)
>         else
>                 reg_pend =3D our_chip->eint_pend + bank->eint_offset;
>
> -       if (clk_enable(bank->drvdata->pclk)) {
> -               dev_err(bank->gpio_chip.parent,
> -                       "unable to enable clock to ack IRQ\n");
> -               return;
> -       }
> -
>         writel(1 << irqd->hwirq, bank->eint_base + reg_pend);
> -
> -       clk_disable(bank->drvdata->pclk);
>  }
>
>  static void exynos_irq_unmask(struct irq_data *irqd)
> @@ -134,12 +117,6 @@ static void exynos_irq_unmask(struct irq_data *irqd)
>         else
>                 reg_mask =3D our_chip->eint_mask + bank->eint_offset;
>
> -       if (clk_enable(bank->drvdata->pclk)) {
> -               dev_err(bank->gpio_chip.parent,
> -                       "unable to enable clock for unmasking IRQ\n");
> -               return;
> -       }
> -
>         raw_spin_lock_irqsave(&bank->slock, flags);
>
>         mask =3D readl(bank->eint_base + reg_mask);
> @@ -147,8 +124,6 @@ static void exynos_irq_unmask(struct irq_data *irqd)
>         writel(mask, bank->eint_base + reg_mask);
>
>         raw_spin_unlock_irqrestore(&bank->slock, flags);
> -
> -       clk_disable(bank->drvdata->pclk);
>  }
>
>  static int exynos_irq_set_type(struct irq_data *irqd, unsigned int type)
> @@ -159,7 +134,6 @@ static int exynos_irq_set_type(struct irq_data *irqd,=
 unsigned int type)
>         unsigned int shift =3D EXYNOS_EINT_CON_LEN * irqd->hwirq;
>         unsigned int con, trig_type;
>         unsigned long reg_con;
> -       int ret;
>
>         switch (type) {
>         case IRQ_TYPE_EDGE_RISING:
> @@ -192,20 +166,11 @@ static int exynos_irq_set_type(struct irq_data *irq=
d, unsigned int type)
>         else
>                 reg_con =3D our_chip->eint_con + bank->eint_offset;
>
> -       ret =3D clk_enable(bank->drvdata->pclk);
> -       if (ret) {
> -               dev_err(bank->gpio_chip.parent,
> -                       "unable to enable clock for configuring IRQ type\=
n");
> -               return ret;
> -       }
> -
>         con =3D readl(bank->eint_base + reg_con);
>         con &=3D ~(EXYNOS_EINT_CON_MASK << shift);
>         con |=3D trig_type << shift;
>         writel(con, bank->eint_base + reg_con);
>
> -       clk_disable(bank->drvdata->pclk);
> -
>         return 0;
>  }
>
> @@ -242,14 +207,6 @@ static int exynos_irq_request_resources(struct irq_d=
ata *irqd)
>         shift =3D irqd->hwirq * bank_type->fld_width[PINCFG_TYPE_FUNC];
>         mask =3D (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
>
> -       ret =3D clk_enable(bank->drvdata->pclk);
> -       if (ret) {
> -               dev_err(bank->gpio_chip.parent,
> -                       "unable to enable clock for configuring pin %s-%l=
u\n",
> -                       bank->name, irqd->hwirq);
> -               return ret;
> -       }
> -
>         raw_spin_lock_irqsave(&bank->slock, flags);
>
>         con =3D readl(bank->pctl_base + reg_con);
> @@ -259,8 +216,6 @@ static int exynos_irq_request_resources(struct irq_da=
ta *irqd)
>
>         raw_spin_unlock_irqrestore(&bank->slock, flags);
>
> -       clk_disable(bank->drvdata->pclk);
> -
>         return 0;
>  }
>
> @@ -275,13 +230,6 @@ static void exynos_irq_release_resources(struct irq_=
data *irqd)
>         shift =3D irqd->hwirq * bank_type->fld_width[PINCFG_TYPE_FUNC];
>         mask =3D (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
>
> -       if (clk_enable(bank->drvdata->pclk)) {
> -               dev_err(bank->gpio_chip.parent,
> -                       "unable to enable clock for deconfiguring pin %s-=
%lu\n",
> -                       bank->name, irqd->hwirq);
> -               return;
> -       }
> -
>         raw_spin_lock_irqsave(&bank->slock, flags);
>
>         con =3D readl(bank->pctl_base + reg_con);
> @@ -291,8 +239,6 @@ static void exynos_irq_release_resources(struct irq_d=
ata *irqd)
>
>         raw_spin_unlock_irqrestore(&bank->slock, flags);
>
> -       clk_disable(bank->drvdata->pclk);
> -
>         gpiochip_unlock_as_irq(&bank->gpio_chip, irqd->hwirq);
>  }
>
> @@ -342,19 +288,11 @@ static irqreturn_t exynos_eint_gpio_irq(int irq, vo=
id *data)
>         unsigned int svc, group, pin;
>         int ret;
>
> -       if (clk_enable(bank->drvdata->pclk)) {
> -               dev_err(bank->gpio_chip.parent,
> -                       "unable to enable clock for handling IRQ\n");
> -               return IRQ_NONE;
> -       }
> -
>         if (bank->eint_con_offset)
>                 svc =3D readl(bank->eint_base + EXYNOSAUTO_SVC_OFFSET);
>         else
>                 svc =3D readl(bank->eint_base + EXYNOS_SVC_OFFSET);
>
> -       clk_disable(bank->drvdata->pclk);
> -
>         group =3D EXYNOS_SVC_GROUP(svc);
>         pin =3D svc & EXYNOS_SVC_NUM_MASK;
>
> @@ -729,20 +667,6 @@ static void exynos_irq_demux_eint16_31(struct irq_de=
sc *desc)
>
>         chained_irq_enter(chip, desc);
>
> -       /*
> -        * just enable the clock once here, to avoid an enable/disable da=
nce for
> -        * each bank.
> -        */
> -       if (eintd->nr_banks) {
> -               struct samsung_pin_bank *b =3D eintd->banks[0];
> -
> -               if (clk_enable(b->drvdata->pclk)) {
> -                       dev_err(b->gpio_chip.parent,
> -                               "unable to enable clock for pending IRQs\=
n");
> -                       goto out;
> -               }
> -       }
> -
>         for (i =3D 0; i < eintd->nr_banks; ++i) {
>                 struct samsung_pin_bank *b =3D eintd->banks[i];
>                 pend =3D readl(b->eint_base + b->irq_chip->eint_pend
> @@ -752,10 +676,6 @@ static void exynos_irq_demux_eint16_31(struct irq_de=
sc *desc)
>                 exynos_irq_demux_eint(pend & ~mask, b->irq_domain);
>         }
>
> -       if (eintd->nr_banks)
> -               clk_disable(eintd->banks[0]->drvdata->pclk);
> -
> -out:
>         chained_irq_exit(chip, desc);
>  }
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/=
samsung/pinctrl-samsung.c
> index 0c91e1124a46..16980f4ef3b1 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -370,8 +370,8 @@ static void pin_to_reg_bank(struct samsung_pinctrl_dr=
v_data *drvdata,
>  }
>
>  /* enable or disable a pinmux function */
> -static int samsung_pinmux_setup(struct pinctrl_dev *pctldev, unsigned se=
lector,
> -                               unsigned group)
> +static void samsung_pinmux_setup(struct pinctrl_dev *pctldev,
> +                                unsigned int selector, unsigned int grou=
p)
>  {
>         struct samsung_pinctrl_drv_data *drvdata;
>         const struct samsung_pin_bank_type *type;
> @@ -381,7 +381,6 @@ static int samsung_pinmux_setup(struct pinctrl_dev *p=
ctldev, unsigned selector,
>         unsigned long flags;
>         const struct samsung_pmx_func *func;
>         const struct samsung_pin_group *grp;
> -       int ret;
>
>         drvdata =3D pinctrl_dev_get_drvdata(pctldev);
>         func =3D &drvdata->pmx_functions[selector];
> @@ -397,12 +396,6 @@ static int samsung_pinmux_setup(struct pinctrl_dev *=
pctldev, unsigned selector,
>                 reg +=3D 4;
>         }
>
> -       ret =3D clk_enable(drvdata->pclk);
> -       if (ret) {
> -               dev_err(pctldev->dev, "failed to enable clock for setup\n=
");
> -               return ret;
> -       }
> -
>         raw_spin_lock_irqsave(&bank->slock, flags);
>
>         data =3D readl(reg + type->reg_offset[PINCFG_TYPE_FUNC]);
> @@ -411,10 +404,6 @@ static int samsung_pinmux_setup(struct pinctrl_dev *=
pctldev, unsigned selector,
>         writel(data, reg + type->reg_offset[PINCFG_TYPE_FUNC]);
>
>         raw_spin_unlock_irqrestore(&bank->slock, flags);
> -
> -       clk_disable(drvdata->pclk);
> -
> -       return 0;
>  }
>
>  /* enable a specified pinmux by writing to registers */
> @@ -422,7 +411,8 @@ static int samsung_pinmux_set_mux(struct pinctrl_dev =
*pctldev,
>                                   unsigned selector,
>                                   unsigned group)
>  {
> -       return samsung_pinmux_setup(pctldev, selector, group);
> +       samsung_pinmux_setup(pctldev, selector, group);
> +       return 0;
>  }
>
>  /* list of pinmux callbacks for the pinmux vertical in pinctrl core */
> @@ -445,7 +435,6 @@ static int samsung_pinconf_rw(struct pinctrl_dev *pct=
ldev, unsigned int pin,
>         u32 data, width, pin_offset, mask, shift;
>         u32 cfg_value, cfg_reg;
>         unsigned long flags;
> -       int ret;
>
>         drvdata =3D pinctrl_dev_get_drvdata(pctldev);
>         pin_to_reg_bank(drvdata, pin, &reg_base, &pin_offset, &bank);
> @@ -457,12 +446,6 @@ static int samsung_pinconf_rw(struct pinctrl_dev *pc=
tldev, unsigned int pin,
>         width =3D type->fld_width[cfg_type];
>         cfg_reg =3D type->reg_offset[cfg_type];
>
> -       ret =3D clk_enable(drvdata->pclk);
> -       if (ret) {
> -               dev_err(drvdata->dev, "failed to enable clock\n");
> -               return ret;
> -       }
> -
>         raw_spin_lock_irqsave(&bank->slock, flags);
>
>         mask =3D (1 << width) - 1;
> @@ -482,8 +465,6 @@ static int samsung_pinconf_rw(struct pinctrl_dev *pct=
ldev, unsigned int pin,
>
>         raw_spin_unlock_irqrestore(&bank->slock, flags);
>
> -       clk_disable(drvdata->pclk);
> -
>         return 0;
>  }
>
> @@ -574,22 +555,12 @@ static int samsung_gpio_set(struct gpio_chip *gc, u=
nsigned int offset,
>                             int value)
>  {
>         struct samsung_pin_bank *bank =3D gpiochip_get_data(gc);
> -       struct samsung_pinctrl_drv_data *drvdata =3D bank->drvdata;
>         unsigned long flags;
> -       int ret;
> -
> -       ret =3D clk_enable(drvdata->pclk);
> -       if (ret) {
> -               dev_err(drvdata->dev, "failed to enable clock\n");
> -               return ret;
> -       }
>
>         raw_spin_lock_irqsave(&bank->slock, flags);
>         samsung_gpio_set_value(gc, offset, value);
>         raw_spin_unlock_irqrestore(&bank->slock, flags);
>
> -       clk_disable(drvdata->pclk);
> -
>         return 0;
>  }
>
> @@ -600,23 +571,13 @@ static int samsung_gpio_get(struct gpio_chip *gc, u=
nsigned offset)
>         u32 data;
>         struct samsung_pin_bank *bank =3D gpiochip_get_data(gc);
>         const struct samsung_pin_bank_type *type =3D bank->type;
> -       struct samsung_pinctrl_drv_data *drvdata =3D bank->drvdata;
> -       int ret;
>
>         reg =3D bank->pctl_base + bank->pctl_offset;
>
> -       ret =3D clk_enable(drvdata->pclk);
> -       if (ret) {
> -               dev_err(drvdata->dev, "failed to enable clock\n");
> -               return ret;
> -       }
> -
>         data =3D readl(reg + type->reg_offset[PINCFG_TYPE_DAT]);
>         data >>=3D offset;
>         data &=3D 1;
>
> -       clk_disable(drvdata->pclk);
> -
>         return data;
>  }
>
> @@ -661,22 +622,13 @@ static int samsung_gpio_set_direction(struct gpio_c=
hip *gc,
>  static int samsung_gpio_direction_input(struct gpio_chip *gc, unsigned o=
ffset)
>  {
>         struct samsung_pin_bank *bank =3D gpiochip_get_data(gc);
> -       struct samsung_pinctrl_drv_data *drvdata =3D bank->drvdata;
>         unsigned long flags;
>         int ret;
>
> -       ret =3D clk_enable(drvdata->pclk);
> -       if (ret) {
> -               dev_err(drvdata->dev, "failed to enable clock\n");
> -               return ret;
> -       }
> -
>         raw_spin_lock_irqsave(&bank->slock, flags);
>         ret =3D samsung_gpio_set_direction(gc, offset, true);
>         raw_spin_unlock_irqrestore(&bank->slock, flags);
>
> -       clk_disable(drvdata->pclk);
> -
>         return ret;
>  }
>
> @@ -685,23 +637,14 @@ static int samsung_gpio_direction_output(struct gpi=
o_chip *gc, unsigned offset,
>                                                         int value)
>  {
>         struct samsung_pin_bank *bank =3D gpiochip_get_data(gc);
> -       struct samsung_pinctrl_drv_data *drvdata =3D bank->drvdata;
>         unsigned long flags;
>         int ret;
>
> -       ret =3D clk_enable(drvdata->pclk);
> -       if (ret) {
> -               dev_err(drvdata->dev, "failed to enable clock\n");
> -               return ret;
> -       }
> -
>         raw_spin_lock_irqsave(&bank->slock, flags);
>         samsung_gpio_set_value(gc, offset, value);
>         ret =3D samsung_gpio_set_direction(gc, offset, false);
>         raw_spin_unlock_irqrestore(&bank->slock, flags);
>
> -       clk_disable(drvdata->pclk);
> -
>         return ret;
>  }
>
> @@ -1028,7 +971,6 @@ static int samsung_gpio_set_config(struct gpio_chip =
*gc, unsigned int offset,
>         struct samsung_pin_bank *bank =3D gpiochip_get_data(gc);
>         struct samsung_pinctrl_drv_data *drvdata =3D bank->drvdata;
>         unsigned int value;
> -       int ret =3D 0;
>         unsigned long flags;
>
>         switch (pinconf_to_config_param(config)) {
> @@ -1045,19 +987,11 @@ static int samsung_gpio_set_config(struct gpio_chi=
p *gc, unsigned int offset,
>                 return -ENOTSUPP;
>         }
>
> -       ret =3D clk_enable(drvdata->pclk);
> -       if (ret) {
> -               dev_err(drvdata->dev, "failed to enable clock\n");
> -               return ret;
> -       }
> -
>         raw_spin_lock_irqsave(&bank->slock, flags);
>         samsung_gpio_set_pud(gc, offset, value);
>         raw_spin_unlock_irqrestore(&bank->slock, flags);
>
> -       clk_disable(drvdata->pclk);
> -
> -       return ret;
> +       return 0;
>  }
>
>  static const struct gpio_chip samsung_gpiolib_chip =3D {
> @@ -1257,6 +1191,7 @@ static int samsung_pinctrl_probe(struct platform_de=
vice *pdev)
>         struct samsung_pinctrl_drv_data *drvdata;
>         const struct samsung_pin_ctrl *ctrl;
>         struct device *dev =3D &pdev->dev;
> +       struct clk *pclk;
>         int ret;
>
>         drvdata =3D devm_kzalloc_obj(dev, *drvdata);
> @@ -1285,9 +1220,9 @@ static int samsung_pinctrl_probe(struct platform_de=
vice *pdev)
>                 }
>         }
>
> -       drvdata->pclk =3D devm_clk_get_optional_prepared(dev, "pclk");
> -       if (IS_ERR(drvdata->pclk)) {
> -               ret =3D PTR_ERR(drvdata->pclk);
> +       pclk =3D devm_clk_get_optional_enabled(dev, "pclk");
> +       if (IS_ERR(pclk)) {
> +               ret =3D PTR_ERR(pclk);
>                 goto err_put_banks;
>         }
>
> @@ -1335,13 +1270,6 @@ static int __maybe_unused samsung_pinctrl_suspend(=
struct device *dev)
>         struct samsung_pin_bank *bank;
>         int i;
>
> -       i =3D clk_enable(drvdata->pclk);
> -       if (i) {
> -               dev_err(drvdata->dev,
> -                       "failed to enable clock for saving state\n");
> -               return i;
> -       }
> -
>         for (i =3D 0; i < drvdata->nr_banks; i++) {
>                 bank =3D &drvdata->pin_banks[i];
>                 const void __iomem *reg =3D bank->pctl_base + bank->pctl_=
offset;
> @@ -1377,8 +1305,6 @@ static int __maybe_unused samsung_pinctrl_suspend(s=
truct device *dev)
>                         drvdata->suspend(bank);
>         }
>
> -       clk_disable(drvdata->pclk);
> -
>         if (drvdata->retention_ctrl && drvdata->retention_ctrl->enable)
>                 drvdata->retention_ctrl->enable(drvdata);
>
> @@ -1397,20 +1323,8 @@ static int __maybe_unused samsung_pinctrl_resume(s=
truct device *dev)
>  {
>         struct samsung_pinctrl_drv_data *drvdata =3D dev_get_drvdata(dev)=
;
>         struct samsung_pin_bank *bank;
> -       int ret;
>         int i;
>
> -       /*
> -        * enable clock before the callback, as we don't want to have to =
deal
> -        * with callback cleanup on clock failures.
> -        */
> -       ret =3D clk_enable(drvdata->pclk);
> -       if (ret) {
> -               dev_err(drvdata->dev,
> -                       "failed to enable clock for restoring state\n");
> -               return ret;
> -       }
> -
>         for (i =3D 0; i < drvdata->nr_banks; i++) {
>                 bank =3D &drvdata->pin_banks[i];
>                 if (drvdata->resume)
> @@ -1448,8 +1362,6 @@ static int __maybe_unused samsung_pinctrl_resume(st=
ruct device *dev)
>                                 writel(bank->pm_save[type], reg + offs[ty=
pe]);
>         }
>
> -       clk_disable(drvdata->pclk);
> -
>         if (drvdata->retention_ctrl && drvdata->retention_ctrl->disable)
>                 drvdata->retention_ctrl->disable(drvdata);
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/=
samsung/pinctrl-samsung.h
> index 7c60375d5924..5390c6d1d7a5 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -302,7 +302,6 @@ struct samsung_pin_ctrl {
>   *             through samsung_pinctrl_drv_data, not samsung_pin_bank).
>   * @dev: device instance representing the controller.
>   * @irq: interrpt number used by the controller to notify gpio interrupt=
s.
> - * @pclk: optional bus clock if required for accessing registers
>   * @ctrl: pin controller instance managed by the driver.
>   * @pctl: pin controller descriptor registered with the pinctrl subsyste=
m.
>   * @pctl_dev: cookie representing pinctrl device instance.
> @@ -322,7 +321,6 @@ struct samsung_pinctrl_drv_data {
>         void __iomem                    *virt_base;
>         struct device                   *dev;
>         int                             irq;
> -       struct clk                      *pclk;
>
>         struct pinctrl_desc             pctl;
>         struct pinctrl_dev              *pctl_dev;
>
> ---
> base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
> change-id: 20261123-samsung-pinctrl-busclk-7211f2c20f58
>
> Best regards,
> --
> Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>

