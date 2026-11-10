Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72E5606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fsKqRKOp;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KgWoyy9O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I5T5peH0PUnCrtzemSjuLVp2+YwXJuyEpiqwvId8VNA=; b=fsKqRKOpSkEDLg
	k6Wp+YVMjw6/sqIcK/imkriGbPwVWnIcw+zZmfHMeeNUZlsM43AdpguClakz2kLCPd8skdj+rxjm0
	uK+12vrQWWvi4dDKibkLM78X/jaB+orX+xxcQmDT41hUwML3YtQMZ1fyaOv0l1eFHiyElFYaplG+x
	QE9xi431j9lUVyhxoDE2DK2EkdqXcfHgXxCfvySUpo/oKQuK3ToEODswjX3E3Rl/uFtHHp8RV4g3T
	Ars5AO0FCCDxCkjlQh1BnAOc1BVAllX7Ojg5KNXuXPQ05lFw8y5mQ1g2C5V8EaMOuKvPy2CsYJ0K/
	jQw77rpa5WPW2sDQz2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkbV-00000003jpE-2dPH;
	Tue, 10 Nov 2026 12:05:33 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkbR-00000003jnl-0LR8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:05:32 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5be416e603cso1389641e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 04:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794312326; x=1794917126; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5T5peH0PUnCrtzemSjuLVp2+YwXJuyEpiqwvId8VNA=;
        b=KgWoyy9OjGaT8+X3ebUQZnvARgqvCosSsWSCwpkbVTrpXE9vI8ayCNNhzJo1b5XWcq
         COGNlWthcBcJ2HGGQAG3a08WY9MzDR/ke40P4yWIW+U5cYmTN2DnkC9hDczUOhIBHdCW
         BAEZ/ygLz4BWMAIIZQZuNxVYN0mV9mRU7MvxEAgDKGmemz04TaHV9iUIfhWWCybjqscr
         1Et4AruiljfGJi21YUjRJYPJfMHwA/I/pzA0v96cCe/LSQH31ORW2DKECdUxjzMFbulw
         trp8rV+Qme17/HCKt48dXxLknhwDrlwJT14Q78vusjm1gjZrXBfQRCmMs2L8N05MxOmo
         t2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312326; x=1794917126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5T5peH0PUnCrtzemSjuLVp2+YwXJuyEpiqwvId8VNA=;
        b=xI7ux0AJf1egToS+KtRC2lMCRcmSaYAdaDhnvKgQx5EwlQy1SPpzKsb2Hw1Hku4fWB
         nV7EP9ZKqETCynl8Z2rbt1d5Y/KRhTuVv21MKJ3iwdkbJsK3WOX447qXU/kMhX01Z5IM
         gdlhC5AJGaRdtSWX4m1ZQOomlt/yz/vXKL/JH/V0zv1o9cR1HTpsziMvbYBKdPGRoPjN
         5RsBoBIyXDS8NM2N86wlWM4Lxwue/XKZZZkldEW1WOLw0+5EBty2ZL1EdPOIHjmno4ZX
         mnJRPm8opsBT8fZFodZSjjNDmvIfWn7JY3OvUgVWuhx/fIDpraZAib1+xBqNxR6fseeM
         FdqA==
X-Forwarded-Encrypted: i=1; AL+hErHtRtuOKXdCWHB/KomlN1jHcAtkTOtbf+3ex98CHTRWxHNzrc8lwPCUJmj3GhHMrYnpk0MWZ7FFRh948w49Ealo@lists.infradead.org
X-Gm-Message-State: APuU4Z++GMctHJy0PTHjacC1yj9OAPHmh8RHtJADk35T6Zpl7ZgOcuGN
	zyME+53pMdi02bc73RFobcj4N95RoyNVo9fxPHeBUBBt/gMkVZyHX61O
X-Gm-Gg: AYBFou0igr6J4PiU3GSBBLt3KjPRW9lmFWd9e3mYPzSUSAUT86cQ35LPpmvl5R9Pfzg
	TxjeFcD8UDM8F5Nj1N38K4i2UXGzVRdhOinNVUMmxKV0+hSGgkGv05IG+OfqpILNOdCg8Plm63g
	TjNbjG1SO3rCC7+j9LhXJqWrL4g6Eb9FqeLPaOMV3jyeHd+FYsxADwh8lU04/LQSRzB/4eUcx7Q
	+bwInTUTzSPFJu7mHSzQ0J10mbB0VS8g2/7LUSvgPet+zl6B5ubmrDOAaxxHi5lAuSMx5VIObOv
	BcLf/mQvxpriK+QvU5liDei/XDzgQHAeaW4HAkV51fsCvRGJwZc1E80W/jNw87Skhe/5nf+G9wA
	RVCOSJFJLb+lltqZmZoYyD2Uzf4jvKMau9LpUb7gJxQB80CTIfmqjWLV7qRhmuhNswwIVv+7Pi7
	EpSWqKEN8lyu1z0oPgFcUSx/DjAgpn3Xtc5MCBUWRPh4MF88rDX1Ndg9wyTdEwQJagU4tTtacpM
	P8ibttXf56t+iH7BT/3XBbxt6fmokMVYC13QYe0bWweZd5cJ3nhMbYIZ7NJLmDpuE1YltU9Vc1h
	Q815t5knQMfsRp4mIOoCK6C8U37q6FAW7K1BZ6t9vZYbfCr//Wp4Nus=
X-Received: by 2002:a05:6512:1302:b0:5c0:4e3:a416 with SMTP id 2adb3069b0e04-5c156e375a3mr617826e87.1.1794312326336;
        Tue, 10 Nov 2026 04:05:26 -0800 (PST)
Received: from [10.127.122.226] ([5.195.0.150])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c159702ae0sm240512e87.20.2026.11.10.04.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:05:25 -0800 (PST)
Message-ID: <91a4fdf2-638c-442b-be29-59e05c8ba396@gmail.com>
Date: Tue, 10 Nov 2026 16:05:22 +0400
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix HS phy init count imbalance on
 Exynos2200
To: Soheyb <soheyb_boulaa@proton.me>, Vinod Koul <vkoul@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261109221522.2796426-1-soheyb_boulaa@proton.me>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20261109221522.2796426-1-soheyb_boulaa@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_040529_153818_4B1BE37E 
X-CRM114-Status: GOOD (  22.52  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/26 02:15, Soheyb wrote:
> exynos2200_usbdrd_utmi_init() calls phy_init() on the high-speed phy,
> but exynos2200_usbdrd_phy_exit() never calls phy_exit() on it. The init
> count of the high-speed phy therefore never drops back to zero: after
> the first init, every later phy_init() of it returns early, and its
> clocks and supplies stay enabled across an exit of the UTMI phy.
>
> When the high-speed phy loses power while the controller is suspended,
> it is thus not set up again on resume, and the DWC3 core soft reset
> times out:
>
>    dwc3 11210000.usb: DWC3 controller soft reset failed
>
> Exit the high-speed phy when the UTMI phy exits, first, in the reverse
> order of the init.
>
> Fixes: cc52a697f87e ("phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Soheyb <soheyb_boulaa@proton.me>
> ---
> Tested on a Google Pixel 9 (Tensor G4) with an out-of-tree port that
> uses the Exynos2200 phy ops and powers the USB block off in system
> sleep: without this change the soft reset failed on the first resume;
> with it, USB came back after each of two system sleeps. Not tested on
> Exynos2200 hardware.
>
>   drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 087d552..0bee928 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -1486,6 +1486,13 @@ static int exynos2200_usbdrd_phy_exit(struct phy *phy)
>   	u32 reg;
>   	int ret;
>   
> +	/*
> +	 * The UTMI init initializes the high-speed phy; exit it in turn, so
> +	 * that the next init sets it up again after it lost power.
> +	 */

I think the function is pretty self-explanatory, so could drop the
comment. Otherwise looks good to me, nice catch!

Acked-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Best regards,
Ivaylo

> +	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
> +		phy_exit(phy_drd->hs_phy);
> +
>   	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
>   	if (ret)
>   		return ret;


