Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC39606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Po0LIF0l;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DePnHql2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KaGd73jUvBCtYYL6VAII2la7monoqE07c5rmlmDTQEY=; b=Po0LIF0lDqzliqfObBVipqhVwG
	WtThDAn7/7OSyfYvEv9kYgiFyp3qZ6H7qxfnU9doWpMmW7KdxIYfMwrOyCljOAQbQnzzePOYyFmlK
	bPosmZrFm0IRTrr0BmWC7VpXmNaMKo9qXdYhOSKf53exexeQh/lU28wbkwCkAP2EgT1X1SZQMYblK
	KDJ0pnJUUkHINtPS02EIdSawT8fYk5JBwWi6U1KXnsKvRM8C94zfFVa27/GtfeFO9bCeHnrhY7aUT
	3sBApUcCT7RG8YeOhcgwgH5v0JHNuht2JB4wcsGRkUce4E3T1mEmZqZ7Ea84OxWkXi8L9TMUJzCny
	KxLoodRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw2W-00000002Rp4-3kq9;
	Mon, 16 Nov 2026 12:42:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw2V-00000002RoE-21g1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:42:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F070F42445;
	Mon, 16 Nov 2026 12:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68831F000C4;
	Mon, 16 Nov 2026 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794832946;
	bh=KaGd73jUvBCtYYL6VAII2la7monoqE07c5rmlmDTQEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DePnHql2vogNseC44FlmR7jh1l1OWiprMO+LPBPtIqCAkEK9tWs+PBcs7op/SeLU+
	 nWeleNAQrWVX72IcIswaR27oRuQKG5uRGZVe/i65oeRrq1QzNrfVjxdAq+vE7HRE0D
	 XO3GyMSFtIWmlLgu3Rno3cHFbIRvA9FD5W/19SUjCKH24eWTbOG3pA4KhDGjytXu2h
	 6YnHpIBU2SX+oo1AFH0/pZ7dFEcwAlK7MKj08Mkl1fAYt9QAsDIjmNbl1ANRRE9TUn
	 fwCFHwraGT/OHD/ZwzkMRUEg5jS/Gam/BN8iS1TVV2/xB1yJUFblPiE51/lk6RnH58
	 drFOsvaE54kfQ==
Date: Mon, 16 Nov 2026 13:42:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: spmi: Add Google LGA SPMI controller
Message-ID: <20261116-slim-innocent-prawn-2caee1@quoll>
References: <20261115180147.1208082-1-vamshigajjela@google.com>
 <20261115180147.1208082-2-vamshigajjela@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115180147.1208082-2-vamshigajjela@google.com>
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

On Sun, Nov 15, 2026 at 11:31:46PM +0530, vamshi gajjela wrote:
> From: Vamshi Gajjela <vamshigajjela@google.com>
> 
> Document the device tree bindings for the SmartDV Technologies MIPI SPMI
> master controller integrated in Google Tensor SoCs starting with the G5
> generation (codename: laguna, canonically written as "lga").
> 
> Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
> ---
>  .../bindings/spmi/google,lga-spmi.yaml        | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml b/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
> new file mode 100644
> index 000000000000..60d1e1769cf2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


