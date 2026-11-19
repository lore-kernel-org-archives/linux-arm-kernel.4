Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0027F606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OUAxAHN9;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=k2thbkOh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RJzTbt4b5o1R8Zwzsovu5HVY5FLB11k288WW5ys9/qo=; b=OUAxAHN9rWu4QVvM1XkOfnBUQt
	iFPXNB2ovwXEYncQJl2ex21RJsDbSiQSKLRm1F/0qp6z6ATKcAYg2g9Qgw359e5bTwV7QqhYOgylQ
	ocN9DOSPAzg7NdpXJ8ybjKpadnUVGnKDzYMNVZk2gk6hpu/uHNq48EyjF2kIei4bchw9mE0UHdTkU
	kE6zFt1uZqtS23EbCljk2mNVIwRvCny18KCe2JkCN8HAEa/wRNpntbb3q+0q43Nks+j/fR4oOlE9Q
	9pEKui9QH4Jttott2AYEIK3M4ivRkufeB78p7Qvt7WS85THSDIoNs6Z+BabGAlqMyEEbH8pyCCWeQ
	YqirBIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5UJ-0000000ClGM-2nq9;
	Thu, 19 Nov 2026 16:59:55 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5UG-0000000ClFS-3TuI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:59:54 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2efef1516b5so14612315ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 08:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795107592; x=1795712392; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RJzTbt4b5o1R8Zwzsovu5HVY5FLB11k288WW5ys9/qo=;
        b=k2thbkOhJItlBYJRlR3FqB7uyh/QpFKaZy3DRVYETpPYfBmwb+C/IAEPFOOv8caAJe
         0tTM5cCNidTwHd7zOl861crbNW+tqvtsHWuAxynI43LLG3q+05qWnLUJc/9ZKcVe9SI2
         VslX2bKbLtEpHz5fb3Kx1deZl5vDKFLgGwtFZVcEdK1rP31eZjc3uhHY2c2hk53zUiHI
         L6/uvEkCXyTHmVIx4pHvBkNvY9BRZBch2bh/88Y2S1IOJwDaCi4mNcRVKJZnWbRHHirY
         2RoKvWokDuig0rFEsQc6uvRj6WBNwQXZ+HePUqtY84BWZPUPOyptfKx32nZCKkRXv9fp
         UDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107592; x=1795712392;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJzTbt4b5o1R8Zwzsovu5HVY5FLB11k288WW5ys9/qo=;
        b=i5ncceecagQFmBoKgr2eVKfq0Jlpu3ONhPovvhPdaAFg843UEYCA+l+Mn7lSQG1atk
         qzHdrsH5l8OrSjIv5RClAOS43eU5vfthIAtqgC+7V/OGqbEy6z503HVjlKh2RlI+jBwL
         i+ByUEzLcibrmaBRPa23Jf/cW2hTU9FgCX4Fw8XbJP/qSQ0iwvMxwCB8RCoaOUBQ9M7P
         80n118nJLAF1gcLvIMxk2lHdosyP5i1zXb/80azFRasjwDU7SYN5Xl9xf/VGqzZKaLIt
         ieYSStXHg0r42b+g7O/YEI36Qb0UA8DR3jtGv1ihnBDnNcx2Yxpjzyz8hjehVlnudeSw
         TO6Q==
X-Forwarded-Encrypted: i=1; AL+hErEl0vx1jB6W9+rtZJPydvzShje1cOgM5bce117kOvwtHqhOCNt3JewJERtHoHgi2q9iPZUHjqLfrNaUFTnqqo+U@lists.infradead.org
X-Gm-Message-State: APuU4Z8JTBL0hRim1YsPztsLa/uy/99VkQMs8eARNyySlE6iWDuQ4ppT
	Nzjlt3UYRXd9YEZsYnSTue9tPaV2cbbZErQgPk0lt5LTuGlESJhv0vJzMVBLQHHfS1A=
X-Gm-Gg: AZFdTZdOzvke0kJx5PRg+Rj0iuAhNff7LnXYmWoRkrABnwUkX3DgS9A/48eRpx44bMo
	gxbnF1ZVir3gUoYTLiXc+/SsVGtnUIrzGm4BC9q+u0HGzPQ2ce+L+2kqRuaqoK8ygDbpgiPM9uF
	KzOvqlUxfdtfWUq8bKdvlFX/TQZwOatVymRVRruWojt0DNSymmkB88+wAxiPQMt+te8983mfQIC
	v4Rb1C3hG1XCjydAoLNau253Rtat7BcE2aAzIA9Hrah7zYDImn881TQ+f3nqcDZJomcyn6CldG1
	dLvf/5lQYpPo7wcyEspO5NGKY2baD1VMeEBXyidttQB0xdC4KE2V6ZMavc89uUIhE4936jtINiN
	ukznTKeh0JPJyBvxOiAfAQmwvgFmomivherETfZiTqfTLUupwced9nPLcHdXvXka98o05yf5SkS
	25UeoU6bc64QkVikgxRecfV9mgGC1WiuoquJSnsKmbguSeMvUQLVl9//R9EniauBsiiJvpZ8yws
	pSCH4Ye5r4q8lBidsFQv/JGPUpTT8r+Yj+9P/W3FPCUdhIH2NCdMmSw4Qy3rkpQZ44K4Yt2M9Jn
	vmTN7wkbEcJyUCqsTWn1m430WgXhWwb4
X-Received: by 2002:a17:903:4586:b0:2ed:fd82:e905 with SMTP id d9443c01a7336-2f03f207db7mr5065875ad.31.1795107591652;
        Thu, 19 Nov 2026 08:59:51 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9bd7:226d:1022:f6ef])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ed3b3c1sm3054985ad.0.2026.11.19.08.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:59:51 -0800 (PST)
Date: Thu, 19 Nov 2026 10:59:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	tanmay.shah@amd.com, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: mailbox: Add AMD PL Mailbox IP
Message-ID: <av8rBP9x0I-ikEJy@p14s>
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
 <20261105051902.1646651-4-ben.levinsky@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105051902.1646651-4-ben.levinsky@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_085952_877313_65BE0056 
X-CRM114-Status: GOOD (  29.70  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 09:18:59PM -0800, Ben Levinsky wrote:
> Document the AMD programmable-logic Mailbox IP used for bidirectional
> FIFO communication between two processor-facing interfaces.
> 
> The Mailbox is a soft IP core instantiated in programmable logic, and the
> same SoC can carry different versions of it, so it is not a SoC block.
> Like other PL soft IP bindings, use a single compatible that names the IP
> core and its version, amd,pl-mailbox-2.1. "pl" distinguishes it from the
> IPI hardware that can also act as a mailbox.
>
> Define the transmit and receive channel indices together with the register
> aperture, interrupt, and interface clock. Describe the FIFO depth chosen
> for each IP instance when the design is synthesized. It cannot be read
> from the registers, and the driver needs it to size received messages.

"register aperture"?  What is that?

> 
> Assisted-by: Claude:claude-opus-5.5
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  .../bindings/mailbox/amd,pl-mailbox-2.1.yaml  | 73 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml b/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
> new file mode 100644
> index 000000000000..dc16a2e1142b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/amd,pl-mailbox-2.1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AMD Programmable Logic Mailbox IP
> +
> +maintainers:
> +  - Ben Levinsky <ben.levinsky@amd.com>
> +
> +description: |
> +  The AMD Programmable Logic Mailbox IP provides bidirectional message passing
> +  between two processor-facing interfaces. Each interface writes messages to
> +  a send FIFO and reads messages from a receive FIFO. The register aperture,
> +  interrupt, and clock described by a node belong to one processor-facing
> +  interface. Channel 0 represents transmit and channel 1 represents receive
> +  for that interface.
> +
> +  The Mailbox is a soft IP core instantiated in programmable logic, not a
> +  SoC block, so the compatible names the IP core and its version (2.1).
> +  The "pl" part distinguishes it from the IPI hardware that can also be
> +  used as a mailbox.
> +
> +properties:
> +  compatible:
> +    const: amd,pl-mailbox-2.1
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  amd,pl-mailbox-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 16
> +    maximum: 8192
> +    default: 16
> +    description:
> +      Depth of the send and receive FIFOs in 32-bit words. The depth is the
> +      C_MAILBOX_DEPTH parameter chosen for each IP instance when the design
> +      is synthesized, so instances in one design can differ, and it cannot
> +      be read from the registers. Must match the synthesized depth.
> +
> +  '#mbox-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - '#mbox-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    mailbox@b2060000 {
> +        compatible = "amd,pl-mailbox-2.1";
> +        reg = <0xb2060000 0x10000>;
> +        interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&pl_clk>;
> +        amd,pl-mailbox-depth = <16>;
> +        #mbox-cells = <1>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1e3f9f2751fe..3722a66b9960 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1306,6 +1306,12 @@ S:	Supported
>  T:	git https://gitlab.freedesktop.org/agd5f/linux.git
>  F:	drivers/gpu/drm/amd/pm/
>  
> +AMD PROGRAMMABLE LOGIC MAILBOX DRIVER
> +M:	Ben Levinsky <ben.levinsky@amd.com>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
> +
>  AMD PSTATE DRIVER
>  M:	Huang Rui <ray.huang@amd.com>
>  M:	Mario Limonciello <mario.limonciello@amd.com>
> -- 
> 2.34.1
> 

