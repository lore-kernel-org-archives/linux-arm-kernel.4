Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9118E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qhhf7bSI;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=g+54x+pL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MMIveEgZcxzjxz6ZQiv/+4zr63avK8Y8JIemnxMuPEU=; b=Qhhf7bSIX+mKy4EqLo/85yLvBk
	gS+h0F0GQVyZozS9iX4HJhwRHF63KpV4QtDmeD8CXbZB2wU2m2bvvy5Evq1M5hU6QZL1gnK+sVedU
	csblz+8BuLBIkdh4ucboxPYiVXO8UO8tKzfqf91JnxnXW7QaCcX9egKT3ZJ74ZHj5LL2rtIJ11XsW
	GlYnTwhMI2PDZDJgCWz6zRH5JWZUH7O5LbvVhXX4PBPjUdMBR0L0sOY5NwkUJ+OPiUVH3q8Rx/XSP
	a5lhVqaJrz9VyrqI9yezALe1ju9xDOkAb+F4QF2xS5oStGYelRThW97QtniiAmfdLQDIJNUiEU0sh
	JkmwGoAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuAI-00000007KBz-2vDY;
	Tue, 24 Nov 2026 17:18:46 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuAF-00000007KAL-1Ogr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:18:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 43DEBC2C65F;
	Tue, 24 Nov 2026 17:18:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B4E7601E1;
	Tue, 24 Nov 2026 17:18:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F64211E69AC2;
	Tue, 24 Nov 2026 18:18:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795540717; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MMIveEgZcxzjxz6ZQiv/+4zr63avK8Y8JIemnxMuPEU=;
	b=g+54x+pLU5Kc2m40alhMaVRIENF1mgYNwpY79Wr/hIkUVfH+6KcxX042P/N7vI3ZCrXQqX
	cYHmmzcrNhi+W0dZqmqEUgBvYr9/fuq5j+inrTYwA6DcNo09xgx1XmHjalE/+PCrBWJEyZ
	j5DKjgo4ZSJIql7gm2ZokKvKKEEZm0HeKhDDWDX9AHr1r0fubD5FZibQ0tt9dVmRYPd9Jf
	jFDN2GIIN+I0MPPul+TJs7I/VKkQ89JfMGb3h5uQSCmY0enkaucsyfdDToglMov2VdE3Iq
	r+2Mu+QbFeLnZ/WHPeTkSIOMEyWaW8fraPv+FHvSYkSfVPjk5f23Gs9RqtwDng==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yuti Amonkar <yamonkar@cadence.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Chintan Vankar <c-vankar@ti.com>,
 Abhash Kumar Jha <a-kumar2@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Swapnil Jakhade <sjakhade@cadence.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 4/4] phy: cadence-torrent: rewrite Torrent PHY driver
Date: Tue, 24 Nov 2026 18:18:24 +0100
Message-ID: <22sq13shQmSOkQPF53jaXw@bootlin.com>
In-Reply-To: <20261121-artichoke-sturgeon-of-karma-a7c4e5@quoll>
References: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
 <20261120-phy-cadence-torrent-ng-v1-4-da2db7125cd7@bootlin.com>
 <20261121-artichoke-sturgeon-of-karma-a7c4e5@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_091844_117628_C8E64D9F 
X-CRM114-Status: GOOD (  30.13  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Saturday, November 21, 2026 at 5:16=E2=80=AFPM, Krzysztof Kozlowski wrot=
e:
> On Fri, Nov 20, 2026 at 01:55:52PM +0100, Benjamin Robin wrote:
> > The Cadence Torrent PHY (sd0801) is a multi-protocol SerDes used in
> > several SoCs, among them the Texas Instruments J72xx family. Its
> > programming depends on many parameters: the selected protocol (each
> > associated PLL has to be set to a different frequency), the DisplayPort
> > bit rate, the reference clock frequency, whether spread-spectrum
> > clocking (SSC) is enabled, the number of lanes, and the PHY revision
> > and technology (process node).
> >=20
> > The current phy-cadence-torrent driver hard-codes, for every supported
> > configuration, the set of register values to program. Because this
> > configuration space is large, adding a new board or a new combination
> > of standards requires duplicating dozens of opaque register values,
> > which is inflexible and hard to maintain.
> >=20
> > This new driver version computes the register values instead:
> >=20
> >   - registers that depend on the reference clock frequency or on a PLL
> >     frequency are computed at run time, from the reference clock
> >     obtained through the clock framework and from the PLL frequency
> >     derived from the selected standard;
> >   - the other registers, which only depend on the standard type, the
> >     PHY revision and the technology, are handled by one function per
> >     register, using an internal table selected through a
> >     standard/revision/technology key.
> >=20
> > The PHY revision and technology are detected automatically from the
> > PHY identification registers, and the DisplayPort link initialization
> > and rate reconfiguration have been rewritten.
> >=20
> > Compared with the existing driver, this rewrite provides:
>=20
> 10k lines patch!

I was expecting this kind of feedback, which is why the cover letter says:

  Because this is a complete rewrite, the diff is large and not well
  suited to a line-by-line review. The rewritten driver can be fetched
  from the phy-cadence-torrent branch at https://github.com/benjarobin/linux

To give more context: the new driver was written from scratch, in a new
empty file, although a very small part of the old driver was copied over.
I initially considered adding the new driver to staging, but after internal
discussion we decided against it.

>=20
> No, instead improve the driver instead of doing bunch of significant
> changes like:
>=20
> > -#define MAX_NUM_LANES		4
> > +#define MAX_NUM_LANES		8

Regarding incremental changes: I could try to build a series of smaller
steps from the old driver towards the new one. That comes at an
additional "cost", since intermediate patches would fix functions or
how there are called, that a later patch then removes or replaces.

However, even with such a series, the core transformation remains: one
patch replacing all the tables with per-register functions computing the
values. That patch alone removes roughly 3k lines and adds 2.5k lines,
which cannot really be split further.

So, I am going to try to create an incremental series: many "small" patches
converging towards the new implementation, with one unavoidable large patch.

With this additional context, could you confirm whether you would
prefer the series split into smaller patches?

>=20
> This is absolutely unreviewable.


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




