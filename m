Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C51606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tI+h3b+h;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zt+d127U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1EYEvcD7siuOpXvwY3Vf+JekvZisCcVk18ZnieT9Z+s=; b=tI+h3b+hBLYT/qyz2assJu+fzL
	Au60z6K8kwHleOj7HoNaNhX0lZoa/pa64VPa7+Gpv/H78w+0IPGCwEhSOi16tkRKiNVvwotmj2acK
	4MfAbBeVBKQkV3oNQlSStFbtL1sl+iTRBgmMwyf0UdO3WW4LM/Ppzp/v3SobypowlsuAno557+uWu
	XdSZX5mM2G0u4rDnWrq6jN3PGDX2KVjHLHAesHSCmEx/7ynrEDw/rytiFD+ShEFxyC8ftS51OT8R/
	kg3Vg6er/YfSn+eHbcBj0Q92NiSeeqJmfVdOdJAx9OkdMsBYmTbxU9Y0Ok6/VGcIRvFStyjD07bQq
	I93g6zpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2DV-0000000C3zq-1itP;
	Thu, 19 Nov 2026 13:30:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2DU-0000000C3zI-2SVP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:30:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 0F870416A0;
	Thu, 19 Nov 2026 13:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 891DF1F000C6;
	Thu, 19 Nov 2026 13:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095019;
	bh=1EYEvcD7siuOpXvwY3Vf+JekvZisCcVk18ZnieT9Z+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zt+d127UIL3Qg/8heu+JJZBZ/UiI98B0QpqkL/6LVP2N5D+D3/JFhX6yJgys2I2Kr
	 BD6CzPELRUlVKs9TiV+BgaBK87vsQYeZ/9yycDz8Dkqc8BrKGzmE4TAMJI890jjHw2
	 h+dYG9QPXcFcK2S35y0KH4zCL/ToVIifI91xdGgz3+fVxeFq20LBpsJTYtkQyAdnqS
	 kGqetxtcZ29IjRnG+N/muFfLVU7QjhIcphYQxuK/l9e69XlDkAgLoWYQ7DxNsT5/2o
	 uDjdOYmfjRrN4UN/+0sAd+A3WREYD9FHi9kLH9aeUGJD1g5+wD+JhRLPB4prVqzzAE
	 MPnTyBPCm61+Q==
Date: Thu, 19 Nov 2026 14:30:15 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: aspeed: Fix potential coprocessor bank map leak
Message-ID: <fvehiq2zts6jevimc2fmzttgh2h3v7s4hjzsasfx64cnhqy37p@qqejcrujd3q5>
References: <20261118-324f82bd41-gpio-aspeed-0@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-324f82bd41-gpio-aspeed-0@mail.sdu.edu.cn>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 10:21:19PM +0800, Guangshuo Li wrote:
> The coprocessor bank map is allocated lazily but is never freed when
> the GPIO controller is removed. Its only owner is the device-managed
> GPIO private data.
> 
> Register a cleanup action before adding the GPIO chip, so removal frees
> the map after removing the chip and before freeing its owner.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: a7ca13826e47 ("gpio: aspeed: Add interfaces for co-processor to grab GPIOs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
>  drivers/gpio/gpio-aspeed.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index dc53b2decb66..bb30bbf8c60b 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -1300,6 +1300,13 @@ static const struct of_device_id aspeed_gpio_of_table[] = {
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
>  
> +static void aspeed_gpio_free_copro_bankmap(void *data)
> +{
> +	struct aspeed_gpio *gpio = data;
> +
> +	kfree(gpio->cf_copro_bankmap);
> +}
> +
>  static int aspeed_gpio_probe(struct platform_device *pdev)
>  {
>  	struct gpio_irq_chip *girq;
> @@ -1364,6 +1371,10 @@ static int aspeed_gpio_probe(struct platform_device *pdev)
>  				gpio->config->llops->reg_bank_get(gpio, (i << 5), reg_rdata);
>  	}
>  
> +	rc = devm_add_action_or_reset(&pdev->dev, aspeed_gpio_free_copro_bankmap, gpio);
> +	if (rc)
> +		return rc;
> +

You have the address of the device that binds to the driver in struct
aspeed_gpio, why don't you just use devm_kzalloc_obj()?

Bart

