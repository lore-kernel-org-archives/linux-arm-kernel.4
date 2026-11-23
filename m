Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A70606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xn8m4XQj;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=LVVCYyO1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3JGEHCaGHgSI8BrKRQk6rt3qVFIqpC8XEVH84mN8VhI=; b=Xn8m4XQjeD2AGk
	LJQxi+NfutEZtkTzw0YBM0PiyUPNUjyz8reZk/UYeralmIUDL5nrr1t7lEBgNv7ocj4E8zVN7sY5C
	1YEXOa9FQP8moyhfwtMnrfdn4civFJdORnnsmf8tnmIhm9BPmgkW8OTxn6E/Ft+KBlXI6hDEMgDye
	AIdtuOdkMGsMwLGoSvHeuEPk4TloaK5COJuW1bVozqT9FZAa8pOB6KEuAOuCq4Sj+zUTzPAqc4LNP
	EL1aM1p4290eKcHKNYHDlIRKlTjyoHuIaEUlC/812MTXG+fcxZjBFMflqU0I+Gh0CJIiPRvFhQlwt
	+vmn9IMCS4Xiy/RKyy4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVT6k-00000003Ltu-1Q1h;
	Mon, 23 Nov 2026 12:25:18 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVT6P-00000003Lo2-0QIZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 12:24:59 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c506a231b88so443580366b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 04:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795436693; cv=none;
        d=google.com; s=arc-20260327;
        b=OzIeBBL4Twn3l0UWPbHXzarT8zgt1jxAWaqi2uYzNSKFn4fnEitCjbcj6ocatfiRoI
         M9DxyHgw+Z529HZ0XyehEOBSEeeCd7Mup00UNY8eSyrVXWLvSdRjpLkNqz9PZxCMJi3V
         BMUvG9Vmw4jIIHLlVfEmUiRsh1pqp0m6mfSybmRHc8IY5XfFuk3rWuD266swnUJEovvD
         e22n4r4OKBg8jB2lx7UCD8BpcqvQ4cLCkasOMn59RNc8gFnPhsVS/0U0r4la4MauusqE
         DWmeqsSwtT/UCqo0UM8pSGYM7P7D7Xh4Q66xB1vhiVcVrHKEqUzrtFcCO/9UyfvFNIYc
         RF7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3JGEHCaGHgSI8BrKRQk6rt3qVFIqpC8XEVH84mN8VhI=;
        fh=A/CgyUVmR0ZKNgXyNH1vJzJq6Xrci+25j2e3uFBEX3E=;
        b=kecRUmy78YepbnMQtihAwarfSZMZkEFWjnM9hQz/KUjARyLsf09VK/VaPL1vxAhzeR
         zFDwFW04fSBHHCsXWRtNErx9ZQdE/OFCVIXQx4uHQwG3aL3LW5bn23pOuu6i5CFDr3v7
         Tfhwrxt0bOAT5vWY3IznNSHisCZT3bbjea8WbTo/vHrnZqUD/cmuhfup5HT8FgfoxaB8
         lsQ0no0lrWeRwnxVvi8tbDGib80FHaWWHoS3S9a7Nxpa0bEq1MJ1X+GXpNC5j6vzvHoY
         mgK/aAqp88FxJHNzuz3GSjkh67uBZN409xO2D/aMZpXIB9fAi+k2D9uToe/mg2cHqs7n
         STaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795436693; x=1796041493; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3JGEHCaGHgSI8BrKRQk6rt3qVFIqpC8XEVH84mN8VhI=;
        b=LVVCYyO1OhKHxOFyOJcVEHGR8LKSHlkcHeUFy4CUqLVHXKX0752yESmPSd280vx5Fu
         O1pBNbm6AiWgo4UofrLXqVjDEPGIz8F5Yk64jmg8LBA01mtfzPRu15+d1q3KHY34Wrc2
         xI9vWAttdUyFUar2g1owjrgHIGT0KfyQH5UfgOkrpoEn2EgTQv/FPxbOg2muylxJ9RTA
         l/Qtn4IjJ+tkKt+mPR3fIQsISIjaqmfkZJD+96vEYefGQLygBwr1OCLB1FtHEhpYUaft
         H1JyKJu9pvChjbziifraIOXKTkofx/s/kSVj2mvEFaLCXiDyTIVu19e2ZrtfT5gXfvBe
         0V7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436693; x=1796041493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JGEHCaGHgSI8BrKRQk6rt3qVFIqpC8XEVH84mN8VhI=;
        b=ereQsYnGxVySjtal8viUAf8ZoPgyDMEgxSXggU76oCJ0OzaRibEMu81puiq/dVjhGG
         TOCFVTgVvPv71W8x/zTlvrQDIm0HdQ7IKF7gEHIKLeCLRCJdox6+rvuhJqSzpbA2iVWo
         2utx1BD1nhu7QQRGMBTRv1wIUQ9SDZ/LWhxgN9aARsya65l6fTc94pv59QL/fZM5Mfu4
         jMx+2R6wMOeI5oVs9SF7SGFcnJ9PJD2TA2ZfyosRiD6XhqCz8yUWcNjoQcHrSZ1JVDfv
         GivGhBc31imkXiC5+4qhPl10WoMymqpJQZFPq1JcVjNGObSqyoc7fzb7vQu+7DpihkLO
         g9YQ==
X-Forwarded-Encrypted: i=1; AL+hErEZemezShV4M2huKC5WnmjkjNOU85WEJJUUNJ0GC3BQrQUkfpykkpYBVqo+QkGsnL7bodlci2PtLr0Pj6NTJ+fw@lists.infradead.org
X-Gm-Message-State: APuU4Z/93OZyKwzKGnOmE5bjpoWKSMUAGWw+dP7iJYC2d4MmDgf3TGl4
	iPO4+1imHDqjnbMCg1Mc4Q6dpsPjUe/MFr/kdu88Jvt/hPPnPk5J+Uylt8zahhWGqCdxyxrjIXu
	Y5YZRIGcPbpchrFgh9pu+mLO8krRV8jd0caQMvCwvFw==
X-Gm-Gg: AZFdTZc4+xjMwpwxcmKrGOqI78KsqW2QEZ5afUsDb92wQ8IJM75nLmecBw7OOJSj5nF
	6h0CuSoVmTticFjUtZQBgMnEGhC0BCOgfU1T5YODkVo02BETLOlcVCmVCz9mTdnahw87ufLUi32
	72qNWJRPAg41XO2apkfKz8WcMAUGZehOnBMmy29fVVwGY38B8HaqSn9rAnjXYmlR7SbXt6lCND0
	Lk/2AB8sEXdI5jw+vy+J0Z092dwXUDxGUxyDC6WtxyZCLAQcjKRPt5ga4D2XLFVjVA5Ml391Qf0
	14/cuFXIJAfeskuViiaJw3kg10GyGTRMFsB4oEUofaX1mhC79U9UiIumQcR7h+fT9vBQ/Goz2a/
	1W4GYKCt53MvypBzKB1fcAQfIKjGTy4ikYz+A/y3NO5nPQNh9SFfzrjU+d0eHmECGl9llvg35Fr
	Xoupr1lKjn9I8h230=
X-Received: by 2002:a17:907:fd15:b0:c40:33d:f06f with SMTP id
 a640c23a62f3a-c513aaad90bmr920564266b.39.1795436692893; Mon, 23 Nov 2026
 04:24:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
 <CAKTNdwH9QAgreJ-6+t1j_P1di4VyoMBSsFkf_g=mCi_-M8g9Pw@mail.gmail.com>
 <20260917221857.GA4056431-robh@kernel.org> <CAKTNdwH6E5=9gZHB6tdianC2+1aDv4wnLmvL59kDW-dR3a12bg@mail.gmail.com>
 <AQpdyd6hRl9cLAxBK-fEdzq0dcZsWpHP63dbDpOxcNQWCdaNIc4D3Mfi9Ll86jBVsbEVhr5-9EZzFHbkF6efBDcRUT7nXx9TH5Aeffy5DyU=@protonmail.com>
 <RWg2ZbGh-TJtEJMDWD9DGxBKsszG10BM07351ALdCUa9UL-IImPGxSYztcNF3kiRFVCA0x5cECwign-2lb56nPMGZQ5LVZhckY4-KTb5qpk=@protonmail.com>
In-Reply-To: <RWg2ZbGh-TJtEJMDWD9DGxBKsszG10BM07351ALdCUa9UL-IImPGxSYztcNF3kiRFVCA0x5cECwign-2lb56nPMGZQ5LVZhckY4-KTb5qpk=@protonmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 16:24:40 +0400
X-Gm-Features: Aa3M54pJDInt1dUc3UbuIPmLJ056A7-Am1qM49T-fqpCAj8EFLf-eta10BiPxGY
Message-ID: <CAKTNdwHOoG8j59X7z6j15n8TTf-A-+EQhvC+SqNWOq24p9vNLw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] nvmem: Derive Rockchip MAC addresses from the OTP
 CPU ID
To: Ryan Leung <untilscour@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Michael Walle <michael@walle.cc>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_042457_202648_76746B0E 
X-CRM114-Status: GOOD (  48.39  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ryan,

On Sun, Nov 22, 2026 at 6:08=E2=80=AFAM Ryan Leung <untilscour@protonmail.c=
om> wrote:
>
> Hi Alexey,
>
> On Wednesday, November 18th, 2026 at 10:51 PM, Ryan Leung <untilscour@pro=
tonmail.com> wrote:
>
> > On Friday, September 18th, 2026 at 3:08 PM, Alexey Charkov <alchark@fli=
pper.net> wrote:
> >
> > > Hi Rob,
> > >
> > > On Fri, Sep 18, 2026 at 2:19=E2=80=AFAM Rob Herring <robh@kernel.org>=
 wrote:
> > > >
> > > > On Thu, Sep 10, 2026 at 06:48:33PM +0400, Alexey Charkov wrote:
> > > > > On Wed, Sep 2, 2026 at 5:08=E2=80=AFPM Alexey Charkov <alchark@fl=
ipper.net> wrote:
> > > > > >
> > > > > > Rockchip SoCs are shipped with a unique CPU ID in their interna=
l OTP
> > > > > > memory, and Rockchip bootloaders use it to give boards which ha=
ve no
> > > > > > dedicated storage for a MAC address a stable one anyway: they h=
ash the CPU
> > > > > > ID and patch the resulting addresses into the device tree they =
hand over.
> > > > > >
> > > > > > Kernels started without that fixup, e.g. straight from the SPL =
in Falcon
> > > > > > mode or by any other loader which does not implement Rockchip's=
 derivation,
> > > > > > fall back to random MAC addresses which change on every boot.
> > > > > >
> > > > > > Formalize the derivation in the DT binding and add a Linux kern=
el driver
> > > > > > implementing it, so that a Linux image can use the same stable =
addresses
> > > > > > regardless of the boot flow.
> > > > > >
> > > > > > Only RK3576 is wired up here, that being the SoC I can test on.=
 Other
> > > > > > Rockchip SoCs keep the same CPU ID at a different OTP offset - =
0x7 rather
> > > > > > than 0xa on RK3588, for instance - which makes supporting them =
a two-line
> > > > > > addition to the driver's match table plus the layout node.
> > > > > >
> > > > > > Patch 1 is a prerequisite fix. The OTP hardware has its own int=
ernal state
> > > > > > machine which only works correctly with serial access, but the =
current
> > > > > > driver serializes nothing, which results in timeouts and/or cor=
rupted
> > > > > > reads (e.g. returning splicing a TSADC trim value into the buff=
er of a
> > > > > > caller asking for the CPU ID, or mixing up trim values of diffe=
rent TSADC
> > > > > > callers). Hence the Fixes: tag and Cc: stable.
> > > > > >
> > > > > > Cross-checked on an RK3576 board: the addresses fixed up into t=
he FDT by
> > > > > > U-Boot match the ones derived by the new driver, and the driver=
 correctly
> > > > > > assigns them to the network interfaces when the kernel is boote=
d without
> > > > > > U-Boot proper at all (via Falcon mode).
> > > > > >
> > > > > > Sashiko also rightly pointed out a use-after-free in the nvmem =
core when
> > > > > > a layout driver is unloaded leaving its sysfs nodes and the pos=
tprocessor
> > > > > > function pointer dangling. This is fixed separately in [1].
> > > > > >
> > > > > > [1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-=
1-2d16bebeb518@flipper.net/
> > > > > >
> > > > > > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > > > > > ---
> > > > > > Changes in v2:
> > > > > > - Switched from a scope-based guard to explicit lock/unlock cal=
ls in the
> > > > > >   OTP driver to avoid mixing styles in a function using goto er=
ror
> > > > > >   handling (Sashiko)
> > > > > > - Link to v1: https://patch.msgid.link/20260901-rk3576-otp-cpui=
d-mac-v1-0-ea9135270fc2@flipper.net
> > > > > >
> > > > > > ---
> > > > > > Alexey Charkov (4):
> > > > > >       nvmem: rockchip-otp: Serialize reads
> > > > >
> > > > > Incidentally, patch 1 of this series also fixes CPU thermal throt=
tling
> > > > > on my RK3576 device: apparently, the mis-read OTP-programmed ther=
mal
> > > > > trim values broke the thermal governor logic, which now works
> > > > > correctly with properly serialized OTP reads. So it would be grea=
t to
> > > > > have these merged.
> > > >
> > > > It would be great to have the sashiko comments analyzed and replied=
 to
> > > > as well if you would like this to be reviewed.
> > >
> > > Of course. One code-related comment Sashiko raised has been addressed
> > > in a separate patch [1] which is still pending review. The
> > > binding-related comments will need to be revisited, as I'd like to
> > > first explore the idea Ryan proposed in the adjacent thread [2], as i=
t
> > > will change the approach somewhat if it works out.
> > >
> > > Best regards,
> > > Alexey
> > >
> > > [1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-1-2d16=
bebeb518@flipper.net/
> > > [2] https://lore.kernel.org/all/20260916123355.4507-1-untilscour@prot=
onmail.com/
> >
> > Hi Alexey,
> >
> > Have you had a chance to explore this? I have got a working proof of
> > concept [1] for the format I suggested, tested on RK3576 (NanoPi M5) an=
d
> > RK3528 (NanoPi R28S).
> >
> > Best regards,
> > Ryan
> >
> > [1] https://github.com/untilscour/openwrt/commit/a622c1cf292f7a4bb70935=
21e25436be324fc1a4
>
> I've updated [1] the proof of concept slightly. Perhaps you are busy
> with other patches? As it's been more than 2 months, if you don't mind,
> I'd like to send it in as v3 of this series, with you as co-author.

I've had a look at your proof of concept. What worries me is that it
introduces a "virtual" DT node for the MAC address derivation without
a corresponding hardware block underneath it, which sounds against DT
conventions.

I'd like to try a slightly different approach: have the CPUID cell
carry a dedicated compatible string such as "rockchip,cpuid", with a
binding description outlining the added semantics for deriving a MAC
address from it. Then have the NVMEM driver check if the cell is
accessed as "mac-address" and apply postprocessing before returning
the buffer. That's what e.g. drivers/nvmem/imx-ocotp.c does currently.

Let me give it a try, and then let's see what other reviewers say.
I'll add you in Cc.

Best regards,
Alexey

