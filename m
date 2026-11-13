Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E75606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G4Nh85bF;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ps2uoU0d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=; b=G4Nh85bFH1oaLz1QM8ay3U5YyC
	b8Rbgub8ZxRgapiJp5eMYzqtElTzkHlreF2sPcMB7Iv6UAxrJ6N6UmuUn1PPMhvbLpW89kkMzjmAb
	sSw5TaSCzaYTQc1quaZSDJJ+RronGR8BCaW2aT7IkmdJ/8rk57ihV2TydKWUxF4FR13uwgt6akOL+
	AwqJhDxblWU4E3QpaNEWVtPcCGlrwg/Y5BlazNa/FzAihKGLXYmP4rwpMymXhC9il9vuJHtwIfG8o
	ww95G1I1Nmj3FRcQD+rnN4qOB+MYPvI6UIokevv/7E2TtekyUoC4F5WIzE5/m5eLWhv7Nva/mU7eq
	Zqpgb2Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqtn-0000000CoQx-2Mxo;
	Fri, 13 Nov 2026 13:01:00 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqtk-0000000CoQP-034T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:00:57 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so1360764a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 05:00:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574854; cv=none;
        d=google.com; s=arc-20260327;
        b=KPTvO/aQje3f8LJAaYy1rk8I3wMmByDp5lOQqMo4SvRcf9oDR7I1lOawNV25WRgiUz
         1IDhDem/10oD4hc2ykXIPGdnkfJcEH9lbJhiaup0VUsdKLsW4TGoUUkgP2p1bwEFhyZW
         Gy8SaT/q7EN6Fnw+Sg99MPeO+Ri5jABJgQWIL6IofiPAB34Wkun8WljFkHWqO8EzbSKt
         Dpv5Eopk7PWyhRRQHi7QNnPgL5YHVDbmF8T7lDWedqoKGTfUy4SvIh8AOF1vDA0PRUme
         JoOsAUKAm1uNICUJG0/m2PSgho/BEGW72vrRGF0M9M9tM1XfOTWWppnx5QFA/NZpoq1H
         5fcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
        fh=vgaUHt7Jllyrb539YjKCrDiOlT3jEfWF54vKWpgU6bk=;
        b=s4AdcfDhaLS6VKie15Q+hOa35f+eq0u3HgEuLv07lRevVp6eeUIyDR6IrLshhDwEOM
         vZwx5M4jhqgoFoZzoEwqM5zKfqybD1k/GE4D75W2GdVw8GgDosMYcU90fPdoxFBbzNaj
         33wj0JTGuBHmE3xCZTFagR46IYDqqMaRheQhMj/7spS/iI2gIcI95d8tmEgD1jagIT7I
         Zm+NyvPy0qC7vhm47n5pJICxdhNQ3RqPClVBvrEOqlh2MnAOYd1L3N48WNB0QVlBbbd9
         544P1GrNhW0CRPC6sf6XwUzLGhEJD5WUd/lma897Xc8i/gSbWxZJoKUEK5jyxmflW6cT
         0OEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574854; x=1795179654; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
        b=Ps2uoU0d9btZEmrRhbjKYNUlrhSkzXj0kRUKKDJMfUSR2BKuMEJ55+ZTOgMjSJNf45
         GmvGYMR/H3Ckdg3FUTkinrwN9GyEgMvMLUZCWObfgjyYUbZZAMRUu9LFLdFzJIamyxMK
         g2q0avlnlTv3VHdnldim7uFDH8YEN7epSfTh1VllPO/xFQOZgnxoO+DaUHhilxcxx/7X
         Wt8QqnvgJwWpytIWDU1IvldtXIlogp2ImDIP5yDOIwYDqRxvYNNWcsccraEEQYep39VV
         jVzPtoSXMvYOFZ9AKgp14TbRmOp++XWptfrJlIYjWnJ74Vy+IgcJ3/mX0KabqD/jIP95
         IKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574854; x=1795179654;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
        b=Vyxn/zC05PK3zwsg8BgjRJCVr1IGqOUAk8vhXX1eX3MNNPt9ZMbzuMWmkfrpvB4zds
         t48AdMUXX/TdsweISzNgK3dn/BmfKhC2E7w8ZY2TK8RtRTGmh0A5y1U91Y7mCDPSGeqZ
         ilnhdY4Y0Iy6vT6TqvTZ963QTwD4KDW5TnhbrAjGMwiWcDlOVgHqcTQlSSS2/YkLWXak
         zRnOvzsrnQXUJpgVPjP0Mt6sQ7WVan7H3taXUEseFtZablmAMlaDrc2u+5L+5ZjOJZvQ
         fRTUs2IX7x6DfYWZUr1LIrl1S0N/DlX4BrdfnO6V6zmK/7DrUlQ+GiM+k1ChVDccpnvm
         6fyg==
X-Forwarded-Encrypted: i=1; AL+hErFUHAIqsOaK+MrOop5Ks0H9Cf8fkSXQ5RyCNKkEUSYLDbkionGC+Wv+NNxKi9oNByeCXZsAFdizHkO5e7sOhCEN@lists.infradead.org
X-Gm-Message-State: APuU4Z+YK4edCQO/sQlV/TCt3XOQwnkCDSkH69yYMsgE+Lve5tnsRk07
	gGT25HYx/ikhdKXZlx+8NBIjE5hH10iCt93GWvYJpXuZRHD2LhT6kfEf3m8PAAe3uW4K1toDP4C
	DTLvBDDdYZYeY+9MqFqBNFUyw4nhxkesML2jY6mFYCA==
X-Gm-Gg: AYBFou3RNW1AScFVrwmrHmbRmeXjDQLeAUDNLagjNtg5koh/zqEoP6bSqeN7HA5nD18
	M2YJlupBy8AsxgSJbKY0FGhEntoQZfkz64AC6FshwsO1i4nTjM4BK5nN5e2WW/WRb/mpJlEu+aM
	mTZmYVjhhgWtyU2GeMj8gfnq+GSBcQbRd1vi20s+UU9SOz2aQlHe8Yg1RpwrBM8KRFBZkls//p4
	uZSPCGwixtkJrEppLB0YhaJm8e95xgcaAIP1IawNzgt5gPscl39KU/FMbkSVJ0bZ/4JhADs0nMb
	k/wwdQnRBl9pAJI/xYiQ5kOWaanDkQfA5cihw+E+WQgLtJcRCZKqJxQ7PFBCM1ghjCHNsq8yJa1
	HIEDqHgIL3X07Glzrd5pVJTTtCHq7g2DJCAo89XyQRuqa/5ks1p++bHxZmWe60dMlynf53nOUcz
	odeI/+ffxceqjnceE=
X-Received: by 2002:aa7:d1d0:0:b0:6b6:face:56ff with SMTP id
 4fb4d7f45d1cf-6b7c0c1cecdmr1756365a12.33.1794574853723; Fri, 13 Nov 2026
 05:00:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CGME20261113104904epcas5p1546fd543fad42a61f1a70d4fd55ac833@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-13-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-13-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:00:42 +0000
X-Gm-Features: AclHuK-Gujxl0bdCqN1FIJbWWs5SjHt2ToZTIgj-Ln1Yz-sYA3apmJelY48JkxE
Message-ID: <CADrjBPoSV8uOqX2tkVyEdiZi7NEOJAb8JsxkvMqUn9+wF5Jc8w@mail.gmail.com>
Subject: Re: [PATCH v3 12/14 RESEND] arm64: dts: exynos8855: add cmu_peris
 clock DT nodes
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
X-CRM114-CacheID: sfid-20261113_050056_597984_040AC814 
X-CRM114-Status: GOOD (  14.03  )
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
> Add required dt node for cmu_peris block. Also add sysreg_peris node.
> sysreg_peris contains DRCG SFRs bits which are used in clock driver.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index 2e5dc79d66bc..b461de6a7548 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -146,6 +146,27 @@ soc: soc@0 {
>                 #size-cells = <1>;
>                 ranges = <0x0 0x0 0x0 0x20000000>;
>
> +               sysreg_peris: syscon@10020000 {
> +                       compatible = "samsung,exynos8855-peris-sysreg",
> +                                     "syscon";
> +                       reg = <0x10020000 0x10000>;
> +                       clocks = <&cmu_peris CLK_GOUT_SYSREG_PERIS>;
> +               };
> +
> +               cmu_peris: clock-controller@10030000 {
> +                       compatible = "samsung,exynos8855-cmu-peris";
> +                       reg = <0x10030000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_PERIS_GIC>,
> +                                <&cmu_top CLKCMU_DOUT_PERIS_NOC>;
> +                       clock-names = "oscclk",
> +                                     "gic",
> +                                     "bus";
> +                       samsung,sysreg = <&sysreg_peris>;
> +               };
> +
>                 gic: interrupt-controller@10200000 {
>                         compatible = "arm,gic-v3";
>                         #interrupt-cells = <3>;
> --
> 2.34.1
>

