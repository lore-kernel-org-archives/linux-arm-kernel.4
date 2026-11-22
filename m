Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1AF606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 00:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fkn4Cdpe;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YuxB9wGC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mdyQFBr0cd8KrOt79LiqhxwKESg2tS5qwCo7QjFMXeQ=; b=fkn4CdpeUGytgt
	uBVOdg9MYtRPaIjWG7Fpw5EHQl62k/4ZphCYagDXCZK8vqqJl4gEak7nL2ogA8W3gd63raFYfFdAh
	ho+N88DSxg0zJFb7ALp2dWca6lVgsMmupcV/K8I2FfNWCVDsRxTf9XRsL0OkCSDYHVTnUF9AY+KHW
	11s8tBBgmkz1Y6TSofN2gybmKbc44CvJGL1JIlX+4luTc8HIp7t1jr3qrelxek6nmn/+mwz4KkkE/
	3CNSgRB39XvfIwOuZJ8+6HDdCeMobxriGeK2XT9jUadVIJrgcZ2rxEB/hrDi5uyDXRioaM2P75BmZ
	1of8Wo/xNUkYHLKeycXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvKj-00000000Zyp-23Rg;
	Sun, 22 Nov 2026 00:21:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvKh-00000000ZyZ-2yxN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 00:21:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 15922600AD;
	Sun, 22 Nov 2026 00:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9072F1F000C0;
	Sun, 22 Nov 2026 00:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795306886;
	bh=mdyQFBr0cd8KrOt79LiqhxwKESg2tS5qwCo7QjFMXeQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YuxB9wGCYlvNqFqXvYcai1G16+UyNN000DwiwUV1nFMyD+GwHsbx5MWtDSXqYgvdS
	 1a5tvcuDRyQ1YaCWOpaWiCG6mt7/XchZocFKG+5yFFIcwNnyJFddghGeSrhOIsTlsY
	 Y1/CyaPhtm+RHNMEJsBG5M3Dhb7Ts/F1fcifas++koidg6NCS9J9UUXQ21jK9hv3p7
	 Dqa2R2MP4t9WeANcjq6K2joumBnmXJ72Ign2bzL3EjfxpHG2qaS3Z0IdS7huzuX0PR
	 RuJg3nIxf0CzQ0TF5CqPuKVxosq21WGtZyYxvZXRfXSIpDw1cixbQjZNyBwrTuUBmH
	 5bwZGNnPQOwcw==
Date: Sun, 22 Nov 2026 00:21:18 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>,
 linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 giorgitchankvetadze1997@gmail.com, amin.gattout@gmail.com,
 antoniu.miclaus@analog.com, gregkh@linuxfoundation.org, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] iio: adc: at91_adc: fix NULL pointer dereference
 on trigger remove
Message-ID: <20261122002118.723b23b3@jic23-hlaptop>
In-Reply-To: <avyEqQEL3A_YNcgg@ashevche-desk.local>
References: <20261117140510.391907-1-abdelnasserhussein11@gmail.com>
	<20261117140510.391907-2-abdelnasserhussein11@gmail.com>
	<avyEb9La1tqS90Cp@ashevche-desk.local>
	<avyEqQEL3A_YNcgg@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 17 Nov 2026 18:45:29 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Tue, Nov 17, 2026 at 06:44:37PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 17, 2026 at 04:05:08PM +0200, Abdelnasser Hussein wrote:  
> 
> ...
> 
> > >  	for (i = 0; i < st->caps->trigger_number; i++) {
> > > +		if (!st->trig[i])
> > > +			continue;
> > >  		iio_trigger_unregister(st->trig[i]);
> > >  		iio_trigger_free(st->trig[i]);
> > >  	}  
> > 
> > Yes, but no. Please, rather fix the above mentioned IIO trigger APIs to be
> > NULL-aware.  
> 
> Actually the iio_trigger_free() is already NULL-aware, so make it only for
> iio_trigger_unregister().

I'd rather we didn't.  Any code that is unregistering a trigger
that it didn't register is probably really very very buggy.
I'd like them to crash or at least guarantee that sashiko
flags it.  We could add a warn if it is called on NULL I suppose
but that is ugly.

I'd rather deal with this by fixing at source. That doesn't mean
papering over it except as a potential easy to backport change
which is the intent of this one.  It think the description should
call that out though. Something like

"Make a minimal fix to simplify backporting.  Moving over to
 device managed cleanup will shortly remove this code."

Jonathan

> 
> 


