Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B8A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Db9cPWpJ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=M7r9xLlF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Rte+nFjJfCpN04ZQkjjif+xK/XpIBzJx/BQcSctTM9k=; b=Db9cPWpJZCcJH2V5DUKojE+3V5
	zUusyoNioeKdjMp8b+mBOt62gyRmjD3qln/i2z5fa3ZEZGi8cxDc/N4+rxj2C3uZP5CFJV2dXgpf+
	nMWQDWCaWhYSRtWx61OpaRckrudy5e0h+iFtPrc5g9x7rNmGaKW/1+hZFMn87/yV9f5hcsHoLoOvn
	cRn07xX/Lj+ZeEjVnyZ+f8OVru2NTaHYQRtTN8wtcRLp+hEVveDG0lFPLoWYFbmyuHrXltdlGr0eB
	nxJiB7ejX1wMCkMQhpL/ntMiKFHp4Kcoeap/cPH30H9+oSzVFDqV1ABK949+Yp+XEuFKMChdZgvP/
	DuyFkSVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmEA-000000047RK-0RLX;
	Tue, 10 Nov 2026 13:49:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmE7-000000047R0-0lj8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:49:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20F1C1477;
	Tue, 10 Nov 2026 05:49:27 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 353973F632;
	Tue, 10 Nov 2026 05:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794318570; bh=hYzeZBtVBVDXCHttXoGztstvHvPFY7lN52/cdyn0Zr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7r9xLlFeYK9RYXoymnR5xbY1504ntzT5LN8cIeeXIgXL7Xcq5lR7JwMvOMEIiJjM
	 0NOQsrhoEejZso/105nnOcn9IBTS4yVgFxBKiIp0L+ABb8dyCAf6tpi+NzaNtCOxbX
	 ovxXTmqBujnIKaBPS7kGPeKc09iRcAGySN6wXaaw=
Date: Tue, 10 Nov 2026 13:49:25 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
Message-ID: <avMg5XmU8uSzPR4s@pluto>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_054931_330804_44E0C773 
X-CRM114-Status: GOOD (  21.25  )
X-Spam-Score: -4.4 (----)
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

On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:
> On a GPIO request, select the GPIO function of the pin, on the pin for a
> pin-only function or on its single-pin group. Without a GPIO function the
> mux is left as it is.
> 
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---
>  drivers/pinctrl/pinctrl-scmi.c | 64 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
> index 6f44e8c0fee6..ba649304638e 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -74,6 +74,69 @@ static int pinctrl_scmi_free(struct pinctrl_dev *pctldev, unsigned int offset)
>  	return pinctrl_ops->pin_free(pmx->ph, offset);
>  }
>  
> +static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
> +{
> +	const unsigned int *elems, *pins;
> +	unsigned int nr_elems, nr_pins, i;
> +	bool pin_only, gpio;
> +	int nr_functions, func, ret;

Beside nr_functions, cannot all of these variable definitions be moved
inside the scope in which they are exclusively used, i.e. down inside
the for-loop ?

> +
> +	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
> +	for (func = 0; func < nr_functions; func++) {
> +		ret = pinctrl_ops->function_flags_get(pmx->ph, func, &pin_only,
> +						      &gpio);
> +		if (ret)
> +			return ret;
> +
> +		if (!gpio)
> +			continue;
> +
> +		ret = pinctrl_ops->function_groups_get(pmx->ph, func, &nr_elems,
> +						       &elems);
> +		if (ret)
> +			return ret;
> +
> +		for (i = 0; i < nr_elems; i++) {
> +			if (pin_only) {
> +				if (elems[i] != pin)
> +					continue;
> +
> +				return pinctrl_ops->pin_mux_set(pmx->ph, func,
> +								pin);
> +			}
> +
> +			ret = pinctrl_ops->group_pins_get(pmx->ph, elems[i],
> +							  &pins, &nr_pins);
> +			if (ret)
> +				return ret;
> +
> +			if (nr_pins == 1 && pins[0] == pin)
> +				return pinctrl_ops->mux_set(pmx->ph, func,
> +							    elems[i]);
> +		}

So it is a possibility that in the above loops nothing is set..and it is
fine should AFAIU...but should we log/debug something in both cases to ease
troubleshooting ? (maybe just a stupid question ...)

Thanks,
Cristian


