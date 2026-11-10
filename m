Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E47C606B9BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3stgXwYi;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=CixjJzFD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0k92K8b49X9cIdh2GF82mc+d2Q8OVuyS6TzYE36ZPtE=; b=3stgXwYipEPNNoh3Yn8t9aPZz+
	Tk8wChY4C1HqLMNHolxBHcBdY3doUEm8SrzgbduNTctdicvEWOcX3vmS1XvcGEVU4Ngwpk+8fbBHS
	50D86oHdDHc/xEPl3frQzVCknR5qTbi1F0r3yCa/JsMOrF90iB7R+C0Xlt1E0KWBcmt7KX8JIoYLa
	usjTJfMajg/q0VLx4fnJueXQhJWo0qfkbH+FvT6j+7Ill/ll0CVA81ekmXh+4JDz6stL4mzquBlr0
	6QAgCWnlNoXKlku+kS+YOz9e8fM//HyZrmZncMahSNk63r0w87pCGQtr7ZztskhoFBMzHY624Ma5R
	HmnTDuVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQj1m-00000003Rwh-2u6a;
	Tue, 10 Nov 2026 10:24:34 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQj1j-00000003Rv6-0WO4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:24:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0k92
	K8b49X9cIdh2GF82mc+d2Q8OVuyS6TzYE36ZPtE=; b=CixjJzFDIKVpJGj+e0HN
	K1hHUYCLcVXcQKua5AIHTqIEXd5XLR2K1xiTJiW2GZNBtgbADz+FWMM9nZCm5O2A
	ZuOK98Piur0oC5bOuegmdwsw69YpeqRvB7bwO92tbfcETkfdXVUD92zjWf6oteO6
	XKkCKkyuLtfqXlmZriJXEm7hdU9Iyuw3nI7V9OP/3t/+WHRZG95vERR+3slbMEg+
	a0OOYfzzjZax/bZsoodgw4a8unf3OW/TkvCAUmHGjZKm8h5uvQ1C9b2Qe8gikhna
	7D9iw2niRkO5MQh3Xk8tUGLp562kgtB84GdmAOkIZkeIxxtr+6Gaj4Gt84AXxuPH
	gg==
Received: (qmail 187841 invoked from network); 10 Nov 2026 11:24:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 11:24:25 +0100
X-UD-Smtp-Session: l3s3148p1@rcKKe+lfZuoujnsO
Date: Tue, 10 Nov 2026 11:24:24 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/8] i2c: of-prober: skip post-power-on delay if
 powered on sufficiently long
Message-ID: <avLw2AiqcnO9Blun@shikoro>
References: <20261103043734.2179858-1-wenst@chromium.org>
 <20261103043734.2179858-5-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103043734.2179858-5-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_022432_027060_D13E5AF8 
X-CRM114-Status: GOOD (  16.93  )
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
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 12:37:28PM +0800, Chen-Yu Tsai wrote:
> On some devices the I2C component is powered from an always-on power
> rail, or the power rail has been left on by either POR defaults or
> the bootloader. By the time the prober probes the device, the device
> most certainly has finished initializing and can respond. There is no
> need for the delay.
> 
> In such designs, the system integrators tend to work around the delay
> to avoid the boot time penalty by simply omitting it from the device
> tree and the component prober. This is undesired, as the device tree
> is not fully describing the hardware.
> 
> Switch to the new regulator_enable_and_wait() function that makes sure
> a certain amount of time has passed since the regulator supply was
> actually enabled.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

@Andi: Chen-Yu is the maintainer of the of-prober, so I suggest these
changes just go in together with this series.


