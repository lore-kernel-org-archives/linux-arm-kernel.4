Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066C760A2616
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N7JEkHj0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=KX4t3g0e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j0OFUyWGFsnHOx/jru7yE6httZZaLm6I3BJksdA09jw=; b=N7JEkHj0Z8W8LJHRDCuY9veFGz
	9u3N9biCj3Yu+hGWHcczDF2yEFKTzV+fWzTy+WkunIDIHVm0K4LZ9eWvZ1ttpw703BNyU9VxHG1DG
	d7MkupKbSQEk48MQI0xCEqL+BPFQ+7/cBhDYBnJ7022lhrmZN7rS+NS9+SqDAdrQ9dLuAh8eOd9N0
	OJ4K4hzeK5byEvbITdWHwhC+U3VA4Nptn7jqrlhM/aB/RkV4AtFeZP+DXEnNzpHXYyoQAAH9ZcdV8
	fqSltTv5mpfc7Or6MoqP0gk1/exRpWYp3nw1CsaVQUa2kmJcxMqJfuaxnYmKAlXaeNn+Nv2SuOh2Y
	Q9cIAZQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrCw-0000000Cszs-2716;
	Fri, 13 Nov 2026 13:20:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrCt-0000000CswB-0lgY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=j0OFUyWGFsnHOx/jru7yE6httZZaLm6I3BJksdA09jw=; b=KX4t3g0eJVWmTu/lZOhr4WiZLw
	eBCvGBf9DJXjnXkHFtAmz0vu18yN+3KV/Se0HIulgfV06weLz1jv7ZUHlf2oDwl9J5A49sy5d9kYk
	wg7lMUpxFrBxFhcq2GNdITdVQdaX47/esrDXL42b/tHRDOJoxFpOj4ja46nxokezBufI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xRrCW-00GHU2-1L; Fri, 13 Nov 2026 14:20:20 +0100
Date: Fri, 13 Nov 2026 14:20:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev, git@amd.com,
	neelisrinivas18@gmail.com
Subject: Re: [PATCH net-next v4 1/8] dt-bindings: net: add Xilinx TSN
 Endpoint Ethernet MAC
Message-ID: <13864fbe-6cd1-4d70-afee-bd3d3be163f3@lunn.ch>
References: <20261113-patches_v2_external-v4-0-56bb26f042a4@amd.com>
 <20261113-patches_v2_external-v4-1-56bb26f042a4@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-patches_v2_external-v4-1-56bb26f042a4@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_052043_329030_63E8CC1A 
X-CRM114-Status: GOOD (  15.27  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> +      xlnx,max-learning-entries:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 256
> +        maximum: 1920
> +        default: 1920
> +        description:
> +          Maximum number of addresses the hardware address learning engine
> +          can learn on each network port (MAC1 and MAC2). This is the
> +          MAX_LEARNING_ENTRIES IP configuration parameter, and no register
> +          reports it. The endpoint port does not take part in hardware
> +          address learning.

Is this a synthesis parameter? No other switch that i know of has it
in DT. The driver hard codes the value based on the compatible. Why
does that not work for you?

> +      mdio-1:
> +        $ref: /schemas/net/mdio.yaml#
> +        description:
> +          MDIO bus controller for MAC1. Registers reside inside the mac1
> +          reg-names window.
> +        unevaluatedProperties: false
> +
> +      mdio-2:
> +        $ref: /schemas/net/mdio.yaml#
> +        description:
> +          MDIO bus controller for MAC2. Registers reside inside the mac2
> +          reg-names window.
> +        unevaluatedProperties: false

How hard coded into the design is the number of ports? The way the DT
is structured, it does not seem easy to add another port. It is more
normal to put all port properties within one node, so you just need to
cookie cutter that node, not add new nodes all other the place.

> +        switch@38000 {
> +            compatible = "xlnx,tsn-switch";
> +            reg = <0x38000 0x8000>,
> +                  <0x00000 0x14000>,
> +                  <0x20000 0x14000>;
> +            reg-names = "switch", "mac1", "mac2";

> +            mdio-1 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                phy0: ethernet-phy@0 {
> +                    reg = <0>;
> +                };
> +            };
> +
> +            mdio-2 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                phy1: ethernet-phy@1 {
> +                    reg = <1>;
> +                };
> +            };

Interesting that this is address 1, where as the other is address 0.
Just to be sure, there are two fully independent MDIO bus masters?

This 


> +
> +            ethernet-ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                ethernet-port@0 {
> +                    reg = <0>;
> +                    ethernet = <&ep_mac>;
> +                    phy-mode = "internal";
> +
> +                    fixed-link {
> +                        speed = <1000>;
> +                        full-duplex;
> +                    };
> +                };
> +
> +                ethernet-port@1 {
> +                    reg = <1>;
> +                    phy-handle = <&phy0>;
> +                    phy-mode = "rgmii-id";
> +                };
> +
> +                ethernet-port@2 {
> +                    reg = <2>;
> +                    phy-handle = <&phy1>;
> +                    phy-mode = "rgmii-id";

Are these two PHY internal or external? Using rgmii internally is O.K,
but odd. Normally 'GMII' or 'internal' would be used.

    Andrew

