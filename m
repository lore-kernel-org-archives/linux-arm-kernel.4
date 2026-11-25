Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F66606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V0Q85PoA;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=axXWiKh6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dSeXJ7oyyRlT3okyd/7XIjlnYjM82bm2rpl4PLf1CEo=; b=V0Q85PoA+zjb1sHGtKAgtAzGcu
	+tbidBmCfnPXYD5t5U398Q8PkUNrHI0RVB5oxN/rcr2uf9GV8EL5cT/5fBxay4U1Sx0uDp06sHubU
	raiyfiacYiiIeL6nS8/kRvfUQSNHqc2mk0UlP/xX0LgBAHjKvL3Kgwvf0ml7JNyiSmVI8bzxsD9jc
	tLnSkz3V5g1Cv9kSncNE9ZPEF2Yc0d4yMLMwOTiRsulojomgVlGL4NwjwNX84R4jF3/nWQRe0QX+E
	Op4KJm6sU8TZX8fc+6nXbyvM4SsVRueb3EuPB+ITGUPlH6vddbYxgvfAErkCk9Z6z4F5cbKJY2L93
	a/vnu+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKC0-0000000BLQD-2JPZ;
	Wed, 25 Nov 2026 21:06:16 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKBj-0000000BLIb-2yMJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:06:01 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so7633179a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 13:05:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795640758; cv=none;
        d=google.com; s=arc-20260327;
        b=GWx4eejfTf6qdqL6MQ5JUjB1bi8zmtLDOzECVSRoLeR9GbsyG6LyRoEfoZJvkFpap9
         KahzGFvclt90NB1TcNM2Ifv0qjCLyIcF6aSHHgoz0xtmk7hnsjMHRZW1fh5PsGhQHfjX
         Z0mQFva+fT0rWnp2xZWVvMd1Cddhd4NVp4Kuv8jNYCAndk6+/Tn6bceZE27kIpg8aZF+
         g7+Bpc4NRjCXypdX3ZiYwn/iqmVf1GHn3i32+O4eZFAFDTqhs7RMHYtNQ0T4Ss6EJR+T
         cPQEVm7ghZy5mYf5/8kK59PFiw8g4riU6WISpiM3P1Tnr4R0LCoyWwVMj23OEVyP5/5O
         s9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dSeXJ7oyyRlT3okyd/7XIjlnYjM82bm2rpl4PLf1CEo=;
        fh=Tk6cvvl3n5z2X1Hoy5a4Nd4YecalbltBuhRXR6OzV5w=;
        b=hEBBC1lLjCAAToRx+7CrCfboGhCT5nDauMfVU4xvGKWE3YD9ciL5nF6GvGTUZFSNO8
         2HZLj91Y7R9DrtSog4YNAUzZaejoycBA37nff+tl//4Y96fhnJ7LIANS+LRd8PCt65Fj
         4k3jrxAUEPkcq6F3B4bxx72vK1WHVF6UwcChXI2KbDN+V5XyUBpyqIC2vUng+npoFB1F
         721yPGWBFTd+4FNpGrSg5LiTodX4ZmRwKF01HvJUrn046m7iZMNRXCYq0LGUmj8M1z6l
         18INwN0/XG3R1q26DaeY+JsbioIr5daytZXCAGwZwkGkXZmgbegJmdS5CjED1eswHIPI
         bWLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640758; x=1796245558; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSeXJ7oyyRlT3okyd/7XIjlnYjM82bm2rpl4PLf1CEo=;
        b=axXWiKh6phLxfwtaENHJnF55uugFPfIZ7APWwLxFypemKrNRKK7qXQsN9f7QrpenLt
         tmdQwIbf/eBfyp3Wln6UwXlaScWA20LQjKnXLzBKofPV+wObvED+AJSDJ7mLG0wiqsMA
         JvKgq4je7Kpf2AEycoakiibZhJ7DFiip+QzmMedwaIsHv7uBln7z4W6QXqVhvN/Rf2uP
         PtSFn4Yg2200SjzYgpxgnb7aLoJG1coejA8dEet9j3efmnaTvX83ccLjooP/zvAWmYdc
         nizdhUtBpYZrvF03iiRAqXfwk1jQNZO+GzvnRNgOK9qiQDyt3r67HsE9tsGRnXDwSjE0
         YETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640758; x=1796245558;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dSeXJ7oyyRlT3okyd/7XIjlnYjM82bm2rpl4PLf1CEo=;
        b=Z+KBBmnKdNfPjLxPnHkKzETPXd0hFFs4ZoA7je806fl+RVfkr9XuUOfTd2HbUKAw7b
         Jv0X6+ki59pOAUapKEtz1HuOVpL/DiAzBWCJQpwKcXpkQcRfSqkwBGVW29gMFMLr+w0H
         xbLYBq5C/+mPLQp0sYgh99bk4jglEm/Bm+lzv+XLEgbWgbRgXTLqOiUar2LuSzD7QWFO
         Gw2wruo7PyzFCIp/gQfqAdhmKTrGsihCJ6kzM91yEq90dnPGH5/1ixlIdwl1OjGr7ZoG
         wfOHUYogveF00EypMGs5RUn1oe0KKu8MAg1ZDO2kV2iz0+WrT2sZJfl/UoYuOjK6PWm3
         a5YQ==
X-Forwarded-Encrypted: i=1; AL+hErF8qDMWj61hY8NLXLJV8s1c2AXX3e3fRfqYJX7QjXYQTlMWY+1ms7XU2FH4FawI2Ydprso6toL6r6ZF+jF57bb3@lists.infradead.org
X-Gm-Message-State: APuU4Z8n4Uwte4HwhbY6Hz8WqIS3KlvDml5tQEX3kq2Lq/0NBy14w2MU
	UV1nL5lN9/nvMao7Dj2enyfUVAk8BeU2J7goaD96n+RBVJjkwXh6PbpViZTCEFN4djRHo4PhrVx
	e27v+ZSb51t1SPgCYP1g0BhPJOSHaRMaJI+lNQDVSbA==
X-Gm-Gg: AZFdTZfb4CZYEXzi4iuFq7tIQ5tvwW41dvAaFgfxkIzKitUsmuKy1o6RZAZBCJTU3Qs
	NYMnGJ5UZ+M3JBRgU9xUO8O/hKH9PNAY/aHiP4tFw94UTcl4yNe7CCvU+w4Jn1g8FbIdeWyktmD
	HeBtGH15ESpHwmJYqJZ1BRa+K0YkZPhjiGqBXgM1ckIHG+0rubjXeT+ohoHIWpbPNrnsDJfP9Xy
	FdZxt2olDbdxapDqcgNNiEbLhzFRkE4xX686TjCAX+VGtcYNvgKsQ+nBUkmDNQmZi/FR0UftYqp
	tm99HMtsH9mrPaHN+3cL70fqil4sVe9G2DFdRW+7y9E9IwmqYp18LPpgbzKDnq46wbUtJAODhvN
	diQMnnhGCmh9vy0FEJg7m6E51pENHa0ZCrUvYrLMcetIgKFEdPjnsY+aJEF1j77WthY+jbPQokN
	DUMLZYsCo8zvl6WHRd
X-Received: by 2002:a05:6402:4001:b0:6b7:a357:3761 with SMTP id
 4fb4d7f45d1cf-6ba37ec0a9fmr13838958a12.31.1795640757962; Wed, 25 Nov 2026
 13:05:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
In-Reply-To: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 25 Nov 2026 21:05:46 +0000
X-Gm-Features: Aa3M54rbIT4J1-0YxOX9tYrRiTVNsMtDy-V7qgEQnJNyRP6bSfPW5CTnV1B_MM4
Message-ID: <CADrjBPpxf+Df69LouGTOq4Qm4HA9HAyoKzW2Gz-zG8Hcty=bog@mail.gmail.com>
Subject: Re: [PATCH] firmware: samsung: acpm: Don't use pdev after putting it
 in acpm_get_by_node()
To: shyckless@gmail.com
Cc: tudor.ambarus@linaro.org, krzk@kernel.org, alim.akhtar@samsung.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_130600_168618_8663AB98 
X-CRM114-Status: GOOD (  21.62  )
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

On Mon, 23 Nov 2026 at 00:46, Suyuan Wang via B4 Relay
<devnull+shyckless.gmail.com@kernel.org> wrote:
>
> From: Suyuan Wang <stevewong@hust.edu.cn>
>
> When device_link_add() fails, acpm_get_by_node() drops the reference to
> the ACPM platform device and only then reads its driver to drop the
> module reference:
>
>         platform_device_put(pdev);
>         module_put(pdev->dev.driver->owner);
>
> The reference from of_find_device_by_node() is what keeps pdev around
> here, so pdev must not be used after the put.
>
> Drop the module reference before the device reference, as
> acpm_handle_put() already does.
>
> Found with a static analysis tool and checked by hand.
>
> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> Compile tested on arm64 (W=1). I don't have the hardware.
> ---
>  drivers/firmware/samsung/exynos-acpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index a575caf871b9..15d2f708b0c7 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -816,8 +816,8 @@ static struct acpm_handle *acpm_get_by_node(struct device *dev,
>                 dev_err(&pdev->dev,
>                         "Failed to create device link to consumer %s.\n",
>                         dev_name(dev));
> -               platform_device_put(pdev);
>                 module_put(pdev->dev.driver->owner);
> +               platform_device_put(pdev);
>                 return ERR_PTR(-EINVAL);
>         }
>
>
>
>
>

