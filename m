Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495BB606B241
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A08/3Z6M;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C+FiC6SN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=; b=A08/3Z6MObeymKGxwMpPZu9HwB
	LSh7AZqYM7iyTNt1GGZbE21LtSxyOM7QXFzuuDtqGgat4g53Q/iE50QHIYJdsTYoAm9d0SLz/I2IH
	q7nUDy0E1ok7nczhUxyF2I0YjvB+moUJDp1CRxDNVwks6vGDiwPU/4VNyg0lswLmpgeUsLQCujySv
	incVEO4ivT8C5QRyA/Xpn65JJI2ucanZNqpw08oA6+5hSXD/oM9D8hx7z0GAaNO/GE/yKsMCeBhN5
	5nZrGBoVDdnWkDJR9DBalq+pFT/njvn0BVD8WDAOh0ayENj4L7da1h7veb/qHv8XqxJRbvvT4a1tl
	3+sGR9Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoyf-0000000CR2v-2cqy;
	Fri, 13 Nov 2026 10:57:55 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoyc-0000000CR1S-2H9H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:57:51 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so1482432a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:57:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567468; cv=none;
        d=google.com; s=arc-20260327;
        b=FbFBpskplilTq/LwsWYy5qp2B1mnOTRI9Gmsjf2VaDDblnZTYWmSmCOLA/vOUhNjoY
         E8l0WlUiPf8e52ZwJV9E/Gub10TOHXDdXP752x3GpLamGbilMxg5xAf+1Z/MgP76qlEF
         ik7iE02QrxntaF8W4N2s5bFRnfKwwv2DfPDU2rHTy0nhV1+/X1jxOrSZSBFNGKCmWFtQ
         FCKPq4bk9JgHZhdW09yyTLyw21sBzK/ri3wQ09rwltdTL8pvVQ5DF3nJGp4jOVG7Hu9n
         nh3RoBmz0sa2YlSXhIOYrqHVkhnDPH95cCzCAQW71sxEWSXGBhQjtuGOmVTGtVvKK2OA
         8xHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
        fh=uqbvZJ7bU2ifog+Z5KhtGK6KoloFsn33UbqPies/nDk=;
        b=p39ELE0a4YtP6OLcQ9YVAwxYizbwSOuBjjVyqvyfy5WHdS099vB5nBXOApYzm09HE/
         Ck5Hgvo7q2QThCsczTwRSxuMVO5+0On6K6IgBy1xhVZXBtkQ4BedILDhIHEklJmlEB9o
         EJbMJGFf6DyhYnMws+BMjYyLPTHBmVQ9uL6Y2WfVs5ymoZDEHPTwbWOeku1cwwcjz4RA
         nS1pMaMg4YOB964m2O0hbNP7vCDtT/rWnhPaiidD14dj15NUu2dmesUtwa83PjsASJ8t
         SnGusy2mlBxpRM2pKMa8BpE7pA3YHqWVjfnWf5EaOClXcFAWpNryI3ow9kEaG8Id2MfS
         nS6w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794567468; x=1795172268; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
        b=C+FiC6SN7hj4PRXE55lGmFPkF9JTXpznGx/JIxJ2aI5OtiSc0AMabW6rPR4RVgjM6K
         FAFRJSYf34tSpAdAvqeUtOGHqjfvQNEJULio5ahM68UrBF4KgQoX7TKVtluJ9oIbVhrI
         HMW89EIotv9qS0PNmpgtCt2NsNbKpu9hQ4TTRjaqdbdq3oLAwf/C+RgD4zYPgV+57EIQ
         R14exOS+bhCCCfRg9fOMbjizuNTzDbu0Z/Jx3ZgSXuusx8zm6isHvSaGEgoexhI6jCcI
         PC38ec8umJIeUtuErCs93swl4wQa/yhTduAkPri9xBKMGB9LnzITDfMoALprK707LiY+
         zNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567468; x=1795172268;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
        b=uRFYW3lg1fRugmb8rbmkHqXFLoIXLJEuLke6YJc/LYovQdflZhRofW8AzMfR56E7el
         XxpHJgGTjjL/c3zSxrk86TKc649DUS30yWPlyQthRdPtG1nb/VFzVAK66S9OA4K1QZ+e
         cc3gk0bcgAHEi5/5qgIFTrqAiSVBpsAUZEsnTLdBdm1Y0QHYaStMR5vdNZXd6/nH7b8k
         hud6l/B6rwk9DWmcNrb/CRpAp3rKHvDrzlnaVWoSH9V+4GAJw1Pw37Lf2gOH2IW0sSDC
         hxQwF56T8ne1rSQ1fyrvRKLt0No+HbUsBEuy8wLyYfdflOod2GGTA2atG6e50bEDpVe3
         EQ7Q==
X-Forwarded-Encrypted: i=1; AL+hErFzw/jFNx0Df0qEtOw/HKUANg5MEUHDKTXeMcoRWBLjG+vjoaoSsE1iZaNBvRSSi7prfnZQuMPjb1UGf6AxCvo2@lists.infradead.org
X-Gm-Message-State: APuU4Z90cg7Bv9bRRsi8z8OHDwW4hqlo3qtM7zFbO3hnYilYFyMbInzm
	RRVQzvaSLiYj7GOZwoTP1Wzee3PLzduV9w2KLK82jruDOuPWyI5n3OKCQGKy/qZe+IbKRvQXDnv
	2NNyG3Hn8HeZ8zHMfH8DlFtE787Jy3tvMbH/tz7g7lQ==
X-Gm-Gg: AYBFou0Cc4HBtVTjPCNgqXMsusBTNeOiTSgx4wTcL/n5Fpd4RYeh2Ipm4enOaGiU9Z2
	jag/sAirkpvRlX+HbBgmDtRkFYCGBtHewV5t7mG0LMHS2ukfq9x76je4+HPoP0J/QaqRjSQPC+k
	6Cq9iM97H6CW/tVcKPsJEFeUVeLe7AveRFtCiD1jx/eoGZP3Kzrj0nlope4cIfTqAqQYF2w6i07
	ZNSjEdDaXNVCZ91TacvSauLq4Eoi3lYOcpiUxTNX/ktE/9eCpcCtgGI/3UV/tGx4Y7jUkcQBGJc
	Kc8Mf0yJxjfjn6iV4yfR1MB0tOsSuRjjCTdu/99lgGkhl0jBzgvZ0iXetVcHuAuq8bAPbMPD8SV
	lnan4HYOAdEXExU7jQMZ0Q/15Ak5qNgePzy5gZCd90dkzr+7Ocpd5mCsqkwcNz4AR/4PVYetskC
	Eo4uWmxjGtJ5EOaZc=
X-Received: by 2002:a05:6402:1ecf:b0:6b7:bffa:6f24 with SMTP id
 4fb4d7f45d1cf-6b7c05c0611mr1899644a12.0.1794567468098; Fri, 13 Nov 2026
 02:57:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CGME20261113104832epcas5p4e1e9a3dedeb0c9c60cb80c23eb5d930d@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-2-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-2-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 10:57:36 +0000
X-Gm-Features: AclHuK8LZ5o_QWvk6RKRY0YNYG96oQjtDx2eCj61VNIttrc76E2ZwU1wIUFE6TM
Message-ID: <CADrjBPrwZ+dH3==Z46PwEVtYR4xWdzS2T0ZFHHWR4+g=a87cTg@mail.gmail.com>
Subject: Re: [PATCH v3 01/14 RESEND] dt-bindings: soc: samsung: Exynos8855
 SYSREG compatibles
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
X-CRM114-CacheID: sfid-20261113_025750_613103_A58DA55C 
X-CRM114-Status: GOOD (  12.51  )
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

On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> From: Alim Akhtar <alim.akhtar@samsung.com>
>
> Add exynos8855 sysreg compatibles in bindings
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> index fcdb9ffd2644..845e0caba15a 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> @@ -31,6 +31,10 @@ properties:
>                - samsung,exynos5-sysreg
>                - samsung,exynos7870-cam0-sysreg
>                - samsung,exynos7870-disp-sysreg
> +              - samsung,exynos8855-hsi-sysreg
> +              - samsung,exynos8855-peric-sysreg
> +              - samsung,exynos8855-peris-sysreg
> +              - samsung,exynos8855-usb-sysreg
>                - samsung,exynos8895-fsys0-sysreg
>                - samsung,exynos8895-fsys1-sysreg
>                - samsung,exynos8895-peric0-sysreg
> @@ -103,6 +107,10 @@ allOf:
>                - samsung,exynos850-cmgp-sysreg
>                - samsung,exynos850-peri-sysreg
>                - samsung,exynos850-sysreg
> +              - samsung,exynos8855-hsi-sysreg
> +              - samsung,exynos8855-peric-sysreg
> +              - samsung,exynos8855-peris-sysreg
> +              - samsung,exynos8855-usb-sysreg
>                - samsung,exynos8895-fsys0-sysreg
>                - samsung,exynos8895-fsys1-sysreg
>                - samsung,exynos8895-peric0-sysreg
> --
> 2.34.1
>

