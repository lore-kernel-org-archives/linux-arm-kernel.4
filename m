Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF80B606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 14:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tcbO0c5o;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bPIAGUus
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IrVeQKBGEQiIhXPASB7aO1B/hnuopAlb12g77nEvd+E=; b=tcbO0c5ozeJ+flvr4xxH8qCt+V
	1bNVjACktvvaunQ7c8mBUNadG7yrJw09N2uqg7EksrHqGh1ZGqrel+6xJx+fFtwmu2+Fb4glJ8znK
	5E6RSzw5vitvGibY2/ABnprMsOH0K8xsX/YRQkCK7MqIPovh1dbb+zUxO/JZklds2L3kusSUsJKmT
	kpJ32n/0s2Aq0BIhRny/CUCsF+JJPBr8NY+TVONLuv7WPIuW0F2Md861keZmI6ESBkudWpuEs+6wz
	zbOXHjJCZc8DWB1PUjaju9mIP1yv9UMd9++e34sWlWFd7wfzKDJpC9OZ0PVr+oTqkO4E3N0wt3Wnu
	45/NEQRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQgk-00000000yyk-124v;
	Mon, 09 Nov 2026 14:49:38 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQgh-00000000yxh-49kp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 14:49:37 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so486029a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 06:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794235774; x=1794840574; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrVeQKBGEQiIhXPASB7aO1B/hnuopAlb12g77nEvd+E=;
        b=bPIAGUusKmnbSdDSoAcfBF3JIGgcuaakUwJNM9jTATvTP53Q5la220MBtQklg6s1GK
         Afbcg1kUTtQoQz/nc7ue5by+HlTcrNJz4l1I3dDfI25FVS2/1LiqpU5wdVpNGzRl1Tgb
         hV1vonIUkJzAmvDeAGvMHUgVsCyngF+zteh2yYZRiVFvcolSQjkXr6wBSbnw1vQ8NFE5
         56d06/TYXoy/SYDRTA04HdqNqMLii55T+wnI8kVRYS+Rb4VIYAgG+/jqXof8vtIN/HxL
         kIUug8D58mO9wGr0MvsHg2AyGzc8TcAKmQlPMQrxH48Czw6UtjLDUXbvHw2q2bxcFGBM
         /Bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235774; x=1794840574;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IrVeQKBGEQiIhXPASB7aO1B/hnuopAlb12g77nEvd+E=;
        b=cGA9YIX7XlZNrhDEJcmjG5q2gR7FoUus3sJ3Q6APQltEiKW2MmrPzLIKC8VDaFiWEC
         nmJhzatVG8A3eHqeM0ExlHu5EkYnC+AwFx9ELpDA+S2lUS4w8VUBQiO+SKti/FKAXj4N
         sCbU0P0985BLnFFBq7TSm68Sg0upfvG6gbY3VgVtYXPbGgovQ3syRaIxmh7OB2HEayRp
         pidqK0MJu7af/ZEr7ytQ3XBDZPWsdkBHyl9lpM5Y+5KtpQWplv+IgmvHAMS2oLxKjdtC
         bgGRkDMyV9xP3B3NJZJeHSjY16NMwuv5HWZVLtbicrybsz/nfsuLk7LSd7+l9zmWx2hn
         WruQ==
X-Forwarded-Encrypted: i=1; AL+hErGG5Ks/RBJG/AzmyXRKW48pGgXwzZbOq0W2G7W8q202RGA3AeaPtXGXB4+pn5zOvQBFw73HsphvDo3eQsFK6xQC@lists.infradead.org
X-Gm-Message-State: APuU4Z+Jjqt+fU6J7emvnVfrvTVZUhfzgOMnEI16ROkUfGNXi96t+Kvc
	qCelvKUyPzgHLq0zcI501zX70dZ8ixsYM3A6zGfFTADgyVSpYuogLdENADQSg7VMNaE=
X-Gm-Gg: AYBFou10oqTbF3Bcjuz7cNoLM4TQhHIH4hQdTvE0jXdbl9ZlHUV6YHs1VQksxMH7ysY
	UApnMtRUFhweM+P50yC+hxP7aviGGu0lKs0qfk2HRveRBHUEDiyB7YKuzMt4bNxomb2Try7Y+7K
	KNoqKhY0LtNjPnnGnXUnm1rlFtX+iM+mk8l6NFTaD6cxBsHU/4p+TEYEfZPB6izJH3yjJKjwm6J
	M2dhIxeyQGxcME4wC1Xxe3bv39sK/M0SWDLnWDH+qGGWHdixjbUohobjCAkl37qTZOLW3MYj1pN
	Y7J+XVHSwWY3+6SxFhhWUafHCPbiiQT3pwYRI0sHbzYq49aPK3y+FumOHOzdsCrkYqQs6FZM3zQ
	R6daGPRws1mAaW01ctvSW9jlif3UFQc9eVWXx8TSEIjGPxgPqzATagfsYAZcFrXdjiff52QdzyI
	aCY9FY6r4ezdBL9QS0ughv65Qcr8MD/Ye6bvy/FN7lH+zRI34zNsTQdgeziDbkPUe3cFxocaA8p
	M4nqy+jmnRpLPsK0nrRh7PpEcvzr/MfP0PleNPM7NyOMeOsIKP430yNxcbAT3DU1Cgk8EkNLb/l
	eQmOqbcMe1wos3DC9j6+XNGTaXccig==
X-Received: by 2002:a17:90b:384c:b0:3b0:9317:5849 with SMTP id 98e67ed59e1d1-3b12d1080d0mr4128385a91.1.1794235774376;
        Mon, 09 Nov 2026 06:49:34 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc27e829sm6647786a91.0.2026.11.09.06.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:49:33 -0800 (PST)
Date: Mon, 9 Nov 2026 08:49:31 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: sashiko-reviews@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <avHde2RgEUtQj846@p14s>
References: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
 <50647b7d731fa54fdc3e2869f02de2096acdcff2.1793879714.git.u.kleine-koenig@baylibre.com>
 <sashiko-outbox-198999@kernel.org>
 <auyGiW91Ir0JcuxG@monoceros>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auyGiW91Ir0JcuxG@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_064936_061421_95415C18 
X-CRM114-Status: GOOD (  27.52  )
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

On Thu, Nov 05, 2026 at 02:41:37PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Nov 05, 2026 at 12:10:05PM +0000, sashiko-bot@kernel.org wrote:
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index 00019b1895e6e..e750a127cbc4a 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -75,6 +75,7 @@ enum rsc_handling_status {
> > >   * @detach:	detach from a device, leaving it powered up
> > >   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
> > >   * @da_to_va:	optional platform hook to perform address translations
> > > + * @memcpy_tova:optional platform hook to copy data into remote memory range
> > >   * @parse_fw:	parse firmware to extract information (e.g. resource table)
> > >   * @handle_rsc:	optional platform hook to handle vendor resources. Should return
> > >   *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
> > > @@ -99,6 +100,9 @@ struct rproc_ops {
> > >  	int (*detach)(struct rproc *rproc);
> > >  	void (*kick)(struct rproc *rproc, int vqid);
> > >  	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
> > > +	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
> > > +			   size_t filesz, size_t memsz);
> > 
> > [Severity: Low]
> > This isn't a bug, but is memcpy_tova the best name for this callback in
> > struct rproc_ops?
> > 
> > Across the remoteproc subsystem (such as in struct rproc_mem_entry and
> > ops->da_to_va), da denotes a remote processor device address while va denotes
> > a kernel virtual address. Since rproc_elf_load_segments() passes the
> > untranslated device address da directly to this callback (including for
> > devices where remote memory is not mapped into CPU virtual address space at
> > all), calling it memcpy_tova seems somewhat misleading.
> > 
> > In addition, when rproc->ops->memcpy_tova is provided,
> > rproc_elf_load_segments() skips both the filesz copy and the trailing
> > memsz - filesz zeroing step. Should the kernel-doc comment for @memcpy_tova in
> > include/linux/remoteproc.h document that implementations must copy filesz
> > bytes to da and zero-fill the remaining memsz - filesz bytes when
> > memsz > filesz?
> 
> That's a valid concern. Maybe `populate_segment` would be a better name?
> I considered being more verbose in the kdoc entry, but all the other
> entries are very sparse, too, so didn't want to add a 5 line comment for
> the new callback among all the one-liners. But I can if you tell me your
> preferences.
>

I would stick with ->memcpy_tova() to keey the mcmcpy() semantic already
rproc_elf_load_segments().  But yes, go ahead and add the 5 line comment.

 
> Best regards
> Uwe



