Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E747E606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 11:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EfnnigPG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCvowU1J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Njqr57p5ISV7HCURBgYX/ECIIVbH/IH4ByQbfc3DSrk=; b=EfnnigPGnOOB74
	L8q3qdn3TJpGZt0kGrouxYA+baM5Yr+IPVJKZmMEZPqrlFjVsNP6dUr1udiqr9pepiwA3AW/iApGT
	AmD4CkfwqAE8ZB6ux9LEogCUF0o7yo7S0FWyQuaJ/5gnI8eJYW0HbpP3kW/z6Tbxrc/o6ocJSF/ak
	r23BArmRmSdofaRaWnMv1lEHS9zMmkxaauRRQY+mxPXTXlW3IKLFRbYzDXeVzqDYFa3Kw5osIE2zA
	amayyGUCcct7b0hfmzMY3u8b2csfePQQiHTfxqfTyV51gICCevesTqW855HysPDdHkUWJm8I7MGEo
	mYtR9V3ccq4ChkEQK9hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzuc-0000000BeCX-1S5j;
	Thu, 19 Nov 2026 11:02:42 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzuY-0000000BeBj-3HZV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:02:41 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5be47aa555cso2456880e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 03:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795086156; x=1795690956; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Njqr57p5ISV7HCURBgYX/ECIIVbH/IH4ByQbfc3DSrk=;
        b=TCvowU1JRpjkVt/0KVpEaBzeS25qM6SDYW9174gyoqCzjPu8RKwIos65vZ0MVwoWYM
         r7z/C6o9O/9PBiHSnjdFdngGQ3MEoTYQXvGTIpgnQ2yuJk80j2HEz2e8iNj8EJGS6qdt
         G0vB7eMdbssOalFM1wLZVIhHI3uwODe36bBK1nsapQx799mr5r2tHW63zkGr/6TV5GQv
         +Ipv+KQNnZ+PQRjy6z7/LG/FinIPwkuKPx1ZI+XL2vAbNvWZgovpdouMyrur3TwIkY3M
         YV1xCqA7qNg0Vb1jIbDyi+Oh5mGJVTASIm1Rs92vdzUJJ/y/noX8LAFvkk8ekpfbRR7m
         ivSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795086156; x=1795690956;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Njqr57p5ISV7HCURBgYX/ECIIVbH/IH4ByQbfc3DSrk=;
        b=WbFZpEy9D0IPqy1n5NwVEiT8A7OnSxwQtfAOHO9J1ABVbEYzEBSt4jeo54LLyqDOgz
         e1DcYxNnox6ASWkNcNa3UFqSKyGmEj7bUj7l7ECebDgfdxQQNb9tZenFz4UWVIw2mvb5
         Wl8TDJZ3MRbL1F3hlAqa0V4+GORxJPFURhy6bdp4ThaBrVcc/vFHq80Ll0s4zvHKKeco
         a0YnS5vqqp2sBAeJdwQkWK4JJC8/Iy7pujIcQgSb9+tYM1zF6IHml4F6QPUR0lWE4c37
         oiJw2CO+WqGDFnQn+6QQ9lFVb5vxA1WFJdZH8FXBGMwtDZrSg64tcEEhj7HZl/37Siiw
         0sZg==
X-Forwarded-Encrypted: i=1; AL+hErHCdt5LzzkLJ82EgUjFgoj3NFIl8B9Z5ICRtwkDU1luF8a4JWWzzs6Wb7XSER28DUcYLQBVtYdADMVyTTojR1Cu@lists.infradead.org
X-Gm-Message-State: APuU4Z/pOAJ58oqgp0JBhpVR2LGH3pm2EEm6dYmCf9+FAZCkFcUZmb7d
	jjNEOTo5ZxIBmkq2ER5v9I3kf135/zhl+YueEYdq0rxnb81xrXToX0SQ
X-Gm-Gg: AYBFou26zjOloa1VT6fs3v2z1oKTtsklYNFIV2h2hDGrb0ATO1TG7sBD4xIdOz0Ou86
	sx6NMiq7sVzy4a7Z89JcxAQrJYDg4mnrDRLtMYNVh40Do11xBtlz9cMr4ht1FqlLWdHlhjEHGlh
	C2xploiVCq+5SDjm87NtbqUXjiyDXyZiPO23Pa2Y8blKZjIO2CKyWXTpkY69EQJWUfa79e9bHH8
	8iV1oI4VXnVJoE7fW29rySjIYYgh17cSj0GMCP5e42QEr7+aaI4QtvAQgf5EcG1yG6ait6k+oK5
	s0M+uqhtRHq0RdEGwbHVoA3DE3uWem4oMoO9M89DEZvVlju520EJMqpNs+PJrCZTJy7tINEHLVd
	YDSBJdVylWcTwuJLJrg0q56myEGot21wpCaSkW42QFYV1kM6x782vB6y/kzCPQI+hvGKl1hZT3C
	HoEQ3J4bPMg6FeCwVSvS9690OfavBSZVZUS0IrXujF0zoUhJmXnokXilZgsS8CKDzxjcdiHSQOo
	NsPNgAbzs6+G08t7ssQRoh/Rnj4YRDJsR7oBjFqz5grWy3UP+Ip/WEct6LqUDnC+1EFTD5fyKAq
	kfsXy4yHlKk4cGGrdCctR+FVh2ANuxMKygs6Ibierb4//rPkH70oYJs=
X-Received: by 2002:a05:6512:2308:b0:5c1:4f83:17dd with SMTP id 2adb3069b0e04-5c1aa2b4af5mr1725666e87.53.1795086155763;
        Thu, 19 Nov 2026 03:02:35 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa772c50sm1425957e87.40.2026.11.19.03.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:02:35 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] gpio: Add Cortina Systems CS75xx GPIO driver
In-Reply-To: <ndapsfnk4wdon57ihawkorz5rwrhxsb7ql3mujqvuu6ixi4sbc@ugtxsjqt7gcc>
References: <20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com>
 <20261116-cs75xx-gpio-v4-2-ad80a944e966@gmail.com>
 <ndapsfnk4wdon57ihawkorz5rwrhxsb7ql3mujqvuu6ixi4sbc@ugtxsjqt7gcc>
Date: Thu, 19 Nov 2026 14:01:58 +0300
Message-ID: <179508611881.4.16899217970121840224@gmail.com>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_030239_681887_A2455CA6 
X-CRM114-Status: GOOD (  10.60  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bart,

On Thu, Nov 19, 2026 at 11:32:23AM +0100, Bartosz Golaszewski wrote:
> Can you please address sashiko comments?

Yes. The spurious edge IRQ is fixed in v5: after programming the trigger
and polarity, set_type clears the latched interrupt status before the
line can be unmasked. This was tested on the Almond+ reset button, with
the pin mux configured separately by the test kernel.

ARCH_CORTINA_ACCESS is defined in arch/arm/mach-goldengate/Kconfig by the
CS75xx platform series [1], which is still under review and not in
mainline yet. The GPIO driver has no code dependency on it and can be
built independently with COMPILE_TEST. The architecture symbol allows
enabling the driver normally once the platform support is present.
I have clarified this in the v5 cover letter.

I am sending v5 with the IRQ fix and the updated explanation.

[1] https://lore.kernel.org/all/20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com/

Thanks,
Fil


