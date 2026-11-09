Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81063606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SCsYbBys;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=un9M3xgE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JRRwWfbameCVHtptgrmOT/aq7z3ehbGnOR3u7VnEKf8=; b=SCsYbByscYdPANx5SjQy9xDykU
	uYysb6kNRfqiyNq191bKapSvPkfR62caCQByth7B2kKMg3+fTMvtNQpEVZ10AoocNfYzOsvefyybC
	o/sjp72HdRWMxXgJYRLcSxyxoDmZZKPi7nR9QpmEZksNRwFqdwTAOqO667XU77ixwKiZ8j8SaAFFC
	FRL4+EkojKL0up5Jof9ykTJXEkbk7fQ5VQI/91asCXtGN7Hkk7gHgFsCbRhUuSl6HD6G3mIiCD0RD
	T3Epe+CR8mAgo2J65jlmvK+L5QI3+jXIxeVbcM9wPW7koayst197zkTFDiBdRLgSBzJap+89xkR1i
	4xFKMQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRMZ-000000012Ed-1Ale;
	Mon, 09 Nov 2026 15:32:51 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRMV-000000012EG-3HQC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:32:49 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso569619a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 07:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794238367; x=1794843167; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JRRwWfbameCVHtptgrmOT/aq7z3ehbGnOR3u7VnEKf8=;
        b=un9M3xgEYo26bzcHg9JwrkFx8Lje/gQF/tehZ/6kkLlU1WgcQiEDBuj1D2Ym0GO7jC
         jobNDn7s5JejHPtiaNu+kS41VBOw1021gbUL7kqq9QIib017qACZzS8KEH/W4jvhndVR
         wPEufmCBjcYdBo/FzvWGeUCSsmwIvSAQUfvZCIAXhYz0GQu2JXj1j3n9HPJ54Dx1f93O
         fHNKewwLiL56yi2eKfd2osJZUfFkNrwkgamUAKd6sk3eZg0jvdEYe484f1k3S8ZEhctl
         +Z7S1hePRhF5TUS40kmrw0iLqGXijuystR8SihhcWknHZw+xXLR+6UKj/4LTv2ErEr+8
         rXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238367; x=1794843167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRRwWfbameCVHtptgrmOT/aq7z3ehbGnOR3u7VnEKf8=;
        b=Ux4UgH8mksVjEroV4T9ytcbUXc358mu6d8sucXArilRwg7qQua2XaaKTQ4mXgNtbTN
         6xXHXvydV1idsx7xkRulPbTx30WV5aXuA8OTyvA8iGsKfdxH3nnN+DFq875QEsqP92RK
         rD0onCbp1OxcXu4XvxZS7PKShICZqWowG06yq+9fR7j5NypLezy+6Q5yAFq/Z7d9gHCi
         Q/1+dPeXRF/3JgE8MPu5OEE4ngaBWMKIegB1zBbVhAToh45KJvfbGGcsb4hrPq01Bmo3
         tEyEQFCq5dhaP0X4Zm911gbl3O6uytvBJVg17GChfIRcibgbl+eUVGaj1J//OtU6zIDe
         qpeg==
X-Forwarded-Encrypted: i=1; AL+hErF8K44eZzw33BJyClMOwmz/2cmfalPr6gVFh7jjxr2AeIQfHHO+PanCZu7mDKM8mMb8FE0yWzIgT/U1N5kRxHCP@lists.infradead.org
X-Gm-Message-State: APuU4Z+Pu15zinGqkjRQCQmim0LdUI6umXCJelNbuvkcdYJZl/SJkXua
	AzwOFhd2hm/EqRYGRQscBT0JKFv+v/ZBIbPVbKKQfU31J24SX+LTY66iXakLQ9Ex4wk=
X-Gm-Gg: AYBFou3wLnmfAy4nZdusMvYoa3IsNPNa3slY+fFuDdQlx3Oo5qQ+PbvcgY4nG+DzSoN
	vnsi3a4CSAB3xe7Gy5PaWIgoulalV42qXSzmD3fmP1yrv1VuQQuOh1HH8ONd3rYJCRY3I2l+Vzi
	ExFsCOIqdI+0c2uaRqpSumbd5hXK+aKiSBUbUh6gDR74XIBLdjvQGgFxGV7rntvSLyzpxzRqzGZ
	tyx76MbRcG06j7Sz9J4JRA87vwGtCxncZi2gz/JsNIeLZjc15uOI1frs6XXlCs3FRQ/PMtrLXTB
	G2kQwNlCbxZBgFrp5NRbFhnDttkdMXAXvmEsYHeoX9QuRunbc2byklqNjyDZpYykIU80x1Qhbnv
	xBa/VdE2K/putx3Eeo6jhgvqBmmUP3STasa4tVla8kan7hrlTbauP6AEAe/GtQenYRpFSPz8il2
	a25pznyuXlgthA9JPtLc915nJIsniLevZWO0+YdUNuPBmu2ZYFLmTlO0dBdIFMY9sMgLtorOUV5
	V90aB5WdLKkqgMoXXdSO3NacYXVcJ+njWlExR29bNVwOcpmZGmN7buvri7aAkxk6qFJr1bFln7u
	B3jFyOCQ6tOyfv5OYWRzakyUAB27/d8MKCh0fPi9ygdZySpFDkQ=
X-Received: by 2002:a17:90b:5307:b0:3ab:e789:ce84 with SMTP id 98e67ed59e1d1-3b12d51ee2emr4031188a91.65.1794238366553;
        Mon, 09 Nov 2026 07:32:46 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd88e5fed3sm315273a12.8.2026.11.09.07.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:32:46 -0800 (PST)
Date: Mon, 9 Nov 2026 09:32:44 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: stm32_rproc: Do not request reset by index
Message-ID: <avHnnBUiH-kLOrCU@p14s>
References: <20261106-reset-deindex-rproc-v1-1-41a03fcc8496@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-reset-deindex-rproc-v1-1-41a03fcc8496@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_073247_827388_72A73A40 
X-CRM114-Status: GOOD (  20.31  )
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

On Fri, Nov 06, 2026 at 04:46:15PM +0100, Philipp Zabel wrote:
> There is no need to request a single reset by index.
> Use devm_reset_control_get_exclusive() to request the first and only
> reset.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/remoteproc/stm32_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied.

Thanks,
Mathieu

> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index a47e040c6db8..1443a4013d6c 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -696,8 +696,8 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  
>  	ddata->rst = devm_reset_control_get_optional(dev, "mcu_rst");
>  	if (!ddata->rst) {
> -		/* Try legacy fallback method: get it by index */
> -		ddata->rst = devm_reset_control_get_by_index(dev, 0);
> +		/* Try legacy fallback method: get the first reset */
> +		ddata->rst = devm_reset_control_get_exclusive(dev, NULL);
>  	}
>  	if (IS_ERR(ddata->rst))
>  		return dev_err_probe(dev, PTR_ERR(ddata->rst),
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261106-reset-deindex-rproc-3c1aa2e9325f
> 
> Best regards,
> --  
> Philipp Zabel <p.zabel@pengutronix.de>
> 

