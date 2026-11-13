Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A423E606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W23p9YnW;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=xaqU/oDJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iZJjvOCw+Qz7RTPFaPuatB3TKmf+mxhm32nAlNzRBg4=; b=W23p9YnWZHXy0uEpZ7E7cA4IFP
	kMwIwKQVJsQhqE8aI8Jsdo2FR8FmtxyDiu157oXXcpvDVS+UM0RyH9dO2VS5uxmgpsrqvQWx632zq
	VYTZR923AblbjWVmwy1+zbYX5AWhH6CJWRCx+Z+rj8tTi1JThM10YDEXKlAJTXx0sAiJoQn9Qq06n
	PmYNzJ9mYn+6oNIZFJnFz96H1YcTqkiuwEe6OyJ8FAcMPyDyj7sKSJzLUY9WnoVrFwE2em5WlJdLB
	9hxE4QxjjyMuybuQVvmZg2mKpXrEOjbHFZi9QEvS9b5efaw0UKHWW8nw5P9od428qrlOTat1941D+
	6L2+RuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwp8-0000000E97G-3Bwg;
	Fri, 13 Nov 2026 19:20:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwp1-0000000E94x-09p2;
	Fri, 13 Nov 2026 19:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=iZJjvOCw+Qz7RTPFaPuatB3TKmf+mxhm32nAlNzRBg4=; b=xaqU/oDJTujHMusxbk+DNWU3G4
	4p+uDpNECLpDeko4WUqLozh+GtW8IQ2X4+PtMGG4McdvDNPQfCqE2Fa/wgsjf3bnaRLcHTSBA4f57
	5B7FElsTObCdFy2f2ZLQe4bs2q0uB53b1d2c/Fwe68nExV3jffhRabIGqLSNve8CEGGFl65oqFBMc
	8IZR9s4T9EQVz+bvU1Pn7Z1n5J9rOZModPtsN9g6Ya0HBfrZwAUiN51F4N8b7jCxAOulSIxs1tYWG
	SDBEnH4CTxn+WZPhCu++OrxoGDCnAqNnUl/L2JDJHI5gKR1UkhScCZYX0jZkZtEy13JNTOw3bhnX+
	6vYNeZsQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Coia Prant <coiaprant@gmail.com>,
 Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: rockchip: mark PD_PIPE as active wakeup on RK3568
Date: Fri, 13 Nov 2026 20:20:17 +0100
Message-ID: <gZu9MXL8T6qhkNXh4okAaA@sntech.de>
In-Reply-To: <CAPx+jO-+uwxMN3-LZn4nH4HSXu6GCnvdrUb9ff79W5EeCU4SZA@mail.gmail.com>
References: <20260925041751.495818-1-coiaprant@gmail.com>
 <CALj3r0jMLFbz+oa_z6kySDg-3aLaFWtFoKv9VB_qHhQZDpemfw@mail.gmail.com>
 <CAPx+jO-+uwxMN3-LZn4nH4HSXu6GCnvdrUb9ff79W5EeCU4SZA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_112027_100324_0F4EEBAB 
X-CRM114-Status: GOOD (  25.38  )
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

Am Freitag, 13. November 2026, 18:48:00 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Ulf Hansson:
> On Thu, Oct 22, 2026 at 5:04=E2=80=AFAM Coia Prant <coiaprant@gmail.com> =
wrote:
> >
> > Coia Prant <coiaprant@gmail.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=
=97=A5=E5=91=A8=E4=BA=8C 07:27=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On September 25, 2026 12:17:51 PM GMT+08:00, Coia Prant <coiaprant@gm=
ail.com> wrote:
> > > >The PD_PIPE power domain on RK3568 hosts the XPCS, the PCIe
> > > >controllers and the SATA controllers.  All of them can act as
> > > >wakeup sources for the system:
> > > >
> > > >  - the XPCS for MAC WoL, through the SGMII link
> > > >  - the PCIe controllers for PME#
> > > >  - the SATA controllers for hotplug wake
> > > >
> > > >The domain is registered with active_wakeup =3D false, so genpd powe=
rs
> > > >it down during system suspend even when a consumer is on the wakeup
> > > >path.  That kills the XPCS and the SerDes, which breaks MAC WoL on
> > > >RK3568 SGMII boards, and it also powers down the PCIe and SATA
> > > >controllers while their drivers still expect the link to be alive.
> > > >
> > > >Mark PD_PIPE as active_wakeup so that genpd honours the wakeup path
> > > >of its consumers.  Consumers that call device_set_wakeup_path() keep
> > > >the domain powered; consumers that do not mark themselves as wakeup
> > > >sources are unaffected and the domain is still powered down when
> > > >nothing needs it.
> > > >
> > > >Several other Rockchip SoCs already mark their PCIe and USB power
> > > >domains as active wakeup, for example RK3588's pcie and usb domains
> > > >and RK3576's usb domain.  PD_PIPE hosts the same kind of
> > > >wakeup-capable controllers on RK3568, so this follows the same
> > > >pattern.
> > > >
> > > >Signed-off-by: Coia Prant <coiaprant@gmail.com>
> >
> > Hi Ulf,
> >
> > Gentle ping on this patch. It was sent on Sep 25 and Patchwork shows it
> > as "Handled Elsewhere", but I can't find it merged in linux-pm,
> > linux-rockchip, linux-next or mainline, and I haven't received any
> > review feedback.
> >
> > Since then, the XPCS driver and DTS that depend on PD_PIPE staying
> > powered across suspend have been merged and sent upstream:
> >
> > - XPCS driver in net-next: https://git.kernel.org/netdev/net-next/c/5e9=
1edfb0e45
> >
> > Could you let me know which tree this should go through, or whether it
> > was already picked somewhere? If it needs to be routed differently, I'm
> > happy to resend it.
> >
> > Thanks,
> > Coia
>=20
> Apologize for the huge delay. I was waiting for an ack from some of
> the rockchip maintainers.
>=20
> Anyway, this looks fine to me so, applied for next, thanks!

got lost in my inbox ... and for the record yep, looks correct


Heiko



