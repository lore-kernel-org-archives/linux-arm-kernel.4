Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6615D606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u5DYePk3;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zjN27/DC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T4XXFlbULQ2nlQDKlkc6yvG+h6ov3GlTKxgkovItaYM=; b=u5DYePk3sKBx2lIbYLiEF/XUiv
	T0nbwusgosKMe+maC/igNeD5YfM7QpRziAtghJst1paGh+yDW3mVSD+vDmxl7mAfsiJMNq/nXYVAv
	ReerXHVNvH0XeB+PlC2zY0Bgm///OOQlLcYS9OtPzFM7uIgquc1oO5vYsMo4rqz2vXu4O42mBl/O8
	Xl5FLEl0EqtE69LcMgOR9pAxxErHrOhGhpbl2SFF9e73IrNGZj7+pLyjVQi3++1roegD56sESJ48Y
	tCBBcw/qNo1Ok6/kIeLK80ZvdoG1RBZ0MbLwfLw4ta9sd1FXKdIufAkEF/CKf5zq4QT8zIkao/xMa
	2SiW2rfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4n2-0000000CbBI-0k64;
	Thu, 19 Nov 2026 16:15:12 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4mz-0000000CbAU-1eyO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:15:10 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c4d581da0aaso314031866b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 08:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795104907; x=1795709707; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T4XXFlbULQ2nlQDKlkc6yvG+h6ov3GlTKxgkovItaYM=;
        b=zjN27/DCg+VedkCxxwomFWysUkuskOwNusq42j7Rk1NKz/Hem554AVI5hwykCdBmVw
         dybxEC6hFFkEvRJoE4P+WeUGeOrStubHWJFjgMebQ8iO8VDlEZA/hUTKWQ2w2jBdv+Kk
         0G7icLk1U3yQA2AyTlI2aoWiUOkInV+OvYsdPKNcHV4NFG3/3vqqRP4hbOqcl2j3UYfv
         RJ5xDwCqNIyMirQp22jl05Usqo5BN4YByyO7d42KVd4OskHycyUGdY4xq4lCWhzVqK/M
         zgX1hiWRrSvKy/0OUxzAoJ3fsrzvDxuiJwoxyERQgWZMppcIkQLHLxw4XifJ+XWEuoYl
         agGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104907; x=1795709707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4XXFlbULQ2nlQDKlkc6yvG+h6ov3GlTKxgkovItaYM=;
        b=FmIbxiQEJWHyHd6LKqZUh2zhxiWbVkCvWcVTw+fqLUXBZoFEtcyk9XWbqwMfZvJREW
         5z3qGAGDIKrcHWgh8ipD7RxznPLDcswAiHr0jaxSwiPXDbQ6EE8IV9EacHGlBThrPtZb
         qSSctmHbzGk4TQGpQNZjOtL18nR7GJa5Y0lj/6hQhl48Mtmytwkiw2y8K0ZLFo+arkZ0
         tcF7N0kCGj8ue+UKxzbC4jQV8wzsLy0T7111awUxRhqGfunhOhNJ+FCOcJBQq/Ybn9HG
         ZjH1nCu6BgPZtNsC7Vhp4JFuwKP4+XyyMACQcgxhLlptwrAiqtldyUQXZ7Cm9c0OTvAk
         1u8w==
X-Forwarded-Encrypted: i=1; AL+hErGosT05jNXaodxB9j0XjdMC3nkDgPVDofzopQ3uOW+SyH968bIaLYfBaG14mDzB5qZ6yWIKF/CSXH51kmk9hLwc@lists.infradead.org
X-Gm-Message-State: APuU4Z//jksUyyjEtEuGrf4VmKbqV1Kvqvewz7NiJZDi+UBBGMCcqIQ6
	FA7ZszAJJxqumZ2AHf1JparB2Q+nItbzQX7naGO+dyFeoB0NygA1sDeYcCQoXs3L+tY=
X-Gm-Gg: AYBFou2gVV9gYw5xssfx6FBss6KXt9VtopzaH3bliKAkZauTigGdIQEnkqz6HxtwzCl
	lrLvfJ3dn01TNzl2yK1rkohUAHlvRXR0wQ0o/HlPQpsInsiz8O2/CB87GvKPfE47iqqIDBj6SaJ
	1y7s/xbCyDWDlhFLM9y0szFm3LdD3wGZpWmafsvtnWCLJaAF/oWYZbFfXrQNmaN7IRPo945aUXm
	g+GVAXcb7cT7OFRhsVnO912Pd59ANS6JQFvbjSDwM6WllxNko9rensUgD52CJJ9BnTgvSK4vhdV
	zcHr7O04ZXe8UyH7dlkYF0McC8Y1COGXZeRQm94+dXHK/Pc1O6xK1Xf6YsbAexTWZ5ClA3BpRxo
	ElVJ2DCYNQorB3z8Z8VDsptMEvvQeNs6VikcbrdT/pL8/d/RYitwwiY4pdMmU+Zc8Yhz8p372T1
	yyLYyws0zQsD+jEFu85/r1Rx5mrtucP4oJtocSFh9KUCU/C5k1FRhUKzjrpSW5HRBtj9Y/qhH9d
	MnuUQ9jPUz6YJw8QBvyexU6BDx7K9PIoU+JpS0U3vzHgzC1hiwbSak5EJdRoiCO+rJ1x5lWrf8V
	tDJfNKaK9jbYyiecM47JYLzUFdTk6t7i
X-Received: by 2002:a17:907:2d13:b0:c41:21ef:26ef with SMTP id a640c23a62f3a-c513aac43a9mr40174166b.20.1795104906817;
        Thu, 19 Nov 2026 08:15:06 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9bd7:226d:1022:f6ef])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acff65bsm16082866b.4.2026.11.19.08.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:15:06 -0800 (PST)
Date: Thu, 19 Nov 2026 10:14:59 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	tanmay.shah@amd.com, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] remoteproc: amd_mbv_bram: Bound device name
 formatting
Message-ID: <av8gg6d7eKwpfcTQ@p14s>
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
 <20261105051902.1646651-2-ben.levinsky@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105051902.1646651-2-ben.levinsky@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_081509_458953_158552B9 
X-CRM114-Status: GOOD (  20.28  )
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

On Wed, Nov 04, 2026 at 09:18:57PM -0800, Ben Levinsky wrote:
> rproc_mem_entry_init() interprets its name argument as a printf format
> string. Passing the device name directly allows percent conversions in a
> DT-derived platform device name to consume nonexistent variadic arguments.
>

I read the last sentence of the above paragraph 6 times and I still don't
understand the problem you are describing.  I'm guessing it was generated
by an AI.  Please refactor.

 
> Pass the device name through a constant format so it is always handled as
> data. Limit the formatted name to 31 characters to match the space
> available in rproc_mem_entry::name while leaving room for its terminating
> null byte.

What to you mean by "handled as data"?  Moreover, the size of
rproc_mem_entry::name is handled properly in rproc_mem_entry_init().  What am I
missing?  I also suspect this was AI generated.

> 
> Fixes: f87b4998994e ("remoteproc: Add AMD MicroBlaze/V BRAM-based remote processor driver")
> Reviewed-by: Tanmay Shah <tanmay.shah@amd.com>
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/amd_mbv_bram_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc/amd_mbv_bram_rproc.c
> index e4a103cf8455..6cf33c7b7e64 100644
> --- a/drivers/remoteproc/amd_mbv_bram_rproc.c
> +++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
> @@ -72,7 +72,7 @@ static int amd_bram_rproc_prepare(struct rproc *rproc)
>  				   resource_size(&res), da,
>  				   rproc_mem_entry_ioremap_wc,
>  				   rproc_mem_entry_iounmap,
> -				   dev_name(priv->dev));
> +				   "%.31s", dev_name(priv->dev));
>  	if (!mem)
>  		return -ENOMEM;
>  
> -- 
> 2.34.1
> 

