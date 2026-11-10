Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26DF606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sIet4aEd;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UBYjfEdD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I6jvLVTJ6/L/P1TOo+cN1ccJTZcH95Jo/fx+GgYHa7w=; b=sIet4aEdMKKnpeGE//gSqIv5EH
	xmbRaX6d8uzGCNXUijYWlZDV5xc7nbPT7ovMMj+RB9gEKWYDyA89qwUzk8Vd8lGjZpHpy3ptNKK3g
	SivwJs7mHd0Calg9vjWYImmSluGAgjg8eq7r4ybBPgDJhzGRFNe7vEQLQ5A1O90x1YdQPzLtPE2Fc
	V2bh25ANwFhA6Tw0mi31YVSjy8d47ULB+vQSDrwe5P985epQn/Tj91yn0AKuHbWlmRfSfsh2BcW4m
	XM5GK+70U7zyGqNX30997ZwB7bgVYA+829G3VwiKQu7PtNTBL4R+ifCxrl3HkjpTzXyXGwzdDPMFF
	VesChbQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQo2z-00000004RBE-2ZPp;
	Tue, 10 Nov 2026 15:46:10 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQo2w-00000004RAS-24om
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:46:07 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cdb681de50eso740270a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794325565; x=1794930365; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I6jvLVTJ6/L/P1TOo+cN1ccJTZcH95Jo/fx+GgYHa7w=;
        b=UBYjfEdDjfN7hUSfcMhposn1RqqpEPusz81ST2ZVJv7gJCkfj2dpIL/yIkL1SBnBZ9
         YPRgT9+HfPGqKFYyq4NQ5GmHtUmo9hi2o9nimqXr7tQMgH26Fc8YILvOJ75Q8ncHlK6h
         mcadBs4v7FvJt/yo7HVeYgdgmcCiVPjy9cTbcJOpsqtSCZv6JhmYbbhINJ0D1BTug+Xy
         5e+bF965jyboNBTqODYTSd9kkOjn6nn64uYf4uZny04+gPIeTkSvPQlGIXtwaOD4QiVz
         5Ra9jxlXMrcCPjC0F0A6S4snyI7Q4D0DyKbDRTq3k8oECkmE6TBBNKlHXAz2YLao+EH6
         GsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325565; x=1794930365;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6jvLVTJ6/L/P1TOo+cN1ccJTZcH95Jo/fx+GgYHa7w=;
        b=QWR4okhk1mT2MUA0pE2+audDolOXEzO86VwQ0SlxipkN1Zj6xfary2TTYkj4qS2oy8
         9Jpkjwu0EOg+rcJn5UEsvVV7kQ/rBZodydej8cxr5E0tGoA1zGL0QTpm7Pl6gN6Xq6g0
         d0NQhseCBBsO9P27b/SGsBWU+CtRx2/sTIYnGfy6nzi1FUcSs6xitpeV37PlGXgoTDD1
         2oXebDq4rDvvgu4+M2JMLJV2yYtLaJBeIzjm5bHW9L85h8z3njnTfVD3vueeb221zz0S
         PWaZAJ/PWCN/TGSUjoKONhIDeVyLXX/f2WvQy4jpBS0v3UE3lulXLjeqGRkkAqaXQyCp
         xR+g==
X-Forwarded-Encrypted: i=1; AL+hErE4JR/oa7lm8vjNa1SGwtfZtUWkQAAtvYlON1EgsDgiqoKD92kn0XP/Hh9c4dpSRm8WrLAtKilPKTXbABLiQP93@lists.infradead.org
X-Gm-Message-State: APuU4Z8MvzrgtYjFgKyXk2rcE8/IltUZrJVONIHgUrHscj+7ZRCr8e9l
	4R5wK0XJTzF7B3yo4o95irSbmc2aUzOZsnJzmYAwBUSuZGjCYdPG6fC62s7lddcm5Jk=
X-Gm-Gg: AYBFou3whzCRey94EdcnV5++/m2s0tOTgmc1GiidgLWqcox+YR0FsA9xAH+ZBUPP7Dz
	WbVjhICjhOeREi8kn1Si0p5vS0s93Fmc9M5HOY/BajnBRfahru7DhOU+irMtTKiL2w/ebqNjjX1
	/74Dyxfo/QSa3hjiSVcSSbHwce7X/jq8ms6yZ9uhQ+b9L3ZfUZJ7gwjg8mJELaZUzqEf+6/k/C8
	erLoIJtRAz8HletgZySx7gMTkj4oEkvplCphBETocYllVTuv43NXkoOXerIF9PXP43RrUZwYy40
	4JavsJHsUae2r1TBdXFwS/BH6VjjOopfSTaj85r+yj9/WES2sJTrOjTkJMmPjL8Uwb5r6CPNajM
	XOfjd6c+dWtgpmY+17iv5+oFBArVk/63HQcw1wx8B2hoMH+WA5Pm9h/Nq0eEUh6hrzH6jwAzui9
	aGM6MpJi0/ipXRW4uHwxzgc7mKAt4QhATe5NlRrDGrLYgbrzKnZZgWKpTq7UVMU/Mg50Ae2mGvT
	Y0MljnxzGjg4a/yGkApGDULsTqZ8GgBJkuXDLucXk5BwxvAS5P8cypEthqdK1BdA5RrIo5JA52Y
	LqpOFmoxSBPUDkTjC8tQMPh1QrEx9MVMr2mC+PZj+oycYr2UBHN4gQ==
X-Received: by 2002:a17:90b:57cf:b0:3b0:b64e:1e34 with SMTP id 98e67ed59e1d1-3b166ce8e72mr3333472a91.51.1794325564896;
        Tue, 10 Nov 2026 07:46:04 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:a917:5683:7f92:9eda])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db2fcfesm325724a91.4.2026.11.10.07.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:46:04 -0800 (PST)
Date: Tue, 10 Nov 2026 09:46:01 -0600
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
Subject: Re: [PATCH RFC v2 04/11] remoteproc: report VIRTIO_F_VERSION_1 for
 non-rproc-specific vdevs
Message-ID: <avM8OYHxB4nAKCnb@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-4-26b300e01c62@valla.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-remoteproc_virtio_map-v2-4-26b300e01c62@valla.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074606_564075_88212847 
X-CRM114-Status: GOOD (  31.10  )
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

Hi,

I started reviewing this set, making it to this patch.  I will continue tomorrow
but due to the KVM forum later this week, I may not finish before next week.
That said, I applied the first 2 patches so no need to include them in the next
revision.

Thanks,
Mathieu

On Mon, Nov 02, 2026 at 12:26:41AM +0100, Francesco Valla wrote:
> There is currently no way to report the VIRTIO_F_VERSION_1 using the
> resource table alone, as the per-vdev feature array is limited to 32
> bits.
> 
> Considering that the VIRTIO 1.0 specification is now ~10 years old,
> always report the VIRTIO_F_VERSION_1 feature for virtio devices that
> are not specific for remoteproc usage. These latter, which as of today
> are rpmsg and rproc-serial, are excluded to avoid impacting the existing
> usecases, since VIRTIO_F_VERSION_1 changes the semantics of the
> communication (e.g., the configuration space is assumed to be
> little-endian rather than follow the device's endianness).
> 
> While at it, replace BUG_ON() with WARN_ON() and return an appropriate
> error in case of features that would overflow the 32 bits limit.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index c56d3330adfe..f1b362158a9c 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
> +#include <linux/rsc_table.h>
>  #include <linux/virtio.h>
>  #include <linux/virtio_config.h>
>  #include <linux/virtio_ids.h>
> @@ -27,6 +28,11 @@
>  
>  #include "remoteproc_internal.h"
>  
> +static bool rproc_virtio_rsc_vdev_rproc_specific(struct fw_rsc_vdev *rsc)
> +{
> +	return (rsc->id == VIRTIO_ID_RPMSG || rsc->id == VIRTIO_ID_RPROC_SERIAL);
> +}
> +
>  static int copy_dma_range_map(struct device *to, struct device *from)
>  {
>  	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
> @@ -268,8 +274,17 @@ static void rproc_virtio_synchronize_cbs(struct virtio_device *vdev)
>  static u64 rproc_virtio_get_features(struct virtio_device *vdev)
>  {
>  	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
> +	u64 features = (u64)rsc->dfeatures;
>  
> -	return rsc->dfeatures;
> +	/*
> +	 * All non-remoteproc-specific virtio devices are assumed to be
> +	 * compliant with virtio specifications 1.x; there is no other method
> +	 * to transmit this capability from the remote processor to the host.
> +	 */
> +	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> +		features |= (1ULL << VIRTIO_F_VERSION_1);
> +
> +	return features;
>  }
>  
>  static void rproc_transport_features(struct virtio_device *vdev)
> @@ -285,6 +300,7 @@ static void rproc_transport_features(struct virtio_device *vdev)
>  static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>  {
>  	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
> +	u64 features;
>  
>  	/* Give virtio_ring a chance to accept features */
>  	vring_transport_features(vdev);
> @@ -292,8 +308,14 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>  	/* Give virtio_rproc a chance to accept features. */
>  	rproc_transport_features(vdev);
>  
> -	/* Make sure we don't have any features > 32 bits! */
> -	BUG_ON((u32)vdev->features != vdev->features);
> +	/* Make sure we don't have any features > 32 bits except the expected ones. */
> +	features = vdev->features;
> +
> +	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> +		features &= ~(1ULL << VIRTIO_F_VERSION_1);
> +
> +	if (WARN_ON((u32)vdev->features != features))
> +		return -EINVAL;
>  
>  	/*
>  	 * Remember the finalized features of our vdev, and provide it
> 
> -- 
> 2.56.0
> 

