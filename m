Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC7D606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 19:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KsElwtdC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T07e69Bj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vHDVIWi0stLdJ+2A+4zasrNWOSGgPQx8IYgHUVcpL7A=; b=KsElwtdC+YwY6BgDomJFnNce38
	8CmIIXoUOLU5ncJyFvGBuIQJlHJla2YGmmbFSOTdXtPpAH85/Q3wqiBX4HR9GrodMZySG26B4WvRE
	qydW53/EKW9KUM0Z6w+r2ZrHY/QUo4f/ArIYqFb7gDxRWmMwjtS5+2jvlOcMXlzmUbetyV9yglFR+
	YOnERWREbj/xWL4lmvDLG3gWHsKjiBvplISxgbjCL3Ihpm6x7d0XpZ3uwv8teTAUzFPiJy5L1h22C
	e5Bs4tS+qPUjj37fI/+oENDtLdY/meB0szqE0MSygwCtqTuxlfrK52XQQ5IcEIMMqOG0nhTU/SIlB
	eFgdKpFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTl0Y-0000000A4dO-1Kp0;
	Wed, 18 Nov 2026 19:07:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTl0X-0000000A4d7-0HY0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 19:07:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC5E343B7C;
	Wed, 18 Nov 2026 19:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5079B1F000C4;
	Wed, 18 Nov 2026 19:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795028868;
	bh=vHDVIWi0stLdJ+2A+4zasrNWOSGgPQx8IYgHUVcpL7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T07e69Bjfc366PA37tW7HGzrn2O+873kedsPzUDGl3AOXX+3BXfi2/Wxq9Tc5rVN4
	 VlZAUCwOA2n4oRwBQZ/2xCbBlN/CvQc8G0P9ejdFiMwyKGLVLiAFNcvx+nqNX2sFhY
	 307EeS7q6lnxU8S2oJGhAEN/bTYHC/x0eu3pcsxuAn8SwvqPIIgMiHmzV0YLciRm/6
	 WaX2SeD45rLPVH9DJ1kcXGTZPEuyRofMMRI9SjKc1ZzqtE09HpVI2YmYIpvdvpy9bE
	 NlScqdSl9BUXltIjiVIedHY8w2hM/x65H8D/xFxI9+CLW5NuwET+IMEao37wlJwUZ9
	 otHHP0T+AEdzA==
Date: Wed, 18 Nov 2026 13:07:45 -0600
From: Rob Herring <robh@kernel.org>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Cochran <richardcochran@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v4 03/10] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
Message-ID: <20261118190745.GA198891-robh@kernel.org>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-3-c41902e5f2fa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-shikra_ethernet-v4-3-c41902e5f2fa@oss.qualcomm.com>
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

On Tue, Nov 17, 2026 at 02:15:23PM +0530, Mohd Ayaan Anwar wrote:
> Shikra's EMAC requires two additional clocks for NOC interconnect
> access (axi-noc, pcie-tile-axi-noc) beyond the standard four, and an
> OPP table with required-opps to vote VDD_CX to SVS when the NOC clocks
> are enabled.
> 
> Add qcom,shikra-ethqos to the compatible enum and use an if/else
> block to constrain Shikra to exactly six clocks and require
> operating-points-v2 and power-domains, while leaving existing
> compatibles unchanged.
> 
> Add the relevant compatible to the binding document for snps,dwmac as
> well.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
> v4: moved operating-points description to the top-level, and added
> power-domains as a required property for Shikra.
> ---
>  .../devicetree/bindings/net/qcom,ethqos.yaml       | 54 ++++++++++++++++++++--
>  .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
>  2 files changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index ef520f810577..6bd4bded650a 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -14,9 +14,6 @@ description:
>    dwmmac based Qualcomm ethernet devices which support Gigabit
>    ethernet (version v2.3.0 and onwards).
>  
> -allOf:
> -  - $ref: snps,dwmac.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -32,6 +29,7 @@ properties:
>            - qcom,qcs404-ethqos
>            - qcom,sa8775p-ethqos
>            - qcom,sc8280xp-ethqos
> +          - qcom,shikra-ethqos
>            - qcom,sm8150-ethqos
>  
>    reg:
> @@ -57,9 +55,11 @@ properties:
>        - const: sfty
>  
>    clocks:
> -    maxItems: 4
> +    minItems: 4
> +    maxItems: 6
>  
>    clock-names:
> +    minItems: 4
>      items:
>        - const: stmmaceth
>        - const: pclk
> @@ -67,6 +67,8 @@ properties:
>        - enum:
>            - rgmii
>            - phyaux
> +      - const: axi-noc
> +      - const: pcie-tile-axi-noc

These sound like inter-connect clocks. Shouldn't they be controlled by 
a interconnect driver?

>  
>    iommus:
>      maxItems: 1
> @@ -81,6 +83,14 @@ properties:
>        - const: cpu-mac
>        - const: mac-mem
>  
> +  operating-points-v2:
> +    description: |
> +      For Shikra, the OPP table specifies the rates for the NOC access
> +      clocks in "stmmaceth", "axi-noc", "pcie-tile-axi-noc" order.
> +
> +  opp-table:
> +    type: object
> +
>    phys: true
>  
>    phy-names:
> @@ -95,6 +105,42 @@ required:
>    - clock-names
>    - reg-names
>  
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,shikra-ethqos
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +        clock-names:
> +          items:
> +            - const: stmmaceth
> +            - const: pclk
> +            - const: ptp_ref
> +            - const: rgmii
> +            - const: axi-noc
> +            - const: pcie-tile-axi-noc

No need to repeat the names here. Just 'minItems: 6'. I suppose you 
might also want:

contains:
  const: rgmii

> +      required:
> +        - operating-points-v2
> +        - power-domains
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: stmmaceth
> +            - const: pclk
> +            - const: ptp_ref
> +            - enum:
> +                - rgmii
> +                - phyaux

Just 'minItems: 4'

Rob

