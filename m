Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A200606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vm+V2I/6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FTdQFNtp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mg4tO9uvKi9Gwzh0PfSMjaKb+RogQEZ6WjO+Jsmx8hk=; b=Vm+V2I/6AONNbWnzABCrvmYirf
	OGbu101eDyBcHjc5B+x5sSZheUQX6BqjLDiBD95vkhKVmYt2oRGE9vBYjTg//HEozL91jtkPOkBt2
	XO1Fbgzb+GQSqvRERRXo09ObIkR8T41si1SzKUeqxxrKNeZCNbFsH6juApSEYlRxbbGUd9VfWVzsG
	HctkkVwk3z9xnegpY1P7mdYVW/lbZBYKKUiG1PbqHhozxhnMaTxo2QU7hUxdhfoqtIZ0TP/sRqFjZ
	9nXMqiF77IM83Ynigsi/FIeDe6bjsS6FIWAqN2JvZ8ZYmKLNFNcev9MW7XmAmCCYLtnf9+/D32Obc
	TQrUrXfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPlO-0000000FHEH-1YFz;
	Fri, 20 Nov 2026 14:38:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPlN-0000000FHE0-0Vcv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:38:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F98D612B7;
	Fri, 20 Nov 2026 14:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD1B1F000D3;
	Fri, 20 Nov 2026 14:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795185531;
	bh=Mg4tO9uvKi9Gwzh0PfSMjaKb+RogQEZ6WjO+Jsmx8hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FTdQFNtpVu6zGOw4c+pl81NSiYbcDLna7/0xJ3TQeCLtJSY7Sfd1AIMDKt1tSVCXH
	 Y774gVMNcmIJgWek0APsIQqYa82ejrv7ac+ns2VQdN8+8rNvFJOO2uyAWGCKLoy5Fh
	 AiU+apX/F0EJci0LrF1vI6sQCHh54s6nHnqiTEIoaqMpyNMLAElGT1cHWYS5NOcylr
	 JcNijs5dg6nsjqCUT5W864+FtUMxprZMA1SoaDVCNWJZ8mEBDMtricr36oZY2kbioJ
	 pQhyhuTkiFzOegZSmVRZaqSoZrND9fFnHGfIM+AFvGpB2QnRXuOxRQC2bAIhlEo09H
	 0D41ONaNOO7Cg==
Date: Fri, 20 Nov 2026 15:38:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yannic Moog <y.moog@phytec.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Benjamin Hahn <b.hahn@phytec.de>, 
	Christian Hemp <C.Hemp@phytec.de>, Jan Remmet <j.remmet@phytec.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	upstream@lists.phytec.de
Subject: Re: [PATCH 1/5] dt-bindings: fsl: add phyFLEX-Libra i.MX 8M Plus FPSC
Message-ID: <20261120-successful-amiable-porcupine-cef7ae@quoll>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
 <20261116-imx8mp-phyflex-v1-1-4adcf8b4d373@phytec.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116-imx8mp-phyflex-v1-1-4adcf8b4d373@phytec.de>
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

On Mon, Nov 16, 2026 at 11:54:40AM +0100, Yannic Moog wrote:
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
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 656f2596e1d53..2d21a1949d949 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1225,12 +1225,18 @@ properties:
>            - const: kontron,imx8mp-osm-s               # Kontron i.MX8MP OSM-S SoM
>            - const: fsl,imx8mp
>  
> -      - description: PHYTEC phyCORE-i.MX8MP FPSC based boards
> -        items:
> -          - enum:
> -              - phytec,imx8mp-libra-rdk-fpsc  # i.MX 8M Plus Libra RDK
> -          - const: phytec,imx8mp-phycore-fpsc # phyCORE-i.MX 8M Plus FPSC
> -          - const: fsl,imx8mp
> +      - description: PHYTEC i.MX8MP FPSC based boards
> +        oneOf:
> +          - items:
> +            - enum:
> +                - phytec,imx8mp-libra-rdk-fpsc  # i.MX 8M Plus Libra RDK
> +            - const: phytec,imx8mp-phycore-fpsc # phyCORE-i.MX 8M Plus FPSC
> +            - const: fsl,imx8mp

Except lack of testing, don't nest oneOf.

Best regards,
Krzysztof


