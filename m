Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EDE606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XClwVb3O;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AvhaAtXO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jAVSepPFXDVnDs0KIr6D847y94ZRdB5eQ9a+FnzieW4=; b=XClwVb3OX3J+gy
	VXbuOaRdYmyWQJckEVHzSFkwk3dlkXH2xkmiM/CzKZp/6pFRN1GH1RIAr9aq9WxCjxpLjhotj6I2A
	CkKyCHlqXoTBhubSzgMCXCzbKaltYO5+/VdCr8QhBHQJbNsLIoi3bm6px+bSa1iqcinedp7IH0SLj
	ckvKwM5pr+1muB6vT4RZ+y2nnG0zXcxQFaqZjUKQXadzwPEdpp8+kImiy/bvdaXpkKt1yeLyeYhk2
	1VNBQokMBmpzJKMFn8qYJ+YfZwQFqIiKKhHT1Y1ywaD3xhjHVtLNsD911qVGnP9BtzDsA8OLNs+fJ
	Py+Wa5kz1XsBYHZaA48Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKAF-0000000BL3R-0woO;
	Wed, 25 Nov 2026 21:04:27 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKAD-0000000BL2a-2FQC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:04:26 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso7406367a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 13:04:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795640664; cv=none;
        d=google.com; s=arc-20260327;
        b=gaujNHFS4gjBzEpknowpnkAti2Y/dy96381EbrtdtKLwev/DV8dHMxIgeE/YhOmF2+
         CHzEvo7wUilER1VmWOjh5FHt5NL3FHDhPySGhskygxoBlRndnD6zvaibvf/djuTOpoRB
         jNXqC1w7TCabqLJECJXllAXLI+RbDux3P1w/G6lmKQKime3ukCXyCGPMCf9YHs8nsnDA
         lJa4gl1fOlGXoyI5oUb/qfe5d9VJeqEFKeOaC+4ROdqlKAfoerUvqJ4nUKWxx9I9EDRq
         frE44lSGWMpkgdYQAQGjP9z5iGvbqYjcDNEyXFNLO7hzpR7Qx9CpbSGFWscTbqmKI/bK
         fb7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jAVSepPFXDVnDs0KIr6D847y94ZRdB5eQ9a+FnzieW4=;
        fh=QGni7boKHjApcsmYcVLGSQ+7uNSMhNw9t4lAePF7qbQ=;
        b=GOqhRtBKq88z809lctKxqlJ5grVAtV+P/0xffpdScIRfjCCMyV6OOog1BHsi51AAjG
         7Zcnnwg4ydkyyUfxAYQtF9MjwpUd16SXY8rRZCDZtNIXtTFOfK80hvARY0m8nY8vuKnM
         siCWx1rfHwR5O4Gms1nskIHUL1UvctLDxiMFKvuqTrehnHbD3HifWBTAaKeeoECylu8R
         qlFoFrdBCF0CEa4oxZAeA2cYMqEIRij+xkNH3j7JemW1K4REp7JicFNHVIVlcVuM0Dxa
         845bw3+fYazUyvwYw8VHbJAn75xXH3uWoBaKlS6GtwEdc1yMkPs/qjimIRhEBV8C9Byu
         iWtg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640664; x=1796245464; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jAVSepPFXDVnDs0KIr6D847y94ZRdB5eQ9a+FnzieW4=;
        b=AvhaAtXO4fw5yTCw0f3Gh+1Wq8LLNCabA/7uigZbUlpa/htiROR09IezxEPFlPamg8
         T0A7Qk5DsjAsz4nsJG71oVkIUhuWQo3ub2QMDVgz5uWFLXTPraC5f1fokNFUMrWknBXe
         nCZ8JOQ7f5vHoiN6jnFM1RDzLtA7CpaQtCX1eEKm89nlksoZzpQQdqj+5Pi8j1qoJp07
         C7BtB99lJGJjOmP95jaILV5j1vUcILjPtlZm9yKNZYt3iokcO0Is7/ElZ/sJIEweX0ee
         TsFkQOqj1VOZWCubzgciKsTO2+MfzDoZ5W96W4rSUTyTot4g0RQzBac3pkmbZfcD9cpe
         WElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640664; x=1796245464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jAVSepPFXDVnDs0KIr6D847y94ZRdB5eQ9a+FnzieW4=;
        b=cHbGX1eotn7244xNxZ7+WpslMlTOqUGKqbSQuNcbYlUnTgQ1CnJjv7CHHPgggEfls8
         YCuFfnkoxZhjyg2FLug5A1T05Ker7TH88u0Fh7rmQtkpPso1XeaHZaYDKQg/8LtxO19u
         U5NgOkWOSGG9JvdU1KMvq4YuclhZKSgfpXwfX/Z3sBaN6WdDPneQS0YRhwNKMfQ84Ynu
         cZOG2+aHre/Qmhw2l/Hp8Mja9M5T2jewmAqnON4qgjYnC2hcwO+rT8g8zwR8D/Tsly2d
         /QJwFNkGBgQus9UPoFDEteE1kZH/vh+dI9fcOotkrYxqmNZkEj3Vmm+6HJx9bx6vDFqG
         2yNA==
X-Forwarded-Encrypted: i=1; AL+hErEMvCB90hAz0kPbfQnQEqMkCmy+HiTQzMe5WuBpKpyu/P9uadfrRrgJuVKcEuNUfR9j9wnVOcW8060MxlVwL+ET@lists.infradead.org
X-Gm-Message-State: APuU4Z93dl0OjGeSJaKoAKadVLfRDz1PIISjQJETHzG5QB7EZBFcaoM8
	7IjS8sruzx18JgMa6PpZLvV8GWKBfoBsogWQzw9j1kiG0zJJf6HR0A9OEmfX6BGgyUwUEE38Zu8
	EloYuFl0QyCYrMTCvD8GmpRRQa58E/Gfk6g4LGnyuJw==
X-Gm-Gg: AZFdTZdMz4yhsImw+c2alB2ldJ6YNI4xv7ha1KwH3R6yFdmn9aDsI3lShIzmI4xnv3v
	7FHlZbl8kWHsB8eWLjOk7jCHWqLRQuZI48z+aeTL7uR6HagWtudI/j7MQjzTnfUTvtC/I+jvwQJ
	kHg5UHCIrCQRvqpV1RysZgHTb0bDTtmpeGhYuvrJBd6nZ/9cSmXMWnvb4T9BxaKgd5yU2Oqj9KO
	Yhte/0cGxMUwbDye42b1gMeapL80Bde3uwVrbCkVeoxGTaXquitLp7+QdRRoA1Jt/Soe7JXbpx5
	MsOzpps7xgKhm5D0t+4NTQfTTw1KU4+5S13YyTVmKrZWNrak4gA7MLrk3nDSt314jv6+SF+4YM2
	Pu40QBE8KlaGOXeTeb1kcixgqL+XZmO46pRrci8eEi2IS3pK5h6vAFC6RPN9zlaBIoqONx0Q=
X-Received: by 2002:aa7:c0d0:0:b0:6ba:144f:ae43 with SMTP id
 4fb4d7f45d1cf-6ba37c7b138mr10360793a12.6.1795640663702; Wed, 25 Nov 2026
 13:04:23 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org> <20261123-gs101-usb-phy-orientation-v2-2-3361fa5f7543@linaro.org>
In-Reply-To: <20261123-gs101-usb-phy-orientation-v2-2-3361fa5f7543@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 25 Nov 2026 21:04:11 +0000
X-Gm-Features: Aa3M54oVBZq5tOYyeoj6arLLradCyxNln2xhQ16gdyoLzIDJohPkD6NVk6Xh8SE
Message-ID: <CADrjBPpE+2n1Y=02Ayz8i8guJ58XBzdG5zVdLJW5ZhQQKiNmNw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] phy: exynos5-usbdrd: apply gs101 postlock tuning
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, RD Babiera <rdbabiera@google.com>, 
	Juan Yescas <jyescas@google.com>, kernel-team@android.com, phone-devel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_130425_587906_1C9B6DBE 
X-CRM114-Status: GOOD (  16.49  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 23 Nov 2026 at 14:25, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Phy tunings to be applied after lock are never applied on gs101.
>
> On gs101, gs101_tunes_pipe3_postlock[] disables the high-speed squelch
> detector when in P3 / U3 to save some power. In U3 (USB3 suspend) there
> is no SuperSpeed data traffic to detect, and link wakeup uses LFPS
> through a separate low-frequency detector. Disabling the high-speed RX
> squelch detector in U3 avoids keeping it powered while the link is
> suspended.
>
> Apply PTS_PIPE3_POSTLOCK once the PLL and the CDR have locked.
>
> Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 comb=
o phy (HS & SS)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsu=
ng/phy-exynos5-usbdrd.c
> index ccaf0f27c4c8..f647688c3bfb 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -1745,6 +1745,8 @@ static int exynos5_usbdrd_gs101_pipe3_init(struct e=
xynos5_usbdrd_phy *phy_drd)
>         if (ret)
>                 return ret;
>
> +       exynos5_usbdrd_apply_phy_tunes(phy_drd, PTS_PIPE3_POSTLOCK);
> +
>         /*
>          * Set this while still holding phy_mutex, so that the orientatio=
n
>          * switch callback can't miss an orientation change.
>
> --
> 2.56.1.750.gf70dc682cf-goog
>

