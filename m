Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D239606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 18:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GKJo8qOK;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZC/5Xwkp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mv59fVvaG8+1uwanG9a9AV3qrfmi8QzYRDjJgUgr+zg=; b=GKJo8qOK96/GUB
	5PxCQiODHYySUdE13JmVXaLjGuCa77eQIseLt27TNyUWeEqFftDEu5d6S4D4VgKi3DDUADMg22ewz
	uoNBS4O/y8dzf0v0HtlviQUXz39iQmDOqDdofEGEWlbX34NeKTV0919rbEcj/1pu7+FJSg+0W/zKW
	zXAo46bzWchRFEHJL8taKDpgSq7RY1jpFRneeslt6WarX/O2uZ1qSGLIihHZ99bmQSWV9r4LOjzsF
	hQ89MWkHN74NGDnKBanvjsRNVPfzmKAZVNUOh1BxiVXlVbBL4WcwqIn9k/lAbrWDLi2B01KVjQ35i
	zYUTubf2G6Hr1kKsHM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYlc-00000004Tzf-1cmp;
	Mon, 23 Nov 2026 18:27:52 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYlZ-00000004Tz7-12BR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 18:27:51 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-54492d8a988so574521cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 10:27:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795458464; cv=none;
        d=google.com; s=arc-20260327;
        b=PhQz4smRVzU2deKoAQMhp8hCK3xz/nXy/wAgq29LVBTXrZkM7Dhrwm6KBYrr5gjAu9
         XVK5Nen2pzC6hJ/w9C5U8LXhjfYPBQYCfuF57xI+Q0JZXd5WVZBeu0QdV9x+ssTRqRfk
         J5JTIc07Ud/m258WHdDoy7LRRSpYhwdBehoL3cLj/w5fCoshYL6qzJNdiyO2fgR0p0C+
         g1ljrdhG8/t8tKiQc05OeMoCagNjkMz7duOnWUawWMGGCrFlaUNP24fob/clRMbrgK/9
         B2pL9zJ6ZY3th3++0GOLTHz69KKmvvf8MAfe9fbGDieufkIPH0gkNQadzLBJAtR05RLd
         vf3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mv59fVvaG8+1uwanG9a9AV3qrfmi8QzYRDjJgUgr+zg=;
        fh=lA/eRgRVJzCV/axVDwdxAFzdiwb6OvhZyjgQn8DUnRc=;
        b=rk8TT20j1XjAkc7YvOznn4LDjgVGTFsFzYfnNG1GcI7HSI3ONp7IYykDWeZteKBqh0
         9t3crQc58qeZ5ZNdN9fGO6um7IShn0KxEvT23Zf70kEVeIBuY9XUbAAFYpfUmQXbz0VS
         U3FSdR5tOcrc1130wrzckHeBgsJkoCSzWodIYn6jmonkD5FlgzYqGovQowHY76pvBvzZ
         tuHQkp8SzFq8xNCKWdySmH65QXXHYjO5YZV31lRSGvNIFw3hUWv194RLir9I5I1Oi1h0
         RL3+cRh6dTUAZG7yag9Zau3GEo30vvFdIc5eISqfdySbTTC1x/U86cDaH2M94RgFY+Jh
         mmiw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795458464; x=1796063264; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mv59fVvaG8+1uwanG9a9AV3qrfmi8QzYRDjJgUgr+zg=;
        b=ZC/5XwkpBm6iSirie/dyr824wdIKwowQwx/lxwDsTLIqPz9QHpAUAx2lMLvA0lF28x
         5EYsyMiAAX3/JsUzppbp1eePrY91G0AqZ8wovC6mjgPSqUPKkONoDTk/H5iwJSoGKU3P
         Y2x3bn7SFhUINKmJSaOgmtASuwEFxtGyYWIbjppl/jlwpjuYBaW4/Ts1d7D7MrxmTsmx
         365Hv/Xj0bJP+Ep0+cAiWbnGqACkjMiNfdBGamcRZTQwJMTND3t4cqDBhTJz4NiRQuXc
         BHEgdHc02YRJcANXKzpTMtc2NQ5kRbMTCRcqqEHwbLxzj8KkHgq4VhH2I6HGdVNJZaj+
         iTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458464; x=1796063264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mv59fVvaG8+1uwanG9a9AV3qrfmi8QzYRDjJgUgr+zg=;
        b=XvfHQa1Nf0/k5pSje5D4JeisWBWTCPwiJPpfwcsQwQza3sBpCyqWOSCMA56LEKUiMo
         5CYl94n6vK6MhFv+0wNxSDUFyJ5OU9ITAGC/nijeJhAyiysq9Ha6+P8oqxmdfKXKJjjm
         1r0kVwAZqW7AQuabjmaXBrGdGNR9JZ4AxAejhas7YQXspyAe3V2k014lYlJtnj/27Wkd
         h8UtweN5twsmctqi3aMCwomTJXjGv4f1YYVf8ERuxVlqVoi5sIror4+MT/okal8A9s6F
         9eNq2XDhaPT06mGQr2qum5O/SJ6r//JqHxZi3Y+R6KYRUD7a8f35dJDRne70eTLvZtKw
         3GUA==
X-Forwarded-Encrypted: i=1; AL+hErHn0Qpev+5QAryOhQ6mYtul5QWba9HEyUM8xAsNzkJuspPiLoFfUR2FLG4KburyN8TdC/Z4n/mVyck2yRX6tpai@lists.infradead.org
X-Gm-Message-State: APuU4Z9cQxEOCy5VE0yLhVMA8Dikr8tJA/6K66+5GsqdOtJyhL9ZUTAQ
	uW6e/DRekXup4xA+NQmbmv2cvTEpGQGixWtCsW6jcKp5BrtRZgvrlWh3tEu3YbSY3aFcOa4f4Md
	aufJ0M0aiilGAefpkqkhuAuIFSq7POk3Gq/fr7PFe
X-Gm-Gg: AZFdTZekUf9qjnbEp0Sdkoh0xGuGCYzvB1ruiPPZMj+NiUcdA9OCZ3gLqEwKjourPuO
	6QFnoZLq6iLXBEEJTrgIxufuEmoXyyX1icR6GuhF6zaU1UiGA1UbX46EYlE8o/xcnC5pCG6MjrC
	QHvbyM36hJccQBvBQAlPUEEGm2KgMgUs/aM7evlyjpb0GO7CqOZw196wsRC2MORMOONZnCMgUTy
	MBRpEonT9ezU5phdvR6OkUoFIEyNW6mXyEkbTqLIlR7+FFNlsUoRSw98kI3NOYpCkBnXOAQFd6X
	guRGjNsAdSvhEdWsVH3HOD7Ufhs/wDEFIl6kY1xtDo3fZ1WL2WetBR9ESnnkog7GnVbJfpDiMX6
	FwFtXOU4FbieezJnHoDfMEv50rzoeCW2KubRAtg==
X-Received: by 2002:a05:622a:994:b0:531:282:6560 with SMTP id
 d75a77b69052e-55d8906adc4mr41086201cf.15.1795458463690; Mon, 23 Nov 2026
 10:27:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113074125.4146687-1-aaupov@fb.com> <20261123175540.GE9176@e132581.arm.com>
In-Reply-To: <20261123175540.GE9176@e132581.arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 23 Nov 2026 10:27:32 -0800
X-Gm-Features: Aa3M54rkqvnpPz0DiXLf5e18ONtq5tQbgbU2y6PXCXZ-S06Dd1ce403DsJ35cTM
Message-ID: <CAP-5=fXh9zDsh6J=oyDKmxLVsOw-CA4vDYu4589eLdxLsOav4A@mail.gmail.com>
Subject: Re: [RFC] perf: SW strobing for AUX trace windows
To: Leo Yan <leo.yan@arm.com>
Cc: Amir Ayupov <aaupov@fb.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Olsa <jolsa@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_102749_298395_E077E0F7 
X-CRM114-Status: GOOD (  35.83  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 9:55=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Thu, Nov 12, 2026 at 11:41:18PM -0800, Amir Ayupov wrote:
>
> [...]
>
> > pmu_pulse (coresight-only)
> > ----------------------------------------------
> >
> > The first attempt was to try to avoid perf/core entirely, and extend
> > a coresight config with pulsing ETE external output on every cycle
> > while tracing is enabled [1]. This way, pause event on TRCEXTOUTn
> > ends the window after exacly N traced cycles. The use of ETE external
> > output is pure coincidence, just a way to count cycles only while
> > tracing is enabled.
> >
> > However, the review has raised that the config is not self-contained
> > and requires a lot of checks to only enable it on capable HW:
> > - needs a helper in the arm64 PMUv3 header and a move of PMU
> >   definitions - needs arm64 maintainer's approval;
> > - only works on ETE whose PMU counts TRCEXTOUTn,
> > - the window is always measured in traced cycles;
> > - is restricted to ETM, doesn't help Intel PT,
> > - the further it is from a pure config change, the less understanding
> >   I have to support the patch series further.
> >
> > I decided to abandon that approach and ask for a better/more general
> > solution, hence this RFC.
>
> I saw you have sent CoreSight and PMU pulse v6, I will review it.
> It is a good improvement for me.
>
> > Option 3: cross-event "arming" (attr.aux_pause_armed)
> > ---------------------------------------------------------------------
> >
> > This extends aux-action with a new bit (aux_pause_armed):
> > - aux pause event period is set in an overflow of aux resume in group,
> > - restarts from the full period,
> > - on overflow, pauses aux tracing:
> >
> > This is the most flexible and general solution:
> > ```
> >   # resume every 10M cycles, trace 5000 cycles
> >   -e '{cs_etm/aux-action=3Dstart-paused/,
> >        cycles/aux-action=3Dresume,period=3D10000000/,
> >        cycles/aux-action=3Dpause-armed,period=3D5000,call-graph=3Dfp/}'
> >
> >   # resume on page faults, trace 100k instructions
> >   -e '{intel_pt/aux-action=3Dstart-paused/,
> >        page-faults/aux-action=3Dresume/,
> >        instructions/aux-action=3Dpause-armed,period=3D100000/}'
> > ```
>
> I am just wandering if we can extend a bit "aux-action" syntax to
> support delta value, something like:
>
>   -e '{cs_etm/aux-action=3Dstart-paused/,
>        cycles/aux-action=3Dresume,period=3D10000000/,
>        cycles/aux-action=3Dpause,period=3D+5000,call-graph=3Dfp/}'
>
> The + symbol indicates that the pause event occurs 5,000 cycles after
> the resume event.
>
> > Cons:
> > 1. the core has to keep a disarmed event stopped across group
> > scheduling, throttling, ioc_period, power mgmt.
> > 2. rearming happens in the overflow handler (in NMI/IRQ).
> > 3. Software pause events are not supported.
>
> Why here software pause event cannot be supported?
>
> > Question
> > ---------
> >
> > Does it sound reasonable for perf to support this, or it's better
> > to pursue pt/coresight-specific solutions? In the end, my use case
> > is about tracing.
>
> I think you are asking perf core maintainers to explore a proper way to
> move forward. If no feedback, it is good to send RFC series to
> demonstrate idea if you have a preference.
>
> > If yes, which option is preferable?
> > - Option 1 with restoring first period behavior that was already there,
> > - option 2 as cleaner fix,
> > - option 3 as completely general but with more core state to track,
> > - something else?
>
> Seems to me, if we extend a bit with "+" syntax, this can be general
> enough to benefit all AUX trace. And we don't need to introduce extra
> new interface.

Sorry, I hadn't seen the original email but this reply popped it up
the list. Could we extend the (BPF) filter format to support this use
case? Or maybe there is an overlap with the auto counter reload
extensions on Intel.

Thanks,
Ian

> Thanks,
> Leo

