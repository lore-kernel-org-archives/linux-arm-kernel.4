Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F4B606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R5xj9mh0;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=E2nkLJu8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q2mecaHdf9fQt6uFtB3JOo6SnHGQnL+J6Uhto1mX8V4=; b=R5xj9mh0SJuvNrWMR8uN893/27
	p7lL4SoOxYJChLLH+dBBxpME10c+ZZ4LBkzVMxChyCT/BrrW3oKi9upAYJb0I1NB1z6yetmZiq+0n
	LALHafBK2URSvdhO07DSBehRbVsg41Og05JRX4nPU6fYXqACBltaaBlAPM9jr1ITTpxXJ+v6kSL+5
	mKjjLSbXqlULHWo8bhqrUh8P45Zi5kcmzgOBFJwoT+GXDesgbTAgyAB75MdvBHQmGZUW8+SgEYWxB
	Tqqq72jx9eBMAJ/lQMWywqVVVC9olHaQWY4WQEdSIyJ8WJZdlOx+BY7s/3Wn5r5OEARI0crf+HCs6
	WPACn5Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWHS-0000000Cgh3-2JoL;
	Thu, 26 Nov 2026 10:00:42 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWHF-0000000CgeK-1N0W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 10:00:31 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3062F200509;
	Thu, 26 Nov 2026 11:00:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795687227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q2mecaHdf9fQt6uFtB3JOo6SnHGQnL+J6Uhto1mX8V4=;
	b=E2nkLJu8uEfaPkMO+WNZl7KByQ7wd17jFeir36TfrYvQxbfFKC7mn2SdTAalXdGoaa2ZmX
	4JdaOx+npG715reCsbR4dqlTOdAhV8XxUMxPAVhifDuL7NIW999vC1SXMStE2T4J1Qyuue
	wH7HPosPfk522LVvVeI0DhpI8n1UkwymWyW5FjEOB3ne4Tr3hfd4c4JyIhyW7mrNfZ6Yyr
	YEMwxxw+xpvmpjaLvvWb3e13r5hSYOVKAgLvp23gvm7kpUNJtj7UTG1HeEDxMugxEkKLmA
	DzPgwizW2yWZHh4Cjdyyk6ZugjJLAFSmbay1dQGQJVh6ynP4voaDmCXb9xt25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795687227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q2mecaHdf9fQt6uFtB3JOo6SnHGQnL+J6Uhto1mX8V4=;
	b=FE0vI8qUEgOEZFKbIBM0XdrhW/hSbyHWJ79sdSHrsOnIVg9JEElEXBugFVTnApGxcIFa7G
	Wue4egM96zYl+LHmjwCZWd8cH1JvD4fGUp2BNUcsKW7KeqGlECqkUe3YOKg0dBdRHcqH8B
	xehcEpC+OMFHPxEOGXEywsiSKKbqf014iK9FsG18lWx0/XBf9LNJpEe4n6Uzrd10g0vBo1
	QzCfZpwxO9juycrNaJDMumwinDvIQBiKp8shIONQe8lRT7fgnDC1xY9uGvGRflNo35fwcR
	CrNeELb7j1xccXRj/53szIGDZ7MjEDL49PqzujbKBUcC9uQ1Ec4cl3pg/JbMYA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795687227; a=rsa-sha256;
	cv=none;
	b=VNKAcbU6083evAYtgG/4DbGEJvDmbeaURvQyZkqMuPvl3kT6NFUlGfwrj14ied8bMDmGsK
	1nd8XCpCfywUpvxt6Au1HrWlkK9V+ujelfUgjVJme3TKo2WX51GbHeQUN2f6+ZssaL+Cvw
	jVFVZIrrzbRYtsqnHcmYFbKCYUT1VQzHDacWYk7TY6rBCSZNLAET3rpVHCvqCsr7acPb5o
	/5pi015kNzKdfOLW6rpZi2T620SePC75+kmFWGpWl8si/nqfvUhDKd+qwgUhBaxgXG8++s
	iNrMfHtbfyiBxB3FcQXdd0c0imCObGH4V4h8A/FeZdcfswD8UykmGrHKvBJTFA==
Message-ID: <66d5a395e692387ff39669b60f803cde8f97affe.camel@pengutronix.de>
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney <bmasney+clk@redhat.com>,  Jerome Brunet <jbrunet+clk@baylibre.com>,
 Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,  Peter
 Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>,  =?ISO-8859-1?Q?Andr=E9?= Draszik	
 <andre.draszik@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, Jakub
 =?UTF-8?Q?G=C5=82owacki?=	 <jglow@google.com>, linux-clk@vger.kernel.org,
 Douglas Anderson	 <dianders@chromium.org>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org,  Mariano Marciello <mmarciello@google.com>,
 google-soc@lists.linux.dev
Date: Thu, 26 Nov 2026 11:00:27 +0100
In-Reply-To: <awcz1aP6xcL6G2t4@google.com>
References: <20261125000349.3385325-1-briannorris@chromium.org>
	 <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
	 <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
	 <awcz1aP6xcL6G2t4@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_020029_672034_76B743D4 
X-CRM114-Status: GOOD (  24.94  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mi, 2026-11-25 at 11:15 -0800, Brian Norris wrote:
> On Wed, Nov 25, 2026 at 09:48:04AM +0100, Philipp Zabel wrote:
> > On Di, 2026-11-24 at 16:03 -0800, Brian Norris wrote:
> > > Google Tensor SoCs (used on Pixel phones) manage many resources
> > > (including resets) using a Central Power Manager (CPM) co-processor. =
We
> > > communicate with CPM using mailboxes, abstracted in the
> > > devm_cpm_get_handle(), etc., API.
> > >=20
> > > For posterity, I list a summary of changes made relative to the
> > > downstream Pixel driver:
> > >=20
> > > * Switch to auxiliary bus, as a child of a CPM device
> > >=20
> > > * Use devm more heavily
> > >=20
> > > * Avoid representing each reset as its own Device Tree node.
> > >=20
> > > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > > ---
> > >=20
> > > Changes in v2:
> > >  * Rename symbols from goog_cpm_rst_* to cpm_reset_*
> > >  * Moved shared protocol details to CPM driver
> > >  * Remove custom reset debugfs interface and .remove callback.
> > >  * Remove per-SoC table; we only need naive translation of firmware I=
Ds
> > >=20
> > >  drivers/reset/Kconfig            |   1 +
> > >  drivers/reset/Makefile           |   1 +
> > >  drivers/reset/google/Kconfig     |  11 +++
> > >  drivers/reset/google/Makefile    |   2 +
> > >  drivers/reset/google/reset-cpm.c | 154 +++++++++++++++++++++++++++++=
++
> > >  5 files changed, 169 insertions(+)
> > >  create mode 100644 drivers/reset/google/Kconfig
> > >  create mode 100644 drivers/reset/google/Makefile
> > >  create mode 100644 drivers/reset/google/reset-cpm.c
> > >=20
[...]
> > > diff --git a/drivers/reset/google/reset-cpm.c b/drivers/reset/google/=
reset-cpm.c
> > > new file mode 100644
> > > index 000000000000..ef0863f25cac
> > > --- /dev/null
> > > +++ b/drivers/reset/google/reset-cpm.c
> > > @@ -0,0 +1,154 @@
[...]
> > > +	if (lpcm_id > CPM_RST_ID_MAX)
> >=20
> > This looks a bit weird.
> >=20
> > Maybe add a CPM_LPCM_ID_MAX, directly use U8_MAX here, or rename the
> > constant to not include RST_ID?
>=20
> How about these (with the masks made 8-bit as they should be)?
>=20
>   FIELD_MAX(CPM_RST_LPCM_ID_MASK))
>   FIELD_MAX(CPM_RST_ID_MASK))

Even better. I just got tripped up by the comparison between lpcm_id
and what looked like the limit for rst_id.

regards
Philipp

