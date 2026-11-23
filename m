Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E282A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1ZynTonC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QFozejRV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ICMJa1FXDkLpeqDBKL+J43KXnXXLbTYi1fHx2l/sa/I=; b=1ZynTonCw0J1nk7OtK3MkoR3SG
	eNogaxZKCgbDJHRoh94CWdsmsoUqd7CNzCl9j75iAVvTpEfGzcN8IzJY3iscvSJhRT229+9R1he5T
	V9KiaY2nI0C9+q+LP9X/UzyMFH1H4uIY/kM+rc0uNvomSEtnGoe1+fqda7YyP7afhcXEhS4ecUv5b
	yi8h0S29wIKu1uWTs8aNZoTcf+VjewebuV+F+PiPE35oqbGAy2YzWtSMGBbPP/AvI0yf+fWJs8EyW
	nPSrieow1MA3tGafrNpqIe5TuiQlRKgODfR2Hi9JEFov666uQLU6BYFFwXzeQcqSLWC2wwTdNo63/
	hxXChrIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRxg-000000035ij-1myj;
	Mon, 23 Nov 2026 11:11:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRxe-000000035iJ-3aa7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:11:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E587410F9;
	Mon, 23 Nov 2026 11:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B011F000C4;
	Mon, 23 Nov 2026 11:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795432310;
	bh=ICMJa1FXDkLpeqDBKL+J43KXnXXLbTYi1fHx2l/sa/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QFozejRVYJDf+6Ka6Yqgp2wwhdOUwXrgWfgZzy69be+GIldHLaLHE6S2H5HQskd+g
	 Hd/QGXwNRChubRjVCtMuZt8JUBw7OoRQmjdJzOnATgNeOs5bQ8hIPfMog23QSC4l2c
	 m4gMMS7hFCbkSCqS2MMpsqY7x8V43UFIzU4umOXC7utNPtWGLVbaRnugVXJpJ4d7zD
	 DSVGNmEmNIpn+ar/6xQexD1719DC9FXpBO7j+Sp3JF2b4oYnOIMa5uJuMRkYXVWWP/
	 v2Z+DiLLAM6JWNNtmdPlj6Wdgjx9Z2QTu3EGR6vjActqeJwnzvBgwTDs8/aw9pM0BG
	 Mv5jOjy4L5IYA==
Date: Mon, 23 Nov 2026 12:11:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [RESEND PATCH 1/7] dt-bindings: power: st: add STM32MP PM domain
 binding
Message-ID: <20261123-pretty-strict-caracara-bfcaac@quoll>
References: <20261116104054.94115-1-patrick.delaunay@foss.st.com>
 <20261116114024.RESEND.1.If3d55e03486413ca40ac73f9bf07046e76a00f0a@changeid>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116114024.RESEND.1.If3d55e03486413ca40ac73f9bf07046e76a00f0a@changeid>
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

On Mon, Nov 16, 2026 at 11:40:26AM +0100, Patrick Delaunay wrote:
> Add binding documentation for the power domains found on
> STMicroelectronics STM32MP SoCs.

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  .../bindings/power/st,stm32mp-pm-domain.yaml  | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/st,stm32mp-pm-domain.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/st,stm32mp-pm-domain.yaml b/Documentation/devicetree/bindings/power/st,stm32mp-pm-domain.yaml
> new file mode 100644
> index 000000000000..4ab477fb4499
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/st,stm32mp-pm-domain.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/st,stm32mp-pm-domain.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32MP generic power domain
> +
> +maintainers:
> +  - Patrick Delaunay <patrick.delaunay@foss.st.com>
> +
> +allOf:
> +  - $ref: /schemas/power/power-domain.yaml#
> +
> +description: |
> +  The STM32MP SoCs contain a D1 domain which defines the devices assigned to
> +  Cortex A cluster, the devices in this domain are functional only when this
> +  cluster is not in low power modes (Stop modes) with clock OFF.
> +
> +  This PM domain node represents this dependency, based on PM framework and
> +  without wake-up path support.
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp-pm-domain
> +
> +  '#power-domain-cells':
> +    const: 0
> +
> +  power-domains:
> +    maxItems: 1

I don't get the purpose of this binding. There are no resources here, so
this looks like fake intermediary (meaning: non-controllable). Why the devices cannot reference
final domain?

> +
> +additionalProperties: false

this goes after required block.

> +
> +required:
> +  - compatible
> +  - '#power-domain-cells'
> +  - power-domains
> +
> +examples:
> +  - |
> +    power-domain-d1 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).


Best regards,
Krzysztof


