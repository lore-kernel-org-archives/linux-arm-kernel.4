Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154D9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MOmVzBmU;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XSq0R6eb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oEbc6GvfEpsr54onGmOLNQTpL2P8UYZyii5KitTQG4U=; b=MOmVzBmUwWkFVN
	cnSngWKHaSGq6T1v9du36H1us+f33Lg7lOkitktrtn+GThK+LeJTLQctJ8yMyDGDBNpGi97APzByN
	Kpj90P++2QL8f2rvBxn8f8kojzAT9oiZ+AKLMby20DvThOriHLCBjkmu9rt4TkBGsA+dvrTfXHu+V
	j+iFnz3G9Co/mnLgS9leYXooB71+ZNQdDtCsJ3N/aOdTyV8Zhqdjo+B3aBRogt8Zt42abvcre1f4/
	rL66NUhvVts+u4czvUz1DAm9IZoA8ukc64pgy+B4ZEKPjswFP67SZ/dyGdtBjjepBJIS5YOCp3OgA
	0hmMvEVsmuGdIAihv5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcNe-0000000DuYU-05Zh;
	Thu, 26 Nov 2026 16:31:30 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcNa-0000000DuXU-0qZz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:31:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2CF08C2B9D2;
	Thu, 26 Nov 2026 16:31:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B15E360558;
	Thu, 26 Nov 2026 16:31:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9187311E69139;
	Thu, 26 Nov 2026 17:31:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795710677; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oEbc6GvfEpsr54onGmOLNQTpL2P8UYZyii5KitTQG4U=;
	b=XSq0R6ebButZYZwwXysdG/xGnajy3rqQ4suyD0LoJQbwU11hLRZ1B0eoOxf1MbLLk4HqS3
	cpet4drLlqhnOh+GwYQvI6OuVAiw/q3rVszc/4nO0pJWDlAh7R8gh2yJY5zcVkHxKyhuza
	DHdjhh6BTJHeYwhKCnni7suBpptl0yz2DC9gPhRNtyO3H/KOmt1/9+tUcvolvNrPhZFkzZ
	MZUZfhcfo1dD5aSekGbXyv4R+D31dMMRuGEsmVEMZpTiVZS9U/7R5/t39J3XkOIawMv2WU
	rFpaTCg3QLM3N+fbFhdlYxdZ2Nprpo0UHzn78390G59CUwax7EF2RxquDvxRjQ==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 17:31:09 +0100
Message-Id: <DN5AB16C26GE.3M5Y1X38QATK8@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358762: fix reset handling
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
In-Reply-To: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_083127_735514_2187764F 
X-CRM114-Status: GOOD (  13.42  )
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

Hello Andreas,

On Wed Nov 25, 2026 at 12:37 PM CET, Andreas Kemnade wrote:
> The bridge driver desserts reset after disable and asserts that
> upon enbale. That requires users to workaround that by declaring
> the reset gpio wrongfully active high.
>
> Fix polarity in the one device tree actually declaring
> a reset line. That patch has to go in after the bridge fix.
>
> The issue came to sight during experiments with reset lines on the
> Epson Moverio BT-200. There are two of these chips with a shared reset
> line, so also prepare for future conversion to use a reset controller.
>
> To avoid having GPIO maintainers spammed with a bunch of patches for
> BT200 support, do that fix separately and now, so it can go in more
> fast-track way.
>
> The devicetree change is only compile tested and is more
> a cleanup, not an urgent fix.

Can you test it and report back? I guess it just means applyint patch 2
without patch 1 and checking whether it works.

Other than that the patches look OK.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

