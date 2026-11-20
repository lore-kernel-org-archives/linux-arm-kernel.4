Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B500606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 08:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=umI7ORJc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=j3BfZ7QN;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=bIx8Bjdo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UxmBx3Rz1ImbRcmIwlXmykyvtl7+nbEutG+sEKlD5uk=; b=umI7ORJcEfGZUu
	Bcn52jh6U4SVmld+MH7XrXIHahX3K8oRGBuAzRBxODCMH+BDSTCkKQiL3JfPZmXJ9JzXMfJFVhRKu
	Fcx5zr+v9LiphfwkG4nZPWfZDbp7Ej9FRuylvb0GmSUsfMOOVn9mA87mG4oSWDyvc2z/QJTQ4yAQb
	hr7vcFLGDxkqK4aQSj/I0n6ZnfrZ0872/Vm2RYb8JwDUOvQX3IMoFEUWl8ZpdLhByYxh5xpn5rath
	kajzJmSb9LYmwe7++01loNAd2Go7sgtMAPXopzPhksGrweXXNYEmFJipgaocuSTqbCE9UIZNEgBpy
	xao6mVXmuWkYKtZ8WWSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKHo-0000000ENzK-18bo;
	Fri, 20 Nov 2026 08:48:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKEF-0000000ENG8-36Rc;
	Fri, 20 Nov 2026 08:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UxmBx3Rz1ImbRcmIwlXmykyvtl7+nbEutG+sEKlD5uk=; b=j3BfZ7QNQ/tbsAc38CDSWIuD2D
	xQ8uwpX6bkzgKkH/FiugXA54oINgjtS2fSf3u6Gh6w6QyV1XHAt1WotGCk+y5nZ5mIK0pEx8WRsCK
	qH14k/amXlpKogXES7p7z+aoIcx7Uc/ugHI22Jq+TycKRJAsiuNRs5S/XI/XYbuQDpFaAnzr7KmNl
	bbPb9ngKrdmWRP8Cz/vQEG9uGcrzXep9PotY7NkvVb+Jpvx48ydtyqb9MJ3tATGK4zPem1V18CKKc
	gGt++AKmOyLzn/bc2PLhAFed7+412OJO42CWlWvyvkv8Ig5Z5TUmiz2vp5VN+iM/eJKTo7WUHxgrX
	Q1Zy78gg==;
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKEC-00000000You-2fJj;
	Fri, 20 Nov 2026 08:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=UxmBx3Rz1ImbRcmIwlXmykyvtl7+nbEutG+sEKlD5uk=; t=1795164256; x=1796373856; 
	b=bIx8Bjdow2LJn/g4OYI0z4fmIM/90CaWCHwi4OrUp3DcOjRAwWKLWNAKEoOkdSTm4Rl2wtEhHUG
	4gZQUJKiPCig2wcY64qQ89cVmv/UBLuaruXQ7lGOLO5xWJMuMZIk/Zy9k8sL5AAw/Gey+NcfFzwAU
	ghAFkZA0iFQjrDAVjHsKuEKw0eUrLUz2e4c1JqOLnuk4BfkSDMMgtRRHOtbSSHO7kZFSAGNhGr24V
	f3ubyXxBTijDkFXJFBKMPpo0aigQpr+PwWuYfKYxwZI3+Xmj+696NQKhtwd3pP7D70+sr5h/Ac5aT
	Yb4q9geFaILNIOFkpGcMszBP4cDHyfm/skhQ==;
Date: Fri, 20 Nov 2026 09:43:20 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Geert Uytterhoeven <geert@linux-m68k.org>, ettore.chimenti@linaro.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Paul Walmsley
 <paul@pwsan.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Sandy
 Huang <hjc@rock-chips.com>, Heiko =?UTF-8?B?U3TDvGJuZXI=?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>, Ulf Hansson
 <ulfh@kernel.org>, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 5/6] [RFT] ARM: OMAP2+: Convert to
 dev_clk_get_from_provider()
Message-ID: <20261120094320.442d064b@kemnade.info>
In-Reply-To: <CAMuHMdVbgGV_6yjOip4xT3YhBgaOveHzSRbw9e_cHen9NRZqmw@mail.gmail.com>
References: <cover.1795094688.git.geert+renesas@glider.be>
	<683b5b189409e5ee04100044fb615b01cb877f3d.1795094688.git.geert+renesas@glider.be>
	<20261119225017.15a7b5cc@kemnade.info>
	<CAMuHMdVbgGV_6yjOip4xT3YhBgaOveHzSRbw9e_cHen9NRZqmw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_084416_567324_2D1CB702 
X-CRM114-Status: GOOD (  22.21  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026 08:49:05 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Andreas,
>=20
> On Thu, 19 Nov 2026 at 22:50, Andreas Kemnade <andreas@kemnade.info> wrot=
e:
> > On Thu, 19 Nov 2026 14:40:38 +0100
> > Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > =20
> > > OMAP2+ clock handling uses of_clk_get_from_provider() to obtain clocks
> > > used for power management, so the latter show up as "deviceless" in t=
he
> > > consumer column of the clk_summary file in debugfs.
> > >
> > > Fix this by using dev_clk_get_from_provider() instead, letting us pass
> > > the consumer device, too.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Compile-tested only.
> > >
> > > The first change is probably OK.  The second change may fail if anyth=
ing
> > > in the oh->od->pdev->dev chain is not available yet at this point. =20
> >
> > Test on OMAP3: =20
>=20
> Thanks for testing!
>=20
> > --- clk-old     2026-11-19 22:44:59.810807920 +0100
> > +++ clk-new     2026-11-19 22:26:52.862531880 +0100
> > @@ -1,17 +1,17 @@
> >                                   enable  prepare  protect             =
                   duty  hardware                            connection
> >     clock                          count    count    count        rate =
  accuracy phase  cycle    enable   consumer                         id
> >  ----------------------------------------------------------------------=
-----------------------------------------------------------------------
> > - oscillator                          0       0        0        2600000=
0    0          0     50000      Y   deviceless                      of_clk=
_get_from_provider
> > + oscillator                          0       0        0        2600000=
0    0          0     50000      Y   deviceless                      dev_cl=
k_get_from_provider
> >                                                                        =
                                     deviceless                      no_con=
nection_id
> > - secure_32k_fck                      0       1        0        32768  =
     0          0     50000      Y   deviceless                      of_clk=
_get_from_provider
> > + secure_32k_fck                      0       1        0        32768  =
     0          0     50000      Y   deviceless                      dev_cl=
k_get_from_provider
> >                                                                        =
                                     deviceless                      no_con=
nection_id
> > -    wdt1_fck                         0       0        0        32768  =
     0          0     50000      Y      deviceless                      of_=
clk_get_from_provider
> > +    wdt1_fck                         0       0        0        32768  =
     0          0     50000      Y      deviceless                      dev=
_clk_get_from_provider
> >                                                                        =
                                        deviceless                      no_=
connection_id
> >      gpt12_fck                        0       1        0        32768  =
     0          0     50000      Y      48304000.timer                  fck
> >                                                                        =
                                        48304000.target-module          fck
> > -                                                                      =
                                        deviceless                      of_=
clk_get_from_provider
> > +                                                                      =
                                        deviceless                      dev=
_clk_get_from_provider
> >                                                                        =
                                        deviceless                      no_=
connection_id
> > - dummy_ck                            0       0        0        0      =
     0          0     50000      Y   deviceless                      of_clk=
_get_from_provider
> > + dummy_ck                            0       0        0        0      =
     0          0     50000      Y   deviceless                      dev_cl=
k_get_from_provider
> >                                                                        =
                                     deviceless                      no_con=
nection_id
> >   mcbsp_clks                          0       5        0        0      =
     0          0     50000      Y   deviceless                      mcbsp_=
clks
> >                                                                        =
                                     deviceless                      mcbsp_=
clks =20
>=20
> Hmm, so the passed device is always NULL, and thus there is no point
> in making the change.
> Do you know if these come from the first or second change in my patch
> (I guess the second)?
>=20
=46rom the first change, The second piece is nowadys only used by the dm81*
devices.

I would prefer to have this tested on dm81* too.

Regards,
Andreas

