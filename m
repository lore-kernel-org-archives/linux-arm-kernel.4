Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8070606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 03:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vC2Rm9Ml;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EAF/911a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v86ECrw4hTZS+oi6SL4n7LCSWP3uQBdnZrQC4d8hSfE=; b=vC2Rm9Mlh4TPys
	b/O9xKKdhjHASVp4MH3MFlb8jkS/ACCZ//DSHrTw8KVkPePhEbYsrEe+y9C+G6CZSXAyw9bg2N43c
	9b3h3buvbqmJ3Xsuao0TDtAz9Aec1YG85daz1hgglS+3eBQMRtHSVrdDoFLBNzVteOoewzSkvqbgo
	Y3Y8jmgn9PeE66DVTnza0yRIBUX+LP6MUS6f7nCyMYE0GaJbSjU1sSWJOaSVK+dhq1zBIanhT042z
	jq+ziDPPsIaeRl9y8IYK5e2VeAet6Gkeg8kA5OYpUUMYlMEVkA0FRWzLVK3OBZcqh4GVmTEC9SL4v
	VY96y+zKpx3/IwDHzfqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9TR-00000004Rtk-1JGN;
	Tue, 17 Nov 2026 03:03:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9TQ-00000004Rte-24fR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 03:03:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 98852605C9;
	Tue, 17 Nov 2026 03:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA6D1F000C4;
	Tue, 17 Nov 2026 03:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794884587;
	bh=v86ECrw4hTZS+oi6SL4n7LCSWP3uQBdnZrQC4d8hSfE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EAF/911aT3K/HgLF7Z/UTT8qhiixqrvj+5cC5G9mJXdj9Bm4icfnFSRvuognvA+4d
	 TJC6Ir5HtYyI1539/i7VyL30DbqZ8gLppaMkDoYfqpMINGAwQMbwpzGXKRBgXQ/7We
	 hpjy2c1Sj0KRpWS9HwAQbT3fp8dDy1KTMloD2IjIthAFnnGBNUwtjTexfF091/gwSL
	 NB8/UB5kZUf0j5qea6V6f+owdNjBu/Voqmlb8s0Ht9ZKtKOvQ0JvRzOO33JEtSUT1a
	 n/7EZFowKNUWhsz8t0owOk0tI6hK1K5YJ7qc3OOSrQylSoq4ws4ZejpfONouuwKlzD
	 rN6VzJv88KSAQ==
Date: Tue, 17 Nov 2026 03:02:58 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Luo Yifan <luoyifan@cmss.chinamobile.com>
Cc: linux-iio@vger.kernel.org, Eugen Hristev <ehristev@kernel.org>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: pl022: handle clk_prepare_enable() failure on
 runtime resume
Message-ID: <20261117030258.364ba429@jic23-hlaptop>
In-Reply-To: <20261117020711.20158-1-luoyifan@cmss.chinamobile.com>
References: <20261117020711.20158-1-luoyifan@cmss.chinamobile.com>
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

On Tue, 17 Nov 2026 10:07:11 +0800
Luo Yifan <luoyifan@cmss.chinamobile.com> wrote:

> pl022_runtime_resume() ignores the return value of clk_prepare_enable()
> and always returns 0.  A failed runtime resume is therefore reported as
> success and the controller is used with its clock off.
> 
> Return the error from clk_prepare_enable().
> 
> Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>

You should probably resend including linux-spi and appropriate maintainers
and dropping IIO folk.

> ---
>  drivers/spi/spi-pl022.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
> index f52130465a..64bf9c4b0a 100644
> --- a/drivers/spi/spi-pl022.c
> +++ b/drivers/spi/spi-pl022.c
> @@ -2067,9 +2067,8 @@ static int pl022_runtime_resume(struct device *dev)
>  	struct pl022 *pl022 = dev_get_drvdata(dev);
>  
>  	pinctrl_pm_select_default_state(dev);
> -	clk_prepare_enable(pl022->clk);
>  
> -	return 0;
> +	return clk_prepare_enable(pl022->clk);
>  }
>  
>  static const struct dev_pm_ops pl022_dev_pm_ops = {


