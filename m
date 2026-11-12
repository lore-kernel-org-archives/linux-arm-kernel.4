Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FD5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 02:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zHfDX3Fz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V0y/59U6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZKKsCw25bN8QIo2qnZkKp0J3NkYgtDw3pdERHmxH12g=; b=zHfDX3FzVmP+gc
	Dln0VdJh0+7gQtuoz3QCsdg+QWS0ERyHGHhMVN4Nh//LUWAd0W2T1aCylMxiD6g1KNzFbw+Fd4KRE
	M78tv6BlXOuZ3ZfZpNxX+VRJPgEYM5wfpgVnh7BGIB3+8kjzy0qe0wqxmBScf91cmTjkuhoxDr04Q
	OTKDkxmzIcGVVC8VH8XYjIYq0F+bhIa+TxW4iOrNFEgsJfOA2cZe9Ls+oLtPHPZAumSY0j2OZy+jh
	egW2ANvTs20gYa/3ju+EzqNvHH2agjEOiBZhqt8CAlfQdcqbWW7sa1/gNvL/HbUTSIESnZYlJbEBs
	e2icG6lrOGl5tDm6c3ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKWA-00000008Vpo-2fJd;
	Thu, 12 Nov 2026 02:26:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKW9-00000008VpP-43Oi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 02:26:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B5C0B4173D;
	Thu, 12 Nov 2026 02:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5711F00A05;
	Thu, 12 Nov 2026 02:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794450385;
	bh=ZKKsCw25bN8QIo2qnZkKp0J3NkYgtDw3pdERHmxH12g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=V0y/59U6PTHaCvD7UUgWfz8yVtke15Qxj/yORI+W2+OO7p1dckoD5hmtzVh6/Sy+0
	 XxO2fXYzBsKukAcvcoDy1LtFWaiSspxLrT5qGTgg7Pl3PX3chM+gy4WOYB+HoREvLI
	 mYqGBMUfJMiEQ+fiudq0608Nxo4i2fQXaVQNepIvw3joh5RNJCsolqTKCT0wtn1fvj
	 gWv0jgfnjIkvZxZiNYmZ3q10gvDyJ7SpopKuh08FFObUgndCCdp/kwUPsMicnUsJUq
	 ZHaak1jOLIcbWP8B+ZJ5kdoNSu0usrnneXTiTUGN5LH4fa1x4rI4jdW/A+dYQGdHHD
	 JmjM3HLC6IMCQ==
Date: Thu, 12 Nov 2026 02:26:19 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Joshua Crofts <crofts@kernel.org>
Cc: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>,
 linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iio: adc: at91_adc: move to devm_* to fix NULL
 pointer deref
Message-ID: <20261112022619.5693c4f9@jic23-hlaptop>
In-Reply-To: <20261111121544.00006c23@kernel.org>
References: <20261111101345.185122-1-abdelnasserhussein11@gmail.com>
	<20261111121544.00006c23@kernel.org>
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 11 Nov 2026 12:15:44 +0100
Joshua Crofts <crofts@kernel.org> wrote:

> On Wed, 11 Nov 2026 12:13:45 +0200
> Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:
> 
> > If 'atmel,adc-use-external-triggers' is not set in the device tree,
> > at91_adc_trigger_init() leaves the external trigger slots in st->trig
> > as NULL. The error paths and remove function unconditionally called
> > iio_trigger_unregister() and iio_trigger_free() on them, causing a
> > NULL pointer dereference.
> > 
> > Instead of just checking for NULL, refactor the driver to use the
> > device-managed (devm_*) API for registration and allocation. This
> > modernizes the code, eliminates the need for manual cleanup functions
> > (at91_adc_trigger_remove, at91_adc_buffer_remove, at91_ts_unregister,
> > and at91_adc_remove), and inherently fixes the NULL pointer dereference
> > since the core handles the cleanup of properly allocated triggers.
> > 
> > As part of this simplification, the remaining trigger initialization
> > logic has been inlined into at91_adc_probe().
> > 
> > Suggested-by: Jonathan Cameron <jic23@kernel.org>
> > Fixes: 0e589d5fb317 ("ARM: AT91: IIO: Add AT91 ADC driver.")
> > Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> > ---
> > v3:
> >  - Addressed review comments from Andy Shevchenko:
> >    - Removed the redundant dev_err() after devm_input_allocate_device().
> >    - Declared a local 'struct device *dev = &pdev->dev' and used it in
> >      at91_adc_probe().
> >    - Declared the loop iterator inside the for-loop.
> > 
> > v2:
> >  - Dropped the simple NULL check approach.
> >  - Refactored the driver to use devm_* API as suggested by Jonathan Cameron.
> >  - Removed manual cleanup functions and error paths entirely.
> >  - Inlined remaining trigger initialization into probe().
> > 
> >  drivers/iio/adc/at91_adc.c | 185 +++++++++++--------------------------
> >  1 file changed, 52 insertions(+), 133 deletions(-)  
> 
> I'm not sure if this is an adequate fix. I'd imagine there would be two patches,
> one that just adds the simple null check so it can be backported and this patch
> that will go upstream.
> 
> The commit that introduces the bug is 14 years old, so it doesn't make sense to
> me to backport an entire devm_* conversion.
> 
> Jonathan, Andy, what do you think?

So, we don't have to backport what we upstream. I could take that null check (which
was v1 of this) and then apply this on top I suppose to make things a little
easier. Alternative is to ask for a backport of the simpler patch with this
referenced as unsuitable for backport.

Jonathan


> 


