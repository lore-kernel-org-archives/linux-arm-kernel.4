Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA7B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mv42LgUR;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=h8k6EZFy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=28IeRESigF0NNn4XBnfBQB0H4Zviuqvhwn/jiwKjQBo=; b=Mv42LgURMfXpax
	Czj8rYiql/YnXx6Ypr4KbrGh2kixmsfSTB1/PUWOD7+hfeH/dHgL2aymHv+yhlJos71csJTzuH3uG
	4dYQSmUnVklQfwgpjhqu80TD21M5LXJfRIE1S3wD4RCQmgQRj/vxvlLbA9IJLpU+Q+ViVKhxJ8RW/
	uVMtfuU4QgddRFmoEvc+cnUqaMdROW+mxfsqPqbwvg1qWIinPAxgnPZQ9vxLdPU8uO9D1Bb+FPiNz
	9BN67qf4Ba/eqmObdsIeiSv3fBOEur8Nhekzl9vgCPNJ7ctERgu9R/Ky0PmkosNaIL6oFpJsE3We+
	t+LHeJhi9U7TPmzxfdug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaJS-0000000DWWc-3D0c;
	Thu, 26 Nov 2026 14:19:04 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaJQ-0000000DWW0-1ZnG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 14:19:01 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso6221421f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 06:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795702738; x=1796307538; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=28IeRESigF0NNn4XBnfBQB0H4Zviuqvhwn/jiwKjQBo=;
        b=h8k6EZFyaVCL6uYQQ8tnVNF5LtMQ/GpjiAGMTjFGxnkWC/deG3cK4/jRQpQeqEQGsG
         E28Zd5i3qVqBLZ4SfD8F2whYe40d/qHqJKLXyvuNYGEPK4Ck4uqSh0uPmj+lxYMV5sW4
         TqWfa2yvfmLEH3pkbzfY9iqjueOLBVfjgrjcd/4Rg2pWwtVsWmMOOco+mftT8WZddiHq
         Dc3oppH7IyckdqNScSPYcLmacl8Wbj7kclFHUBa1Ly06zIR15NpQW1K9UdsIVxtZZsE6
         19lTVDCg413CPclsTAPpKbDwxliF63eD85DLuFuShIbrI5JYaIvBu43gIEr4ZpphoayS
         NnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702738; x=1796307538;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=28IeRESigF0NNn4XBnfBQB0H4Zviuqvhwn/jiwKjQBo=;
        b=sctgxINi2pR+uHl/zO+8aUNQkwDr/77CJPxNJWNM57NoTYEMidGpDUo44WNRX+ZS2m
         IjdI2+GL4WtOojEVGcmfMKes253RzBRYIBeMwo3cXNFZa5i3RJbNDeXEcPVqyISM90Rz
         acd7mgfvZ96Hst4k0z9ADA3gspmQApvVzhGuj1+QAP4AKRtz/jsTLm9dnS+HN2tuI8Ui
         aT3zv0kUiTitM3uEKgCPsYqLxStbAdNW+XyfjER7xFFkvqOpuD7Oe+xPNNyVJOvQBHtl
         C3XaPtsLBoljcHWS0koXRdE7I90wmtMc4hIpd1k4Zm9FxeUv2DEW4TK0P6oaUJRbK+Ao
         DO7w==
X-Forwarded-Encrypted: i=1; AL+hErGvUhKl9Zyq9Z5p1JHycJol8ROejFauma4aDOpY7py4xFRxToBiofLnLW+NvF4/qZCEW8A6EjBQxnIbds1P0x2M@lists.infradead.org
X-Gm-Message-State: APuU4Z+mVJjj7mCG4NrCpOm7ZrVutveFqdbP1f2BRXHXoELkrrdHgmFv
	gvYH423e3a+EUHKmFNA9G4B+IM+9VSJ3tcEaSGPtwvmULSs9Z40Lfvj52j1jbhJmedQ=
X-Gm-Gg: AZFdTZe2uaYvV7BlnN/RAk/2rH/XbMF4DkrJ3bJKK6rJdCzl7zqmTG2cg8ovnvBWu78
	4L7gimG6YBQtWPcqSOV6VurEUBouk0NlWNPKWrPlFvj/SujOV6V7j8++lOPV+hbzD5I7+3+4E8G
	o+X2bn9jArndDtLPWXv3DwUAC5+1/h7MYBJUtkf+SKNggOIH1KHL7M707AqBDeSM+iLknaW7nKK
	4R8wtlZVCFI82E8wTSdNFVEBfFqYcbn5CHy8AFhhZfxCFuhSdwSRCC7eM1iuAzXQ/5bAy1bUy6P
	A1JzZURFB40ehj2V3JkLGuBGJKYVIV9KIz5BBDucmfztf9ZrCJU0UYa4UGROjN5ctdj8NsPuMJq
	adkpWg6AsZqeQ1ROD/ubG6Z2Ai74VIrMvQImcGVGigvXcmNS2y9mbSWZ2aTRUB23rjPi3QPPtz3
	8UKLN2Z7VnQE0z12YF4h9iYcRMd8aJVE8ovTrauBGnkMfYPsvEUhng0n2pgalFaxtHb4v9Mzg3M
	yOSPu103G4/fqLAZOZEr0V/yaqKUIivqp+vmph5NB9uP62xup1Zv4rbht3cFQMmEMSTHXpvOKLX
	bqKRonIA/CkrI6Fqv73hKDP1Evv/SubM8eWRo1TUMxdqkmc+z7EwsTw=
X-Received: by 2002:a05:600c:c168:b0:4bb:81b2:c801 with SMTP id 5b1f17b1804b1-4bb889238f1mr418306405e9.20.1795702738375;
        Thu, 26 Nov 2026 06:18:58 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9065744esm321693005e9.1.2026.11.26.06.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:18:57 -0800 (PST)
Message-ID: <e06bd559-c8c5-4e82-8951-9f7894cfb378@linaro.org>
Date: Thu, 26 Nov 2026 14:18:57 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: tpdm: Fix fwnode reference leak on probe
 failure
To: Yige Jiang <yigejiang86@gmail.com>, Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <rc-b1-20261110-vc-178-2d9055f946c8@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <rc-b1-20261110-vc-178-2d9055f946c8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_061900_453750_432C65B2 
X-CRM114-Status: GOOD (  24.95  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 26/11/2026 13:29, Yige Jiang wrote:
> coresight_get_platform_data() takes a reference on the fwnode of each
> output connection's destination. These references are not devres
> managed; the core drops them in coresight_release_platform_data(),


Don't _tnoc_probe(), tpda_probe() and smb_register_sink() have the same 
problem? We should fix all of these at the same time if you'd like to 
send a V2 with a patch for each driver.

It's quite fragile to have to call this in a certain order in every 
probe function though. Doesn't seem like it will survive further changes 
or refactoring for very long. Longer term, Leo is working on refactoring 
the locking and connections. Maybe can do something like make 
coresight_fixup_orphan_conns() re-read the firmware for unconnected 
ports and re-connect them, rather keeping these long lived references to 
fwnodes.

> called by coresight_register() on failure and by coresight_unregister().
> tpdm_probe() gets the platform data first and then returns directly
> when the drvdata allocation, the MMIO mapping, the dataset setup or the
> device name allocation fails, so these references are leaked. The nodes
> come from the base DT, so this only leaves their refcounts unbalanced
> unless they are dynamically allocated.
> 
> Get the platform data just before coresight_register(), after the other
> steps that can fail, as the funnel, replicator and TMC drivers already
> do. Nothing before that point uses it.
> 
> Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---
> Based on linux-next next-20261109 (630059a5a632).
> Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_CORESIGHT=m, CONFIG_CORESIGHT_TPDM=m, CONFIG_COMPILE_TEST=y; baseline and patched coresight-tpdm.o, no new warnings.
> No hardware or runtime test was performed.
> The paths need an allocation failure, an MMIO region already claimed, or a dataset setup failure in tpdm_probe() after the output connections were parsed.
> 
>   drivers/hwtracing/coresight/coresight-tpdm.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index 102b8b7edf87..07e19c1a94b6 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1404,11 +1404,6 @@ static int tpdm_probe(struct device *dev, struct resource *res)
>   	struct coresight_desc desc = { 0 };
>   	int ret;
>   
> -	pdata = coresight_get_platform_data(dev);
> -	if (IS_ERR(pdata))
> -		return PTR_ERR(pdata);
> -	dev->platform_data = pdata;
> -
>   	/* driver data*/
>   	drvdata = devm_kzalloc_obj(dev, *drvdata);
>   	if (!drvdata)
> @@ -1444,6 +1439,12 @@ static int tpdm_probe(struct device *dev, struct resource *res)
>   	desc.name = coresight_alloc_device_name("tpdm", dev);
>   	if (!desc.name)
>   		return -ENOMEM;
> +
> +	pdata = coresight_get_platform_data(dev);
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
> +	dev->platform_data = pdata;
> +
>   	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
>   	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM;
>   	desc.ops = &tpdm_cs_ops;
> 
> base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47

