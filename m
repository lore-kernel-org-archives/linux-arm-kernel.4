Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CA2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 17:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y75oPRgr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YBbd5mtS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w8vNoC9Nxsw0YxO6Po42QLoQ5/fTPMksdeWkGWXJRYg=; b=Y75oPRgrSUtHmQR3N/5Q7XqTmo
	y8jiMe8fRa7RxWzS9zCheRxMRqCHrKuuE2wqXlQbhFkN/BCTi7xz/cvegKO5ehdAnD/XmNvBqkbRv
	xv//oqqQ2R1V02HdL8m5yz/fdYd8F9e4fUFUQrI/aDbqnEvGMfJYKjYbOuM/BNVjcFm9NSECVxueO
	OT/4e/mYsAI6Xx1zOHRnIvdGz8nqohfM0f/QRELqbYbHYpJyPK/nBZZ9271uJhGE5D3e4tE6MTAfa
	GqhSlvEe3ZcZ44DCEPInHtjvTcXBsr3fBf7a/UYCoSLttEA9XW097YYHZWM65y0qfJYtoBAhlv9rn
	maN3Xx3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBvF-00000007HRW-0U2b;
	Wed, 11 Nov 2026 17:15:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBvD-00000007HRJ-2JfX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 17:15:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E81DB4144E;
	Wed, 11 Nov 2026 17:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D0A1F00A05;
	Wed, 11 Nov 2026 17:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794417342;
	bh=w8vNoC9Nxsw0YxO6Po42QLoQ5/fTPMksdeWkGWXJRYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YBbd5mtSUp/RiEVHPeFjrL7da0RxMdI9MfB0nbzxVOv7RTGdcgZpyua3TNCwi5Dib
	 +Z3PbFFN4/4ztEmPqd/4p47SQA6+h066iQzBEDxlRtmsZXKhNPjIg+PKpCtC+zyy69
	 8QHRCtTfXQb7GL16zBWUvAn+uI9nQVFSW1bpEa3iQH2DH8wPRt8B1Nuib5QYhWcp7V
	 Y3a4aaXC4HILFVFU0N6GrG1s6+RHSBGsbq3iEH4jrcgB1X2aHe27spSiqRsbxDvQRr
	 v1/0iHch+2nhANOHGJRXmRg67o58Ue8nhnfIDI7lBoa1IE6GIAuxtjDbzTl9agaycG
	 K6p3Sb+ZkDSvw==
Date: Wed, 11 Nov 2026 11:15:40 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, Ulf Hansson <ulfh@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: mfd: Describe the BCM6846 PMC complex
Message-ID: <20261111171540.GA3718375-robh@kernel.org>
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
 <20261111-xg6846b-bcmbca-xrdp-reset-v4-2-17035a5e8ad2@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-xg6846b-bcmbca-xrdp-reset-v4-2-17035a5e8ad2@kernel.org>
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

On Wed, Nov 11, 2026 at 12:00:43PM +0100, Linus Walleij wrote:
> The third generation Power Management Controller (PMC3) has
> different subdevices.
> 
> Identify the parent with the BCM6846-specific "brcm,bcm6846-pmc"
> compatible.
> 
> Describe the complex as a simple-mfd with a PMB bus child owning its
> register resource. Include the PMB power, clock and reset controllers and
> PVTMON, with its acquisition clock and reset resources.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml  | 87 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 88 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
> new file mode 100644
> index 000000000000..6082e30d37ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/brcm,bcm6846-pmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM6846 Power Management Controller
> +
> +maintainers:
> +  - Linus Walleij <linusw@kernel.org>
> +
> +description:
> +  The third generation Power Management Controller (PMC3) contains several
> +  register banks. This binding describes the Power Management Bus (PMB)
> +  interface within Procmon. The PMB child owns its register bank. The parent
> +  provides address translation and does not own a register bank.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: brcm,bcm6846-pmc
> +      - const: simple-mfd
> +
> +  ranges:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +patternProperties:
> +  '^bus@[0-9a-f]+$':
> +    $ref: /schemas/soc/bcm/brcm,bcm6846-pmb.yaml#
> +    description: PMB configuration, keyhole and address mapping registers

This causes the bus node to be validated twice (once here and once when 
applied by compatible). And then because the pmb schema does the same 
thing with its child nodes, those will be validated 3 times. Twice I can 
live with, 3 times not so much. The fix for all this is either merge the 
schemas to 1 file or do:

'^bus@[0-9a-f]+$':
  type: object
  additionalProperties: true
  properties:
    compatible:
      contains:
        const: brcm,bcm6846-pmb

  required:
    - compatible

That ensures the node contains enough to apply the child schema. 

Since there's 3 levels here, you could also do some combination of both.

Rob


