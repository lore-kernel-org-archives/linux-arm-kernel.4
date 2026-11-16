Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0718606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eiDgkEDf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QlZTyq5c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hV5HxN4iZUg/iKmw0/HzwNF9cux4HXGPAW6rNXzLRBY=; b=eiDgkEDfHZxCUAs3riCK06Y3vT
	XDm05zh2seBMWx+zRnRYhqAqbhMyTXKxYXOwmX2usOo5QIKKFsGafRMZprUFHaVhVKz3DKxvcwtXT
	q+BJCVCzKEwz4J/3ZHqEEihQaHin8H8SivceKpqaIZqs6De3w28JVNj6A6gKSIIbbDqriUr8C/odd
	Lm5OqKK/y6lSjAX5/LjARH/ei5g2Zx2U+i0XQVlpHrBlxbE4h9qGC34a1+6JBSlxppLZQM3u9tLw/
	z+JnkFnIPPVZGOmhNVekMawuCh6EITHPqC8IsLN6w/MXI4EpK0x/3tdigP+i3w59YIC/hXJv3RW5S
	X1id+t2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzUP-00000003Cgb-2nSr;
	Mon, 16 Nov 2026 16:23:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzUN-00000003CfV-3Xf2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:23:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 501F94664C;
	Mon, 16 Nov 2026 16:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5CE1F0092A;
	Mon, 16 Nov 2026 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794846207;
	bh=hV5HxN4iZUg/iKmw0/HzwNF9cux4HXGPAW6rNXzLRBY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=QlZTyq5cHKxeaEi+fzkvC/Lbqk4D0G3AeGRHdYzwyTMeevQL6y/lFn1ohvEuxIjD5
	 ZnsC/a9Lk8PhaT23sSFm3Nzin+NBnYyaU3VwfKNJm2QtJqj7PsHs1mdANQgQGRmBBh
	 D+uZaw82PA67VQzCOHf4IXqBi4GNtS+BiLF/GZhlShQ6YKlb/XriqZvQIPblyrs6FO
	 YXIc3DDbjbmGaEJMuKE1wwglvvQAiESh1ZdtNPZXpvQWPqnGx3Xk+1URl8YGVrgL9Z
	 syQF+J+gBXfuRFm93Z5NWObV7XxuePV98Ig4McfuNxOGCZmELlQx2oR+AbpKTRs7XW
	 UxdDIXN5KPAxg==
Date: Mon, 16 Nov 2026 10:23:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Jan Remmet <j.remmet@phytec.de>, 
 upstream@lists.phytec.de, linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev, 
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>, Benjamin Hahn <b.hahn@phytec.de>, 
 linux-arm-kernel@lists.infradead.org, Christian Hemp <C.Hemp@phytec.de>, 
 Conor Dooley <conor+dt@kernel.org>
To: Yannic Moog <y.moog@phytec.de>
In-Reply-To: <20261116-imx8mp-phyflex-v1-1-4adcf8b4d373@phytec.de>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
 <20261116-imx8mp-phyflex-v1-1-4adcf8b4d373@phytec.de>
Message-Id: <179484619251.2165678.3116272117041652680.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: fsl: add phyFLEX-Libra i.MX 8M Plus
 FPSC
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


On Mon, 16 Nov 2026 11:54:40 +0100, Yannic Moog wrote:
> Add bindings for phyFLEX-i.MX 8M Plus System-on-Module [1] along with a
> carrier board (Libra) that join to an SBC.
> 
> [1] https://www.phytec.eu/en/produkte/system-on-modules/phyflex-imx-8m-plus-fpsc/
> 
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/fsl.yaml:1231:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/arm/fsl.yaml:1236:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261116-imx8mp-phyflex-v1-1-4adcf8b4d373@phytec.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


