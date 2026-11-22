Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626E4606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 00:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rR8hCq4p;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cTHAnEuW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AyDS5VRgSOms4J8bbyqtZFW1oePW7qKyGAxVG2slVEk=; b=rR8hCq4pJMm/yL
	/tmx5gjBnaGiDWNlLE+++gDhDRSsjNdXspv1kbiTZkqfh5ge/00hE7sh9HA8uVk2vA8AZcAmYhlRp
	fTNZSJMT36xT0vV5WckFgaSs+I4pkAmesnf+m2j3+T4VdyKnc4t/8TEQah0a8JROzKxcrGYHGlqC8
	2zTCBDYL0IiwZgrZINLXqYUHm9dtp/NWHHPanbSR8SzR1ziK5dxsKlLNpKkW7utImezWtMlxGIxdR
	yUTdUP1b4lnrNwdUNMP0mpvbO51EMFFow+HYa0ypikANme+s5WxzioF0/dfboOQfcTGEiwHXwWLJ6
	RnpLog15fNwIMUVpkSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvMu-00000000aDy-3qcG;
	Sun, 22 Nov 2026 00:23:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvMs-00000000aDn-32Hj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 00:23:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EA8C760D21;
	Sun, 22 Nov 2026 00:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A241F000C4;
	Sun, 22 Nov 2026 00:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795307021;
	bh=AyDS5VRgSOms4J8bbyqtZFW1oePW7qKyGAxVG2slVEk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=cTHAnEuWPHd2J77ndevmd13NWYxF1vg7Yjc3RXM1QFh1cNrSqub3F4HMbCQlfa3/k
	 m0FWxdp7/ZzL+47bQvd214KGwnTX0Ww38fGaKnW6yJZAj9G9tNrNyKvYyxLiI1jAmt
	 QCL44DnuLRVxLurWhKxgFbPFomv8G+++cQscTaGD6oAkkWf421Erc/RfPgnRj/UXnX
	 baTLXZs7lEpouyTP7IE6BG5TEvK5Y/QrGtAHyqaL7wXUmzznX9G3qtb7nndTnugLYh
	 o3s6SlkSssIkGFlTCDrrpzDwMA2IUo13Yz4W4DSCpQEIXoGZNqYv8rW5e6A2RwC3Is
	 9x8yPMvdNG4mw==
Date: Sun, 22 Nov 2026 00:23:37 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 giorgitchankvetadze1997@gmail.com, amin.gattout@gmail.com,
 antoniu.miclaus@analog.com, gregkh@linuxfoundation.org, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] iio: adc: at91_adc: convert to device-managed
 resources
Message-ID: <20261122002337.5fcb85ce@jic23-hlaptop>
In-Reply-To: <20261117140510.391907-4-abdelnasserhussein11@gmail.com>
References: <20261117140510.391907-1-abdelnasserhussein11@gmail.com>
	<20261117140510.391907-4-abdelnasserhussein11@gmail.com>
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026 16:05:10 +0200
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> Convert the driver to device-managed APIs so that all resources are
> freed automatically on probe failure and on driver detach:
> 
>   - allocate and register the IIO triggers directly in at91_adc_probe()
>     with devm_iio_trigger_alloc() and devm_iio_trigger_register(),
>     dropping at91_adc_allocate_trigger(), at91_adc_trigger_init() and
>     at91_adc_trigger_remove() along with their manual rollback paths
>   - set up the triggered buffer with devm_iio_triggered_buffer_setup()
>     directly in at91_adc_probe(), dropping at91_adc_buffer_init() and
>     at91_adc_buffer_remove()
>   - allocate the touchscreen input device with
>     devm_input_allocate_device(), dropping at91_ts_unregister() and the
>     manual input_free_device() error path in at91_ts_register()
>   - register the IIO device with devm_iio_device_register()
> 
> at91_adc_probe() no longer needs any error unwinding labels and
> at91_adc_remove() is removed together with the platform driver's
> .remove callback.
> 
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>

Looks good in general. Even better with the stuff Andy spotted that
would be nice to do whilst you are here!

Thanks,

Jonathan

