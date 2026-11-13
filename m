Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1E0606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PRGCeqfk;
	dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=E1IES2KV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NInaYM5/ulsk78/rKQK71fJZph826pB2bolPCV0acww=; b=PRGCeqfkQbSQqAojx/M1U0OlI1
	aZMO0ik3MJmMP35y6WT2ZJx7cW/s7kTKwB4vAymFwsE+dcNuuhQwC61NvFD4zOPupdPnA5qftKodU
	yEYmCERpFmTUSAn/09UtzCTG/fWC3qTSRIuQ1ldF45m/e/h5DlVe4rdxFs3W3HwrpKJBUtf8yGnXy
	87jyH+Ch+Xb17/uCqJJtbWvnud/ylvqRAvaJ+ysaF74LjuXY2eCP7mOzfn2cmpaEhaEB6QtFjA+4W
	h8RytOpR4KI+yDFU0al6xziH1q7ahp7+B9BlCJyhckCibO9y78INccmL+2v8GEwqbO0O2/ocq4V1b
	Z3H+Rs2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFe-0000000ChTX-3wQv;
	Fri, 13 Nov 2026 12:19:30 +0000
Received: from submarine.notk.org ([2001:bc8:3310:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFS-0000000ChGw-3Yok
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:23 +0000
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id 58E4F14C2D6;
	Fri, 13 Nov 2026 13:19:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1794572351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NInaYM5/ulsk78/rKQK71fJZph826pB2bolPCV0acww=;
	b=E1IES2KVgYEB6pOuIqY3HGLBMX1AFtAm0XtC08mfjPnUlijVCi7/vHqpOvEHcBDRZ3KJQa
	iDJ7mpQjjNoha05y5p1VK+S57OcLA5AR9x9zV+6jd3rt96pj1iKJljZctBdaI2kEduObrJ
	k3hlUmlXS+nfzkShN13dZgVlh9kAv3NyLsP1zhNc1iPysCy0w/U4l1f+YR88lvVOZ6XLId
	TEThieEH4us11BfqoC9CRavIV2DKviKArlyArxIVgtDvhIozTenJ3eOtH9RbchW9cp7tVp
	Jcsd8U4GkSck9wq3bkWB3nCoj4RdiNf86lspYpMTy15LOQ3N3plt1lKa4JEB4Q==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 284c54b0;
	Fri, 13 Nov 2026 12:19:04 +0000 (UTC)
Date: Fri, 13 Nov 2026 21:18:49 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Jiawen Liu <1298662399@qq.com>
Cc: broonie@kernel.org, cl634@andestech.com, william.zhang@broadcom.com,
	kursad.oney@broadcom.com, jonas.gorski@gmail.com,
	bcm-kernel-feedback-list@broadcom.com, anand.gore@broadcom.com,
	f.fainelli@gmail.com, rafal@milecki.pl, olteanv@gmail.com,
	han.xu@nxp.com, haibo.chen@nxp.com, yogeshgaur.83@gmail.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 4/4] spi: nxp-fspi: disable runtime PM on probe failures
Message-ID: <avcAKdwmS3nZ2Uk_@codewreck.org>
References: <20260620083931.1120616-1-1298662399@qq.com>
 <tencent_8FC0B8DFAF4AE67AEBA20548045D53A77707@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_8FC0B8DFAF4AE67AEBA20548045D53A77707@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_041919_301207_363F29F6 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Jiawen Liu wrote on Sat, Jun 20, 2026 at 12:39:31PM +0400:
> @@ -1389,6 +1397,11 @@ static int nxp_fspi_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	return devm_spi_register_controller(&pdev->dev, ctlr);

Should failures in devm_spi_register_controller() also go through the
error path, or is the current code as intended?
e.g. something like
---
ret = devm_spi_register_controller(&pdev->dev, ctlr);
if (ret)
	goto err_disable_pm;
return 0;
---

> +
> +err_disable_pm:
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);
> +	return ret;
>  }
>  
>  static int nxp_fspi_runtime_suspend(struct device *dev)

-- 
Dominique Martinet | Asmadeus

