Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563AF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JMJDDqMk;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=xkMoTvUx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=seLBTqo+TbPyZH6raQEMgMKdv+2iIg01h84sk7q1r0o=; b=JMJDDqMkw6DiZu
	V0EDpKtuPKMfqHOeVfA4e4B8kCTYFRLJFUpBpur+D6L+P3hDHvWQv8bf9hfttJj/scAAxrndWEOBc
	vaT/I7o72Tak62xebWl+C8l6C9CcSoikCknrPZrYX3ewmMwu5lQO/2t8yTtXAnWKNHHVnduUYMpCf
	ZAlgjIR4aoenYYsu5Fp5e21Uf0peYzpp04zJrm2OwHtU31skR/Ef9B4nS+GouM3ggdlVpBndJaDvD
	mfwopqcmPa6bzyddliUnpUbXwjZFiD15FbL3+L22bHusPD1EEM7+rEpUFuvCslMrZaphBbIbd/A8W
	XAPDC3erYJLGN9l5ZTsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuOm-0000000FsgN-3Sat;
	Fri, 27 Nov 2026 11:45:54 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuOh-0000000FsfM-2u7q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=seLBTqo+TbPyZH6raQEMgMKdv+2iIg01h84sk7q1r0o=; t=1795779947; x=1796989547; 
	b=xkMoTvUxaZY85B8w0XZLs5LE8FoxiZuBuQx0uZ7xK8DTwnzQIN0ZUFcoHJ24GW+aGAXbGqlPc6f
	abrvol5XN2nHI93uiSOon8jwf2ARXpc1U+R3ylNSeYjmhZqPtIjxW+wH60JJtRitWgmYFpdjKJV+S
	Uhc+IxifN4C7s/Viz8K9bQBC1JA7jGheOTdLKOfTYc1EbV3xhp4VW/ZAxj38UFsHV187aihM11y4L
	Ak2DwPXAOriJNwQ/0hanOY+kVK6pnHuhgIw9SgVCKsTcSQYPVY47mzXoGb/m5Dt+qWGtz5P7HS0fq
	eWYCNCOSJaDuEURRvJp6n3cWBc8/vxjXiVAw==;
Date: Fri, 27 Nov 2026 12:43:18 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux@yoavmoshe.com
Subject: Re: [PATCH v2 0/3] ARM: imx: Add a more agressive idle mode on
 i.MX6SLL
Message-ID: <20261127124318.276552d2@kemnade.info>
In-Reply-To: <awhl-wsYhZlC_VD4@SMW015318>
References: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
	<awhl-wsYhZlC_VD4@SMW015318>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_034547_731998_CEE4F1AC 
X-CRM114-Status: GOOD (  36.64  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 26 Nov 2026 11:01:47 -0600
Frank Li <Frank.li@oss.nxp.com> wrote:

> On Thu, Nov 26, 2026 at 12:00:53PM +0100, Andreas Kemnade wrote:
> > On Ebook readers there are often situations in which the system waits
> > only for some GPIO IRQs and no module is active, all the clock system
> > is using most of the power, not every clock gets disabled via RPM,
> > esp. those are marked as CLK_IS_CRITICAL.
> > A usual he situation might be mainly wating for touchscreen input.
> > Since nothing needs to be sent to the display continously, clocks
> > are not in use. Maybe some frontlight is consuming power, but if it
> > is not used in maximum brightness mode, the clock system is still
> > using a significant portion of power.
> >
> > In contrast to suspend state, that is not forcefully turning things of
> > and wake up only on selected important things when the device is not us=
ed.
> > E.g. you might still want to have frontlight enabled.
> > Vendor kernel work around this by adding an extended suspend mode in
> > which more things are disabled, e.g. the touchscreen.
> >
> > So rather add another idle state, which is only conditionally used
> > depending on clock usage.
> >
> > System timekeeping is currently using a high speed clock, which is a
> > major blocker for this idle state.
> > Use 32K clock for the timer and the clock source to avoid that
> > dependency and allow the timer to be used in stop mode if that low
> > power clock source is used.
> >
> > Other things preventing entering that idle state:
> > - imx-thermal driver: probaly needs some notifier block called by
> >   cpu_cluster_pm_enter to avoid false alarms like ti-bandgap does
> > - PXP and DCP drivers are missing RPM, so they keep clocks enabled.
> > - serial console: needs to be unbound
> >
> > With these patches are applied (and the not-yet-upstreamed EPDC driver)
> > I can run a loop displaying the current consumption in every 20 seconds
> > for about one week. Power saving is around 70% in such
> > situations. =20
>=20
> Nice feature, but how to make sure don't cause regression?
>=20
I think it is quite opt-in at the moment. At least gpt1_serial should block
the idle state if not reconfigured accordingly for that board.
CPUIDLE_FLAG_OFF might be used as well initially to not have surprise opt-in
one day.

=46rom my testing / maintenance experience (I have used an OMAP3 device as my
main mobile working horse, which has very deep cpuidle states):
- Most problems show up with only one device active at a time
- Sometimes waiting for something with clocks disabled my cause issues
  -> explicitely enable clocks, pm_qos (I do not think this topic
     is that present on i.MX6 (mechanisms similar to drivers/clk/ti/autoidl=
e.c
     seem not to exist)
- context save/restore can be an issue
- puts a spotlight on any pm omission anywhere, mostly by blocking
  that deeper idle state, but that does only mean as high power
  consumption as without it. e.g. DCP and PXP drivers just keep their
  clocks unconditionally enabled.

Looking around: there are quite some devices not having a driver on
mainline (or at least no devicetree entry for it):
- epit
- csi (imx6ul has)

no driver... no breakage

Looking around in drivers to see if anything happening at suspend/resume
should also be done at runtime suspend/resume:
Interesting commits targeting the sound stuff
What I would also do is looking=20
05cf237972fe6 ("ASoC: fsl_ssi: Add driver suspend and resume to support MEG=
A Fast")
8661ab5b23d6d ("ASoC: imx-audmux: Add driver suspend and resume to support =
MEGA Fast")

These commits add context save/restore handling on resume/suspend.
But it depends on someone setting bit 0 of PGC/GPC offset 0x220.=20

arch/arm/mach-imx/gpc.c does not touch that register at all, does not
even have a define for that. i.MX6SX TRM lists modules belonging to that
domain. The i.MX6SLL TRM contains almost nothing about MEGA besides the
register define. So that all are indications that these things are
a non-issue on i.IMX6SLL.
Also I do not see widespread context save/restore in other drivers
like I see on OMAP drivers.

Regards,
Andreas

