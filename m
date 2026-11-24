Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F79C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P49/7rm3;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cC5cNUw7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cheJlkoanCZTRG4AhCJxbSrRT9zoO/I9wDY38Qxp5Hk=; b=P49/7rm3Auw1fi6dc11LxvWpzh
	Em+mPy/Gixl4GTjKbfuHLP+wF3oub9u2HsrMan6nAYQZZxKw2HXNbKKGWlB2Ud2MS4TsR9Hexr+l+
	1GlkjGcGix6PTvd2NxnuzI6C5PB33VpMQd1amJRvPGMKZqpmB39XdUE6VDKIOzEX52vx1+cbE7l+p
	vAPNPU0HH5CtwhabdmiE9miRWC4zw0K5fyviVypTPCJFy8Xf97Fxa50XtF075qWlhdDRdMEAD8eEm
	K5qwBhF/4EpXV2ZUsYcYX647oryXVg9OKa+mXxSZiwB0otLkrVOSclpsp+uyo7DOErAUfBMZbHCEg
	cwO/K42w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtaT-000000079BD-1jTu;
	Tue, 24 Nov 2026 16:41:45 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtaO-000000079AO-3Ux0;
	Tue, 24 Nov 2026 16:41:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 86173C2C65F;
	Tue, 24 Nov 2026 16:41:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED19B601E1;
	Tue, 24 Nov 2026 16:41:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A4A9211E69A7F;
	Tue, 24 Nov 2026 17:41:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795538489; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cheJlkoanCZTRG4AhCJxbSrRT9zoO/I9wDY38Qxp5Hk=;
	b=cC5cNUw7oFJed13YEaX4fWUIaxKQkdzydKfQ9yy80c4r8hL2EGyps+9mJ9gPa29bZau93Z
	Mm1WW2W0cSx8HaIZMfhL8Sptorsuabrl1dcNoZflp6Fq1/r8sVQHlybGU079m+Fz4TNUT6
	cYwawPDm55MjDOIwMVGf0aPeWweEWwNEl5LljDozd9ecGuUzMutf6GwrFFPV8yw5+zfTOR
	1VLNmelAq4LWQODxHw7mpEce9TdtfE7LVBSIZBXXLTs32hcgPBpUOMAV8PJ6Fv5aOBPJYN
	w5d5TTZUCQxTY2eLtRCdP7Nrk5UXXYUZ+ff4wW+D+Cnu3nlAnXVzWj00DBMliA==
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
Subject: Re: [PATCH 3/4] dt-bindings: phy: cadence-torrent: add phy-mode constants
Date: Tue, 24 Nov 2026 17:41:19 +0100
Message-ID: <8vihTUc0Sjqm4gFwtZkB5w@bootlin.com>
In-Reply-To: <20261121-wine-nautilus-of-courage-94af4f@quoll>
References: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
 <20261120-phy-cadence-torrent-ng-v1-3-da2db7125cd7@bootlin.com>
 <20261121-wine-nautilus-of-courage-94af4f@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_084141_023166_B6CD9D1C 
X-CRM114-Status: GOOD (  18.31  )
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

On Saturday, November 21, 2026 at 5:20=E2=80=AFPM, Krzysztof Kozlowski wrot=
e:
> On Fri, Nov 20, 2026 at 01:55:51PM +0100, Benjamin Robin wrote:
> > Add the `CDNS_TORRENT_MODE_*` constants to
> > include/dt-bindings/phy/phy-cadence.h such as SATA-LP and 2500BASE-X.
>=20
> But why? Why do we need more of these properties?

The Torrent PHY supports multiple standards: PCIe, USB, SATA, XAUI and
SGMII, ... For some of them, additional configuration options exist:

=2D USB:
  We need to know the I/O supply voltage (1.1 V or 1.2 V), since it
  affects the TX full-swing magnitude multiplier configuration for the
  USB TX/RX pad supply.

  The link can also be limited to Gen 1 speed (5 Gb/s SuperSpeed)
  instead of Gen 2 (10 Gb/s SuperSpeed+) to reduce power, which is why
  the option is named "LP" (low power).

=2D SATA:
  The PHY supports SATA Gen 1 (1.5 Gb/s), Gen 2 (3.0 Gb/s) and Gen 3
  (6.0 Gb/s). The link can also be limited to Gen 2 to reduces power.

=2D XAUI:
  The link can be configured to 1X only (3.125 Gb/s lane rate),
  dropping the 2X rate (6.25 Gb/s), again to reduce power.

=2D SGMII:
  The link can be "overclocked" to 2500BASE-X (called SGMII+ in the
  user guide) instead of 1Gbps. There is no PHY type in
  `include/dt-bindings/phy/phy.h` for 2500BASE-X, and since it is
  technically SGMII at a higher speed, I am not sure adding a new PHY
  type there is appropriate. That is why I added these constants to
  phy-cadence.h instead of reusing PHY_* types. If there is a preferred
  way, I am happy to rework this.

> >=20
> > These constants are used by the new Cadence Torrent PHY driver and
> > are referenced by the `cdns,phy-mode` property of the Cadence Torrent
> > PHY binding to select the PHY mode.
>=20
> That's obvious, explain why you are duplicating phy type instead.

You are right, the commit message needs improvement.

Any guidance on how you would like these options represented in the
binding would be much appreciated as I am not entirely sure about the
best approach myself.

The plan is to eventually allow reconfiguring the SGMII link speed
dynamically through phy_set_mode(), but for now the configuration needs
to be expressed statically from the DTS.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




