Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5FE606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nTtVr4ef;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RQ10YhV/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=; b=nTtVr4efozlHns
	yICn4AhatObS/mY7BH9hf5dFV9ufrCgbnJegXJyi/aYRIKgM5JPrimQX15+kgy7PhO5jcf6IFf2zU
	IOQHkRUniIeV75ajpUE7nBvyTl3Q2NlmlpC4dJHH1jg9xXeDu3ZK2WW5lg+iV2AUPELs8NkKI5HRH
	08emCQPgDKz0wUDKEH6ywAMQOUmlErHT6Z99p2BtClZExBcRt+8GwhFy0NV64Cw/P38ik6VeaTNdN
	wI7GZZsBpJpozyoks4z83kheTTozwscxnRfm1WI9InKFujrHMLA4ISQY1I2QchV45fEOGSUNx88WN
	dPJf2hk+zApiTX/XqSLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdG8-00000008cnC-3tta;
	Wed, 18 Nov 2026 10:51:24 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdG6-00000008cmC-1PO8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:51:23 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso2270182a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 02:51:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794999080; cv=none;
        d=google.com; s=arc-20260327;
        b=QBC6XKKKPyuWcptUOlWTk4ha9gFWpQH7/EXLZVByGrMcgNo+ymiD7dWvTgwCPO+X0k
         yvAJMFXRy2ZMDJ6ott/8R0xu2hPu5aRXCu5QxQxGZ7//pxPkH3wo1g+iiYx5q2hfMPJJ
         3XoGNuru4kO82b1BfZbO1bHchL8bz6mgeFloxwqhZmRhm0Q25rnYcQODeaMjahKx724+
         UPdQ58KBuTg1BqBLzt+lIGZsu/L5xcYWzlS4GSjGkIK/RgrNWewKHyFcVuLQHEqzVdz3
         neKCsWiV58rZGRFDzdA8KY3Ras60C/Ib1Yo2dGbOS+fRZK+pLxV+0QPK6unEiplH7gnl
         fKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
        fh=upudzCaFza8170v98PZpTG7PdaiPnJYoinjRyzhlnEk=;
        b=XBbeYMw/bpa4fwfnEvWosF8WkNvnDp6VLp18C6wrNyUfoaLq5R8jMyV3JHjY5QLZtv
         3WL1ksWHG8wy3aygiuDzd+56gi/S0y5D+MwUg8oBFDbSEid0dLssyUH2sXTmjJkCrueo
         SQ9vkDfqVdcbD37XoG1ThXj4rhfLBRFryLbVgb30tlFAuHkDIWUE+zKSkLgruo6m50Ek
         RjLI2o8foI8jGQ1zN+K5AlXabJrImqa/eoYl1oMXUgbba6YiHZx7xsbKgFCpZ87uXjCD
         HVl1DTJ+Ag7S5GUUAPICCJvBJJfAx1v4pPAYeN7w697DRZY2G2Dc9AklR8VwlQAVVIEG
         0d9Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794999080; x=1795603880; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
        b=RQ10YhV/cJ9X+FVEwbNU05Esun16UP7ub5LsltZSvAvK1ZflyhkIwk9YqcDJI2eRXF
         0zfLAs1nUA1C1HMYMWyg+Ly1CABXm3F5Uw+xWbDCNfnUq1o5m6KPltzkESxXbWPYIDpw
         cNKzSEnRIunCerx+60Aungu72PG6WjFj3rR2xsbTEwMxHZEn0fGzMhLrZRaNVNVWfpNN
         TozBXqRqvYNFzclVavZURthWoJRFqvaC40P1QOk5nOoSWxUpNHkuUr8MiUsHvHWkRrnL
         lPO5zcpDnAJ6btZFrWBcUSkvF5obI5BMBOI47yyIWgNysheLv3du9DtrZADNC6CcPVrk
         7BOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999080; x=1795603880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
        b=ozS+BvOsCA++CTLnJDIETlgSR5N0/gFMKf25PiR/4qkKE7fex57EnuGy93h4mxbwbc
         jcg/qdazuIHEyxlyTD3y+zapHKHoOaG5RE+ILAf12KIfOeAQRm8LjkKzqzewNQelX+mR
         8myP0SQnCC/KZ/X3/QOhVPFQs/6QJqfBqVmTgcMn7V1TNO2BLAqSrL/xkr7WkM4qkeXM
         DFze/Xsa+S1NpV8w4pTZBxTHrxGTq+FhzKAPokPSPSnwvR3AHQXOYiBvvLCcC2Qq/5bS
         CA03rTOIkkb/qijQfRVOkSxwuuqb4hSRZIA9wnrNRrtgMbexrsPDEeiUm8nt7EdoH2ph
         wN2Q==
X-Forwarded-Encrypted: i=1; AL+hErEE3k+/BdcwMC/VS2WUM4Fx76y7yhW4J97dSkmzY1jxh7g6fYswj7ERh/SbY8WE713vxIZO1fBEt83PexfCiYkQ@lists.infradead.org
X-Gm-Message-State: APuU4Z9b6YkMZE3LzOb1LEK3ej7SLlK+PpEdqinLfvyfVgRb9tf7UgEf
	AUuBMmbA8haFOa+gtaxiYFcFVxZKYLDxMjzuyBxkIU0SQO3/x0F4Ak4TJ6f8WxrUAun36yaMris
	K80Jm5aEhRCfV9Grr/y4I4YBFCj+rPZeUWgRFhdZFeBeAMznCACYQ
X-Gm-Gg: AYBFou2AstMdzIqSHGMopdHHt4uv9Xb6Doh0orcThnWzGlmDC/AQzLqlwsKyuuMfc0e
	T4gosNS1fEYXbAEQQ/IcArvhSaI0XpJ50KWpI381jiXCofmz7YoOXvHw94e/fQOliJev1VheMef
	GYNjRVLizPlQQ5Eb0mhO+DVB30rU5++lApNhiXz1E6EdJT4307mbKLaPDOYdhu9DMpao4zbxBBc
	/0y1djNVNnc2DxzPXDa9heLZW9FN3+9A4yvFeU1oOPDWmzUu1RJbTIImIo0vNHwNe8fN+S2CMet
	nR0SUKj6lM/pOrq06DiASZVa3l83LVN8AGoCa9wcgd+MmIa06uRZEEVuYKJlFkIYqB3Efztmonv
	iaA8BxbDRS/vqFe1iSpufsDVE4hszHTVnFnwmpTVlfkUN24ityMbYMG02yJwBzq2tdU57WXY=
X-Received: by 2002:a05:6402:a513:20b0:6b7:a647:d6ec with SMTP id
 4fb4d7f45d1cf-6b887f0d11amr1156171a12.5.1794999079857; Wed, 18 Nov 2026
 02:51:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com> <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com>
In-Reply-To: <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Nov 2026 10:51:07 +0000
X-Gm-Features: AclHuK-Y9_U7OVUZSj7mMfHViEYJaBBmRFeKE5RJI3gsS9G5CebJQE_OwkvnRns
Message-ID: <CADrjBPph5r0rjZPLz7db9-QtmN5+7S2Ft8Zgn1oi+C0Okvas_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos: Add initial support for
 Samsung Galaxy Note8
To: =?UTF-8?B?VHLhuqduIFRydW5nIE5ow6Ju?= <nhan.094.vn@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_025122_403157_82EBB679 
X-CRM114-Status: GOOD (  12.26  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Tr=E1=BA=A7n,

On Wed, 18 Nov 2026 at 08:43, Tr=E1=BA=A7n Trung Nh=C3=A2n <nhan.094.vn@gma=
il.com> wrote:
>
> Samsung Galaxy Note8 (SM-N950N), codenamed greatlte, is a mobile phone
> from 2017. It features 6GB RAM, 64GB, 128GB or 256GB UFS 2.1, Exynos
> 8895 SoC and a 1440x2960 Super AMOLED display.
>
> This initial device tree enables SimpleFB, PSTORE and GPIO keys.
>
> Signed-off-by: Tr=E1=BA=A7n Trung Nh=C3=A2n <nhan.094.vn@gmail.com>
> ---

[..]

> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x0 0x80000000 0x3c800000>,
> +                     <0x0 0xc0000000 0x40000000>,
> +                     <0x8 0x80000000 0x80000000>,
> +                     <0x9 0x00000000 0x80000000>;
> +       };

Does the Samsung bootloader not pass a correctly populated memory node
for the device? Or is this required because UniLoader doesn't pass
along the memory node it received from the previous stage bootloader?

Peter.

