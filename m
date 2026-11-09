Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6199606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JmvCwv4O;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=l/39h8mY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6+yKcd34YBJDbehP0dz+di+4vqNJ4KlYRH/PR+seNMI=; b=JmvCwv4Opyp/YX
	v6JIobiILOQcqKJZlKFw3DENswZkcRfhd1mObAEEM0DQrVvuQsJMfZBeoJor7huVYxga5XCs4be8J
	iiCZ6zfQTpRJ1m6WVtevzIhR0NtGHMuMjhwkVzh5lt6RAhuc9BOnin/hGq7OdEuCQEoVWoRzidfgK
	yHmMtdXRdp6GNaSVSvWliXILw7fnjCF6Bc/X7FH5OiqnAqzVbU63bbHqjuv0Z03R9v02B2oYgv0Zu
	1dFszjh1MAEXlblRi4ikTQ6iAS10Xq8EfsY9Cv4zRZ4wUfaWo3XCUGbLLR1MlZ28H4FXRhwhGIpjk
	IPk8XwnDfGgRLxm5ePaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQM5q-00000000JNu-23Or;
	Mon, 09 Nov 2026 09:55:14 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQM5n-00000000JN2-2TyP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:55:12 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-679a2b5fe87so692053d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 01:55:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794218110; cv=none;
        d=google.com; s=arc-20260327;
        b=rXbfARIfu9GLOAUCw3luqSSLKWXJvNuGbPlCHm65ZnYC/qYKPm342Aw2/IPX4zLm/m
         9+VkZzaSOP+wTyrH1noDTLm1zcilhtZ4M+aA44rvGk7IrpJXW+hjjz12R9fQZKy2lpQh
         Tc/QeLLdHEFgzPPf7X8c0ANW+efoq9INbUm5dP/lWZFT2mHR1nmBt69sL1ShPXolxZA3
         uCGnAxNbHnc6OCNoYSbpsl15bJw+nzGXSVBmdUrKI4DV4u9H6BjZnsG8rbnrTgyI4DPo
         eSEH3v6i/DLLTdCPpZn9yh5fKYm/wcgB9puyM9Ufdg8s2fZO38Hk+lI8NMfqgc1+ykN5
         VNDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6+yKcd34YBJDbehP0dz+di+4vqNJ4KlYRH/PR+seNMI=;
        fh=TOv878xa3ABOUp1VPSODWmvEh+c63LL1QQ10dbTzMvA=;
        b=SBqQVr6TrYGd38BDJLymw6U1rxdcn6QFPv/BXULaKf5lsJHsUjc92S8JiczmSlfr/E
         OPci4NOI3+Ot78lCt4Oh/sxPzIgY4xhsrd7/cQWHsBCPFDCsnCIBPqxHqsE+miYxo198
         qCjidhaFnUQ837SlGAcp0w0X3bQXLPzI/YOLAe/xVL6XSgJnHTclLS15VQp0h4a+0T7u
         IxQN3A9tzsQxRbAjStJVg9t6Tr9INqp6ntFtYpY2sa1aBvAxCICdwzO7YFI/a+PqhrGL
         s7B4aMlkdf9zRgFghjre2mn32GmOHgvZdE7jiR3drFR30CnLPBjE0nWyVzSmtwkqELCs
         VyJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794218110; x=1794822910; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6+yKcd34YBJDbehP0dz+di+4vqNJ4KlYRH/PR+seNMI=;
        b=l/39h8mYNFIY/cAkPooxvjHlo+PB9Ld+pcPqc30KirIIm6IsNrf2/+o1Gkr2g2IigB
         pvFI9LlTtRiWzsAY+bDRn3bv0NZjuiExWnXMQA6hf6VgjuOXJKwFFuO2p8GDvbtYjvwh
         GQs8iN58/6iQXed/2czsAjQwps56f0KNvk180=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218110; x=1794822910;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+yKcd34YBJDbehP0dz+di+4vqNJ4KlYRH/PR+seNMI=;
        b=YzbXL/fykEVVm9EUAOIyK5Gcj8E57p+0jXFvUJ+INYCGIm7zEIve92gcA3MhCtyXYz
         KRzeBLvh4EYUkS2ZMPcYqBWOSYe3VnuIIo4yBssYLIqsJI7DJSEMSFN2WEJP6KTquIY6
         ZDJ0MxPyIOcVx9vi8l04G35r8OrGi3nsiCiukBSQs2A/Vg1y9kykVA7cB9NhMV/1L5et
         LQ1b2yy1CpK6M7si3SewqyalbTL1L3m3Lz+k2foO14rJbb3oHIZg5gJtIRSKuTMpBalq
         NIASNReMtTWXYw2A5IHPeIz0wHscPPy1qyWnQKggFCyB3s3vHriQWbATXdGaGAsMPjFA
         Ac+w==
X-Forwarded-Encrypted: i=1; AL+hErHuM2/m/2iEyNFET6bHd4VImD41KHu9GyGR5MXIXojybiZLG6nF2SdroPzvWJMVJau0rufe19x52eV3MhxZQUPY@lists.infradead.org
X-Gm-Message-State: APuU4Z8YJgRQXie72f9TJPmh0SvA3+F3QjK6YNjrh7AhCOc0/rFORY3e
	buFVij9iWnQ1M18dp6kGfjM/a/PwL5Bk+Mdrk5Ok/mIlYItdQ1oKFFzYnjKGEl6dCb4Fau9Mpah
	m9NiYMCn/IrpSocJn/EzwG0WS3wfNCe3BSCxPeJND
X-Gm-Gg: AYBFou1Y1Z6OHLd4XSqW9cQSIeIUR4xKRD6GyISLaTVoAc8dz/AkaOxwmvKDmKXdbBm
	5xx3eWmkoxuJSiNu6ozvvSp3VG4iyiqM4blfELGV0wj/p3ef7lLpnlRsNMRCGcOOPk7yzAMzWp1
	skSrAGXF7FLnHAR6lQo1XRdrwVtLrZBleP4hJh36QUbpybbYBLNMFqp820j/SOepdT1OmpQtF/v
	4GjTM2hqkSfJAl0J15od/bNP4yxpo+pdMQuRs8YZESyrFsyaT7S8dmvPOtSlHpoGr+h5ssvmCY0
	MmuwJSNxknonGtsETE2j3Idw8KCbyPSO9ONL32l6k0WCBkhn22nQNZAosAaYTFUBu/PNMOdR3PY
	lhpu5AVDuDPJ7hozPhEpDtFclanXYVb8h0FYqUQ==
X-Received: by 2002:a05:690e:304:b0:679:9ad9:b103 with SMTP id
 956f58d0204a3-67c3da632ffmr1254960d50.136.1794218110297; Mon, 09 Nov 2026
 01:55:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
In-Reply-To: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Nov 2026 18:54:59 +0900
X-Gm-Features: AclHuK-bIXuY3rwirQbdsttFwHYyj6lmMzuR08wUI0ixSLbLjL_ihv4G533qIVU
Message-ID: <CAGXv+5FSG5P3-4-eijurDA68NzcFOXJN5k12WV9SJ+_3wmTjPQ@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_015511_701516_37311EB1 
X-CRM114-Status: GOOD (  31.50  )
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

On Wed, Nov 4, 2026 at 8:18=E2=80=AFAM Ryan Brue <ryanbrue.dev@gmail.com> w=
rote:
>
> Since the driver probes as a platform device, the GPT clock event is
> registered late in boot, when PSCI CPU idle may already have put CPUs
> into a state that stops their local timer. Those CPUs wait in the
> oneshot broadcast mask on the hrtimer broadcast, and
> tick_install_broadcast_device() arms the new broadcast device to expire
> at once so that it wakes them.
>
> mtk_gpt_init() sets the timer's bit in GPT_IRQ_EN only after
> clockevents_config_and_register(). The forced event fires while the bit
> is clear, nothing is latched in the status register, and the waiting
> CPUs are never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle
> state in use, this hung the boot in 20 of 40 boots, and in none of 16
> with this change.
>
> Enable the interrupt before registering the clock event. The IRQ line
> stays disabled until enable_irq(), so the handler still can't run before
> the clock event is set up.
>
> Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF p=
robing")
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

This seems to have fixed the cpuidle related stalls I was seeing. I
didn't do that many rounds of boot tests though.

Tested-by: Chen-Yu Tsai <wenst@chromium.org> # on Hana (Telesu)
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

I do think we should expedite this into the kernel, as a 50% chance
of stalling is not great. It was even higher for me and somehow I
had to do a hard power cycle by rebooting the EC to get it unstuck.

> ---
> Since v7.4-rc1 the MediaTek timer probes as a platform device, and on
> MT8173 with PSCI CPU idle the boot then hangs about half the time: the
> broadcast device is armed at once to wake CPUs that are already idle,
> and that event is lost because the GPT's interrupt is enabled only after
> registration. Traced on the board with prints in
> tick_install_broadcast_device() and mtk_gpt_init().
> ---
>  drivers/clocksource/timer-mediatek.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/t=
imer-mediatek.c
> index 842d6ee4259e..1b2cbcc2795a 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -339,10 +339,10 @@ static int mtk_gpt_init(struct platform_device *pde=
v)
>
>         /* Configure clock event */
>         mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
> +       mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>         clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
>                                         TIMER_SYNC_TICKS, 0xffffffff);
>
> -       mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>         enable_irq(timer_of_irq(&to));
>
>         return 0;
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261103-timer-mediatek-gpt-irq-order-a878ed869f84
>
> Best regards,
> --
> Ryan Brue <ryanbrue.dev@gmail.com>
>
>

