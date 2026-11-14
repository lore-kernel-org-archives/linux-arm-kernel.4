Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB45606A882
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 11:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jcejNeR9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W45qvjQF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BZMV82AAXCCxgE7Hsa51ktlr29+UIpvHYfbEnQ2q08U=; b=jcejNeR9T9zdwnsPaNRuEDHcV7
	jkkRWrhJQbtfUnm3qAHwLzXKeGzcOW0gvLnF7w7Ahb5APCQ7On1gyquZNKn88UDpCvgzyGQ6S4BJH
	eRfAEc2YuPfQfmUML0OKzGxdUXqvk3VAAiYsqqOUPTWoTrXd0NlGzivcjHi7lS6cZ7P2tJV1sh5x7
	1A0VYEIZBV01xKtSu5Iys65BMiJ0Ij8tlZkpQgXRO2R3nTmlcvHDD+g9wE2Y4/IdIahyfS1AMMIct
	ZJmMZrr2Gs05b3UYZRy0Asb8x/8cBbVmsKzCOm5BkueoAWs/TO1UfORlgeTtHXWckoCCOTv66tBQq
	nsI3eDhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBt5-0000000Ft29-04YV;
	Sat, 14 Nov 2026 11:25:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBt4-0000000Ft1f-2OIl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 11:25:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F44E41A3D;
	Sat, 14 Nov 2026 11:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071A41F000C4;
	Sat, 14 Nov 2026 11:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794655537;
	bh=BZMV82AAXCCxgE7Hsa51ktlr29+UIpvHYfbEnQ2q08U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=W45qvjQFqs/yCfEGqFyMi9x2QURtIaZP1yAJMQDJc5W1cy+d3ixJqQV8kvVyvMAtm
	 8Vnh/iMAY+7ZIQtQjvgL/byD4y+YY9AYAUYnWeCnL99HwnUmJCIkHsmSrDO5rViIH3
	 oXcRk/Rhw/OeXlnY3tw6fCx+mTMESj4lXeutg3QZBUT4Hs1dIuJeNdCowrBdB87YIV
	 BU5ma1jYbvtH0sfEfkvGZKpuOElDdv4uEuanSNHHnvHgz46Vp4XT0zR7FPHqsf5WNs
	 6etmPn+FZYX+tth2dy8QBsvV8bX4VEKMGfCFzAyFxYyfhOsTyxlhq+i4HzZht7RXeW
	 hQSnDrbQWYHEA==
Subject: Re: [PATCH net-next v4 1/4] dt-bindings: net: dp83867: add compatible
 and reference ethernet-phy.yaml
From: netdev-bot+sashiko@kernel.org
To: s.trumtrar@pengutronix.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 afd@ti.com, andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 michal.simek@amd.com, edumazet@kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Sat, 14 Nov 2026 11:25:36 +0000
Message-ID: <179465553656.2199510.11430097651218280926@kernel.org>
In-Reply-To: <20261110-v7-2-topic-dp83867-v4-1-a268f83b1ec1@pengutronix.de>
References: <20261110-v7-2-topic-dp83867-v4-1-a268f83b1ec1@pengutronix.de>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch adds `select: properties: compatible: contains:
  const: ethernet-phy-id2000.a231` to…

--

dt-bindings: net: dp83867: add compatible and reference ethernet-phy.yaml

This patch adds a compatible for the DP83867 PHY ID, with an optional
ethernet-phy-ieee802.3-c22 fallback. It also adds a select on the PHY ID,
so dtschema now applies the binding to nodes. The $ref changes from
ethernet-controller.yaml to ethernet-phy.yaml.

> diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> index 4bc1f98fd9fe5..2cd8311ece5e5 100644
> --- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> @@ -8,7 +8,16 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: TI DP83867 ethernet PHY
>  
>  allOf:
> -  - $ref: ethernet-controller.yaml#
> +  - $ref: ethernet-phy.yaml#
> +
> +# only the PHY ID, not every PHY with the c22 fallback
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: ethernet-phy-id2000.a231
> +  required:
> +    - compatible

[Severity: Medium]
With this select, the schema now applies to every in-tree node that has
"ethernet-phy-id2000.a231". The binding still ends with:

    unevaluatedProperties: false

Several Xilinx ZynqMP devicetrees set #phy-cells on their DP83867 nodes.
For example, arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts has:

    phy0: ethernet-phy@21 {
        #phy-cells = <1>;
        compatible = "ethernet-phy-id2000.a231";

The same pattern is in zynqmp-zcu102-revB.dts, zynqmp-zcu104-revA.dts,
zynqmp-zcu104-revC.dts, zynqmp-zcu106-revA.dts, zynqmp-zcu111-revA.dts,
zynqmp-sck-kv-g-revA.dtso and zynqmp-sck-kv-g-revB.dtso. It is also in
zynqmp-sck-kr-g-revA.dtso and zynqmp-sck-kr-g-revB.dtso, with two PHYs
in each.

#phy-cells is not defined in ti,dp83867.yaml or in ethernet-phy.yaml. With
this patch, will make dtbs_check report "Unevaluated properties are not
allowed ('#phy-cells' was unexpected)" for all 12 of these nodes?

The commit message says:

    Reference
    ethernet-phy.yaml instead, which also describes reset-gpios and the
    other generic PHY properties existing devicetrees use.

That doesn't seem to hold for #phy-cells.

The later patches in the series keep the select and
unevaluatedProperties: false. They don't change these DTS files either, so
the mismatch is still there at the end of the series.

Should the series either drop #phy-cells from the Xilinx devicetrees, or
allow it in the schema? It looks bogus on an MDIO PHY that isn't a generic
PHY provider.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110-v7-2-topic-dp83867-v4-0-a268f83b1ec1%40pengutronix.de

