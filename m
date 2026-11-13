Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CCE606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UImpwi4X;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JfYQXbF2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=; b=UImpwi4X5HXz6Z2PIE8qUk+hHT
	Y9159zu9LE2iIhlhbGNSyPuq13KBk+wNT2dZd9+msei7woSVurfrQ0B13As0PFuPWz7Al+L9v4xiY
	0N1TjE+uspX6CYUdLPpyXQmX6JNXRJoNARIvxp9J1ZYlfygSgsueOX0wYAZl+lWFzNwTikESvacHf
	EqDn4X2V9/j4si2vKEteXtag5L68euXeK2weRN60f41A+aCk6XEnU5l0F1cLGkR8Dclczrc59M/4g
	8KC73oyUMGkWsJ5x/3IP+e97Z2UQT541oURCObJfqrfDb+7VM4hqvu0g8QlOy/JsGzj2HanNn9uPA
	omXYdZqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRquf-0000000Codv-0MuQ;
	Fri, 13 Nov 2026 13:01:53 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRquc-0000000CocN-0ihG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:01:52 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso1854352a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 05:01:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574908; cv=none;
        d=google.com; s=arc-20260327;
        b=rXYdY4TkFo++q5LNffrepaMSXQ2pkFXQ0BiNNcnKsy3v1jkekNJXqx/eYhXIfsH0yV
         ophU4ijlE1VSZyWo37lcj0trP5AzAP2gFK5/6ces0cv1IUoGfPIPojAD26kROGGfXjCN
         fbCSI4OejNpHJEcvmUnWiuBr+EOlqo3RE3uemylsTTue5CoWmMZnZ/a6v2TmleI2gvw6
         1qqHFVxXupJXOMQXgGdHerVKMOhwIJdUkf15IN/Jwg6vB2iwdpW1fRMot14qnchSGS0i
         Fk0+2pPK2dWOLfZu00up/vsLWYVEuUrSrJ/lmynRPwuDQGO2WSbRODRJnvx/cREgJYDv
         L+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
        fh=fT+XrTi7e4xDJDZmzfW5nfPme5lPVQLU83Mmr1R/lQU=;
        b=dO6aQ2vi73phSSZbCfNG3O7wxlbRTEpLsJIlxecJq6zzYku0mR2J/st2fKq6RrnCFu
         PBCvZORPUfOC1NEwrMbtKRP/14B4hkQ3NqRUIoTMzE7QUoxle1hytkf+Me35TwqHDazi
         rHByybN5/FHcYWU5qYZFPKH70/E/QsrVKwVL140kzeFsdc4NakIg14QLquPzpvOjd/iF
         1yU5BHn1D7sqwEbi5F/HLKN3xmUByCuk45MkxE/6sdq7HxtZqSy7KUpVoaPIWNP46Lqa
         IwBHl7ipZtnkz6NQ8rVmCo+qMlp89RjcwVMFh70PoHCFHnIGJwBYrk5kTSVZFVVIZVyu
         +08A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574908; x=1795179708; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
        b=JfYQXbF2ZLO/KJuSNTX0sYMqHnEZ9s6BxX56q6W3lVcDXbpIMdCWdeiN1/kEX2ppvQ
         sOqccJu3af4XBWxttmztnIDdP3TLkv662jYB2CbRYYMcR3o4SUkYJGfkOK6y6qpKs2vF
         cWuJLqQPvTTAYtc2jt+PuyyD4jTj5mnp22R/VkfHI5g0Bis6S6KYcYEYhXdXKr/EvDGz
         tAn9CP+Bm16u/EiXUuNJyI1zYDPnCdmX2zoyRreVW88Mbz5dT4wqosr6EOxtnBghqXHT
         BrnL6YlNkR/vpgRa+Q0lDIUFmk/dRM3MXAZIUVehA9IXILjepZRPQwCZR+yNdCJFn0tW
         xy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574908; x=1795179708;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
        b=HEvW/TRmB+1V8/hGDayJE/pZVUI7Bofup/spoVHCRPkDxHnMk330PDvp4g1ZBOF3xr
         gmXm7EQTBmAA26pEc++e+TS6R/VqOkKUKAkUWP3/vSnuqPZ6q658pDd7y+0ykhqVTmyj
         hThZFrHKhXGMRDr4HYrjSQdq7fpoESNbxiADoW45enzsfobfAkGiDQmeOL0FC8RlcR6W
         xHEMpWcOB6LKTRmpgH3dumof/nhImrpMVqceeSca2djlIUr9nOHun8cYHSzG0kV7aKRt
         acbjQEpqula0scrSYCrPGo6VJOd+jjP5kvoJGOj9RXA1dENyOk/IZ+P6xMdMgCPglKuZ
         uflA==
X-Forwarded-Encrypted: i=1; AL+hErGEcGlJtwgv2A4pHkTKg+Jy9ggTmQ2jx2QMcs7HAhl7d/eWM1nuNUGpVVi0JsIu4vRrlYkK2Q+2je/Zw21l0V0T@lists.infradead.org
X-Gm-Message-State: APuU4Z/oOGWn0dEC/6QC6HE3eLExvemNIO5Kf3ZYmhZk8bVKS1M+/7u4
	sq/q6J2Lx3U88zS7KWVx3tLyvy8Dgt9LGfOCDRmCT4F8zAcKE3D8NEMIuiKFBSwmxpFyQ4O/u26
	Jn69i8zW6UeI8sy9k6jouG8+dCSoYnfy8rxbIaj1vqQ==
X-Gm-Gg: AYBFou1uD5w6gGtYSik4GczwejDZ+kz7rbDEDzNGDY11VVpm2FRPGtdnDPxwwso1g47
	d21tNV4RWFTGT8pbhfWeJwxMB0mJsXqWi1iNq41Zx/a+Z5Dd7lksx0jorJdgpRZ53lMIj/Z3Pj5
	9jlMnhM2m6H6luLPLl2/fHXJdkkqvWXkxMYnqASxeRG1ZBf26TCfHQYFAEsdEWjdfoER4+/lOzA
	PsSFv5zbMhXKzWMHuF8LdoQkMxlsKC0BNYrExBPCmtxLAtcJMAVd++GiY+0zgvKwYPGp2SeVNe8
	21HeGF1wEZC2LYYqjqpbH3YoTGglbVoOiIBqJiTQCHdx9kNV72fR7pbUNUAzuVe02gXUMwqwQMg
	ZmFuSGAyfAPRRMROSneWdX+18NFKzueXGURqTNsCUyF3UYs/c0DsLwZpD61tdOEPMF97aIQ==
X-Received: by 2002:aa7:df02:0:b0:6b1:e4cb:a23e with SMTP id
 4fb4d7f45d1cf-6b7c0953c22mr1651047a12.14.1794574908159; Fri, 13 Nov 2026
 05:01:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CGME20261113104909epcas5p1d1b81b4e800e8a1d1cf830f21e52499a@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-15-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-15-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:01:35 +0000
X-Gm-Features: AclHuK9jDSyMiIFILSiBUttwKXmQ1n1NCQzZgnrbYNenJcyQXOWeJVgUA5tGPQ0
Message-ID: <CADrjBPrA1WZO_7bjV4jbOGB6MRZMG6=8UTTAtf-v_ZRq06MxpQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/14 RESEND] arm64: dts: exynos8855: add cmu_usb clock
 DT nodes
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_050150_224390_1E6358AA 
X-CRM114-Status: GOOD (  15.04  )
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

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add required dt node for cmu_usb block, while at this
> add sysreg_usb which contains bits for DRCG and MEMCLK
> which are used by clk driver
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index 3dd7a4c4c609..dcf1e58c6367 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -192,6 +192,27 @@ pinctrl_cmgp: pinctrl@12030000 {
>                         interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_usb: clock-controller@13000000 {
> +                       compatible = "samsung,exynos8855-cmu-usb";
> +                       reg = <0x13000000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_USB_NOC>,
> +                                <&cmu_top CLKCMU_DOUT_USB_USB20DRD>;
> +                       clock-names = "oscclk",
> +                                     "bus",
> +                                     "usb20drd";
> +                       samsung,sysreg = <&sysreg_usb>;
> +               };
> +
> +               sysreg_usb: syscon@13020000 {
> +                       compatible = "samsung,exynos8855-usb-sysreg",
> +                                     "syscon";
> +                       reg = <0x13020000 0x10000>;
> +                       clocks = <&cmu_usb CLK_GOUT_SYSREG_USB>;
> +               };
> +
>                 cmu_top: clock-controller@13900000 {
>                         compatible = "samsung,exynos8855-cmu-top";
>                         reg = <0x13900000 0x10000>;
> --
> 2.34.1
>

