Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFEF606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y9rHSBzS;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jy6v125z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ny0ODnWnV6171dn8DCwt5qzCHPJg4PZkZSQUcRv3Azw=; b=Y9rHSBzSEZo47p
	P1ogLK8w2Z01p6aTgNLj2919do3YBooFbhKHpybbODjbofjFi+vXyIR3QiCuQG1PzSwR7wEd7CIJ7
	il15VGL0pQw8/vc8PkRzFfGWoSwcM5oR3Q6YHjuP7ci0g9jNynUY1CIMesAUzzlFQIz/wjROllNup
	pEO0W0HxNTepS25LfHp0eKzUe0hakZJu46psZQyzbjTmDOB68YLp/Nvc/WJ8r9OwTswvJpOVtxHKN
	LL85JK5hnX1k4Ou6FAVzFK9CdT8DIBUcHNksLbR39LTJ0UxpG+PkzQezRggx0S61KymSFIoQCOEyG
	YBJ1KZPlHsf1j+0j1RnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAp2-00000009Xk0-0qSo;
	Wed, 25 Nov 2026 11:05:56 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAoy-00000009XiZ-0cLU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:05:54 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48dee593f18so5252119f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 03:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795604750; x=1796209550; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ny0ODnWnV6171dn8DCwt5qzCHPJg4PZkZSQUcRv3Azw=;
        b=jy6v125zJV1GWvX/j96lsHPqHM2rFVCJ3YqXv6q8+Aod6gdwEkoYWPZGBKoytRGpLy
         bpEQ5hnGZ71fHb+KmQ+qFBf9jVQzpKNMkq35yD38zsEjIfTmV2rfPaRgNxKjI0Js8a/f
         JjvGscRSTngTLd052ITeh3GN5NJ6rhEu5h4sPBJOWTxEwcWTi/cF4N1//BC3raYyEWjj
         ySyTn5rQAG0P6AV++nufRMAzB8kn3EqNobTN86/yk+5N5eSLAZ1z1UiikUwrN2DIuHpt
         CgCYHHPUzasTKy3R7fWR7LLYAOufccw7zqOlagXnh3IIzxcuwHTZFmoYkC/hDieWkbmJ
         a7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604750; x=1796209550;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ny0ODnWnV6171dn8DCwt5qzCHPJg4PZkZSQUcRv3Azw=;
        b=r3Mo1kJK0fYnwGWq6v3jUqt3Pi+NyjQNWA9eU6BkWpI2V0ETxPe8dBvyRW56GwgB95
         7JQSgMrH3uiG4DPcF/NQhDTEcSX41V/7U1o0ga5aZScT90sawaWV9dbQPXSoWJbK8T+y
         yHFny1LYWMweRmtG8INrt966rS5jW9cutppWSZjRn2K5+/Qijaf4l/q03W06Q0qhdW4k
         RvYBJQo8oWP1+OxZnS5xOJyH+HNXSSi3+EQ+o5zzZ+q/3InzPXyrMhx2YNTA0r+P7vcK
         UdCWmJnnZPVwBgoYEU3AR8rTgGUbK3QXjRvOHNyGH5T2RzUkMURAu0AGaet5N5RkxnIN
         6fHg==
X-Forwarded-Encrypted: i=1; AL+hErFwIBfxjMaz3hDg1KJAc/OdRygvjjLrPBeZZUQmBu/xLnCMIb/QOIvW7DS2ZwT2R21NU1hf6eckX6StoSPzWUWk@lists.infradead.org
X-Gm-Message-State: APuU4Z+WOPYH/T7Oj8YhftexAsf7WN6JIuMVG8PM09gJyv9XhdAGfv+v
	vvB2Ym2EA9c/m5bhgMUw4ZJ3Vp4h9LTR329dyTRMhyDKPGpxSPIGoEoZK8iBJDfnEPI=
X-Gm-Gg: AZFdTZfBdOPICVGBI4993wsg3U+jRPptHbDRRJlgtCC/4u50ufrccPQPCFNG8qT49Ti
	A++lL0mfOdgVKeJQ1ZuN2TrW8Js91Nae6xV6ToKOEmg5HGJiUHd/RrduylH01AJdVvtQsipM422
	RW4h84x9e6N59ptYO/A+XN+oST3I8vYMFhI4buVhfif5N8wEn9gv9li2liWN31I43maJ9X7pElC
	FY6sCbnt0VO0Uw0axtN0q5ivBqDQbUAgjFcuusiWgsGcJNVU5WBpNaAfjUJ1FOFwkXGE6hyrirX
	3F1zLHeIvQJ0ggq+fIggi2/zYtxry21K+vlRHlP9XFj8Z3PQqyEWkh0cvSnEMSF+VsXv7yCJfYe
	loljjNUkoC91QIUJo293FAK8zuWVVV4S0Y/tQPH3vpKvJ7nSell3bfByo+MihrgyFLvHBPLdTxy
	+mc4hZ9h453H/hk575RPVwAYMDbd3dIiM4wcMpmBvpMQ+8ZgYzWf8NyvNO3Kh0dbFGlw2bNktd9
	Uu26ZCYbI9xmeF5rsdWvyl2tN9FWrjQJahQ+YbXNjXjB+WJ3yGvgl2LdB4DdZvukrmx3TAzgCSj
	IcfVFeXghGfjIOd7+IIjZoIhkw==
X-Received: by 2002:adf:e011:0:10b0:48d:f99d:a0d2 with SMTP id ffacd0b85a97d-4abb2168f53mr24522718f8f.15.1795604749846;
        Wed, 25 Nov 2026 03:05:49 -0800 (PST)
Received: from [127.0.1.1] ([151.42.79.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm33775330f8f.50.2026.11.25.03.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:05:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] arm64: dts: amlogic: meson-g12b-odroid-n2-plus: enable
 SD UHS modes
From: Valerio Setti <vsetti@baylibre.com>
To: Igor Velkov <iav@iav.lv>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>, Dongjin Kim <tobetter@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20261125-n2plus-sd-uhs-v1-1-cc2019e68da8@iav.lv>
References: <20261125-n2plus-sd-uhs-v1-1-cc2019e68da8@iav.lv>
Date: Wed, 25 Nov 2026 12:05:43 +0100
Message-Id: <179560474311.1313389.4488537313012289406.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=802; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=oyMGF25BX72C/uylXywl0ei07ucGN60OTc56dWF+k0M=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDNlsB7kc8j+cLuUtWbOaY5GFsNB1qWc+f+zsz+ul5Vdq8
 bZOSP7ZUcrCIMbFICumyMIy/d7vglK1h8YJJwtg5rAygQxh4OIUgInsl2RkuCC+9l3Ms6QtP1QS
 1nHvmyl56cTF9jlrDk78WFz/eeEXnqmMDJ32r76cinf+P/uZUv7zVRJx74WKqz7xPOCOMlt1/Vv
 pf14A
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_030552_208620_3DF59B2B 
X-CRM114-Status: GOOD (  10.79  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> index ce1198ad34e4..1f49686f359d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> @@ -15,6 +15,14 @@ / {
>  	model = "Hardkernel ODROID-N2Plus";
>  };
>  
> +&sd_emmc_b {
> +	max-frequency = <200000000>;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +};
> +
>  &vddcpu_a {
>  	regulator-min-microvolt = <680000>;
>  	regulator-max-microvolt = <1040000>;

After checking the schematics and the devicetree I think this is correct.

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>

