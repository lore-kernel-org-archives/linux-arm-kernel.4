Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8045D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 07:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sWiSP16D;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Mqorarf+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PS5LMiKFzIUnURDmLwbpwh2C/rUlEP4/H22PiA88mjc=; b=sWiSP16Dc4XyOa
	sKEf9O6sZ0sNUnW3LiG+b7iGku9Wsy4rv6VNBKNlewUW6TgE2xmWC11XXWzTsr8DYxnq0ktZ9o5bn
	TjWZZ1CF8AsZkgwELv0ww9DbGBOjG/E7K3+jrfe0m8vzOH4gVgXt6Zfznq9McRGJmYCAqKnE7Od1i
	+cLO3yPSNXqUpqAVR/sJyogILfRymozpIEPDtOtJpjjDnSkVBX5tr5NHnpeFX2uLthfmRjHQWUiiK
	bGJk05wCND/HV6C+cMsDSQ+dqy1G4UhqhoRZ9S77XYWIZEkrcenS7nmxkamX3n0/pjyGkLTvnJmlk
	0+ChR+r6ps+szfKlCuQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2Z3-00000005rM7-0GbI;
	Wed, 11 Nov 2026 07:16:13 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2Yz-00000005rL6-3Mfg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 07:16:11 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-679a2b5fe87so3472783d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:16:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794381368; cv=none;
        d=google.com; s=arc-20260327;
        b=qKLN9Dm0LiAw2jkKbwArFWQgEle5OqevtMMoipthN6XRHTAAEzZxfH+stCa9pJdPsC
         vXEoL02LvLslgMOvuHumt4eaQOxwWjcp5rEmUhfUGe4vb98SdA/pc6XMU9NG02GMTlyv
         N+js+Caag68jE1GTO++LxGbJTJV8/ooSDGoTj9BeyMZW7iOWq3xzBGi1SF8rUVf8d9n3
         DF3oRQ+Tuhy9+G6lohXIui82q+TDf4YJZ1JdRBeyejMsXcgY5peZy/P1pcu/rXU0A7K5
         ReXxiRWBsoT3f/AXzYrxuA8/sBeFMGkgrS/o9V42onuMar/SLjTQzZzn286X5nXOcpfi
         vGMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PS5LMiKFzIUnURDmLwbpwh2C/rUlEP4/H22PiA88mjc=;
        fh=UVXTVxao9qKmDMEzR3JUhV285PPIAgoTMInOwtn+gwQ=;
        b=ZGlv2364NftKglH7oP5deaejFcbYHdI86jriiwGvMPAofdKjgOPkFtfqgMj3rnbpvK
         e9DIJgefdH7uNC+asIjJydWg897kHM4J9Ue88B/3zKGumgHI/G5QMwQH7viNFNIeeny7
         zMkBIFarcNLCg5S4gjjfMymRwNwBDz9yKUT27Sdm72P3KXQIGg1OHxDmLzJaL8vXC065
         OBWxDKN/h5Hz1NPUtAY/OG6MGxDssOj5/zJ2bu5TKyOYe42zSFrDEtGGGA2cIh+2M6vo
         RH5SCCwc8SQDB1I96NwaPgc3FW+k5srawpusjnvyT94jmTDh9KhEi6wlmP8rRYkO+TtU
         R85g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794381368; x=1794986168; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PS5LMiKFzIUnURDmLwbpwh2C/rUlEP4/H22PiA88mjc=;
        b=Mqorarf+CfEoTEVmFiYCzFkNepDcORRWFJamIBY2rAwREKa/u08RzvzWwsfpGSokBW
         iXzTcAlmlJqxGBxkO9kz1QMJQdbKV4HhhI0shXnqhY8gfs0Zimy5kwGfxUuk2Eqln7nN
         lVNMkOD3c4jfsMEN+q/+fI/1+hUuXQhMfpH2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381368; x=1794986168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PS5LMiKFzIUnURDmLwbpwh2C/rUlEP4/H22PiA88mjc=;
        b=WB7ZT3xMb/ZJSaLPjodCb08bfK0DzZ87c5mRlZoHnSraIcLjc1enXIzepId9/WQn1W
         L56wdu5k6eMkjQdSpVZZf4f2Eu5WrvEymsJFJR/V9AfvOelzheI7WntWN+VfxBhpN3E2
         mff4tG5uJwllGtAYA4Lq0XpzvRIxzQlfIk4CO1Eftw3wdgfi2dH/r9AeXHWrBhvHPc0n
         YKvTfjLNU10Q/DPDvSPWlJqMFNGJ+OjlNK/mpfS2kzlfaqFSdQ+O+tR/uEbBJoG5N1Na
         sKtRV04oj3omZJ4p/pfRX/7xn2CEIK5m6LXBndzljCZIgh2BXriFv+olacAlYxEltoFe
         X7Bg==
X-Forwarded-Encrypted: i=1; AL+hErHYDzcNldc1wP1l7tYW66hEs0p16LW7Oo0f14fs+K/L/OZTxbjPcKPCoWRGpcC84+OX3SQYj7nU8LpgDxcY0MdO@lists.infradead.org
X-Gm-Message-State: APuU4Z9+YJaLPMJVrgDM/XIVY8TA5tc9lrKOFPcS5nT5XCjBwEt6G/vu
	yEuU/NT5Ffj0mSrE8b3GsbBWo29z37NBhwFgnFsqosy5H0xmz4MxNFiY9rbcGhy4DkcbbmoB6tI
	IusjQuAC6qUPrzFGkpDoHAd55ZVkKTz/HUnLgVG8DeA==
X-Gm-Gg: AYBFou2S6/O9tk7ia7+AedLg/55shfLPA2WlyKRjZU1X7R4sXobvIfMPaOYxhjmx4ey
	VFgjKCjT/gRCZn6phguxTdOdCQWmoal0hMSnYjxvWEmKpWN+xBCHvKGVb80GC/STN/6un4ioQCh
	EL5d932kKHZYuI2F9fG3qRA/IFxjwFN2d9crbo5Jjc6a7izROVzInRFJnRWhLscb8aFqZA9rG3n
	OUzRgU9VQc7Ygo72ahnF94DUm1Pkt56sx6vsl2Rqw3xOb9s2znnj/mtz7+HnpwKne98JhkgJ2iV
	/4eRG9yzqIPgq7jD7zoe6Noj1Saa6lElgwMMYrM64VxoFIOa3cYvWYM/qCoxcw8CoiaJneVTzvn
	KNE032VXfVN+neZGjCw8f5JxufPfB823oew/Mo8GIJzz8Rbjysv3qAXn6n08jlWfOerI=
X-Received: by 2002:a05:690e:1504:b0:677:cbfc:be28 with SMTP id
 956f58d0204a3-67c67f7bcdemr1039946d50.75.1794381368118; Tue, 10 Nov 2026
 23:16:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030171910.2822677-1-dario.binacchi@amarulasolutions.com> <f5ddf27a-9771-4967-a9d0-13c09f588402@leemhuis.info>
In-Reply-To: <f5ddf27a-9771-4967-a9d0-13c09f588402@leemhuis.info>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 11 Nov 2026 08:15:57 +0100
X-Gm-Features: AclHuK_y6USQFhQ1AriRJr3BWyE_Wi1fKklRA36_ipXu6i6f67Qj9RIWxt--J7M
Message-ID: <CABGWkvor=2AWC06iRvONAAPu6b8SS-JnJYmeALCYg_r4bh3wtQ@mail.gmail.com>
Subject: Re: [REGRESSION] cpuidle: psci: boot stall/hang on i.MX8MP
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Ulf Hansson <ulfh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Russell King <linux@armlinux.org.uk>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org, coresight@lists.linaro.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_231609_866019_0CAE1B30 
X-CRM114-Status: GOOD (  22.00  )
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

Hi Thorsten,

On Tue, Nov 10, 2026 at 10:12=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 10/30/26 18:19, Dario Binacchi wrote:
> > Hi Ulf,
> >
> > on an i.MX8M Plus Dual board (Engicam i.Core MX8M Plus), mainline
> > c339f4010dea sometimes stalls for ~0.9 s at boot, or hangs until the
> > watchdog resets the board, right after:
> >
> >   [    0.806123] ledtrig-cpu: registered to indicate activity on CPUs
> >
> > On a good boot the next message comes ~11 ms later.
> >
> > About 1 boot out of 3 stalls or hangs. With cpuidle.off=3D1, or
> > with commit 65705b18162b ("cpuidle: psci: Move initialization a bit
> > earlier in the boot sequence") reverted, 10 out of 10 boots are fine.
>
> Hmmm, nothing happened here. Might have fallen through the cracks, so
> maybe this mail will get thing rolling. If not, I'd suggest you submit a
> revert.
>
> Or was there progress or even a fix and I just missed it?

Sorry for not following up. I can't reproduce it anymore with
current mainline (b3dfbde62cf1, v7.4-rc2+) on my current setup, and
I'm not sure what changed. I'll keep an eye on it in my next tests
and report back if it shows up again.

#regzbot inconclusive: can't reproduce anymore

Grazie e ciao,
Dario

>
> Ciao, Thorsten
>
> > I haven't dug into it much. The stall seems to be in
> > pl330_driver_init(), so my guess is that it is related to the AMBA bus
> > reading the ID registers of the CoreSight ETMs while a CPU is already
> > in cpu_pd_wait, but I may well be wrong.
> >
> > Any idea?
> >
> > #regzbot introduced: 65705b18162b
> >
> > Thanks,
> > Dario
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

