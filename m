Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3273606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5FC9nKyd;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ux2gncfF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=; b=5FC9nKydE0F34qinGhf1bIfhsv
	5vC0GMFW3qXnzCt9jQ/I2xOTnPVxwm3kX+4EOFAXGQRGejUFQZwiJQyHK1h9seRrupDpwTl6hVxh8
	Rw0947mj8EcNibj4R1A5CIOG6FvjOf04ZKMdsvK/ndd0PhiGIYr7tpAKmcaQ2NX/sMIrpu6Uo7NHs
	HF8cm8WWAqDTRyHV8Jwa+fBc7PEFzfkC+Wx+MY3C9H/pGz1Ojs1RNOpYS9awoNzP5Fqkf85idHV3j
	i3D/5jd+H18uzoiNnbmEn4moM6jHefDIZG3zaffXfGSc+q1+2BpM7chylHLMbxRdwJTse9hmzShAb
	h0E4x0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqsp-0000000CoGY-0yP5;
	Fri, 13 Nov 2026 12:59:59 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqsk-0000000CoG6-2ftS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:59:57 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6b58cb69927so1867011a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:59:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574792; cv=none;
        d=google.com; s=arc-20260327;
        b=NIR4NcAhwZfHaVFhcZbO6IyWLPoY120nSzzpCueuSZ+Mv8y7Q41mYH5quYG1Uk0xoC
         4fzjDnVvpOGAAQy/OEYI26ag82s6W36Pj+bERViBCLst1GUQJuf/whI+4q17NTbNkAIC
         8o5jcnI5qKZk/VdhzMvoPBfGBD2bg4fl4lgo/y+dNKPDYZ3nc3eSChXVc1pLVNkeCUFM
         dlSZXPMO0dDK/jxvpTzJPJIcubgN99bYnX9rU0kFCvTuMzYMdnWw7zL51a5XqmnBxdLx
         59apSVGp1R+pfoKXGYkHjNNiB3e15L7+zB3L5nbA/DxSBv2DjHsgYdUscBiV7mntb8iz
         Mnow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
        fh=aqnHS9ICfeo7hAXGCtlUlEcQ4htamJ0fso7jbAsbvMo=;
        b=ToaapLi3C9P1Am0iQFQFwD3w2fzsUqGQvRgNSoIHg/sewFQ14S+a8T9ypdPzEZhzGk
         bFq1u9L6DCg0ZodGx/PowtJt8xPTqBULzFCj3sUWBQbxCx1V0UAWxW9JpJOUzNPcJS01
         N71Fn9eySc89XcAr41bBKzQSPkxxvv2rm+pbYzQR4aMz5btTdWbRlmyoN7Maccgk+aYO
         cSHvN1zbOg0LpDd0OAhgDo658QluK+nzwlKrDeDinynDy4Cytc4JPveo7SZCepi/U6Ou
         9zdFjHNNX2SCKNKQLfq882H/1vAkqFDP6Bf0o326MukbiPhSqeDGoVAvDJGJbo31jS0M
         H9kg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574792; x=1795179592; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
        b=ux2gncfFlKih8Qh8OBz9HTZGPqDtbD5Wknh/tIl/U7mrbb/DOdW/On6BrOGWyDfjb2
         EGdH4XIG3lX+bvZ7a6tei3KqB0yvmKMz2iq2i/qwRpNE/k5qOXCRr99zm0XCTMqcecLa
         K0LY6RhJ5OE+KphRdFPDNiN5zVUWrqgLAUStIb2fpiK5c+lr/84Mjn7fjBGHUW/CW2wM
         Htyy5AIm1msdmPvSuc4Um3qOEB6iIPXhzmLh/Jeifx1EJ+PGAlG+V55umCvnkw0Kx/OS
         QVrLvTWbTM4U0VVZfdnw4jH0vX+1Hw3QqTuBX3AyAZxXjVsDHe59Sd1ZStarpQ5eoNK2
         Po5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574792; x=1795179592;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
        b=08WL/PkLYiGbUpN7H7hUeFpB5NutQvuBaeeeXAAJmMHbjlfgcj7VErLs8b1TGB/6iV
         kODJgqTzhTKsjj9ITgChIwodRVgtSnefx107LHdYhTyz5NxDXeMpQULjPS2Ka5Wh2/Mx
         XNO6bc5jDFqE1er4crDzMDmf0xSssGocWcOeDsCk/sKyEN3aBF/sQls74ouEcQOFleDj
         a/d8YsRjxOaMJBHiS1pA+EwvNS0nv9PHjyCIxPpBP2LUL/msDNFt0WAb2x5IDmjfjcMG
         4+fQS8hiE+uEEGm6uStNNB6dAZC4by5rHT28NEv7i2/hjXOIyfmyB+EOAnqKcVLXWO7D
         q1dQ==
X-Forwarded-Encrypted: i=1; AL+hErFcqdIZTxHBxfzyH/ZmiVWZqmMxGrjE0PBDqySC14nvQD5xjLnK4nBgtE2w6yO2dc31NHmvxXMTpqLXuQX7TYVs@lists.infradead.org
X-Gm-Message-State: APuU4Z+HBgM/x1JWON5f1nRGUoxkv2sDJFCAJMLu1Sndu3r6dB52sidW
	5fzzmZpycHLgaalmPvXPqcauZtej78LbthEOyWHAvIYHqZS6wsjhTu15zJSZ04zkxYwhGsiFKiI
	ht2VQxiaDFmXPjbqhWFujpp5OHswIqKl6LyHuPCjJxg==
X-Gm-Gg: AYBFou2pk1m2L0CHW2v4nNI1joKBoe0CGX2kpTOnJLAoYcLvquFxEhtj5Pa7fzmyY2j
	NzfU/khcVAv2mA7EnRyJSBeYTOnfsjSYjlYjuZsysLDja/941404r+oPGBxfKrwvbK+LPTaEvaz
	6J/AAUXcIuH6Geo1WrW9wubW0/vOiVYrjEP18pZgjjnNs2au6gc9QmMTQ72icEQczvGhCb7j7b0
	Za8nySLXwlrodR00TG4CQ8ud4m4bIrFWpcioqvBegfobTGnYCeN5AkPY/mX++MUiqB5z9uvlOkv
	ef2pUob3gmYd7Yp7NIWcAR5lFHsAGnkESS1D0RfAGasIelEF2vIB3GrcW6j0QbuLJ+aXff62H2g
	7PuF2loFmi8XAER2W1kag2JjyQazy7+bGxRMoGr1KKoAjKoU35JAb+TvEdm23ZwdRFyJMF6WlDl
	EW6r+KLH+5f4a5+oQ=
X-Received: by 2002:a17:907:3f9e:b0:c46:ca2b:84ab with SMTP id
 a640c23a62f3a-c507bca4549mr587358566b.13.1794574792499; Fri, 13 Nov 2026
 04:59:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CGME20261113104901epcas5p26c1b8e9a324f133216b7980ac7ded44a@epcas5p2.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-12-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-12-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:59:40 +0000
X-Gm-Features: AclHuK9cm82mhKCf1OM8U8MOAQmGsMU4pcM69WzWfUaEMzCzm0cQud7ofsYoc9E
Message-ID: <CADrjBPpf_-pnzQRYrpqpzWUewgF_U5EbOA1CJprnH1XzQoDuLg@mail.gmail.com>
Subject: Re: [PATCH v3 11/14 RESEND] arm64: dts: exynos8855: add cmu_top &
 cmu_peric clock DT nodes
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
X-CRM114-CacheID: sfid-20261113_045954_728116_1451FA25 
X-CRM114-Status: GOOD (  14.84  )
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
> Add required dt node for cmu_top & cmu_peric block.
> This also add sysreg_peric node. sysreg_peric contains
> DRCG and MEMCLK SFRs bits which are used in clock driver.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index 0333b80eba84..2e5dc79d66bc 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -10,6 +10,7 @@
>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/samsung,exynos8855.h>
>
>  / {
>         compatible = "samsung,exynos8855";
> @@ -170,12 +171,43 @@ pinctrl_cmgp: pinctrl@12030000 {
>                         interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_top: clock-controller@13900000 {
> +                       compatible = "samsung,exynos8855-cmu-top";
> +                       reg = <0x13900000 0x10000>;
> +                       #clock-cells = <1>;
> +                       clocks = <&oscclk>;
> +                       clock-names = "oscclk";
> +               };
> +
>                 pinctrl_usi: pinctrl@15030000 {
>                         compatible = "samsung,exynos8855-pinctrl";
>                         reg = <0x15030000 0x1000>;
>                         interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_peric: clock-controller@15400000 {
> +                       compatible = "samsung,exynos8855-cmu-peric";
> +                       reg = <0x15400000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_PERIC_NOC>,
> +                                <&cmu_top CLKCMU_DOUT_PERIC_MMC_CARD>,
> +                                <&cmu_top CLKCMU_DOUT_PERIC_IP>;
> +                       clock-names = "oscclk",
> +                                     "bus",
> +                                     "mmc_card",
> +                                     "ip";
> +                       samsung,sysreg = <&sysreg_peric>;
> +               };
> +
> +               sysreg_peric: syscon@15420000 {
> +                       compatible = "samsung,exynos8855-peric-sysreg",
> +                                     "syscon";
> +                       reg = <0x15420000 0x10000>;
> +                       clocks = <&cmu_peric CLK_GOUT_SYSREG_PERIC>;
> +               };
> +
>                 pinctrl_peric: pinctrl@15440000 {
>                         compatible = "samsung,exynos8855-pinctrl";
>                         reg = <0x15440000 0x1000>;
> --
> 2.34.1
>

