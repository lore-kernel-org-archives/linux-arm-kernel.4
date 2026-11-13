Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E441606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NmuantXW;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Be1Tda2F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=; b=NmuantXW+h36sqH51YgrMKCZ0F
	7R3UfakEDOWk3WwKdMUzHVCoCqgl/OZtPKI36U6iYEIRtFRCuVHkZsXE0lzn/XxnvONVgvKsKS5S/
	+K7utdaaX0tIUmSKw28jShHIm24RN3EhldphUNhcQWTnpIcjPUNsjcIsbNNO5uV/V9BKQj97tF6kF
	ARTxHNSqpV/D9A0sqd6csHN1ycgNVt6B96pUUjyMuqY8YFqFX33tKfewiGX1RjfPtBthPH+zuzOUt
	BA5HS+ucXKiL28yVN7fNLuIManpZ/pEhz+ROv2iMk5M2K4J8BaFlkr3g9fK8sOyUoCOQociv2JM/R
	dXDGmlCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRquF-0000000CoVe-39VJ;
	Fri, 13 Nov 2026 13:01:27 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRquB-0000000CoUP-0bUm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:01:27 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so2392161a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 05:01:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574881; cv=none;
        d=google.com; s=arc-20260327;
        b=WTdxLDki2xKt8hgjq+uzu4Rx+Ku+Skfn4+8paSS7SyqPK43EsuBjldJq+zFlIX2pTp
         p3EWsXwKL/rRAE4WGbQOwBvXUjQIbHPLZJKooxnOF6tPOkM2fHDx+BlIzjrKLyDjJG8j
         etrociDu4bKuPJUkLSN8PqRM5ahEsFOmsxNPRsZj3oEO8XGCrKxwDZrvsLnkxnHV8vQG
         T3fD8fGfJ1+cjQS446fR43PauVCnLK01y1zleOAhhCRIyvLzhyTforZghXtDHVT2yQQ8
         EC0zUUOeMcW57A56NhnHlKqZJeIESNZdq1kt1dzLV+CjmlZbM+VCr8+VCPnAQZJOLsLS
         6IHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
        fh=wyLIXBHzDL40iO7FvNb3wzNxHVaXPBXQ97KOaC+eB8o=;
        b=rAX/Sccfn84yH5w/jbUcURng2qYUZAVR/JV/ZofTvwU5Ro6MRyJXweiHtRn4wKqMjC
         8FYQEj7T9YcQtJnrcffbZaFSCHdbMHT5YJu5iZr1iAZjqSOUoLgSXADcxCIeMxMu6ZGZ
         N+ljFbHJ+9ZUbF04zgtcSN0RIoHVmXWTQYQwsnOEK6on1Y0Rycp7uxwB9w6fEA/DH5hS
         GrEq/G9WEgVojHLPlXVtocMbGRyw+x82Snk94pEkwTCOiLb4+p/7yMmYS0VrmIl07Boi
         QBf9LwrAEmDvN8vxX59BMzA+iT1qWxTrS9+CsDvvZoCWgf0EMaXVFbrdpQydKU82LQQU
         lXjw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574881; x=1795179681; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
        b=Be1Tda2FLe4csg1wGmxSbPJONL+m6VFGlyoxdaLJZ9h5nsMGZiWDn0S2b+AwUB0U4v
         UfNX0Js4W+d5DBUvMKaEG1t7KVDd7kwWEdYcAAhJgVn7HpQ1RrvXa8NhQyvx3d4kogrY
         oIJSmCDQjr4U2T3jLSgYGb0JkDTpkDawEO/wg3TUJOWKav3LUvvys5iv8ax2H/7aIlQM
         VVZSEbeFHDyp/5tYhMsXz4WXyRXwFMOHQb3bzkMROgB+e2tF86Gtr49K8naafk1xTb4c
         WHDpMO6pNcZOHuPZMaTQ803AhkkZ0fZdhmsomcXEDsNxBg1kaxhTByppyBncIPU4Bd2u
         nsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574881; x=1795179681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
        b=W+1STnIDtPBcH9ksNCrwNsA1cPn37KaqcqPcVI+TXgVgz/9j8pRcaSwHLQLFa/Dyny
         kiiFWMxDpyBXa4Re86ekKYbomrCiuU3KJsfTtkrChP9GqgblT56p7wEPF2T55kbYGGdn
         jnrWqGAHbMngIO6vthx8hOKvkU/1nPKQEYHqwJH7RTjylZNIIq7l5D/x1WT1z/dtuzil
         Cps886G5Y5lsnZMozwR43N88LzCzZfSGO9KhbYUlV+ibNlBNmr/WdwPKuADxSg2G8lcc
         8a2PWcmU7JCKUGTuz05j8mewU+xqpUeBzdFPBFXYoJTJTIGJaIRP8oAbTU4y3EcJkzcM
         FUPg==
X-Forwarded-Encrypted: i=1; AL+hErGDU37a5iNKBrb10ktWmrU6zd7YyjiBNim4lSZHkofiB4TWJJZcH1Nt83GJD9eBPu1ElyMTYfX+K1rEPxOhByxZ@lists.infradead.org
X-Gm-Message-State: APuU4Z+tSCgzhCnCLRyQZXI3li41L3gu1I5yGRcy6oGGBHQE8b7ELWop
	epJyS8pHoj0M2rqoUyYAtK3s66WmSIpgN+6/+uGO66leoUi+NTWu10txNQNd77UyH+wOgwpZIQb
	VD0gnkpskoH1rBBx7Wuly80Ix5FL7SCKsE1isO0SQkw==
X-Gm-Gg: AYBFou1n1qj81Rtn5rEW6dBo1KCSVXOTgnzN38E19dGLs8opGQOM67ui+BD1/6FVhy0
	F+ymcdBDSeS1qLJlz5hGyEK2hBjm8mCiyPtrQ5hOJ0oo0HdDvn21GiuccenOHe2mYnwyh5z+7dd
	/wAKgSv8ZY0w/fHC9ccczuI/n6ZXbz7EpdPJiYLTsK6EhENuXKZPVx/F+BJVrUUGDGhueP7epuJ
	keyyLx7iOiImxXY5iAd2EXDHX+Hau78L/HNDrkNETdlHqRkERstQOu/XH7TElRJXQvBkoi+GBzA
	xXwWNBNqLhcZ4dMRqKfqjU7v9JCnPwIMui23+cSqduZidApT5B++bsMHXk8U9WjJi25eMZu2Ieh
	Ql2rBwQ7TpFArrBE3NXYzWtGxh7fNZc5FYalnPGeku2Q+Z+S57OPITOrzm2HJ5dDmkq0C8Q==
X-Received: by 2002:a05:6402:4413:b0:6b5:9150:edf3 with SMTP id
 4fb4d7f45d1cf-6b7c0d144a7mr2186142a12.43.1794574880970; Fri, 13 Nov 2026
 05:01:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CGME20261113104906epcas5p462308ef9eec80f8b7a5f81b64e72b24d@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-14-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-14-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:01:09 +0000
X-Gm-Features: AclHuK-DofCQ80IZzIK-whDWDx-7N4O3mu6ydJD4FcVZrdGUzptZd5Yy1pZ4bbc
Message-ID: <CADrjBPqormg=jcKYZh5q61MiwZaRB-ZqtV+R2CFNP7o6Jd-SKQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/14 RESEND] arm64: dts: exynos8855: add cmu_hsi clock
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
X-CRM114-CacheID: sfid-20261113_050123_218869_ED69444A 
X-CRM114-Status: GOOD (  15.30  )
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
> Add required dt node for cmu_hsi block, while at it add
> sysreg_hsi node which contians bits for DRCG and MEMCLK
> which are used by clock driver
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index b461de6a7548..3dd7a4c4c609 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -241,6 +241,27 @@ pinctrl_pericmmc: pinctrl@154f0000 {
>                         interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_hsi: clock-controller@17000000 {
> +                       compatible = "samsung,exynos8855-cmu-hsi";
> +                       reg = <0x17000000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_HSI_NOC>,
> +                                <&cmu_top CLKCMU_DOUT_HSI_UFS_EMBD>;
> +                       clock-names = "oscclk",
> +                                     "bus",
> +                                     "ufs_embd";
> +                       samsung,sysreg = <&sysreg_hsi>;
> +               };
> +
> +               sysreg_hsi: syscon@17020000 {
> +                       compatible = "samsung,exynos8855-hsi-sysreg",
> +                                     "syscon";
> +                       reg = <0x17020000 0x10000>;
> +                       clocks = <&cmu_hsi CLK_GOUT_SYSREG_HSI>;
> +               };
> +
>                 pinctrl_hsi_ufs: pinctrl@17040000 {
>                         compatible = "samsung,exynos8855-pinctrl";
>                         reg = <0x17040000 0x1000>;
> --
> 2.34.1
>

