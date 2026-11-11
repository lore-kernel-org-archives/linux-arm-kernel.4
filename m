Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C09606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 02:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mmIBBKgx;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZ3cW4Nw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4OlrevCe0/UiiEV9eDZQ+cK59Yv0r9XD6ToHjH9AnwA=; b=mmIBBKgxUxCo/n
	APhHE2MFBzcLvCc70eT3NruqiHdkCI5t8BDKk/W2KeIiQyzqE1hKbYRgVlsQXrRexd9TIS9nlPjpn
	m+hOV2/E15pwC7q+IHx76KYgxHy8risA7NXgNuC451hcsACWeqqu4BIZyZtvhx/1Iu9GZ1wxpxGIe
	p5fSbiS0DTVPJL4ruqTYZSf1HAUq73evkUQtqQ5XLl57E9qM/TeUR3n0pj6nthfi+ckGsvG+xfBHl
	z2JtnmkbKPoVzWrSAI+N0eFvJUnwv0wsLRjGq5erV8kWwPND+Pv3h4azIFxSrIo/epkNGZbx0plgv
	XN8GH37fbmqhKYPE80bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy0Y-00000005RC1-0nGw;
	Wed, 11 Nov 2026 02:24:18 +0000
Received: from mail-oi2-x0a.google.com ([2607:f8b0:4864:32::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy0W-00000005RBG-0InB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 02:24:17 +0000
Received: by mail-oi2-x0a.google.com with SMTP id 5614622812f47-4c3bb46aaf0so1118278b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 18:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794363855; x=1794968655; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4OlrevCe0/UiiEV9eDZQ+cK59Yv0r9XD6ToHjH9AnwA=;
        b=WZ3cW4NwYv4iQkBB13fJBozz4+eH+oiAQqQWh1WzyGCDskazajciXMSsRG4dH0sxZ8
         raQ3a2seFfATWcAHd6BMKPje4NgONRYkxFcGy2m3jAuHzn0JzXY/JqJ/mBLAizS2Fc6V
         b1MMIliZrLtNC6YRGftXllCTxR0+ID+OiCj1Ozd9STMpd5xmRtjW6MUr5UbV3dRSnvsG
         Zyx8/B5mnvX8jRRoKvWmefCDbgzORJAkRWgfiDfB5OKTbHXtt/2gKZvH46MxRLTZ/yyd
         Lul5bRk60tGCTzWxel9gXftFEkFCAbGvDiLuwloCJVEDAMV0c8vfjILFaM7aKXcd0XsD
         e/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794363855; x=1794968655;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OlrevCe0/UiiEV9eDZQ+cK59Yv0r9XD6ToHjH9AnwA=;
        b=UmlgHfzOgf3yiqMFeJFiM3AET+60jhkNoewpI24xYD1vSf7tt9YwIbhfq6fcGZ2FKA
         QQRg0ESh/76QJZb4G5GqsZimq5dWWS3YKGCRQR8saqubYBtagUaFLDZgvxEOeUYrtDx2
         wNBvhe7S3sJe52603cTzs5v9cGXK/pUjl5Y7EtSNsTBiCsIk4QtLcnl853rBVBlpiHKD
         zFcJQI7MlwNrclhh5Nw7T7lrXY3rEw1/bwVbXEeitONBOBhJTvn0q6MA7RA/ib+6bSC6
         vlml4SvPdi3fc/FWBR6GPxaKtgQjAB7kcuBoJ7IhiEUgKkMws4Yto41ZkABSnM43wE4P
         brgg==
X-Forwarded-Encrypted: i=1; AL+hErEiwqoy6GExgxvdjwvJJOmWGxSyIwezQCg0dzUhKvdH5qI481p9pyToltWeMhoGP19e87qHEHeID6vM//U/urZf@lists.infradead.org
X-Gm-Message-State: APuU4Z9Yl1AN9gP+TUFxajfMuHLUyy+3RNKK/Zs3/Tfwx0Oti80em17Q
	uTDHSCTlh3ar4HE3mtZJDihST4wDSZpEsbXFLYo51WxHgoTxQ7c5ESMn
X-Gm-Gg: AYBFou3Grzivr7yj+c0t7yYuB1HMge5mm/2m7mP8hefpGw7xxDuj+oMX8roAnkkjncy
	qeDhCRYukoKVRmmcSdGltGbdgdMAMBDokkMbfpY1U3sJYkynU/wJl1yhA/yDvcIzW8i4WmpmCGF
	v8cYcFl7GayP6z1YaR+PyMmvqxUxdTj7U6CfJKdRRllbKBkAPs9ZpI0QrgWxLCpq6GSacBZxPQM
	DPpqTfl+9hjaGaMFFEuxniTAbiomc+JHgGKVumGwqFS+HxqGk/MMYU2cTxXExhG4V9lnr1G7bLT
	v/yu2ZEOAixK34AOgsw877YQ8+X2wo8Pecz7L9LKdcGpelKCxnVx1tB1aWkAgO5jh85UbpNqTjB
	b3dr5jr1dxxBY+iB3y9uHgybHDkyFFtLTI/gaKWFlMgXZ/AMr8cIMxteIvdo9hBHHAaMnTa8PMY
	fh59y4c/pPe+8OpMblIg/c/x2eczWFeeja3I7ZiIYxJIfC0ulVDhzJ4tWO2RsoBPCV3s1WyYNj2
	MF0Z4nkUOCgMGIisLZLUIjKLPryyDtiozRoimmlYPTVar4wl/u19An/To8qmctUueJQK7GyTmQ9
	LUtKDjyJRe6GaIrvcZ3x7cqhgH+jDGWMc7ccGW1Kuf3cQg==
X-Received: by 2002:a05:6808:6408:b0:4f4:d7:b16d with SMTP id 5614622812f47-56b98728e6amr910942b6e.60.1794363855042;
        Tue, 10 Nov 2026 18:24:15 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcbc82b5sm3364957a34.17.2026.11.10.18.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 18:24:13 -0800 (PST)
Message-ID: <a6a47813-97e7-4d22-b8e6-7dfab8ae79ce@gmail.com>
Date: Tue, 10 Nov 2026 20:24:11 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Don't override the
 arch timer sched_clock
To: Chen-Yu Tsai <wenst@chromium.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261109120757.847266-1-wenst@chromium.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261109120757.847266-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_182416_117812_D4C8B8EB 
X-CRM114-Status: GOOD (  11.57  )
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chen-Yu,

On 11/9/26 6:07 AM, Chen-Yu Tsai wrote:
> Before the conversion, both drivers used TIMER_OF_DECLARE and
> timer-mediatek.o is linked before arm_arch_timer.o, so the arch timer
> registered last and won.

On MT8173 the GPT already replaced the arch timer as sched_clock before 
7a097aba7255. Every boot log I have from 7.3 on the Fire HD 10 shows the 
same swap, for example on 7.3.0-rc5:

   [    0.000000] arch_timer: cp15 timer running at 13.00MHz (phys).
   [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff 
max_cycles: 0x2ff89eacb, max_idle_ns: 440795202429 ns
   [    0.000001] sched_clock: 56 bits at 13MHz, resolution 76ns, wraps 
every 4398046511101ns
   [    0.000366] clocksource: timer: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 147020034397 ns
   [    0.000378] sched_clock: 32 bits at 13MHz, resolution 76ns, wraps 
every 165191050201ns

and on 7.3.0-rc6:

   [    0.000001] sched_clock: 56 bits at 13MHz, resolution 76ns, wraps 
every 4398046511101ns
   [    0.000192] clocksource: timer: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 147020034397 ns
   [    0.000201] sched_clock: 32 bits at 13MHz, resolution 76ns, wraps 
every 165191050201ns

Neither kernel had changes to drivers/clocksource or kernel/time iirc.

I think the reason is that timer_probe() walks the device tree nodes in 
order and matches each one against __timer_of_table, so link order only 
decides which entry a node matches, not which timer initializes first.

In mt8173.dtsi the arm,armv8-timer node comes before soc/timer@10008000, 
so the GPT registered second then too, and with the same rate it 
replaced the arch timer.

So what the conversion changed is when the swap happens, late enough to 
trigger the splat, rather than whether it happens.

The patch still LGTM, and it gives MT8173 the 56-bit arch counter back. 
It's just the history paragraph that I wanted to give my anecdote for.

On the Fire HD 10 (2017), v7.4-rc2 with this patch prints only 
"sched_clock: 56 bits at 13MHz", where the rc1 boot before it switched 
to the GPT's 32 bits. Boot, suspend/resume, and cpufreq are fine.

Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # on Amazon Fire HD 10 
(MT8173)

Thanks!
Ryan Brue

