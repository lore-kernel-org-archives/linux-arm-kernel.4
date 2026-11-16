Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3924606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 17:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zRFSjiyT;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fxz06FDE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Bd5KkZtIi9hEU9aTOnohsJP4GtQbznYQgq/LOm2c1XM=; b=zRFSjiyTvjw0aNjBUggYgPq/HI
	Mzl/E3XoPyYLQ3hEbmHhVHy31XDoJiE0NQas//c+uhNVs+JnqPOsUzK9lGYlMcEC0DkeNwfdRfG46
	WHX1FFsAzocGpPqB8AJnPAVFNQSWDsfIWKMJPQxIDWnCeLoNLM7dGZ0DFT7K9I5ZH7BZwcAhxANnR
	Pxr2ORg2FFzkmPq6tqWPaFdqPC1KKbaxNpUgp6FZcCaZikiqxjPMvXkTTlxE9+1jSMo8fANPhudCn
	vwVMY3FdFPqOEZ3G6dtXbLIrozud4Ignxs7V1hYrmmXTQIzo/G+KXT9IDoAn8FXOoVLl0GQ1Golc7
	TXmgbDUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0JZ-00000003Ne3-0Hqg;
	Mon, 16 Nov 2026 17:16:21 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0JV-00000003Ndg-3Ury
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 17:16:19 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso32198a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 09:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794849376; x=1795454176; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bd5KkZtIi9hEU9aTOnohsJP4GtQbznYQgq/LOm2c1XM=;
        b=fxz06FDEHk5qsPHPny5bset5pesg+qo5K6EOZ2g4QAI+ldtRb0GATrxDPG26NuRPAD
         DgPTfHVg7GC7Kv1cI1RLBok+uhXBMg8M2fXcxUUoeFHj7VAl8+u6CgsNGldVnFpHBklv
         d1gtY0/d9s9Mm0ghDvuNu6PYhGZ6HS9mu3w5yrclWnXD81B7blSoq1067A2v4aGBj9D/
         +Y1fzLrYG/moemSLjHofZIWNcij51dK7D9ftRs4vLUOB4UqnpR7hok+dpiYFlQzQeM1P
         QGodjrP6usyv0rEXNMU7r3ud/H2i919lsw1U9PZJNC9ph0HgDp8crD6gIdo+nw9tD5QS
         K9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849376; x=1795454176;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bd5KkZtIi9hEU9aTOnohsJP4GtQbznYQgq/LOm2c1XM=;
        b=x5ZnhX7p084Vo/ymtyb4HT3KNxXZeWckcc3HB/cf7TZkJWen0pgfo3A7bgHJzfTOGG
         mFnraGkHknSsAqpzfEJmeQkqm1hsks01FZbDAHHffPyxNW9q9sIYDetFMJjEnnLSvw+D
         sL38p+k7Y4d9BtomxNPBvRMC1BvPGeRJd3FS1yONqvfRvZU42i9iPLZkN+0fhc3y6jac
         HGydgXQ/NRpwkroGymRpcxx0+LILZ4G3Ay0HswJc2jQHOV2Zei/Hr++5dGK+STPUOmAu
         2FvxEtSu3RDhBVZ10aVVoeZ8Zo9ts63TEN16pH4IBaqw5Osik1RD7RekXbuL1wGNnpU2
         gmGg==
X-Forwarded-Encrypted: i=1; AL+hErGAVmgzwdLAJmtXxyariWJ+0biS+ATTWGXdRpRmy9vQBpYPIaaLUaaWpEmetaLz4sz4K6YrHoAJ/FKSqd2qG0CS@lists.infradead.org
X-Gm-Message-State: APuU4Z9VKO+fUuI1jmZtoIIrL1rVP94+iGMZ200+vwO5/d4ezFNlVn87
	QjCDtncVoJdQtxYGcbFpghfo+SL1dPeRZ6mIsPtorG/STuFSDaytdI6/kcazhmgDAkw=
X-Gm-Gg: AYBFou24ViVs5D5B9SyfBZI7OPtMadteZ3mRQQ6wknK57w9RkxaqlG/iMFJ3E84kBn1
	WbB9VGDjIILsuN9Lg7vA+77vdEJE7WqyCKXa8kG/iE5MhWmGnVCyvjyM7ZmvRt6Xyu9XCNFscjv
	xKU519KExFWvt/HzdkbaPIt1QOjQZqtjcPHGe8GXgcKBiN4CJyevP2c4hKgh/Yd2k7i91QLSU4d
	NDvPYBKWyDnN/n3C4pLwVF0PUtEnb17jBGxdn33DG1dquX+RMlxn09uf5KXCwKcvk6VHJTCNZPy
	6SBJADwa2nJwxrm2LpIcKPjjeZ64u+w5+UxHoibnfA/zRGX8ieVzaQEO8ypEoL/WQsPvDZ0GslD
	JVQ0u1sgOSl7vsVxMeW51grfFEJEh3CB3yJ42KCEtPb1LxKirVH9dJeyNN0ImhhcbUgZ6/4LB29
	lewzExa7GVHVhMtttTYUZwffs24aTFijvelY6YuNybtaMhrhHShJ2bARoO6ZX7uhcESh7dpmZTZ
	JpH02ity0wn4+n7TnnU/OvG+CpFOOvSWxZY0Wwrhf6UP2F4hVBrTn0+R8/crZ/js7Cf++K9ayHQ
	JV8L2ZMExop0nwAwzSnXhs1KE+IaTV8w
X-Received: by 2002:a05:6a21:7a46:b0:3de:71c4:a22b with SMTP id adf61e73a8af0-3fd29c153b2mr84093637.1.1794849376336;
        Mon, 16 Nov 2026 09:16:16 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ea6f:45e1:c614:f10f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a97f9sm3778408b3a.14.2026.11.16.09.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:16:15 -0800 (PST)
Date: Mon, 16 Nov 2026 11:16:13 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 05/11] remoteproc: virtio: report
 VIRTIO_F_ACCESS_PLATFORM when required
Message-ID: <avs6XQpoQmY_MNYx@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_091617_895139_63885EE6 
X-CRM114-Status: GOOD (  31.35  )
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

On Mon, Nov 02, 2026 at 12:26:42AM +0100, Francesco Valla wrote:
> Depending on the driver originating them, data buffers used for virtio
> communication can either:
> 
>   - already be allocated from the coherent memory area that is
>     accessible by the remote processor; this is the case of
>     remoteproc-specific virtio devices, i.e., rpmsg and rproc-serial;
>   - be allocated from generic kmem, and thus not necessarily accessible
>     directly by the remote processor.
> 
> In the second case, the DMA APIs can be exploited to obtain a
> functional communication, since they will take care of cache maintenance
> and - if required - bounce buffering. The VIRTIO_F_ACCESS_PLATFORM
> feature flag can be used for this purpose: with it set, the virtio
> framework will use the aforementioned DMA APIs to map and unmap buffers.
> 
> Bounce buffering will be transparently used in two cases:
> 
>   - if the buffer address supplied by the virtio driver is not suitable
>     for DMA transfers, or
>   - if the reserved memory associated to the vdev is a
>     restricted-dma-pool; in this case, *all* buffers will be bounced to
>     and from this pool.
> 
> With this support in place, any kind of virtio device can be supported
> through the remoteproc-virtio transport, at least from a data exchange
> standpoint.
> 
> Note that remote processors behind an IOMMU need da == pa for the memory
> region(s) the buffers are allocated from.

I'm not sure to understand the da == pa requirement - can you expand more on
that?

> 
> Existing use cases (e.g., rpmsg and virtio-console) are not impacted as
> they are explicitly excluded.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index f1b362158a9c..1496659ddff9 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -280,9 +280,14 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
>  	 * All non-remoteproc-specific virtio devices are assumed to be
>  	 * compliant with virtio specifications 1.x; there is no other method
>  	 * to transmit this capability from the remote processor to the host.
> +	 *
> +	 * Virtio devices that are specific for remoteproc usage take care on
> +	 * their own to allocate memory from the device's coherent pool; use
> +	 * the DMA APIs for the others through VIRTIO_F_ACCESS_PLATFORM.
>  	 */
>  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> -		features |= (1ULL << VIRTIO_F_VERSION_1);
> +		features |= ((1ULL << VIRTIO_F_VERSION_1) |
> +			     (1ULL << VIRTIO_F_ACCESS_PLATFORM));
>  
>  	return features;
>  }
> @@ -312,7 +317,8 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>  	features = vdev->features;
>  
>  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> -		features &= ~(1ULL << VIRTIO_F_VERSION_1);
> +		features &= ~((1ULL << VIRTIO_F_VERSION_1) |
> +			      (1ULL << VIRTIO_F_ACCESS_PLATFORM));
>  
>  	if (WARN_ON((u32)vdev->features != features))
>  		return -EINVAL;
> 
> -- 
> 2.56.0
> 

