Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79289606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bl7nplsL;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jA81KxLQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/AZpVI7KIqymZwkfQLbTYKoY9euwaZTWbbcMfI47B/k=; b=Bl7nplsLO0n4db
	5CggV2tWmWV/8Kx7jvDAhpp3nYHLeNY565/hMvBUpcu/9rPGX1kHhEtZuQxVFin6fbZBy2NU181xP
	bYEvPrd9N82Jqwi9oWu18Yd4VEo0d+O4yQzFeuCsAZ4fRTY5tFF/PEBrf7+G5fAh0DDWMWLymhrld
	/TJYPJ3nAMwVucL2bdcy5osXdoYXb6VaFOCyEiRv2TkKP2iTG4e8D0M7lT2SKna2w0w+ihlQ9vtPm
	77g2PNDh3IFQyyMIXoE1HLFaEy+ql5hQJuf7qhUeO5sY8OD+Ez8hmyitB82UISJdY+Y4XVNbANtPy
	J9v1BuYNgJPGFjsxSPzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWV9J-0000000CQnT-0nr5;
	Thu, 26 Nov 2026 08:48:13 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWV9E-0000000CQlF-2Skq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:48:10 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-8b4fb5d96b3so104453097b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:48:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795682887; cv=none;
        d=google.com; s=arc-20260327;
        b=l7WVpgPOrIqq0sPv5X0UG9qE69RHrRIWv5x/1Dbjuc31MoF0RbLEE8paM3AUaC6BNw
         lZ0Jj7fgGH16m7+/+Dotn44g7GgdCMs6UmhVSaXE1D6DGLKS+O7ZTPO3R224OIg2izcG
         BJtmG8cjj2jmkzvpvnPzECuL1PjzZw+m2nzZtfJ/OvAcUzDPf3W/fZ1D3XL+t3z8c7Hr
         RmHKMkdfx4yNq1rovYNUbOgP2qZPNZ5dZOmWbYStq/RKMNngv0m+b3ONsDXjrVtbzUUn
         ttXYv1ISAZ21Om1To2HayPAU1jPNRf3AWA8njxJYp2+YSBpuNeSwssWt4tsJkXqyiA/M
         LMQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/AZpVI7KIqymZwkfQLbTYKoY9euwaZTWbbcMfI47B/k=;
        fh=rXdOry+f6HBR58l9XuCAjuA6D1ri2hG1Caxi5c7EyNo=;
        b=Pmxg13Hl8vG9TGXrY3xcBir6JyfZccIDgdjTDVMp7dl998PHTKr5RSGnykdQk6br9b
         TqxYrmv9RA+85UDmftBU3kQSk8bnGZyRo2dBh1Zt6shxD8pZe1aw7EYGJV4kpnFW7hmj
         OtDdxN7yN2N4F8Ao9YI1yl6w+X1LSGyxjxWBNg1ZYrF8dOsqOyeUqwngmuiXHH1YAmo6
         o2duhUoeoC2++noeFALwyOhRk183VdRoTXQRuScAFXIhBlGvE1+LyjnuxntK90ssTknr
         8Fj/98sY9VkynDlrJIkvZdn2w2n8uGI1HSifBLSAvARUpUHVyzwCs3At0eG4w3mhRJmF
         EzEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795682887; x=1796287687; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/AZpVI7KIqymZwkfQLbTYKoY9euwaZTWbbcMfI47B/k=;
        b=jA81KxLQcPjmNe9sst1H9QOLmmtBo4Grs45EjD498i2eo8cigk0fVmVLN5Gxk47Dx2
         jEhjc9aPGlYQ9doxk/lwxMGCdY9p7b/xJS07wd27pBgvxFkoaCR1Zywa6Yd1M+WOC9Cu
         kk64Rf/R4txzrwMhzlPj1lRt/NxP/I5AOp/bA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682887; x=1796287687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AZpVI7KIqymZwkfQLbTYKoY9euwaZTWbbcMfI47B/k=;
        b=JAq45xheNqKIaV7xVM0bu/YBDU1wkrZodWjyLNPob6VMU26bDdt7HLCDUDkbcOtLQQ
         AwptCeoS6e5zRXWTDP0V5rH/2osPoIek5ktjOTA0mMt82rHB4HhDRQi8DQWurO4Ca4l+
         GOHYcWfrKxcHJMILyiPbBosXrMyBdgsiVnNDo5bg+c5Zcv6/MPboOIA129M8BS07gEq3
         ExE/558fnYcbGxk8BFYcq37OQNKZydCLsw5CLwkYBswsjT5u1nEu6o5AD73ck9V9oo6o
         55Q9ADsuT7RbEYYlCDK3pPNZn0+iVu0GxcDALi+aoqXhFostUs+CEFGwdUO9sJU0Rkhl
         AZtA==
X-Forwarded-Encrypted: i=1; AL+hErH8LJExT88E9PhuzycDHVWrTVmIzU96pq7Xce2oDtSjJXqAvItF+ubeeKK+OJqkDnd5R1k4aV1bi3KoIT02aVil@lists.infradead.org
X-Gm-Message-State: APuU4Z8fKfDliCVgyvFFi940xxfSjOuYGEwv4vLuJK839eXY7s+pUz2X
	aTT3FePM5+z8AAK2+OHOoqwc2CyWPy07+wNOkfGcWSGFKx2i6VUEqLe55o1Oek7/1+o38x2tpFb
	q96unbajqkEAvmdLNSleywvc6+fWH3lsWRSG3D1e8
X-Gm-Gg: AZFdTZeEeCqcJoxzWR8I1iH0rNl8vjb1ikH1fQ8jc2H8agNE3Or62yESWITJXBnWZbK
	12aR6QlVRXOmZVAL7YNOTrQBERGAzYR9T3TUD1IQpIlLEL5jXlFdV5IlC5kmW7ujAms4SAluzky
	G3aqStYvYkwbek9iyOJ2gfC9LXLwYf+izVNv5j+WH4fIVxTOHFV4kc5wbBt5bvUO+/aTc4nFvy4
	QoCbMOVV0KLiwLdERS5f14XoMpAzjeKUMTU//pTgFmHZRHFKM3Rn0s3aWZBwhvTogdeNrBpd0Hf
	lXWtrg1iEeXAs9rCaQifz1oNsMqL2PS5gvttxdP5yzEFymL3bx8Hy3tzFLaXBLvLkHrYMjppeXK
	QZHCbzU0g0WICepDBSIpYiXaBfTf5jj1zVM9L6cfuLFbDbiURdqMJIH5uKSPNVh6ITCI=
X-Received: by 2002:a05:690c:3181:b0:8b0:e13c:2852 with SMTP id
 00721157ae682-8b518e8aa28mr76705587b3.7.1795682887386; Thu, 26 Nov 2026
 00:48:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125-timer-mediatek-gpt-irq-order-v2-1-e9e793bd87d4@gmail.com>
In-Reply-To: <20261125-timer-mediatek-gpt-irq-order-v2-1-e9e793bd87d4@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Nov 2026 16:47:56 +0800
X-Gm-Features: Aa3M54qf4cs2aSjQ1h2bRvoduY7bxQ8dKJy1_2bbcHeKnvBYrvNW4fHBBOgXtRY
Message-ID: <CAGXv+5FEYqMrpL_Kze=Q30CEozpUQND-qX-hVi-gLZMpkd6r2A@mail.gmail.com>
Subject: Re: [PATCH v2] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Luca Leonardo Scorcia <l.scorcia@gmail.com>, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_004808_666878_B6BF2CE1 
X-CRM114-Status: GOOD (  18.57  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 1:14=E2=80=AFPM Ryan Brue <ryanbrue.dev@gmail.com> =
wrote:
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
> is clear, the status register stays clear, and the waiting CPUs are
> never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle state in
> use, this hung the boot in 20 of 40 boots; with this change it booted
> 16 of 16.
>
> Enable the interrupt before registering the clock event. The IRQ line
> stays disabled until enable_irq(), so the handler still can't run before
> the clock event is set up. With the bit set, the timer that
> mtk_gpt_setup() leaves running could latch an interrupt that
> registration doesn't acknowledge, the kind of pending interrupt that
> commit fc686d0037d7 ("clockevents/drivers/mtk: Fix spurious interrupt
> leading to crash") acknowledges in mtk_gpt_enable_irq(). So stop the
> timer before enabling the interrupt, until the core programs an event.
>
> Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF p=
robing")
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org> # MT8173 Hana (Telesu)

