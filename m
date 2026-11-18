Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9D2606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 20:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Aqp+BjZt;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y44GakXv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FxLntHqNI1+h3sJPoaAEyO+/hQb8YRhU4FckPwMqXOY=; b=Aqp+BjZtL+nb9Yj7XFpy/7u7gm
	Jx9WqHoGi2IT3GLjZcI4XaI0JKds4P9cf3XZuYHSU7WirF2USgHhWG0yDO+4fb1FCzD+3xjC5/m7v
	66ohl7kHYvpFM+XZXxpF5OaE5oNRh6dIKsNFTpczRYYfv9oG5Mim3bdetAHh4DuofpXJ4SSq8VE7y
	alDDtL/sY2Lf0wt/ckkDpQMwi7EYD1yGIku1+JjUUK++rIgcSn6sKfdmudeOCGCm2I6t7rB3GHqIH
	XVHwR6gIYmbWxGHKbkbdITt4h7pDzJ9pf07wPbnFo4psUA5nsRayD6tWdIBipx/TAKGGdVkdG1ugV
	9E8euYYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmCn-0000000ACno-2zGz;
	Wed, 18 Nov 2026 20:24:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmCm-0000000ACnX-2ftU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 20:24:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2300C432D7;
	Wed, 18 Nov 2026 20:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B7B1F000C5;
	Wed, 18 Nov 2026 20:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795033472;
	bh=FxLntHqNI1+h3sJPoaAEyO+/hQb8YRhU4FckPwMqXOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y44GakXvG5GHKA31JnnJ8TOHTL4DJuDPzANJjJWG60MjNDOfyRHhJIm8vJ9IDSIev
	 kJKebboMkeglmR/Z3kWmpAzBb/AQDqIH9Izq2L/2oEbS6SEXi6ZsaYaQUkJZjqCiEE
	 /cEFzHQ3SGAkusbdtG1G+mq2iETbisKSIMwmFp2X1YKr62QeB8t2Omdt7o8wYE65tf
	 74JyKMlIkz2XlLsmuBGfkZAol4hWxO6LXScQh90VN9uTyIGALwX/totrf6ZkzLWXcR
	 OAC91HP6t82IYLn0SO6X1Zc4Z9eHlbMjrylVDrjpOpZr9CRq/RJ7Wgclipi8eTEcKP
	 JLUuYHqvl39TQ==
Date: Wed, 18 Nov 2026 14:24:26 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: krzk+dt@kernel.org, rppt@kernel.org, jenswi@kernel.org,
	danielmentz@google.com, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, linux-mm@kvack.org, ryan.roberts@arm.com,
	ardb@kernel.org, catalin.marinas@arm.com, sumit.garg@kernel.org,
	op-tee@lists.trustedfirmware.org, will@kernel.org,
	robin.murphy@arm.com, mark.rutland@arm.com, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	david@kernel.org, devicetree@vger.kernel.org, hch@lst.de,
	thierry.reding@kernel.org, linux-arm-kernel@lists.infradead.org,
	m.szyprowski@samsung.com
Subject: Re: [PATCH v3 4/8] dt-bindings: reserved-memory: Add
 lendable-dma-pool
Message-ID: <179503346493.801350.7313588345506554121.robh@kernel.org>
References: <20261111110738.872947-1-vdonnefort@google.com>
 <20261111110738.872947-5-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111110738.872947-5-vdonnefort@google.com>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 11 Nov 2026 11:07:34 +0000, Vincent Donnefort wrote:
> Add bindings for the "lendable-dma-pool" reserved-memory CMA pool, used
> to dynamically unmap pages from the kernel direct map before lending
> them to a secure world.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> ---
>  .../reserved-memory/lendable-dma-pool.yaml    | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/lendable-dma-pool.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


