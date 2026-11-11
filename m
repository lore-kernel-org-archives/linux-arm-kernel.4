Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00FA606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zhCz6o7W;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S0gS3/uq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tJEwk0yeQZ5BY0HMxF5cN+S8qbdxO56EHI6uRg64h7U=; b=zhCz6o7WOVQQ40
	csu1cN8qn0Jmz7PpCxKDMkdk/PST91yvqtoZfLqt/pKdMt5b1ugp+DKEnjQFWcsYpt2HbdB1QdSbE
	W0wPrjmOCf+nRmJpATn7ZL6Z47WKkP3mIqG9sVc4k08d0Q/MX+Mb7CiCaLEP8ErZM2r44eGRIhrMg
	WkgGUnxLxgIf+7qP9Q8KsnLWOMqCydQgTYs63zURA64Zy7MP0tzRz5sla4hydmTgzrttTvpWPI0bJ
	1343S2saOxDJrWXYOX7F3f8rSzSQ1s/2O4x63v8V6jMqx0WP7yV18FDSBrbuqdIN3w1PlOTosbzz3
	dZPAbfc+p4ubVxGomeHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR97N-00000006vak-30iR;
	Wed, 11 Nov 2026 14:16:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR97L-00000006vaF-2E5a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794406561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJEwk0yeQZ5BY0HMxF5cN+S8qbdxO56EHI6uRg64h7U=;
	b=S0gS3/uq5gDYF96JNVn44FuF4WrzZP9Psvs+k4SMxbC21xVXstM3g54j62CzpoVimzjHp8
	CHnxHz+LI2xusjaC/B9ByFGUO6G+xUb/TtXeiVSdWuUNW3Rig6652LbzFwOzM+QLiY4Lee
	MAlauv/U3d33nPp3hgeADkINv0Pxa2g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-HpkxIHENNPSaaKeSb9Z8XA-1; Wed, 11 Nov 2026 09:14:14 -0500
X-MC-Unique: HpkxIHENNPSaaKeSb9Z8XA-1
X-Mimecast-MFC-AGG-ID: HpkxIHENNPSaaKeSb9Z8XA_1794406453
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c29c391bd2fso286635766b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 06:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406453; x=1795011253;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJEwk0yeQZ5BY0HMxF5cN+S8qbdxO56EHI6uRg64h7U=;
        b=xNaE2SG5AgIT/YH+ubbPaw15fFrFCbyHBN9b2uYylwNFvNXWl0bcJP97MzGpQBipaa
         kl4FID3E238xKUWmSF+gWsXiLfRtY7wn2zz6ae+gdvQIxaTjbzJ1tKWX4uzD1OLLd3D2
         SVzp2gfsC8JFQvafJbAI2nal/ZdtfJePX0G6dhmqpCcqLQEm0qj4Etk1vF2fvVy97siY
         M3hH01LU0h7cz17yuOOa+umtj0Z5PZdAT+bfMQuZ69t9wh2rjbxXSzM7jKemIKrS9cUd
         Bo9RE9w2kZ+eM2Hk8QR+v7t264PXnXB//L3YRwMixY3+1EGiNoXowuuJc9V9nvyuWb4u
         hBRw==
X-Forwarded-Encrypted: i=1; AL+hErHdYelAMKFra1pAX6s66MyP2c64wO213J3x659FPaU81BKLDvBmzN0ZWNsqpfb3gC3A+hNDJuaOaMlQuwPDIAjp@lists.infradead.org
X-Gm-Message-State: APuU4Z+SizwALRLodhKHUk+fordcFJc6ezhr70PPDqrmVf2lezCDaWG9
	2M3S53V2O1Gb8o9b/Eu1ieeIpik13nPWsfKerZfjJYDLVJM5LruUAe2qocZLnCf4iEta335AMdb
	tqdHAnYKtoeLIlIPPXTlpkqclOFAmb8LPqks59PArkmbZ2Ms1SnFlU62jLqghCT0WX3UOBNz3oR
	L9c18N9PH/vZxpPy+ykbTSMg/5DBpy30kgDDDRD5pSnb0+mE2SUeTdCcO+Iu3OPg==
X-Gm-Gg: AYBFou2x1ogvdTYZ11uw47nHoljVxLqHFQ6/rb563RvqQdAdNOjj2o02gUGNbuogPTC
	sWOrQ8dqn1xBRRcug8XbgMr1JLikzmJ+pI/1PD8Uffrarv6XqbMi5MwQw02FoWecM2t0+RBpn5O
	SZ5cIAre4ggbXhKnzQKfZH9DAMf5/RTtiqahGbep6dGQgJkFEGs0ge3YHhqLvqqRizio64PEgT3
	WT4NhOp4uduYjMkc+27CsAZAEOdo7exCqs1aHYmIZh2XyN4VLWZxwOR/sfDCNmn1eG2JHj8UIRM
X-Received: by 2002:a17:906:9fd0:b0:c40:5ee3:8698 with SMTP id a640c23a62f3a-c5066b563cfmr215905966b.31.1794406453463;
        Wed, 11 Nov 2026 06:14:13 -0800 (PST)
X-Received: by 2002:a17:906:9fd0:b0:c40:5ee3:8698 with SMTP id
 a640c23a62f3a-c5066b563cfmr215902966b.31.1794406453032; Wed, 11 Nov 2026
 06:14:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261015113738.435986-1-juhee.kang@redhat.com> <a626dba9-6aa2-4cf9-883d-8c6f94770d6c@oss.nxp.com>
In-Reply-To: <a626dba9-6aa2-4cf9-883d-8c6f94770d6c@oss.nxp.com>
From: Juhee Kang <juhee.kang@redhat.com>
Date: Wed, 11 Nov 2026 23:14:01 +0900
X-Gm-Features: AclHuK-LaKGJTHFBtUxEsdfkP6i27gB8i--xEgkyocEdovtvbwJs8a06wnvjStU
Message-ID: <CANBgpCxKYVExEgpS-8PqWqHvXV1nkF+1CzekQKnHGsTJCq7WKA@mail.gmail.com>
Subject: Re: [PATCH v2] clocksource/drivers/nxp-stm: Register sched_clock once
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Dustin Black <dblack@redhat.com>, stable@vger.kernel.org, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cy4XaWC5Vdp3IEKz5u4edS4vtHy0U0NbgYnWidJYbNM_1794406453
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_061603_647619_43CAB0F3 
X-CRM114-Status: GOOD (  26.11  )
X-Spam-Score: -2.8 (--)
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

Hi Daniel,

Just following up on this v2. Ghennadi reviewed and tested the patch.
Could you take a look when you have a chance and let me know
if anything else is needed?

Thanks.

On Thu, Oct 15, 2026 at 8:40=E2=80=AFPM Ghennadi Procopciuc
<ghennadi.procopciuc@oss.nxp.com> wrote:
>
> On 10/15/2026 2:37 PM, Juhee Kang wrote:
> > [You don't often get email from juhee.kang@redhat.com. Learn why this i=
s important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Each probe updates stm_sched_clock before calling sched_clock_register(=
)
> > again. The call then subtracts the counter value saved during the
> > previous registration from the new STM's counter. If the new counter is
> > smaller, the subtraction wraps and the timestamp jumps forward.
> > (e.g. from 0.4 to 32.9 seconds below)
> >
> >   [    0.403653] sched_clock: 32 bits at 132MHz, resolution 7ns, wraps =
every 16243448316ns
> >   [    0.404056] clocksource: timer@40120000: mask: 0xffffffff max_cycl=
es: 0xffffffff, max_idle_ns: 14456668980 ns
> >   [   32.890509] sched_clock: 32 bits at 132MHz, resolution 7ns, wraps =
every 16243448316ns
> >   [   32.890882] clocksource: timer@40124000: mask: 0xffffffff max_cycl=
es: 0xffffffff, max_idle_ns: 14456668980 ns
> >
> > To fix this, register sched_clock once at the end of the first
> > successful probe. Clocksource and per-CPU clockevent registration
> > remain unchanged.
> >
> > Fixes: cec32ac75827 ("clocksource/drivers/nxp-timer: Add the System Tim=
er Module for the s32gx platforms")
> > Reported-by: Dustin Black <dblack@redhat.com>
> > Signed-off-by: Juhee Kang <juhee.kang@redhat.com>
> > Reviewed-by: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> > ---
> > Changes in v2:
> >   - add the comment
> > ---
> >  drivers/clocksource/timer-nxp-stm.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/=
timer-nxp-stm.c
> > index 6fe098a4a33f..23b2d44e4b78 100644
> > --- a/drivers/clocksource/timer-nxp-stm.c
> > +++ b/drivers/clocksource/timer-nxp-stm.c
> > @@ -211,10 +211,6 @@ static int nxp_stm_clocksource_init(struct device =
*dev, struct stm_timer *stm_ti
> >         if (ret)
> >                 return ret;
> >
> > -       stm_sched_clock =3D stm_timer;
> > -
> > -       sched_clock_register(nxp_stm_read_sched_clock, 32, stm_timer->r=
ate);
> > -
> >         dev_dbg(dev, "Registered clocksource %s\n", name);
> >
> >         return 0;
> > @@ -473,6 +469,15 @@ static int nxp_stm_timer_probe(struct platform_dev=
ice *pdev)
> >                         return ret;
> >         }
> >
> > +       /*
> > +        * STM counters run independently at the same rate. Use the fir=
st
> > +        * probed instance for sched_clock to avoid timestamp jumps.
> > +        */
> > +       if (!stm_sched_clock) {
> > +               stm_sched_clock =3D stm_timer;
> > +               sched_clock_register(nxp_stm_read_sched_clock, 32, stm_=
timer->rate);
> > +       }
> > +
> >         return 0;
> >  }
> >
> > --
> > 2.55.0
>
> Thank you for addressing this issue!
>
> Tested-by: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>
> --
> Regards,
> Ghennadi
>


