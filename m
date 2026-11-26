Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A237606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 18:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SVhQqmUL;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=4RdLHP5R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gZd0J6e4Vwhc7KaA03ZOyx2UROI87QlvB1FAZkxX2CQ=; b=SVhQqmULDHP9Ho
	XOZ1mDmsiCD6ai3ejmP4iciEEWeglQKEC6c/RgaEALpDL81/dEoVb0KaZMBpH0Jf8KV6q3r/AOb4D
	a3LAK+8GMY7l+TokSOeIT9vb87w1TNrEva4DlGl7n3GlHhyJz54DD7Y83paCM6jpOZ0PCZFHAfw5E
	e1ttfrObsZ2in95RtXO7YRBaelSeVwBSnTfR8m5lTTKprCYZU2gkY+3qb4tSM5qFuMcP4o31vkMuk
	cqHrZWNAYmJcHOyBDfVX6cstb/4sx8xM/FeUXE1n2F+FNVcohrYcwPQA8FZgzWIlHLagcOKWD0wLr
	J5CFbxyFUZd9t6IDHW2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeIq-0000000EBdw-3EXc;
	Thu, 26 Nov 2026 18:34:40 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeIn-0000000EBdM-49N4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 18:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=gZd0J6e4Vwhc7KaA03ZOyx2UROI87QlvB1FAZkxX2CQ=; t=1795718077; x=1796927677; 
	b=4RdLHP5RY3SNo50LBkn3XB3XM7qWgvt2gVaU9hBZp3QKzTZK3m47u0CQTfeiuMtCBUG1oH3xoqB
	V3toPMt9hM24wvdG/sAQu+8zuuAizTQqCisr/9/7D5oYLBJ6FViWHl0v0b0EHOAe0ahSwb5uO04xu
	+f2n0s+zYe1PfVOrhb5377ASkKewhGr6pOE9sNj4w4ix4Lsb+kHWijaSpOYGzKR27X48NetDEPqrH
	lwOV5j53/2Udnd9Xp/jr8CcrteW2yhpEvPFXNCvbLR5nhwKun5+XGUTLGRVmURSbyOxzixZWKrABs
	M0Y8yBDWXpA3R5MJI54KYFFWSICHegp4F/xw==;
Date: Thu, 26 Nov 2026 19:34:23 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Christoph Niedermaier"
 <cniedermaier@dh-electronics.com>, "Marek Vasut" <marex@nabladev.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <kernel@dh-electronics.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358762: fix reset handling
Message-ID: <20261126193423.2344f609@kemnade.info>
In-Reply-To: <DN5AB16C26GE.3M5Y1X38QATK8@bootlin.com>
References: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
	<DN5AB16C26GE.3M5Y1X38QATK8@bootlin.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_103438_036160_D389E427 
X-CRM114-Status: GOOD (  21.43  )
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

On Thu, 26 Nov 2026 17:31:09 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

> Hello Andreas,
> 
> On Wed Nov 25, 2026 at 12:37 PM CET, Andreas Kemnade wrote:
> > The bridge driver desserts reset after disable and asserts that
> > upon enbale. That requires users to workaround that by declaring
> > the reset gpio wrongfully active high.
> >
> > Fix polarity in the one device tree actually declaring
> > a reset line. That patch has to go in after the bridge fix.
> >
> > The issue came to sight during experiments with reset lines on the
> > Epson Moverio BT-200. There are two of these chips with a shared reset
> > line, so also prepare for future conversion to use a reset controller.
> >
> > To avoid having GPIO maintainers spammed with a bunch of patches for
> > BT200 support, do that fix separately and now, so it can go in more
> > fast-track way.
> >
> > The devicetree change is only compile tested and is more
> > a cleanup, not an urgent fix.  
> 
> Can you test it and report back? I guess it just means applyint patch 2
> without patch 1 and checking whether it works.
> 
No, I cannot test that. What I can confirm is that BT200 reset with a single
chip works with GPIO_ACTIVE_HIGH without Patch 1, with Patch 1 it works with
both GPIO_ACTIVE_LOW (which is the correct descrption of the hardware) and HIGH.

Patch 2 is based on the assumption that things are working in the state it
is in right now, and only corrects the description of the hardware.
I expect to break things if it goes in without patch 1, so probably the
best strategy. would be if patch 1 goes to v7.n, then patch 2 should
go into v7.n+1.

BTW: BT200 support depends on the stack of patches from Tomi + my RFC +
reset wire up.

Regards,
Andreas

