Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92C460A2633
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1i1mZLG1;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hMttQTJg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YjLnuqwofbYQbuSGetIqvxmrdKzxbU4U58ecDgp2SNM=; b=1i1mZLG1Agl30e
	uKriZ+YV/gwEZbdetPWp6BwcQNE1jQIPzbd6u8tsBe4PWHqkGNTTbqSnkeTIF/EnkFK93S5BrVl6g
	nNEkIY7oLoLx2iL5ALvbJ6HlL8+KRB3LkXtlZwGH+Fv9NovK/TqIRhpQ7qFCuv1zuOJ7/1DFPYNxW
	p6+UvFVXvhyj0wzdYdTKE37X0+rTIUBU5W4NxWiGIBR3LKnzKhEY2ZAfvL8UCZIiZaJ3INWvxKWzy
	212N7e+ObUlzQ7VtOdSwXBY50Dj6Okr/bsAyXTl4nWbB27jYKe5BOMHJNHdRtYjnS8pPl59OGZmK5
	j1CDn7FqXawl7VGVJ1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsKu-0000000DAUo-0HY0;
	Fri, 13 Nov 2026 14:33:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsKq-0000000DATr-2JXu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:33:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so15958595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 06:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794580378; x=1795185178; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YjLnuqwofbYQbuSGetIqvxmrdKzxbU4U58ecDgp2SNM=;
        b=hMttQTJgFyn/CkDD99p4Niayo23Qsqsq7Zx8qQRn8BNjq2CGY8CgcbhxmVfHuapby8
         rVlT2bO262QRV2LEzySojFZHPIuemUhjWdUjrQpsWhpRraUmn6A6wCyscyTnILYDtJBD
         iVMRxQEUz1zBcUgzon0UEodJDjAEuiFegZAhnQkiNORkjLlisuILTUlWigFGe8CC9O0P
         HI4OMnxNjke+GzqiWzcOWPzSZS+N6ylGbhbMbWiAfuwchhRYrJ8q8nvMbd0BBC7G1Ffg
         QeEI7wmQZ41udoV+lBP5FQ/23x2ErRXg0uUTy2OuVtVEO2YgOGvl+1hyf+wvrFABn9ic
         upBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580378; x=1795185178;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjLnuqwofbYQbuSGetIqvxmrdKzxbU4U58ecDgp2SNM=;
        b=T3tP27/NTEiOPSZskpNsX7M/sSNaqzFQGoWVSq9g0ppXOZNNwrn504Qg3ufQ4PCyyD
         52uwpHOjzBsv41sVkIDmxChPCzKHX1b88irJOXbvMZPl9e6gqPq/0msy3W7MXO4zIfEY
         xZTD0L0ztP5/dzvo4g61wqIoG3SHI9M9lQPWhWHn/AS2fMdC/hWqAtMLAJt8RhGWDfXW
         TUKNNivbE9mswNT2T0bHp1vH9VOtFhaTvRbA4CnOAuHvkHlMPdxHpN1OxBhuPAIXqQ+Y
         f3XwGBQoYmzYzU9m+lZffg3ogvf1Z/PMcgepbBOKJh5GYpqFshdFh3ZvjUIZppsMrNbt
         Ogvg==
X-Forwarded-Encrypted: i=1; AL+hErFyFVURPEeUT/qJEAQ1im3UlaPHimBKSxuCS6/m9jR2ncUrqXRujXjO2rDRPMe/xmOz3o2lm02q6fvMBbxkxWL/@lists.infradead.org
X-Gm-Message-State: APuU4Z9Wptu7VBgG3SsV0eIOgTVWrEIuKF9IclSVUhyLZx/lUlFwthsE
	9obsJ8P2stZ2Hse02CJbSE/PPr6KROZjDIMlGJnuu8tSL1x3GT3pQZRL02b9+ILvtmo=
X-Gm-Gg: AYBFou1l9MXTrcXF5fcXYs4h9LrSuQ3Dg9rx8jpjLGIW31E+bFjl48qdtMkbCPv6Gk7
	X4B/j9bE7jhJGtoNT0kK1h3Fyar82ZTaD5B7DUfMiBV0NvEWuYDtM6eAAjDWdkv0iXQU+8XiVg5
	WsOcXMvPlGiDY9TOrcdvYEK81FjYTw6DBHLosF8sQiiAsyrzLb9KUl+faJJDSFoY16MuoRmLbim
	aMHY7rn587FhnAkNYVsx2dog5615Q/uxmt5kWHJnxh6L0MkpEe2PqXLIPa4ZCl/Og8g/6juvUyP
	bJTKT+r1GtYU23FQce18NEEb6ciDNaQM0AvtJV6uj0BeBYqb0xVmRw8UW0wdA1EpzEiGSLdqS7f
	lu4Ya6x0/TEr5FW4ZrG0ZJltVBWQ1DUym4BF3suatLrDcZoUFoIcvoqBGCMhJRBVOzJRinzYwHb
	Zmzb1uncEVbrxQb7rUj4kY8r8OaUgKporRJfCKwyFov5Zh0fSvHTzmZw4TqkDbRxLl/0bHuGyav
	5dWKgVvJEOiBNM7Hp2ZLp6OiAhZZQMYGqnOZAqfIE98tzsmhOZZF1tWXNGHrYHzCX4td2MKXWNB
	S/chRHlC5eynk8QWgjzJQ8fE38jFiMmU6KZo0yEtqfdGuSYX
X-Received: by 2002:a05:600c:3111:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4bb55a4490fmr56671835e9.10.1794580378184;
        Fri, 13 Nov 2026 06:32:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm167089005e9.2.2026.11.13.06.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:32:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Chuan Liu <chuan.liu@amlogic.com>
Cc: robh@kernel.org, conor+dt@kernel.org,
 christian.koever-draxl@student.uibk.ac.at, rafael@kernel.org,
 sboyd@kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Christian Stefan
 =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>,
 devicetree@vger.kernel.org,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 krzk+dt@kernel.org, bmasney+clk@redhat.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
In-Reply-To: <317f2930-9f65-447e-aa46-223ba9e47033@linaro.org>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
 <317f2930-9f65-447e-aa46-223ba9e47033@linaro.org>
Date: Fri, 13 Nov 2026 15:32:56 +0100
Message-ID: <1j7big244n.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_063300_634292_E735D8A8 
X-CRM114-Status: GOOD (  34.95  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On lun. 09 nov. 2026 at 09:44, neil.armstrong@linaro.org wrote:

> On 11/8/26 22:45, Martin Blumenstingl wrote:
>> On Tue, Nov 3, 2026 at 10:46=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com=
> wrote:
>>>
>>> Hi Martin,
>>>       Thank you for joining this discussion. :)
>>>
>>> I have re-examined the capabilities provided by pm_opp and cpufreq-dt,
>>> and it seems that we may also be able to adapt A9 fairly well based on
>>> the amlogic-cpufreq.c here. So we have no objections to the driver
>>> implementation in amlogic-cpufreq.c here.
>>>
>>> I was most worried about before was that cpufreq-dt might not fully
>>> handle the complicated clock and supply adjustment logic between
>>> multiple clusters, which would have required adding a separate
>>> cpufreq_driver. But it now looks like this can be solved by adding the
>>> corresponding config_clks() and config_regulators() callbacks in
>>> dev_pm_opp_set_config().
>> That's great news, indeed!
>>=20
>> [...]
>>>> - Meson8/8b/8m2 (32-bit ARM Cortex-A5/A9) where we need to reparent
>>>> the CPU clock to XTAL for stable operating during clock changes (which
>>>> should go into a cpufreq driver that implements target_intermediate).
>>>> There's no secure monitor or firmware involved for CPU clocks.
>>>
>>> BTW, could we put the CPU clock handling logic in the clock driver like
>>> G12A does (though, of course, handling it in the cpufreq driver might
>>> minimize the coupling between the clock and cpufreq drivers)? That way
>>> we could fully reuse the existing cpufreq-dt?
>> Common clock framework maintainers don't want muxes to be programmed
>> magically in clock notifiers (which is what G12A and Meson8* do).
>> So there's a chance that for new drivers they would just NACK that appro=
ach.
>> I don't recall the exact reason anymore - but from my perspective
>> using a cpufreq driver for this is the cleanest approach (although a
>> few lines of code extra).
>
> It would move the soc-specific logic from a soc-specific clk driver
> to soc specific cpufreq tree handling clock muxing. I kind of
> disagree on this approach. If some logic is needed to handled clock
> parking while switching clock sub-trees and notifiers is not
> accepted them the CCF should evolve to handle that, not moving
> this logic elsewhere and have a proliferation of clk mux related
> code in cpufreq.

I dont really agree with this. There are other cpufreq driver that do
handle this intermediate clock. CCF is there to expose what a clock can
do and how it behave, not to encode how one expect to use it ...
even if it is the CPU.

Which clock is the "parking" and how it is handled is really not
something that should be handle in the clock controller. this is
a usage policy and it belong the clock consumer IMO.

Changing muxes in notifiers is also very fragile and will completly
break in another clock was to refuse that change while in the notifier.
It is kind of getting in the way on reworks we have to do in CCF
Amlogic G12 is the only one doing that. I would prefer if this logic
could go in a cpufreq driver, which is where it belong IMO.
If think we can do so without any breakage in DT.

>
>>=20
>> Additionally: I believe the udelay(100) in the G12A and Meson8*
>> implementation is not even clock related but a delay to wait for the
>> regulator to become stable.
>
> It's highly probable
>
>>=20
>>>> - GXBB/GXL/GXM use SCPI firmware CPU clock control so to my knowledge
>>>> we're good with what we have (meaning: no custom cpufreq driver
>>>> needed)
>>>> - G12A single cluster, no DSU: needs a cpufreq driver that implements
>>>> target_intermediate (currently it's managed on clock driver side in
>>>> kernel space, no firmware involved)
>>>> - G12B multi cluster, no DSU: needs a cpufreq driver that implements
>>>> target_intermediate (currently it's managed on clock driver side in
>>>> kernel space, no firmware involved)
>>>
>>> The cpufreq-related resources on the SoCs mentioned above are relatively
>>> clean: each cluster has only one independent clock and supply of its
>>> own, and these SoCs also do not support voltage selection based on chip
>>> binning.
>> That makes things simple, indeed: each cluster follows the same logic
>> using it's own resources.
>>=20
>>>> - SM1 single cluster and DSU: needs a cpufreq driver that implements
>>>> target_intermediate (currently it's managed on clock driver side in
>>>> kernel space, no firmware involved)
>>>
>>> Compared with the SoCs above, the difference for SM1 is that it needs to
>>> additionally manage a DSU clock. In this case, the clock-related
>>> handling can be added in dev_pm_opp_set_config() in amlogic-cpufreq.c
>>> (by implementing clk_names and config_clks in struct dev_pm_opp_config).
>> I think so far mainline is not touching the DSU clock at all.
>>=20
>> [...]
>>> All in all, it looks like we can currently support all Amlogic SoCs in a
>>> single amlogic-cpufreq.c? Then, for the specific characteristics of
>>> different SoCs, we can differentiate them through the "compatible"
>>> property and add the corresponding drvdata for each.
>>>
>>> I'll also try to support S7/A9 with representative differences based on
>>> this patch.
>> Great, let's look at some code rather than discussing theory on how to
>> write code :-)
>>=20
>> There's one last detail that we have to manage in case we also want to
>> include the Meson8* code into the same file:
>> config MESON_SM depends on ARM64_4K_PAGES
>> 32-bit kernel builds can't satisfy this (meaning: we end up with
>> linker errors). I think a simple way to get around this is to add stub
>> functions to include/linux/firmware/meson/meson_sm.h.
>> I'll take care of that once I can submit Meson8 support patches for
>> your upcoming amlogic-cpufreq.c!
>>=20
>>=20
>> Best regards,
>> Martin
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

--=20
Jerome

