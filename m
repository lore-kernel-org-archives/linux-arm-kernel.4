Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C64606A8B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 01:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CXJFyJyo;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CsO7ySAe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mRnwY06Mr4WaxMQBOxox7fUWk47wPCvPr48cEnpqDt4=; b=CXJFyJyoY9MnPsLXbtMIVeLJni
	igP7OxY5h4Pwdl9sl5fzvjs8bEBC84LdACAMmkUgxbggwKJBG8WYWcfGZpwMQSNrrP0YzQ/aGReDe
	O1jF6kbtfxt7t2aBMp6x2igDlZh2l/YPXM4L5e847GJMmRMA8yvSiQ/sAMSqdVZwdFixvSIYIEIvE
	wxQWLuOpC2sB3JXZBSR/kvUHd31St/JR+0wA80fMG1yiyqL2v3pImC3MPlTgy9Lmf//lbVkCYSa3o
	jOLk9wsIWqqC9IlJQ1VhQcF8kjsnmB8UPxq2XN3frdVBhrlsbofId2LaLSOBJOCa2n9uGL/99JS7X
	MwHmGWSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS2Kt-0000000F01x-0p6Z;
	Sat, 14 Nov 2026 01:13:43 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS2Kq-0000000F00x-2rNf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 01:13:41 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3adfb0c9e3cso2981891fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 17:13:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794618818; cv=none;
        d=google.com; s=arc-20260327;
        b=HWbMDl4NgU6e1zvTaUugLMpqBLN1C2kHf8A6qf8cyQVz6GA+67pY+qSKirJyq04Ydh
         07fD1QmjcJT3QN2i99DcsIlgDOLE7DiCaMznKdGbOX/D+yqeelhAHVC87HtUk424/l6d
         M7FPVBowf3jXr+XZ7TJccAu7PoJoxusuuzH0Tps1/isBmYsOhUwbM6R2nnAKfDMUCMeU
         oow2g0BaqrBVUdXBqf3ySmP0eUVOAaBOV6uhRw5E6UWyJDolFxX5chwXBLqW5axLBf9r
         9o9IkRefWAP1ErMrRsuVwAkve+oRHOSvqYlDNZbIK8DwagKvkI+2GPrG6k6/8d/qU7fW
         1T0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mRnwY06Mr4WaxMQBOxox7fUWk47wPCvPr48cEnpqDt4=;
        fh=xR3pH/oN39CT5+VFfBL+J7ABwuLiB1eF+ENbvUHYS3s=;
        b=PL4L2HCuqLexVoBXkJRZSm+MB5aKMSRjGkRHCDrgoSDLu2iDNZEt8oRPA/4DijxMFd
         cbzgHj/i9AAmNglf9reOWnWj4HFBafH0aip3zJseohX74ZclF1qzPBhlaJlc2ZuNRVZX
         eJABm42hE+tABJlU6zcqAiokLxS1QgvnKBhsJq+TFbAMGyIwelh/N/zhISEh+BDCdei9
         mNLlytn1zbRcwlzAgl88D3gVLBXasYbwEiJXl219DfohVD4FDP2IsUDiolrTftIs5YcO
         VVxC0zkgK93Erp2ewjPayxJVI4gCIRYWjZjkNY+6jGBEA7oHkNIRoSCoCKoiHwIUF89P
         hiew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794618818; x=1795223618; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRnwY06Mr4WaxMQBOxox7fUWk47wPCvPr48cEnpqDt4=;
        b=CsO7ySAehH8iFN/qSlcog7ZPIlfmw50fL5Vyn0KOuulWiFZCp0iaHUAgze0Zof8D7O
         3leISC9qR/Ie2bwXoql7i7KhwmAgMhtLXW8Nq6HaTc6mkU2nvWD3rGi6ApWO3fOU/GfN
         mSokCQUqQSAxGFUbBkCdN0TFN0FIALvX1jIWaN/3uq18cLuTcrvm3d2bqzTndw3n4fyR
         cYOvYuGkCzlk2/tduuzaxT/OHeYex5eJTO9zpXR8SW4aYgB1rNWmPFTkAG6hDqIxQEs0
         oJSUNMAx6MBzJgoaB+p73x7jFKvWt+ozQ1aaSterswaaDIkyHQsOlYx8FaUC/8BYXaAF
         7sTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618818; x=1795223618;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mRnwY06Mr4WaxMQBOxox7fUWk47wPCvPr48cEnpqDt4=;
        b=2jMjWkEFPGeN4+ErglnCCBzTVsdzy68I10c8rKLqgEZavCbF1pB5S6hbUHDe8OTvNZ
         6yP0rU8y4NoT7PmCUdn/pOc/Hh4jCPmxGAVTw93rU1sN97FawhbkpLBFtnXgh5dKlVqS
         mWEGGfKT+ah4NZSwzYsSEDybzsipP+l6O7Yvfp94qsRm7WOxYYr4rb/+taqr95oa46Hd
         4EweBk8+HTdRai0pMWD9E0D1eaEQSAPALaUl5zuUvpH0QDdZ3ONrNiiebABl9+86GnLI
         QdZxgsvqaBcSpHpMS6drCRTsN4QgfZWc+wRD3xQ9I5XRRmkF3jzuYRUNvjzV6XeuP6ff
         LXvg==
X-Forwarded-Encrypted: i=1; AL+hErHYX7qnXlJNbA2LEy+YbDaVvVQTaezTTWdYlPLd6ky5W32gA1jqq0qSxVZgwQ2q+b5i6FZF9V3c3J9l4NomGo6j@lists.infradead.org
X-Gm-Message-State: APuU4Z9d1w870hRaqbi1EWqPUOKnLBSnWnc8cVa7FpL9S6DzIZtZmGIG
	9tKhHdZ2J7eG1dDaAjhxC8FAz6y2cdbu3Pf/Z8c1grARos9WWaHyNjXPbRtclCoct4D/EziTPyD
	5/x/x1APYl49yZjP7IwbrB59XrEmRIFc=
X-Gm-Gg: AYBFou39PXnW90HfHU65/prs+CVrz9ZDmOPoeLeTW97+I87NfyGQ8qrkFDm6jVeY/rO
	V6OngOt0ZBx/DaQL9kdt66Mh88I1NS3/fYNwwD5uZfupRzZO481Yn0FyZDJM/NQ5OPdN6XdxJGO
	N3IHxsF05NVYq/Totawr+hqPJShNkXRJF6pGLebS1MoBP6b567Y5bWzjZijOyyljnomvGr9R8LN
	uJXBFEM9ITPZ7GSFx+1GaAErdNuN2iaHmmfdleR+4E1itOO88Oh5n6K6IHOKTpV9wmKV8LBoofy
	KL9aR00rezv0O12FMNJ24j4H8+JLpzdhqNweit5TZZ6O3TNaSuvWXWbLyNDCi8TSwvhMRdAIbCd
	PXUeTdpsK5H+HG234Ox7pKolnHCtH1vpz3tePp9Fb+agN43YuDMzowORXj/whaTXtOvzPM4U=
X-Received: by 2002:a05:6512:3e0d:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c17058b108mr1887902e87.0.1794618818343; Fri, 13 Nov 2026
 17:13:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-spi-sun6i-h616-dual-read-v1-1-59bea5a897d4@gmail.com> <179461167656.590303.12402709871115244251.b4-review@b4>
In-Reply-To: <179461167656.590303.12402709871115244251.b4-review@b4>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 17:13:27 -0800
X-Gm-Features: AclHuK_CV3TuQGipcbjy18QP_8RBQLDadnLrh6ZniBLdvP-qmCmNyU7dCRkLAeM
Message-ID: <CAEy9hNUgWgO_tzV=3=X82A3kOYBxhukOvqRzaq+-YC18=RZW-A@mail.gmail.com>
Subject: Re: [PATCH] spi: sun6i: Add dual read support for the H616
To: Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_171340_740347_158B5D1D 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

> This new compatible needs a corresponding DT binding update.

The binding already has it: allwinner,sun6i-a31-spi.yaml lists
"allwinner,sun50i-h616-spi" with the "allwinner,sun8i-h3-spi" fallback,
and sun50i-h616.dtsi uses that pair. The patch only makes the driver
match the specific compatible before the fallback.

I'll say so in the commit message if a v2 is needed.

Arun

