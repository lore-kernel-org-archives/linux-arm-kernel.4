Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D7C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 04:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cK4Imcl2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QWcihlbp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NHMGWMgewe8kC7ESdHx6pfUaRaII6jAZvHzMMG3ecVY=; b=cK4Imcl2UYZJNQr0wCH+MeAzPZ
	ppJENmmDkmnGr8uWwxqhF2khmFxTo8l9vbCMpVySLfWSlRGqC/dto6xvuBYDHT5LH+gdv470KSlsV
	b5hbHdplMwxuQ0/93oc2ICqPIcnkrjMOUzKbkkd7W28BZPFO9l05Ve6E0sOfqoeHBNuISt2I4xO8C
	GNNJPabbcPA/d3Cbr4CWmpxtmYuH8Lmg13NWnlXpKId7uHlqxfc2U5tRu1ebRKAHaZi+Q3eE+qd/k
	ADMwb/oYRp1blY3HNg2UOXf1bkHOGsNpRNMl7O5hKNqjkNh39By38HlHxxTsXLTCRiB1oZXOPtd2W
	dKA3Xrtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSo55-000000016PG-1qDx;
	Mon, 16 Nov 2026 04:12:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSo4z-000000016O2-3Lu1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 04:12:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 37E2B435C9;
	Mon, 16 Nov 2026 04:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC301F000C4;
	Mon, 16 Nov 2026 04:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794802349;
	bh=NHMGWMgewe8kC7ESdHx6pfUaRaII6jAZvHzMMG3ecVY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QWcihlbpgfpt2SpuJ80O42O4m98vSHiyI3tHOEK5h82H6L2fGaVPdwHb1EuhqbxCu
	 K48PXFgTtPpZwIpp+VSYxR6iLzf0gN5mbcTKS18F0mnfDIFrg64xzrwEEsmmVOHlVh
	 N333wOgkynOVOjFdwuHSaU+F/eQ0zyLfpc7L3SZdAt4AaJxTEVyhfmoEtFynZMcQJ2
	 mbzAUxmqhhkPGPifgO9xo120qs0D6XqP8gYoJVG7HQljiRGbdKW/Y4VaSsrGZuLrVA
	 tCxLmJpHPLHYBwgI/CXuEd5R40wirsBqDfav9zgYpvVp3PxNCdNTaNvk2EcgYhlFof
	 zZjEvHSdIObYw==
Subject: Re: [PATCH net-next v5 2/6] dt-bindings: net: xlnx,xxv-ethernet: Add
 Xilinx XXV 10G/25G Ethernet
From: netdev-bot+sashiko@kernel.org
To: suraj.gupta2@amd.com
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 04:12:27 +0000
Message-ID: <179480234767.3136.1383853926077576761@kernel.org>
In-Reply-To: <20261114182947.2908628-3-suraj.gupta2@amd.com>
References: <20261114182947.2908628-3-suraj.gupta2@amd.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml
  blocks the inherited properties that conflict with its stated design:…

--

dt-bindings: net: xlnx,xxv-ethernet: Add Xilinx XXV 10G/25G Ethernet

This commit adds a dedicated schema for the Xilinx XXV 10G/25G Ethernet
subsystem, which has an in-core PCS/PMA and uses an external AXI DMA or
MCDMA controller. It requires xlnx,rxmem and adds the optional
xlnx,has-statistics-counters property. It also disallows phy-handle, phy,
phy-device and pcs-handle, and restricts managed to in-band-status.

> diff --git a/Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml b/Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml
> new file mode 100644
> index 0000000000000..caf582c72a8dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml

[ ... ]

> +  phy-mode:
> +    enum:
> +      - 10gbase-r
> +      - 25gbase-r
> +
> +  # The subsystem has no MDIO bus master and its PCS is in-core, so neither
> +  # an external PHY nor an external PCS can be attached. phy and phy-device
> +  # are the deprecated spellings of phy-handle.
> +  phy-handle: false
> +  phy: false
> +  phy-device: false
> +  pcs-handle: false
> +
> +  managed:
> +    const: in-band-status

[Severity: Low]
Should fixed-link also be set to false here?

fixed-link comes in through the ethernet-controller.yaml $ref in the same
way as the other blocked properties, so unevaluatedProperties: false does
not reject it. ethernet-controller.yaml also does not make fixed-link and
managed mutually exclusive. Its only dependencies entry is pcs-handle-names
requiring pcs-handle.

The commit message and the binding description both say "the link is
always managed in-band". Even so, this schema accepts two configurations
that go against that.

The first is a node with fixed-link alone. In drivers/net/phy/phylink.c,
phylink_parse_mode() checks fixed-link after the in-band default:

	if (pl->config->default_an_inband)
		pl->cfg_link_an_mode = MLO_AN_INBAND;

	dn = fwnode_get_named_child_node(fwnode, "fixed-link");
	if (dn || fwnode_property_present(fwnode, "fixed-link"))
		pl->cfg_link_an_mode = MLO_AN_FIXED;

This overrides the default_an_inband = true that
axienet_xxv_phylink_set_capabilities() sets in the XXV driver patch later
in this series. Carrier would then come from the emulated fixed state, not
from the PCS status that axienet_xxv_pcs_get_state() reads.

The second is a node with fixed-link plus managed = "in-band-status". The
binding allows both properties, but phylink_parse_mode() rejects the
combination:

		if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
			phylink_err(pl,
				    "can't use both fixed-link and in-band-status\n");
			return -EINVAL;
		}

So the device fails to probe from axienet_probe()->phylink_create(), even
though dt_binding_check accepted the node.

Later patches in the series don't change this binding file, so the gap is
still there at the end of the series. Adding "fixed-link: false" next to
the other blocked properties would close it.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114182947.2908628-1-suraj.gupta2%40amd.com

