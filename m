Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37306606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mycELBOv;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=BpKVSuP/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lusnGRfk+umHymzkE0cY3hSploaM39BQgbgUI4luLX0=; b=mycELBOvG+AURyQfBY/9g0wAUr
	2rFv6OIuJWoYbiH+sxkM0S0XMVLkUV1XW/ChpRRFzEZ4q6NGNbWnpxAW9nWj2hla/SBtzSjGiB2Yz
	ahw6dp9AS0Ah+5xw4LJfa5+A6Cv9hBemQwuD1FaL67jPf0a1D8ZED77C9vaehSjJbT1Vlb/DcZNIk
	PT4FD2OmWX9Dg9YYMRJqqF43X/uneDPKW7l7K0fIZxCOBySnpMHu3SwmjNE48hh4ULw1E4x0jca43
	/RMCtR8AbluHsaMwfQjFDeioUYqmAZVJbbvx82ZGZidOaU+9tSzdvCe/6YgKtslsYKfjO5lyRV2+t
	NRGVSoxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPW8-0000000FF2w-2duw;
	Fri, 20 Nov 2026 14:23:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPW7-0000000FF2i-08lv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:23:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B3E04403D;
	Fri, 20 Nov 2026 14:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AFB91F000C0;
	Fri, 20 Nov 2026 14:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795184586;
	bh=lusnGRfk+umHymzkE0cY3hSploaM39BQgbgUI4luLX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BpKVSuP/TcUHJ2kfTbFOMqN3DShNbmQJKTfMJhvilCLmvJAExqzmDsavDi2HwQlTV
	 zRZE8ZVK5I08Kt+GpeVAxmBeHd7beXgLwKshV2blTIcNZUzdFH+/QkknvCGutpVjfd
	 wAZP3R/I5TnuWnq7qtqm8wtdHap/xOzOXlLU4f+4=
Date: Fri, 20 Nov 2026 15:23:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH v2] usb: gadget: lpc32xx_udc: drain pullup work before
 teardown
Message-ID: <2026112007-lumber-pounce-3ec2@gregkh>
References: <179474326988.103840.10326852247134349070@seu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179474326988.103840.10326852247134349070@seu.edu.cn>
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

On Sun, Nov 15, 2026 at 07:47:49PM +0800, Hongyan Xu wrote:
> The pullup worker accesses the transceiver I2C client and UDC
> state. IRQs can leave it pending when remove or a late probe
> failure releases those resources. Cancelling the final pullup
> work would also discard the requested disconnect.
> 
> After the gadget core has stopped its callbacks, explicitly free
> and synchronize the registered UDC IRQs. Request pullup-off and
> flush its worker while the transceiver client is still retained.
> The worker needs no UDC IRQ to finish its I2C transaction.
> 
> Track successful IRQ registrations during probe so late failure
> also stops all acquired producers and drains pullup work before
> destroying DMA resources and dropping the I2C client.
> 
> Found by the author's in-house static analysis tool.
> 
> Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
> Cc: stable@vger.kernel.org
> Suggested-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
> Link: https://lore.kernel.org/all/20260928134158.117-1-getshell@seu.edu.cn/
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
> Signed-off-by: Zehao Gao <gaozehao@iie.ac.cn>
> ---
> 
> Discovery: found by the author's in-house static analysis tool.
> 
>  drivers/usb/gadget/udc/lpc32xx_udc.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
> index 94355d3..d627a2a 100644
> --- a/drivers/usb/gadget/udc/lpc32xx_udc.c
> +++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
> @@ -2978,10 +2978,17 @@ static struct lpc32xx_usbd_cfg lpc32xx_usbddata = {
>  
>  static u64 lpc32xx_usbd_dmamask = ~(u32) 0x7F;
>  
> +static void lpc32xx_udc_free_irqs(struct lpc32xx_udc *udc, unsigned int count)
> +{
> +	while (count--)
> +		devm_free_irq(udc->dev, udc->udp_irq[count], udc);
> +}

This is "funny", please unwind things in a better way.  Also, have you
ever hit this in an actual device?  If not, don't make changes like
this.

thanks,

greg k-h

