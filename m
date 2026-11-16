Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D094606A899
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 03:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ueCQdyQq;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ypZUOlzW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4qUheKg2Lay7rkyQAuqzWzkTXaIYOEjjSVeDSogdieo=; b=ueCQdyQq+IGRfSbjRyuDigMcPq
	+gMEruNZz6SKK2+/as39jpuNI4WDTd6wCTRZAck0uUoZg43ROElg4pcBncwp3OqX6xU5B+fdMc42s
	poZ4L5eWQD27dv3hk6w3JUfg+BIk2sT4lIAdPjV/eK7jFRhYAnXGCbd8uWjkJs6Lbz/hUYr5nUzVL
	zfbzv+EQsXzDTLRanHPUF0Etmw39cbMYLGVKUUTqnmBtUBxpU+YdP3oj64bL0tAQJmTQSDLuwAB+L
	gF0puy6fQF5FwL74ZwEFjnJEOXoXV3IooA4K5a7bQruEdL/lLO5Z5CcNvaYpwXIPoM7pg6ncQC/7v
	TF846kPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmyJ-00000000zRL-115T;
	Mon, 16 Nov 2026 03:01:31 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmyC-00000000zKF-41de
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 03:01:27 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6b7c7fd4c33so353927a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 19:01:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794798081; cv=none;
        d=google.com; s=arc-20260327;
        b=JJXIoXVOItPLm5eyyb+tENNLY8lCzMpykSASr5kHoOjy2/eJZs6699iEu2EFwoIJhP
         J3z6TbfE9+RSHV6mNHjrvr/aODww6feuV1iVa2t/3VwYySvYp3Xxva/Pvc8YbVsQQHx+
         4tDVDnXgvUPljDWul4t4yDlG1ip4Y7YDeG5rg6pNKm25DqnpWfIyRwrn+OxtaRIkFf6H
         xm+9vhPX9bd15bpymKdX0f+qg6DbOritP4mUUwfROeDaN6XvUYxOmIeynwh48Heb7+1D
         8zrMALmJDW4FtWmt1tvNV7EyOeTpMGHuclR4O/S1RxB3Z8m9iI3pXK4V2WUlx4fUWotM
         tPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4qUheKg2Lay7rkyQAuqzWzkTXaIYOEjjSVeDSogdieo=;
        fh=WYgaLLjNUFLvj/Bs2BVr2iLxpknTGQx7l4RrPDmpYYM=;
        b=YHc+ff/o29QXFgcO8nEB9Y7HmrAPxdc4fvTluHvJTkeSpaVZOjdLrhnWX0vC52aOf5
         pPEoOR8qUALZp4mC9ldRNQ4XuzwU/+mvpgLArkUg/IuqUlNt1+NZ6lmB4aTYDOpbTIg5
         g5kUv7+pjkpOBj86qWlDZWBjzoIAVGkHn9vRuBiVxJ8kLLlucCSWMx96KouSpHsrOoEO
         Q/QepUpb39W+WIJWfbt1778vajHJAR1ngt0Je9W2+0Qow90T/tqaebJs+C7DpuKYuxTT
         fxxY8vCHBPBPDu8tl3wT6CJLE8CUTTwlNV4Wg+Ss7GIZ8DvGrysF6K/F50G2wHa8eUET
         /eew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798081; x=1795402881; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4qUheKg2Lay7rkyQAuqzWzkTXaIYOEjjSVeDSogdieo=;
        b=ypZUOlzW0zfxiQOwmiTLgU4qngWZuHY9XO+Aes+aYyaOfXsP2aye96YbozwVFG3Zdz
         7xfkQNgysPOy0aAFrWl4jHZuQvLf8CqjeJThUfEpLA0dVmatlXqNl1S+lR3aKuOCGMYR
         Ex3qYAE4urmIwqLj7dPJeLFIaBl34KYsFQycjMnIyhxhh2Lydlxub2q+rh2HfrltOXHH
         WXZ7OLoNG54sUTs1ww/ikqjcmigExi/o0KdXLBAmQ9vgntnKc0dre4lXsv1b7X6iHPOR
         tnBTOLUxnlczGCsEd8obVqEiZ0kEWC1yJ6tvQCOKW9fb/93wp9vIfRS+/Mu2M6c+6kLQ
         T0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798081; x=1795402881;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4qUheKg2Lay7rkyQAuqzWzkTXaIYOEjjSVeDSogdieo=;
        b=dJG8mfihFR5Y31UOwXl58ohJIeAe1Vl/40rBeiCQTaYA7FI5RoTpPay24U+nPoL7tu
         Pv97UdhcIuwkTotmcTgNW+tandMlVupGXhRgkk3CFPHNxHDpK1slnRI456+YHmOBB1SG
         xI87C0+GqifVZYgsjuoHH1di7E7lOtlWEIB75blCIeK9bgwubHtfvnCFbA0n2S0hKNw0
         kRGQChqzsJ6NdDNlU/EPElscmNqnxLmg+0tlwj6sCnFhBi2LHNX7hJvioIyzFXrNQwhm
         kXlg48seXXX/L8+GT7en+cqhM9KN8a/H7Sjw5TRN8N2N6lOoYdjmfG2T76/CvsNFDEfk
         +ySA==
X-Forwarded-Encrypted: i=1; AL+hErFajM9hNZCgRzsgyfwhfB+KrxnJP/Tds2MSofNfCfJmNRqjMyV9zv155xqxiIl5iskE3ToIGpnIEKV+Yn5Hqzt0@lists.infradead.org
X-Gm-Message-State: APuU4Z8Q8Mqj0zLnRrc9eYbwZw1LUNjkJmH5u79wIho2qil3IQHlJXYo
	yzL04841/V6+0ny1unognRgggoIS2a4m4mSzQUtma4Zorbw858+I2tov0zau8n5PmA4lYoA4MXV
	KkZj0edCOIY+Snx+A3EMnD2VRP96fsQ0=
X-Gm-Gg: AYBFou26L8l2dgX9PaqssN06Y452z7BPGSjgCMerNAafUnU2jHSnz44yHW77Jfm80PN
	an7d6MiK15qYrIYxrokQ9Fl6fjIQblb4rMaLBrB6KZi4wK7JNSpUJQADlPe+PBRVq9mcRzYxQF3
	d6RjFl1+CCa1/XMAq8yMxoYQRf6QocWIbpwk+kRnIxVoJtjGycqGcVYsfiyjVj3OkB1pm+RcuCQ
	FIPQjqIS23efhrGoG8/WV3EXK5pETKY4fIbRpPq5IH0JJMfi9DpAT2SGHvcYCNaODSw/ld/zVVO
	2to6fJ9aA7wyPxS4tjluG55HF4cLAh3uxcRe0MvKA6AWTBwYV5Ik6QPx/gZIQArydkT1blhhO6z
	ymLiP7KkP1U3JNl297r5lKsaYbN+0A4zztpwmzrr9koDgi/vUufQ0PvZLsA5PQiXf05R+wtiNjN
	AusHvh/m84oXDQ1COJ
X-Received: by 2002:a17:907:6eaa:b0:c4d:1768:48eb with SMTP id
 a640c23a62f3a-c50962f0b77mr1233752266b.2.1794798080923; Sun, 15 Nov 2026
 19:01:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-3-d681ba20b36a@gmail.com> <3ab93996-7e37-4143-aa4c-b4b4b0e025d8@collabora.com>
In-Reply-To: <3ab93996-7e37-4143-aa4c-b4b4b0e025d8@collabora.com>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Mon, 16 Nov 2026 11:01:08 +0800
X-Gm-Features: AclHuK_2CCL-6w7SS-4GVGwc0x2u2Iaps879pDspYuxXhI4Edd6EqNeYrnLX7uA
Message-ID: <CAPwA33JHxsd=nr9F9_KFKWPx+HGaR8P3ee7hxMc8XCS6QY46gw@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on
 PLL lock failure
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_190125_032375_824AE5BB 
X-CRM114-Status: GOOD (  17.94  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michael,

On 11/11/26 14:02, Michael Riesch wrote:
> I wonder whether this should be here in the first place. Only judging by
> the name, samsung_mipi_dcphy_pll_enable is something that affects the
> complete logic block and probably should be kept in runtime resume to
> begin with.
>
> However, since _dphy_rx_power_on does not call this funcion, it seems to
> be something related only to the TX side of the logic block, but for
> D-PHY and C-PHY. In this case, it probably should go into
> samsung_mipi_dcphy_tx_power_on.
>
> On the off chance that this is actually for the D-PHY TX operation, the
> function should be renamed "*_dcphy_pll_*" -> "*_dphy_pll_*" or
> "*_dphy_tx_pll_*".
>
> What do you think?

The settings in this function are indeed only for TX, for both D-PHY
and C-PHY, so I will rename the PLL helpers to
samsung_mipi_dcphy_tx_pll_* in the renaming patch (6/9).

samsung_mipi_dcphy_tx_power_on does look like a more suitable place.
However, I do not have a C-PHY board, and I only have one panel with
mainline support, so I may not be able to test the DC-PHY TX side
thoroughly. For now I am trying to leave the TX code unchanged unless
my series affects that code.

Should I move the PLL enable to samsung_mipi_dcphy_tx_power_on, or keep
this error cleanup path and the renaming change for now?

Thanks,
Jason

