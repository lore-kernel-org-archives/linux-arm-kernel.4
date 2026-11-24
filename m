Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6762D606A336
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YlHeXwUK;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=BoyObo1z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NrmR7f4NWvJtaGShihv5Oaav7f9YUTikEYvCAM/Zj8A=; b=YlHeXwUKBax9XQ
	2wNLjZMkr3sMflGvYxifpALLstIvb6ZjBPA3Rj5VkZN9094NexDfOhAX0bspxu3ggeBctl+pxRl6E
	W6iXtloPruFACeU/TP63HoiQpGioKkuWPl4Zapjq/6CIlrSH6wowd8DilwLRlPv8/Axj2gijIK7MO
	54s1i7Axwup0LjLgy2ercGQjnrB6P9OahxEwOS39HJqcvz/6zD1QXDrW7IbMlpbwYuXLpAe6ggp3X
	eoXkAGmyHJxWJcHgp49Ym4vCM0u0UiefK4obnl5/ryJDNXE/hqpIZxZo27P38iqZT3St8YiYeH81c
	PeHBlSD+7mKxqqqALggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrRm-00000006jew-1qsf;
	Tue, 24 Nov 2026 14:24:38 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrRk-00000006jeB-1t3f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 14:24:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=NrmR7f4NWvJtaGShihv5Oaav7f9YUTikEYvCAM/Zj8A=; t=1795530276; x=1796739876; 
	b=BoyObo1zkWaNSD8VRAuIf32Gg3XKuv8hqZnk0TuF7aIUbMHmDO2e3pVP3VweYCjigkVpIs1C/7M
	QttEfxN2DOzj/hiR7KBTKqKWYBRIqE0v55NLi2rNzSKTP23AZU6Dy1v644cpTnb08QxZQ8UmqyXet
	Q4Yq6majcUQ91m9bDLTtL4zi/+ys8q92Z/Hmakiuy9nWo2XnPCE5M/w0B4rIbqZEtm1dluzDWaE7D
	DtZvlz93+LtLORp8oFIK7gUvFIsDbHp4REDj222ZGWoNf3sjaf0wrLw/wHlHutzedO1Nn4bQMDNgj
	rLuqgvYoxVr94HR2jmJ1oOMeNr5OhGOsnthg==;
Date: Tue, 24 Nov 2026 15:23:49 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong
 <neil.armstrong@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, Robert
 Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Christoph Niedermaier
 <cniedermaier@dh-electronics.com>, Marek Vasut <marex@nabladev.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH 0/2] drm/bridge: tc358762: fix reset handling
Message-ID: <20261124152349.6a1b6826@kemnade.info>
In-Reply-To: <7a94fa5a-ddfc-449e-b014-387d8e868e97@ideasonboard.com>
References: <20261124-tc3-reset-v1-0-a5d27fe4b5de@kemnade.info>
	<7a94fa5a-ddfc-449e-b014-387d8e868e97@ideasonboard.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_062436_499713_AAA51218 
X-CRM114-Status: GOOD (  25.10  )
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

On Tue, 24 Nov 2026 15:44:40 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Hi,
> 
> On 24/11/2026 13:54, Andreas Kemnade wrote:
> > The bridge driver desserts reset after disable and asserts that
> > upon enbale. That requires users to workaround that by declaring
> > the reset gpio wrongfully active high. As an interim solution,
> > ignore polarity, until things have settled to fix it afterwards.
> > That will break setups with an additional inverter in the signal
> > patch but those should be uncommon, at least not seen in in-tree
> > devicetrees. Fix polarity in the one device tree actually declaring
> > a reset line. That patch has to go in after the bridge fix.
> > 
> > The issue came to sight during experiments with reset lines on the
> > Epson Moverio BT-200.  
> Indeed, the driver has it the wrong way... But what is the way to fix 
> this? Fixing it will always break the backward compatibility with dtbs.
> 
> Is it worth it? Or is it easier to just adjust the bindings doc to 
> mention about it, and add a note to the driver that the gpio is set the 
> wrong way "on purpose".
> 
I am a bit wondering whether to use the reset-gpio driver as aux device,
and then we would need correct dts. There are two chips sharing a single
reset line, so I have to deal with shared gpios. It seems not to work
that well directly. But first I try to have things working with well-defined
boot state.
That reset-gpio stuff was invented exactly for that case, see commit
cee544a40e4426040946e685988b1489f13e6600.

> Or, if this is to be merged, I think the code around the 
> gpiod_set_raw_value_cansleep calls should have a comment to highlight 
> why it's calling raw funcs and what the plan is.
> 
Yes, the comment should be there.
Sashiko suggested to add an entry to 
of_gpio_try_fixup_polarity()

to have fixups.

Regards,
Andreas

