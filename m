Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D3B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y/w8hIzz;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EQDaEarX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MrwdyrGCigoLs5sakLPRHPJFywstvadxadEtt5B8ORo=; b=Y/w8hIzzp4B8HD
	5j2ctMuV1lfmbTe7DN4ghvV6NjIys3XHjVP8ifofD/am8EQR7SywNqLxPkPMpy7ctIzsvqLS8okPn
	uVK8VVojQkeCqUsPUsJGdmDSc1Mvxs/XdXS7NhmYX7aD1hLhmqprL11XHJL2n41CC1eEpJtum6Buq
	t2GAH3asiBYXbxQ3VT8xuo9ql2GOc0EuDpte7sx5+aG90rT2cpvz/CuhRsOU4zPJ+z4ZhZY1Qth8I
	97PCT0tewBMKKSWhAeGkOsttXM+tBSraXs31E1u/uyH5wnOI+Ac0OCyOgSzL7KMOPM2etlI1dt2p5
	hPeVKmuCNcU3XYN0A0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfIy-0000000EMg1-2UW6;
	Thu, 26 Nov 2026 19:38:52 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfIv-0000000EMfd-3vEc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:38:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 629D31A1821;
	Thu, 26 Nov 2026 19:38:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 351CC60558;
	Thu, 26 Nov 2026 19:38:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDF5511E68361;
	Thu, 26 Nov 2026 20:38:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795721922; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MrwdyrGCigoLs5sakLPRHPJFywstvadxadEtt5B8ORo=;
	b=EQDaEarX5ZZKUUatlj8XX6GwcMfEJAdXz0zX+hexJjwp4uUbs1XfV6d/bUYPRmRwv2Dg+j
	20BIq9QfQG4q7a5JWbrLkoPoAC0dddqbX+2IJM+duoput4oR1N09a5uo0MM0okhhW759uJ
	T4sQ1Vz+e0BfRWFpJhIXfLjVGLXwzuDr9Gu9ozrCw6l2Mda2rvzNl1V9YMNLr40KEn6AHC
	T+KO9TJ4bOO5eE93b1IgxmQWtTTHsrXHg3G2yg6ThJS6ptYtSt6yeuZwuE24z3oWBufppp
	uWXxhc5GzwNpWGgJUkMY4lE998ePX5S2z4YS2adtUFu/3ipxvt3LhSI8IX3Cow==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 20:38:36 +0100
Message-Id: <DN5EAJWRZSFX.3GP1W2FARX6K7@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 1/2] gpio: tc358762: fix reset gpio handling
Cc: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <kernel@dh-electronics.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>
To: "Andreas Kemnade" <andreas@kemnade.info>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Dmitry Baryshkov" <lumag@kernel.org>, "Robert
 Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Christoph Niedermaier"
 <cniedermaier@dh-electronics.com>, "Marek Vasut" <marex@nabladev.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
 <20261125-tc3-reset-v2-1-32eefcaf1460@kemnade.info>
In-Reply-To: <20261125-tc3-reset-v2-1-32eefcaf1460@kemnade.info>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113850_111391_335BCF41 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed Nov 25, 2026 at 12:37 PM CET, Andreas Kemnade wrote:
> Reset gpio is asserted when the chip should be active, deasserted when
> the chip is enabled. That is the wrong way. Apparently users are working
> around this by using GPIO_ACTIVE_HIGH to compensate for that bug but that
> is not correcly describing the hardware.
> Since this chip is used in a RPi Touchscreen hat, apparently with
> devicetree overlays floating around, add a gpio quirk.
> Also prepare for using the reset-gpio driver.
>
> Fixes: 3355f4ee561d ("drm/bridge: tc358762: Add reset GPIO support")
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

