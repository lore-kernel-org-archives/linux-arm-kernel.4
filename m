Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A287606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 00:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DeTyJa5X;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ogmkXiS8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WmDxcQotq3NgeobvzOlqzwVczvRUhsveENxWAqE5LCM=; b=DeTyJa5XNoL0Ma3rxgDOUOUMZu
	Rdvz6MknFznzoLiASVbC+AZ2OZyL4NwClRGYSqon0ugbJRW1vO6zk0dVM/XOoy7h/nfbqJYY+IimF
	WK3WVh22vob8srHj3n6a6rHqIsc8QT7kz314nuNHyrLGgjN3p8XtNCVGw/qt+9tqqQVjImanAeOWs
	82WXOe+wvxwvc1kSvagULR/URpuK5hvaGT1e8wVGeJWU953i6bcwLPO8mu1EUv64aevZSnbkt7LCL
	3yngCZ+mnYpAjBVaiZBQagrm7o5q7qMmSmDEGARwjwX3lu7cFp1gslDWLUUCbrZ9e7xP3XayB2Bxl
	ZtTcLY8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRId0-00000008Ecb-0L3b;
	Thu, 12 Nov 2026 00:25:22 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRIcw-00000008Ebc-3lmI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 00:25:20 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-37071c0f42aso6358083eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 16:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794443117; x=1795047917; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WmDxcQotq3NgeobvzOlqzwVczvRUhsveENxWAqE5LCM=;
        b=ogmkXiS8n4Mq6gKzWanOtpgAepR1RpzvQdNjM5Y6B2p2Id7Nrlebh1O7keFbjBNntp
         WADvBzUM7kdPnQQjp8rDNzKpbFoAer1bsLHvNjS46PF/SfXmoPsxz1ltqr8hrSMGLe9D
         TE4Zrxxv9glLZsAl194TfoMBxCdmsWCYUVHHAeB/McjppE/Zof9lyNqvXHYcjGQLSr+a
         P7q3NutjwNmjnHTDmtzEheXHgTn1CHglonAJqMVm7YNNA0YuuWh9IzyjTbxR1x+A6wtY
         WchtZBJoQ11XWdDIaWax5eTHEbruOFUMxCJ/kJC69tqqYWhr+GZNO4yxJ6KNQXaZB9IS
         SxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794443117; x=1795047917;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmDxcQotq3NgeobvzOlqzwVczvRUhsveENxWAqE5LCM=;
        b=P7ROwbjedE+tlDQfJAap01V/OoQ7M7uiXpRn5gK7mgCE3OuK6vFFMuhVsUr4b41eGQ
         WaJ7SQsTI05kX628cMRnf7PM7W898Iv2vCTWxVJNxWOsda4ongXLg366GRcHsLJcNMQk
         AAChWLWgogeB+uO4MA8d0fV6s4HDPwbavh8yk+cYtKPRARq+vSZ1JhnbW8MZNpZWnaos
         tYD89qw2qnLKscpdzCcWoSP6k0KIJGGcHWHy65QZhtn6McCbCxMrc5iVA0PEeTzAg6hp
         iZt3uQZRwaMKBl+SuBXDTKiIX+tAQByAwk8P2ojePPVnGo1jPN9Vyq9kBGgtVa4G0rlH
         /UNQ==
X-Forwarded-Encrypted: i=1; AL+hErFzYhmFNKQDjXivMMmQ/KD+MUu9RHr1+/6KZTmVYtgxiYlSETxFL+bagPMYqlgk/LzRRGhWdZXFAr0bybHMhP9T@lists.infradead.org
X-Gm-Message-State: APuU4Z8loP8sfsu64IlhKlFTJuyBRpJBAE9G3jihlgYgvdPoSvLusBd2
	Qspm4hMCYAz91toX09iYog1aMjPA7jTw782Br5Bv0lS5fn8uWQCOJ4sO
X-Gm-Gg: AYBFou2PsQ7Yo6VGdTCZJEy5ywMQzXQSJjvUVlDuQ+UdsywbMN401bYCaCTot/MQoTJ
	3ejBgJQMxcnLr0DI9XGvTsLl+Sr6Mx8CsTEL1UF3AXJpnGCN9obElp0Ea6BgDdHOIlumn0KWnF+
	LWP5/Q3IK6LR6gUS6mDk/UICqpAZejkUp2Kgg+4YnosjUowoWZb8wkqc1yTsBq4l6DNnhHhs8Fa
	LIAgVfxSdxccrCEi7Og0SeASDkfgQCbufdqkfqKlCMb+PLDJQkFQOUC60/Wf/Iv37FRtNGAF0sY
	iEkPIyjCorFxErU3jwbG6lqDylCPkU1dq9iY4KRMQ1GN0cQNKt534dRG317N6e5gEFd00PP2zJH
	HNqxedMMn4BIBsLymM5380OxNmuYCg78DNxouwxLVYP7Y5OhczS5w8WWSv8UWErycXb1d6uxVyA
	ncjBgKZIdtoruDhw5utTt6WcXMDjBQoPcxgY51X44JyCxyZXUUYly3RFRH91ovv3JmCILuvhHFx
	D6xc7mz9kuHotuRMtQwZR6KaMnXf0E3qhdv+ITD0LFBwNvJwQiD25EmrTg0Sy2reRPbEef+WI+s
	N0zZOfZMcR1f51p9SVvqpSCBDVmAKmJAOkXK5a8VIPunWcT8kX33qQOFIf0i78AdJn6zzw==
X-Received: by 2002:a05:7301:d807:b0:378:2e89:3958 with SMTP id 5a478bee46e88-3782e893b15mr345363eec.19.1794443117438;
        Wed, 11 Nov 2026 16:25:17 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3766146551asm12082193eec.1.2026.11.11.16.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 16:25:15 -0800 (PST)
Date: Wed, 11 Nov 2026 16:25:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jakob Unterwurzacher <jakobunt@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
Subject: Re: [PATCH 1/4] Input: rk805-pwrkey - enable the wakeup interrupt
 during system suspend
Message-ID: <avUGEQhSKlko0Fm9@google.com>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
 <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-1-cb12621c1fb4@cherry.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-1-cb12621c1fb4@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_162518_939515_3913BEFE 
X-CRM114-Status: GOOD (  36.27  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jakob,

On Thu, Oct 29, 2026 at 11:06:23AM +0100, Jakob Unterwurzacher wrote:
> From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
> 
> The driver marks the device as wakeup capable, but never enables the
> power key interrupt as a wakeup interrupt. As a consequence, the PMIC
> interrupt line is masked during system suspend and the power key cannot
> wake up the system, e.g. from suspend-to-ram on RK3588 with an RK806.
> 
> Enable the interrupt as wakeup interrupt in the suspend callback if the
> device may wake up the system, and disable it again on resume.
> 
> This is done in the regular suspend phase on purpose, rather than with
> dev_pm_set_wake_irq(), which arms the wakeup in the noirq phase: there,
> enabling it updates the PMIC's interrupt registers through regmap-irq,
> which fails when the PMIC is connected via SPI:
> 
>   spi_master spi2: Failed to power device: -13
>   rk8xx-spi spi2.0: Failed to sync masks in 7a

Sounds like this needs to be solved in PM core rather than hacked around
in individual driver? Let's CC Tony and Rafael.

> 
> Fixes: 5a35b85c2d92 ("Input: add power key driver for Rockchip RK805 PMIC")
> ---
>  drivers/input/misc/rk805-pwrkey.c | 42 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/misc/rk805-pwrkey.c b/drivers/input/misc/rk805-pwrkey.c
> index 76873aa005b41..9b64ec7463c62 100644
> --- a/drivers/input/misc/rk805-pwrkey.c
> +++ b/drivers/input/misc/rk805-pwrkey.c
> @@ -15,6 +15,10 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  
> +struct rk805_pwrkey {
> +	int irq;
> +};
> +
>  static irqreturn_t pwrkey_fall_irq(int irq, void *_pwr)
>  {
>  	struct input_dev *pwr = _pwr;
> @@ -37,10 +41,15 @@ static irqreturn_t pwrkey_rise_irq(int irq, void *_pwr)
>  
>  static int rk805_pwrkey_probe(struct platform_device *pdev)
>  {
> +	struct rk805_pwrkey *priv;
>  	struct input_dev *pwr;
>  	int fall_irq, rise_irq;
>  	int err;
>  
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
>  	pwr = devm_input_allocate_device(&pdev->dev);
>  	if (!pwr) {
>  		dev_err(&pdev->dev, "Can't allocate power button\n");
> @@ -84,16 +93,47 @@ static int rk805_pwrkey_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> -	platform_set_drvdata(pdev, pwr);
> +	priv->irq = fall_irq;
> +	platform_set_drvdata(pdev, priv);
>  	device_init_wakeup(&pdev->dev, true);
>  
>  	return 0;
>  }
>  
> +/*
> + * Arm the wakeup in the regular suspend phase rather than with
> + * dev_pm_set_wake_irq(), which does it in the noirq phase: enabling the
> + * wakeup updates the PMIC's interrupt registers, which is no longer
> + * possible once the bus to the PMIC (e.g. SPI on RK806) is suspended.
> + */
> +static int rk805_pwrkey_suspend(struct device *dev)
> +{
> +	struct rk805_pwrkey *priv = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(priv->irq);
> +
> +	return 0;
> +}
> +
> +static int rk805_pwrkey_resume(struct device *dev)
> +{
> +	struct rk805_pwrkey *priv = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(priv->irq);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(rk805_pwrkey_pm_ops, rk805_pwrkey_suspend,
> +				rk805_pwrkey_resume);
> +
>  static struct platform_driver rk805_pwrkey_driver = {
>  	.probe	= rk805_pwrkey_probe,
>  	.driver	= {
>  		.name = "rk805-pwrkey",
> +		.pm = pm_sleep_ptr(&rk805_pwrkey_pm_ops),
>  	},
>  };
>  module_platform_driver(rk805_pwrkey_driver);
> 

Thanks.

-- 
Dmitry

