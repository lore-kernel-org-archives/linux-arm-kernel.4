Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED7C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 01:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kTwxfQt2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P+Wf/7xZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f5siVNgFbxLBQ1QMnUvIOA6GSr9qzcA82CUcS7hu/DQ=; b=kTwxfQt2aatFgP
	W3WdCZZyfwP7to/oyXzqjNET8oX8lsxkMuGTIOQipaNArEF64gVozqjnny1v7VH8ZkGGB95o3Ufy+
	yIBVs5rVYuMd973gya19Efa6C1r10ScQwc6QY8Do2sKOH6uy6prn2hVji0j1fx/s8IfR4881gZO3f
	IN2dCAlgHcJKdierUkUPOE0R8vDD1rlGBJa+yUZ69GJC+TG9WHhYzK97rcfHi0s6R4o+ZKIz50MMb
	DNpST/iQ2Omb2QQnFch5afkClDRvdQEEEOgUV4PMeF3Kn/VKzGN6q6yl9IiPERaAlz2rE7vd9TVSE
	iQp4M8HC7OAZ9Cg/NU8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPUn3-0000000Dy0P-0LmV;
	Sat, 07 Nov 2026 01:00:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPUmt-0000000Dxyk-0srl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 01:00:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E3CF423D5;
	Sat,  7 Nov 2026 01:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8311F008A2;
	Sat,  7 Nov 2026 01:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794013206;
	bh=f5siVNgFbxLBQ1QMnUvIOA6GSr9qzcA82CUcS7hu/DQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=P+Wf/7xZtzjUn9Y3NP6BsZnSb87fAX68Z1jxc9Gc5/vQgc8oscEHlbx0cNhRqBliL
	 GGEmnVIZhhZU2/Resp5s0VBve/5kPspsu64w7R1YcFKR87Jqho++cdiE3X4nkqVCig
	 o3VAZdJjeE6UQbaWKfEbxkfc1Ad4fGrYOmYBJGRBiPuaaR609DyXRL8y57DPz3LPLC
	 3e7unQ9wEA0PVOBXzxB/6ZNE+1QQFBKom5Zw3sN/NufhdPq11Cf7ShJWiB5tPhEk0M
	 rpx2/WBSiWiAcgUchlwX9LRpPDuslKInhjThthrXxj1Sw/ZoGMp7OdYTZyq8WZVNcg
	 7PPtaoPiLvgeg==
Date: Sat, 7 Nov 2026 00:59:58 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: at91_adc: fix NULL pointer deref in trigger
 removal
Message-ID: <20261107005958.706c6bd8@jic23-hlaptop>
In-Reply-To: <20261106200809.53799-1-abdelnasserhussein11@gmail.com>
References: <20261106200809.53799-1-abdelnasserhussein11@gmail.com>
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

On Fri,  6 Nov 2026 22:08:09 +0200
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> If 'atmel,adc-use-external-triggers' is not set in the device tree,
> at91_adc_trigger_init() leaves the external trigger slots in st->trig
> as NULL. at91_adc_trigger_remove(), also used by the probe error path,
> then calls iio_trigger_unregister() and iio_trigger_free() on them
> unconditionally, causing a NULL pointer dereference.
> 
> Skip NULL triggers when unregistering and freeing.
Good catch.

There doesn't seem to be anything stopping us just moving the
registration and tear down handling of these over to devm managed
calls.  That way we'd not need to clean them up explicitly at all.

That would mean calling devm_input_allocate_device() for the input
path and devm_iio_triggered_buffer_setup(), devm_iio_trigger_alloc()
devm_iio_trigger_register() and devm_iio_device_register() for iio instead
of the non devm cases.  The error handling and remove path would
go away + the NULL dereference would be solved because no cleanup
would be registered for the the case where the trigger was never
there.  I'd consider carefully if the various helpers make sense
after this change.  I suspect you'd be better off with these
calls inline in at91_adc_probe()  for the IIO ones at least
as less done in those than the input related one.

Whilst it will be more lines of code changed, it would both fix
the bug and improve the code.  So that would definitely be my
preferred solution.

Thanks,

Jonathan


> 
> Fixes: 0e589d5fb317 ("ARM: AT91: IIO: Add AT91 ADC driver.")
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
>  drivers/iio/adc/at91_adc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
> index 0ac74ad92fca..c7fc06214c05 100644
> --- a/drivers/iio/adc/at91_adc.c
> +++ b/drivers/iio/adc/at91_adc.c
> @@ -660,6 +660,8 @@ static int at91_adc_trigger_init(struct iio_dev *idev)
>  
>  error_trigger:
>  	for (i--; i >= 0; i--) {
> +		if (!st->trig[i])
> +			continue;
>  		iio_trigger_unregister(st->trig[i]);
>  		iio_trigger_free(st->trig[i]);
>  	}
> @@ -673,6 +675,8 @@ static void at91_adc_trigger_remove(struct iio_dev *idev)
>  	int i;
>  
>  	for (i = 0; i < st->caps->trigger_number; i++) {
> +		if (!st->trig[i])
> +			continue;
>  		iio_trigger_unregister(st->trig[i]);
>  		iio_trigger_free(st->trig[i]);
>  	}


