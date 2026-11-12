Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAEC606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 22:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r6SvkwD/;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=JCx5HzQB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EopehRq5ikgbdAiXlBfLUoKgyr9SSArgqvetpz1gLic=; b=r6SvkwD/pSTPAa
	17+/vki852/1dYpCkR7fKvNoEnFifMqY303CAqRaRSXg72z7tCv85cInaAN2t2hHz9TTY3eWhfvB6
	aT9ghBN17l7c7/8ez4VFFT8pZwNXZmobZzw004Cd486BE5JJuFJQoWBl08zQ6X1YwXjtJuyeIQBJF
	lZimgUShZ0FOj2x/rYvYjtBy2iT6nnADfC/rirK48woDJUJIw+jXEWN8b+8YPrEQEiNKB7LXtMPgr
	SYq4GxAbGIXfbYDznRCsCWqFLbIK1oPMMZdKQMjrWFAbQnNvi+BpOIQ1IBqdKmp098TdhRflTxNjg
	qmaiOJw4Pgb1p5+cD81A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdlY-0000000BDeb-27Fp;
	Thu, 12 Nov 2026 22:59:36 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdlV-0000000BDdQ-1aF2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 22:59:34 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-67be7b9abc8so278368d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 14:59:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524371; cv=none;
        d=google.com; s=arc-20260327;
        b=Hg7ZK3XkPIVs2lgE+ouvCYBI+GPALlwPcu2fiLXWE9aEusxWqeBao2xfdkcQWFo5Nw
         vLg9Phq0AruLFI24PZ000rtpmwS6JRNj2HpuK9Z7K+DCo95dXMpcyPZRaahnMWnFQjPW
         PaGuD+/zSjl9l+dSUKhQWKILbLNV1rc/9ucJf0lZpGpD/Gd1x5rgGRYdBEgAc4813vng
         E0ngCLtT/BEZVh0ED6DezySysw8CfQZDGIqD5PE7e7hUbDJ+U2RZQW2MQesL8qCKmWoq
         8QKxrltkmqkmywukn7YerkB+W5CRLn8SYhMFIkfw28kAL6M96t3awmKXAYElWea9aGY5
         V9Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EopehRq5ikgbdAiXlBfLUoKgyr9SSArgqvetpz1gLic=;
        fh=Oe+8bzXeot40Kr9aQ4D0WJVU8QgCmEQ3lERymJLLX9M=;
        b=X2kpZHydnOU2eXgS+fAtIQ6QK/sU/g9E1O+YPdUi67cfdZzWyOBXjfen5AN4sUzD/0
         V7kR1GtRaqMnyxAweoaMiKQpb8mFInyeNkOTN4iY5gIkcRLZWJxNXwUCoc0maWM41jAV
         Km3zN+aLunL5gc3FuYBeJ7adfuZnfEX8I8Ji96Tlyyp6xobqLeZDF+7a0h4v0qaV7Zwn
         hfXJGa9OA045FU7yujUM1LY43ASioR1rSLwrsRZzlRmL9XVIRxaaJ4cb1XzSfX+KRhKb
         Lsu5UM/628fQvXXJu+KJQTsiPXBoo/fAmGeCkWJ1vG0ozphMtZ7vFS6lXwxa6Dmu40jN
         srmg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794524371; x=1795129171; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EopehRq5ikgbdAiXlBfLUoKgyr9SSArgqvetpz1gLic=;
        b=JCx5HzQBz6705+i2l3H3pkv90UGiH3JxBS95FHC/HNujq/6ec1S/AJ/nPo+70QPlRC
         sFvPFx5okoOJ6+keQROKHgKjJM/IfF3hpESqi+v5uoTRlsPIgfNauuawdvwgSFw+zumm
         UZYMHje2CyNun724TuvjYQB0hMIMKZXhFXS34fPLmWM8TZ/D/GTgESbRMC2SzLWHK5JU
         JFe0DIqN7Uncs63ht/6aYwyIB7j07nizJRpW6uzOYvj3/nsT2tncN9kXJRHmA+MSxVdE
         Noc8NL8z0euJ2eM7/Kcr/3BeKySTw5nYl7EaKH3CQ9jrw/GwEP/kBX27UOrYR+dkzcih
         wmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524371; x=1795129171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EopehRq5ikgbdAiXlBfLUoKgyr9SSArgqvetpz1gLic=;
        b=Kh/JpSUZli4C+M22gBglQK3i1Zn0oDqeg4RlD+ZPJ2hJhAvKd3Dvij0t2HVOinidGh
         fn0uF9NWydZcCY1m5rMFev3+gtjkV7Ci5kC9HdsLb4d02tMjnNdXeGQwmWNy/BiYbwQR
         mdial2DgGdUuViMl5t/77tIjf2ByfsPGat78G7ba2rETs4eonGCzIJgy4TXaSrMbXVBD
         +T5ftHHM6utBULgGbJB+NSoh4ZZAG3JF1LR5Ov8VzaVbmHnJnU3kbKJTrNpa/X300MLv
         nttnI08mQhr5SgEUN6uTFJsT3HBpxnp/2F2RT/BwN0z+mUvuMwxeL3v9ekCcNrcvc/YZ
         953w==
X-Forwarded-Encrypted: i=1; AL+hErFvgg//3wFB/q6AzBuDrrPs1pwZw8pIzCXtPVojOQMZkvIw0oi9MxPbwLSNs/dTE2NGLh+T54U8zd1ubShk06ie@lists.infradead.org
X-Gm-Message-State: APuU4Z+mWRIGyQPO6AotBaEUMg8DYuE9cT1CjT4GsYdpA0lf9EmMskOo
	8aOaG5a3AhUZhFk+sxRi7RcOMbEC37NREevPrp1JeKnhqeUjVmo4QilM/7MHWe3LOO+meLsP2Ig
	0YfYwINS8T6XQ6Mb5j4GRuQoPvDuZnV8=
X-Gm-Gg: AYBFou1XEiRseM7Rs+DV+88ybsjtHaasE/6+Wox871hjx55i/lWyHFO32y2aTCL+GyO
	GqaTIHKUOPgf0h/VSO3PkkDx1670V8pB20UNPGzJ3g8dC8JLeKEfscSFuv3mzQLcshFwPyiKO6B
	P0nmh9rarYOJhLZ+CA3HBGwyckS1kyyw9YqOfFmmpSpl+cY7G9f2q6qfXyPeqfEXrAbb86riVT7
	EzeRc9t/uh+tYlBJY9rutn6JN9tnMcFJ+/F6Si/tFYIRUkT86ClM/+K6I12Owkt/txhvBcxTRFd
	98zNvygMOGRGdELd7epY4TtclTXyD7Ou8EApzyocCSI9a2kGSohyR/ubhdFJuwwfpLdkinA/2jY
	cERH0VmX6nc7MgR4iQ5QlwVzRgMQbyHQfopejdMURIg0zPqtDKpNRwV159p3uojVIyuwaYRlnb8
	BjnFo+AJgd/R3waiM=
X-Received: by 2002:a05:690e:d83:b0:67b:f64e:b323 with SMTP id
 956f58d0204a3-67d897f316emr491608d50.87.1794524371234; Thu, 12 Nov 2026
 14:59:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
 <20261111-gx-formatter-use-spinlock-v2-1-763241aeca52@baylibre.com>
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-1-763241aeca52@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 12 Nov 2026 23:59:20 +0100
X-Gm-Features: AclHuK86E7RwyUwDuKN1XBLuFvJlmfcg53qNUpHMBnQ5zRn_8wYfmQuNj2Yj5C0
Message-ID: <CAFBinCCdqpb-d4wEThYCLLEa89eqUNycxn7BYHMq9a6nTVPL=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: meson: gx-formatter: change stream lock from
 mutex to spinlock
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_145933_432644_CAB7B1AA 
X-CRM114-Status: GOOD (  19.28  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 11:12=E2=80=AFAM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> Currently a mutex is being used in 'struct gx_stream' to serialize
> access to structure data. This was inherited from the AXG design. An
> important difference though is that in axg-card dai_links are nonatomic
> so callback functions like 'trigger' are allowed to sleep. In GX instead
> dai_links are atomic.
>
> For example, starting playback from userspace with
> 'CONFIG_DEBUG_ATOMIC_SLEEP=3Dy' results in a warning message like:
>
> [ ] BUG: sleeping function called from invalid context at kernel/locking/=
mutex.c:316
> [ ] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 272, name: spe=
aker-test
> [ ] preempt_count: 1, expected: 0
>
> due to the following call stack:
>
> snd_pcm_do_start (called with spinlock taken)
>   dpcm_fe_dai_trigger
>     dpcm_fe_dai_do_trigger
>       dpcm_dai_trigger_fe_be
>         dpcm_be_dai_trigger
>           soc_pcm_trigger
>             snd_soc_pcm_dai_trigger
>               soc_dai_trigger
>                 aiu_encoder_i2s_trigger
>                   gx_stream_start (takes 'ts->lock')
>
> Fix this by changing the lock type from mutex to spinlock. This is safe
> on GX platform because all formatters' functions only perform MMIO regmap
> calls that do not sleep.
>
> 'spin_lock_irqsave' is used in 'gx_stream_start'/'gx_stream_stop' because
> trigger runs with IRQs already disabled and stop can also run in IRQ
> context (e.g. in case of XRUN while executing 'aiu_fifo_isr').
> 'spin_lock_irq' is instead used in 'gx_formatter_attach'/
> 'gx_formatter_detach' in order to prevent IRQs on the same CPU that might
> end up calling 'gx_stream_stop' and therefore deadlock.
>
> While at this also improve 'gx_formatter_detach()' by moving
> 'gx_formatter_disable()' under the spinlock guard. This makes it symmetri=
c
> to 'gx_formatter_attach()' and ensures that the prepare/enable/disable
> formatter callbacks are called with spinlock held.
>
> Fixes: a295be8d6210 ("ASoC: meson: gx: add gx-formatter and gx-interface"=
)
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

