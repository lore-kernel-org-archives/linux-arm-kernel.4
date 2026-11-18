Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74237606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GeYlWuXG;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=rZ/PnwSS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eY4Iukd9tnjFhKXxywz21kAw07HDovdZxf/3jteIVpk=; b=GeYlWuXGhKY7hc
	YXEH+dmoe9T2vB1ruOs7jHXVlbQCyY2MDvXkdBwL6WErnBEcxEeGxBcGrS0y9BcDQILFO2nVJlBJR
	FI2x36xpwx+rslm2sdQKA19xJo7nmJMSAY2pjQdlP8MGb5tocURKSRHN0+KnAtgAqyTvkwt3tcU05
	O8EhA1ITY1hlErH7VHJ+e+gBGea6oNJLgFLAwzZS/EICHUsv3RdebUTcgmAha14tx7rTx51GBj83H
	kZ9NGqbrKqho4lIrrbwUpUfyqhpqESHX+Jpc0xanDIU4oG7qoM9zBpR5YQ9W91uuW71krr9yfGV70
	4ZT5hV8RUpLqf0ixNcHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTh0T-000000099QO-0Rym;
	Wed, 18 Nov 2026 14:51:29 +0000
Received: from mail-10696.protonmail.ch ([79.135.106.96])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTh0P-000000099Ox-21xu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 14:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795013480; x=1795272680;
	bh=eY4Iukd9tnjFhKXxywz21kAw07HDovdZxf/3jteIVpk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rZ/PnwSSZ1nVthbPy1h4qRvgQHEffarDlEReR+yx4dBjD7tO5dpXE3Yk0xZ/gp/Qo
	 v9LxmsS4Tk4xS1FeiH9Ni1c2yU4mo0nDfJx3t4DZZcjLk99IGRTyeLh4zYyxZis8tk
	 vxaDOHxwwY3IXTw6LEaQLh2GsMiHC3nzYf+unvtdTUV4fDe9iiN1nWWtsj0VkFTkH5
	 kzfktF8ZQWifZDoNYSY3TzUB3NBZGhx5jl12r/wi6ikVxb3krMi5GcGH2dyBmFPQGj
	 rFA+nffQYoDiNiapYqKhIviuE65hFotW5iIRO1rxM+lApx3lC876DbwXXAt75lzQKx
	 tcTciGWpaIh7w==
Date: Wed, 18 Nov 2026 14:51:13 +0000
To: Alexey Charkov <alchark@flipper.net>
From: Ryan Leung <untilscour@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Finley Xiao <finley.xiao@rock-chips.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/4] nvmem: Derive Rockchip MAC addresses from the OTP CPU ID
Message-ID: <AQpdyd6hRl9cLAxBK-fEdzq0dcZsWpHP63dbDpOxcNQWCdaNIc4D3Mfi9Ll86jBVsbEVhr5-9EZzFHbkF6efBDcRUT7nXx9TH5Aeffy5DyU=@protonmail.com>
In-Reply-To: <CAKTNdwH6E5=9gZHB6tdianC2+1aDv4wnLmvL59kDW-dR3a12bg@mail.gmail.com>
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net> <CAKTNdwH9QAgreJ-6+t1j_P1di4VyoMBSsFkf_g=mCi_-M8g9Pw@mail.gmail.com> <20260917221857.GA4056431-robh@kernel.org> <CAKTNdwH6E5=9gZHB6tdianC2+1aDv4wnLmvL59kDW-dR3a12bg@mail.gmail.com>
Feedback-ID: 184418679:user:proton
X-Pm-Message-ID: f72cf6b7ff069e62495bd32a905a304144d1643e
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_065125_688409_E505F653 
X-CRM114-Status: GOOD (  39.65  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Friday, September 18th, 2026 at 3:08 PM, Alexey Charkov <alchark@flipper=
.net> wrote:

> Hi Rob,
>=20
> On Fri, Sep 18, 2026 at 2:19=E2=80=AFAM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Thu, Sep 10, 2026 at 06:48:33PM +0400, Alexey Charkov wrote:
> > > On Wed, Sep 2, 2026 at 5:08=E2=80=AFPM Alexey Charkov <alchark@flippe=
r.net> wrote:
> > > >
> > > > Rockchip SoCs are shipped with a unique CPU ID in their internal OT=
P
> > > > memory, and Rockchip bootloaders use it to give boards which have n=
o
> > > > dedicated storage for a MAC address a stable one anyway: they hash =
the CPU
> > > > ID and patch the resulting addresses into the device tree they hand=
 over.
> > > >
> > > > Kernels started without that fixup, e.g. straight from the SPL in F=
alcon
> > > > mode or by any other loader which does not implement Rockchip's der=
ivation,
> > > > fall back to random MAC addresses which change on every boot.
> > > >
> > > > Formalize the derivation in the DT binding and add a Linux kernel d=
river
> > > > implementing it, so that a Linux image can use the same stable addr=
esses
> > > > regardless of the boot flow.
> > > >
> > > > Only RK3576 is wired up here, that being the SoC I can test on. Oth=
er
> > > > Rockchip SoCs keep the same CPU ID at a different OTP offset - 0x7 =
rather
> > > > than 0xa on RK3588, for instance - which makes supporting them a tw=
o-line
> > > > addition to the driver's match table plus the layout node.
> > > >
> > > > Patch 1 is a prerequisite fix. The OTP hardware has its own interna=
l state
> > > > machine which only works correctly with serial access, but the curr=
ent
> > > > driver serializes nothing, which results in timeouts and/or corrupt=
ed
> > > > reads (e.g. returning splicing a TSADC trim value into the buffer o=
f a
> > > > caller asking for the CPU ID, or mixing up trim values of different=
 TSADC
> > > > callers). Hence the Fixes: tag and Cc: stable.
> > > >
> > > > Cross-checked on an RK3576 board: the addresses fixed up into the F=
DT by
> > > > U-Boot match the ones derived by the new driver, and the driver cor=
rectly
> > > > assigns them to the network interfaces when the kernel is booted wi=
thout
> > > > U-Boot proper at all (via Falcon mode).
> > > >
> > > > Sashiko also rightly pointed out a use-after-free in the nvmem core=
 when
> > > > a layout driver is unloaded leaving its sysfs nodes and the postpro=
cessor
> > > > function pointer dangling. This is fixed separately in [1].
> > > >
> > > > [1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-1-2d=
16bebeb518@flipper.net/
> > > >
> > > > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > > > ---
> > > > Changes in v2:
> > > > - Switched from a scope-based guard to explicit lock/unlock calls i=
n the
> > > >   OTP driver to avoid mixing styles in a function using goto error
> > > >   handling (Sashiko)
> > > > - Link to v1: https://patch.msgid.link/20260901-rk3576-otp-cpuid-ma=
c-v1-0-ea9135270fc2@flipper.net
> > > >
> > > > ---
> > > > Alexey Charkov (4):
> > > >       nvmem: rockchip-otp: Serialize reads
> > >
> > > Incidentally, patch 1 of this series also fixes CPU thermal throttlin=
g
> > > on my RK3576 device: apparently, the mis-read OTP-programmed thermal
> > > trim values broke the thermal governor logic, which now works
> > > correctly with properly serialized OTP reads. So it would be great to
> > > have these merged.
> >
> > It would be great to have the sashiko comments analyzed and replied to
> > as well if you would like this to be reviewed.
>=20
> Of course. One code-related comment Sashiko raised has been addressed
> in a separate patch [1] which is still pending review. The
> binding-related comments will need to be revisited, as I'd like to
> first explore the idea Ryan proposed in the adjacent thread [2], as it
> will change the approach somewhat if it works out.
>=20
> Best regards,
> Alexey
>=20
> [1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-1-2d16bebe=
b518@flipper.net/
> [2] https://lore.kernel.org/all/20260916123355.4507-1-untilscour@protonma=
il.com/

Hi Alexey,

Have you had a chance to explore this? I have got a working proof of
concept [1] for the format I suggested, tested on RK3576 (NanoPi M5) and
RK3528 (NanoPi R28S).

Best regards,
Ryan

[1] https://github.com/untilscour/openwrt/commit/a622c1cf292f7a4bb7093521e2=
5436be324fc1a4

