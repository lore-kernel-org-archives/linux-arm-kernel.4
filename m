Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78A160A381C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=prmaEt3L;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=tKtrPj/X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3L5/R0TNdPI9wKc9dod6srzOhs1ZLS+127xQ0nrb1+8=; b=prmaEt3LLmOJP5
	KBEFTeA5RfXEKIQIPe2vXvpoJh5EcYUi5hb3Tazf50m1MYHC7QepOwtyrs67jxOQsGusmdRqDz6/Q
	kLbXpR7wXlN/YNqYMNu0UcLEGCgD5LJzbwtQ/mvbdf8WWugI/JD+jHhezft8XZ3JLLhLrrEiQvin0
	lbIqKUbvCWLh1Rio432DMqLsDjE7dLi4WH6iMtWeX8w6T4RHkvcYxBbIBEA21SJ40YYZWrD9lawFH
	UpqFT8VMw2jkBH0aixzl0yDvXd9eVa81CoZFsUoX3cdYATcjFYQ+u0oZ6QASzAloTa1eXfa1RWkbB
	yk5AYcNUmbi6qGORYJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRz9M-0000000EcxZ-3F2n;
	Fri, 13 Nov 2026 21:49:36 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRz9J-0000000EcwW-2XJ2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 21:49:35 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-6767d92cde6so1626988d50.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 13:49:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794606572; cv=none;
        d=google.com; s=arc-20260327;
        b=O7JsU0fiv1lJESdZTBxS+FJ4WnQTcoqO+YYEWKXc1K18Ct3vTll5aqJo8fv/uxbZ+g
         YWm0RZM6hZawjOQdIywkI5LcPi7HuQ+1JSV4HusvKOhoncN//DMQSz+2MD3vnYz1X4Wv
         FAN6XJKIixJBNeKz+z9jSlNcq9v0khyu3OosCe3w+sz24xNDxAE7topVAPnYBKYX4itB
         LUj4BQExbnjEzcMSf0hN97+8pXvrPJzI3YBvV9AIykTrDksT61cqo2c6rNOVVPLU6Msq
         5Iho6OIsXdgkc4R6L02ERkN7JtFku3SK8BKRR/2cT0mSVwMG9nHP/mZrPitOHWnl/FF+
         9wkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3L5/R0TNdPI9wKc9dod6srzOhs1ZLS+127xQ0nrb1+8=;
        fh=Oi+/iOz1rJ6e/Nmb7+y/JWrRNqN+I6Mej9GY2zjcy5Q=;
        b=md7+YkM/jfKnhif/Ky+zvwDHx3mbfm1LVaXj6lTHLh2npHpRTvkAkRDB6GXzyV/xeI
         sQ9BKMWYNJO1kLaBb9ri9Eu2a6wIMIW8cO3Kqy4epJmo0HKwvw9d0Mqym3TnaJBKgM4d
         z7Q5qBLCqR15MP0q7groa3Ujuyi//P6dPqhuJGq3HGOr8BiPNjUnWROM6IfZu/bVk51+
         eM1XuiNiWkqZHpRqyUIBGoirbdWbPhSIioysxYvOVd52bKY70V6Zap/ppM5S9f+rNdfU
         Twv7aHHIIhgzsxJrRnqU6vWdN8df7znPBzgwGxd/yR4NEnxQIppLAh/Q2JGuCHgV6YN3
         k54g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794606572; x=1795211372; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3L5/R0TNdPI9wKc9dod6srzOhs1ZLS+127xQ0nrb1+8=;
        b=tKtrPj/XX4N44IevHlFgAH7DbNuZGVFEQKyd25070wYbDFkMzLKiBC6oaxaJMznNMI
         5ZpZDiIH2/tRXV86476GP52nA2Y9fo2lU6ZYnLmM0YxY0ArcQ0WV53gZkOWRpOg/Gu/S
         NUyEj1j8DhHmn0BtemcEERk65Gf1nRW34DwxqCOLsHv5ycr6WQXIuarMlqUtLTlS6nhC
         3zDaShT3qVhSQqbJHXxtGsHYeTVef/oVbhd2WMIh+qlN2+C6UMEIUZaDGkiPZhTHkTzY
         i9SOwzAu4CbrEQa7X6+usgdCwnK/Yqbpv3ag/InA/wzV0xtvEn9QMS85/ww2Qa6LRSlR
         T0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606572; x=1795211372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3L5/R0TNdPI9wKc9dod6srzOhs1ZLS+127xQ0nrb1+8=;
        b=2CeRFITMQ3GNFIDqzAqXQr0YtFB7hye3nXngQ6Ywuzvk/9bCxuhHXYhUa+7tK9Wdjy
         On3JZYeF4TTLyekHyekxEQTqkJObUntMrT+QwVEWv7nIz2P9dqe1f0xMwVERthFcNb51
         KVOBhVyu5Ohh3KXOJUm9wkhs+d6v0PpgTPf86K1XZ1zrRgm2QOB1gSO3WiklYPdLazml
         k5vF6G8n457zisoebui/mcA/5x8P8dLN1VxqAObnhUuRB39G5UmqMOvnFN/7AkNBUnGz
         1kchV4858EiK3u5wDZfNYwDIif+VdwklgvXAWULMrAHtznOvCN4/QGMW72pO3n0EYW5G
         sQ0Q==
X-Forwarded-Encrypted: i=1; AL+hErH+Erg1LvK0+kk6OiDAW94bJN028SNS+0O4JaoVJWEnCDaEV9SRq00Ak9PL6ux+3bGrYAcs7G4LN3qxqMIvhLnj@lists.infradead.org
X-Gm-Message-State: APuU4Z9TForrf1lU6TAhEV9C1rEB9QyNDRRrXfYDFlQ2hVia919jUYvp
	X5IhB3J4RoQ4jrKlghrw46yY5t0HYPCSIETzTg/gpSjwyfGZzSBHbLU4Jm4F/JCNtBy6C63r8Rn
	oNkZvuk8qK7hsOkXByTHnO+RQP3BZtN4=
X-Gm-Gg: AYBFou161LG5ysHOlRIMDdmcgfOVBtWH9sRtQXJBLn4e81UK4jhIEpCmrN29pMalFwS
	IuTM+xSm+UVwiKfyb/0QaFPIevxZCgkxpuL8V+nDSB2wTl6bBpm98Mudmfr/urLT2SkzPTykJVB
	NObmI1eZrQXtJUeM98Vcg+iyI2xTA3CP4CcsnINXnoUn/AB6BS3kgoMhTbobGS9PwdxA6R0AgSF
	x584vgxU/sjPYwM5o7uviqtnO+99eyntMLRfSZabe811l8hLBJejN1IGrjnUbZqiJrCeij1wZ2t
	3ulk0H+WZsMD2C865a1M9vMmM5837TY4F473h/2UEOTd4Ti6GiQneVrbe4IGHLcrbgQ08W7Im+K
	HZcVPCxmOERIsHYfNlNhwi1XT4l3ifxdyAJdDYfS314ZtAzkenm14atU5wmIvubp72/k/Vg==
X-Received: by 2002:a05:690e:4514:20b0:67b:f3f1:1657 with SMTP id
 956f58d0204a3-67d895d1d1emr1805444d50.34.1794606572014; Fri, 13 Nov 2026
 13:49:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
In-Reply-To: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 13 Nov 2026 22:49:21 +0100
X-Gm-Features: AclHuK86y13cJB3U7lK1W7UeMH0dHKC_-NtrK8Vfy5rgx6ydsQHgJZMUNQRuLoU
Message-ID: <CAFBinCCKLhk1RZX725o84kMYTsiVZF8SE3rc52t5NuknwHgMGg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: meson: aiu-fifo: prevent sleeping when spinlock
 is held
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Christian Hewitt <christianshewitt@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_134933_660131_1F1CE3C8 
X-CRM114-Status: GOOD (  17.15  )
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

On Fri, Nov 13, 2026 at 2:56=E2=80=AFPM Valerio Setti <vsetti@baylibre.com>=
 wrote:
>
> dai_links in the gx-card are atomic which means that the DAI trigger
> callback is called with the spinlock held. This means that usage of
> potentially sleeping functions (e.g. mutexes) is not allowed here.
>
> 'snd_soc_component_write'/'snd_soc_component_read' take the component's
> io_mutex on entry.
>
> Replace usage of these functions in:
> - 'aiu_fifo_i2s_trigger'
> - 'fifo_spdif_trigger'
> - 'aiu_fifo_pointer'
>
> This is meant to resolve the following runtime bug found while starting I=
2S
> playback on an OdroidC2 device where the kernel was built enabling
> CONFIG_DEBUG_ATOMIC_SLEEP and CONFIG_PROVE_LOCKING:
>
>   Playback device is hw:0,0
>   Stream parameters are 44100Hz, S16_LE, 2 channels
>   Sine wave rate is 1000.0000Hz
>   Rate set to 44100Hz (requested 44100Hz)
>   Buffer size range from 128 to 262144
>   Period size range from 64 [   21.012074] BUG: sleeping function called =
from invalid context at kernel/locking/mutex.c:623
>   [   21.018009] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 2=
67, name: speaker-test
>   [   21.026184] preempt_count: 1, expected: 0
>   [   21.030151] RCU nest depth: 0, expected: 0
>   [   21.034205] locks held by speaker-test/267: 1, last CPU#3:
>   [   21.039638]  #0: ffff000003dbd910 (&group->lock#2){....}-{3:3}, at: =
snd_pcm_stream_lock_irq+0x40/0x60
>   [   21.048782] irq event stamp: 5274
>   [   21.052059] hardirqs last  enabled at (5273): [<ffff800081494240>] _=
raw_spin_unlock_irq+0x38/0x80
>   [   21.060856] hardirqs last disabled at (5274): [<ffff8000814935c8>] _=
raw_spin_lock_irq+0x80/0x90
>   [   21.069481] softirqs last  enabled at (5238): [<ffff8000800f9aec>] h=
andle_softirqs+0x584/0x5e0
>   [   21.078020] softirqs last disabled at (5231): [<ffff800080010324>] _=
_do_softirq+0x1c/0x28
>   [   21.086133] CPU: 3 UID: 0 PID: 267 Comm: speaker-test Not tainted 7.=
3.0 #2 PREEMPT
>   [   21.086141] Hardware name: Hardkernel ODROID-C2 (DT)
>   [   21.086145] Call trace:
>   [   21.086149]  show_stack+0x20/0x40 (C)
>   [   21.086160]  dump_stack_lvl+0x6c/0x98
>   [   21.086171]  dump_stack+0x18/0x24
>   [   21.086179]  __might_resched+0x160/0x230
>   [   21.086189]  __might_sleep+0x50/0x90
>   [   21.086197]  __mutex_lock+0x64/0x8a0
>   [   21.086206]  mutex_lock_nested+0x2c/0x40
>   [   21.086215]  snd_soc_component_write+0x38/0x80
>   [   21.086227]  aiu_fifo_i2s_trigger+0x74/0x90
>   [   21.086237]  soc_dai_trigger.part.0+0x44/0x90
>   [   21.086246]  snd_soc_pcm_dai_trigger+0x174/0x280
>   [   21.086255]  soc_pcm_trigger+0xe4/0x1f0
>   [   21.086265]  dpcm_dai_trigger_fe_be+0x30/0xb0
>   [   21.086276]  dpcm_fe_dai_do_trigger+0x11c/0x1a0
>   [   21.086287]  dpcm_fe_dai_trigger+0x40/0x60
>   [   21.086296]  snd_pcm_do_start+0x4c/0x80
>   [   21.086307]  snd_pcm_action_single+0x50/0xc0
>   [   21.086316]  snd_pcm_action+0x88/0xb0
>   [   21.086325]  snd_pcm_start+0x2c/0x40
>   [   21.086335]  __snd_pcm_lib_xfer+0x660/0x810
>   [   21.086345]  snd_pcm_common_ioctl+0xa20/0x17e0
>   [   21.086356]  snd_pcm_ioctl+0x3c/0x60
>   [   21.086366]  __arm64_sys_ioctl+0xac/0x110
>   [   21.086376]  invoke_syscall+0x5c/0x120
>   [   21.086386]  el0_svc_common.constprop.0+0x48/0xf0
>   [   21.086395]  do_el0_svc+0x24/0x40
>   [   21.086404]  el0_svc+0x54/0x3b0
>   [   21.086414]  el0t_64_sync_handler+0xa0/0xf0
>   [   21.086424]  el0t_64_sync+0x198/0x1a0
>
> Note: the return value of 'regmap_read' in 'aiu_fifo_pointer' is
> intentionally ignored. Regmap is MMIO here and read failures shouldn't
> happen. Also 'axg-fifo.c' is doing the same in its 'axg_fifo_pcm_pointer'=
.
>
> Fixes: e8712315c44d ("ASoC: soc-component: use io_mutex correctly")
> Fixes: 6b59c53c8adc ("ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF=
 datapath on start/stop")
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

