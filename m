Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54B560A261F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v/wYLR8s;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GVVA2TtO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xyPkutf+7u4MBeQWcEZC0BYLhd811Pqb+vA5vUZ5q7U=; b=v/wYLR8sx2O8dX4gqBMWhQaja9
	iMMnBwlQ4iTDUzVbAWMTTfpc6og7u+dKeqneblwbLnleD3YNNmRAIFv3iJr+CELqlNiK96kkN7wIt
	KeZcfL/Ul7tixkJuqeVa9i7F8gRNENXtCqGWXtbkpVsmt28JNyJzYiSX+v4nIOwRMrli0I4jaljB7
	ME2aK6IOpEa0ZwXpq/9/ydeW1f4wNO4myTd7grn+idja5JTYNm+d4eQluuKgFS/bBKeblQFsV2B6s
	gK8iQhohMnYIV0IGlHZ5XGiXbZeoy9D0rHKV68RIJ7O88m+Rd0UXhF4xY3vnIX3kEaRL/pabE0B3N
	dXCzNnaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJ1J-00000005sHN-2tSI;
	Tue, 17 Nov 2026 13:14:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJ1I-00000005sGg-0QrK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:14:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4827E634AB;
	Tue, 17 Nov 2026 13:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A131F000C6;
	Tue, 17 Nov 2026 13:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921283;
	bh=xyPkutf+7u4MBeQWcEZC0BYLhd811Pqb+vA5vUZ5q7U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GVVA2TtOKCATkUVgz44orb44F6ykiWv6QfYowOc81WmQ5JHbSJnuEIvtXX1eDP5x7
	 +eaxtRfiU4i1bPhGayTJ+jpfq5sHebMIW0mVYD39Vb1hZnQm2tGbfGE5kXdeExBOBi
	 UqQhcVTTS24CHnLWE7HVH6/WpFwwpCSG0W8i+X70EtBrNz1NPT3viafmBK5Xc6Ak+U
	 0lfpu0s0ua0zUNDS08vjQfBILohX79k1XcEVe8ua5Kh3r4J2XrTsMeIFGwcUlfCIkA
	 /XOvRGzAEIaBCoJ4TU1oF1KE2aZ9ayNraIrK9MPOPFBHgB6sNvnlAHYVnCO+pFop1D
	 nIdz+1F2ROIrA==
Subject: Re: [PATCH net-next v4 1/8] dt-bindings: net: add Xilinx TSN Endpoint
 Ethernet MAC
From: netdev-bot+sashiko@kernel.org
To: srinivas.neeli@amd.com
Cc: nagadheeraj.rottela@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, michal.simek@amd.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 edumazet@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, git@amd.com, neelisrinivas18@gmail.com
Date: Tue, 17 Nov 2026 13:14:41 +0000
Message-ID: <179492128136.3136.2884088710304095071@kernel.org>
In-Reply-To: <20261113-patches_v2_external-v4-1-56bb26f042a4@amd.com>
References: <20261113-patches_v2_external-v4-1-56bb26f042a4@amd.com>
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

- [Low] The top-level schema never requires the '^ethernet@[0-9a-f]+$'
  (xlnx,tsn-ep-mac) child or the '^switch@[0-9a-f]+$' (xlnx,tsn-switch)…
- [Low] The per-xlnx,num-priorities allOf branches force tx-queues-config
  to hold exactly queue0..queue(N-1).
- [Low] The wrapper compatible is IP-version-specific ('xlnx,tsn-
  endpoint-ethernet-mac-3.0').
- [Low] The commit message says 'Each external port@N references its PHY
  through a phy-handle in the matching mdio-<N> child.' Since v3, the…
- [Low] ethernet-port@1 and ethernet-port@2 restrict phy-mode to gmii,
  rgmii and rgmii-id, which excludes rgmii-txid and rgmii-rxid.
- [Low] clocks/clock-names is a fixed list of six required entries (gtx,
  gtx90, host_rxfifo, host_txfifo, ref, s_axi), with no conditional on…

--

dt-bindings: net: add Xilinx TSN Endpoint Ethernet MAC

This adds a YAML binding for the Xilinx TSN Endpoint Ethernet MAC IP in
its Bridged Endpoint configuration. The top-level wrapper node owns the
shared clocks and xlnx,num-priorities. It has an xlnx,tsn-ep-mac child for
the host-side DMA channels and an xlnx,tsn-switch child for the three-port
switch, its MDIO buses and its ports.

> children and per-MAC interrupt-names entries. Each external
> port@N references its PHY through a phy-handle in the matching
> mdio-<N> child.

[Severity: Low]
Is this sentence still accurate after the v3 rename? The binding now only
accepts ethernet-port@1 and ethernet-port@2 inside the ethernet-ports
container. That container has additionalProperties: false, so the schema
would reject a node named port@1.

Should this say ethernet-port@N instead?

> diff --git a/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml b/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml
> new file mode 100644
> index 0000000000000..2fd22bc0d0357
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml
> @@ -0,0 +1,536 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: xlnx,tsn-endpoint-ethernet-mac-3.0
> +
> +  clocks:
> +    items:
> +      - description: GTX clock for transmitter logic and RTC
> +      - description: GTX 90-degree phase shifted clock for RGMII
> +      - description: Host RX FIFO clock
> +      - description: Host TX FIFO clock
> +      - description: Reference clock for IDELAY control
> +      - description: AXI-Lite register interface clock
> +
> +  clock-names:
> +    items:
> +      - const: gtx
> +      - const: gtx90
> +      - const: host_rxfifo
> +      - const: host_txfifo
> +      - const: ref
> +      - const: s_axi

[Severity: Low]
Does the IP still have all six clock inputs when both external ports are
GMII? The description says gtx90 is the phase shifted clock for RGMII.
The list does not depend on the ports' phy-mode, so a GMII-only design
still has to supply gtx90.

The example already feeds the same clock to both gtx and gtx90:

    clocks = <&misc_clk_2>, <&misc_clk_2>, <&misc_clk_1>, <&misc_clk_1>,

Later in the series, tsn_ip_probe() in xilinx_tsn_main.c requests all six
clocks as mandatory:

    ret = devm_clk_bulk_get(dev, TSN_NUM_CLOCKS, w->clks);

A DT without gtx90 would therefore fail to probe. The binding does not say
which clock inputs exist in the GMII configuration. The ref (IDELAYCTRL)
clock may still be needed for GMII.

If the GMII configuration has no gtx90 input, should that clock depend on
the ports' phy-mode?

> +
> +  ranges: true

[ ... ]

> +patternProperties:
> +  "^ethernet@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/net/ethernet-controller.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Endpoint MAC sub-node. Provides the host-side data path through the
> +      DMA channels described by its dmas / dma-names.
> +    properties:
> +      compatible:
> +        const: xlnx,tsn-ep-mac

[Severity: Low]
The wrapper compatible is versioned (xlnx,tsn-endpoint-ethernet-mac-3.0).
This child and the switch child (xlnx,tsn-switch) use unversioned names
that cover the whole family.

Documentation/devicetree/bindings/writing-bindings.rst asks for specific
compatibles and says not to use device-family names. For sub-blocks of a
bigger device, it prefers a compatible derived from the parent device.

The MDIO and PTP blocks sit at fixed offsets in the per-MAC windows of
this IP version. How would these child compatibles distinguish a later TSN
IP revision with a different sub-block layout?

Should the child compatibles follow the parent IP version too? If not,
could the commit message explain why they are generic?

[ ... ]

> +      dma-names:
> +        minItems: 2
> +        maxItems: 16
> +        items:
> +          pattern: "^(tx|rx)_chan[0-7]$"
> +        allOf:
> +          - contains:
> +              pattern: "^tx_chan[0-7]$"
> +          - contains:
> +              pattern: "^rx_chan[0-7]$"

[ ... ]

> +      tx-queues-config:
> +        type: object
> +        additionalProperties: false
> +        description:
> +          TX queue configuration node that maps IP priority queues to
> +          DMA TX channels. The TSN IP supports multiple priority queues for
> +          QoS scheduling. Each priority queue must be described exactly
> +          once and map to a distinct TX channel listed in dma-names. Two
> +          queues must not use the same TX channel. The mapping need not
> +          follow the channel numbering. For example, queue0 with
> +          xlnx,dma-channel-num set to 5 means priority queue 0 uses tx_chan5
> +          for data transfer.

[Severity: Low]
Should dma-names be tied to xlnx,num-priorities in the same way as the
queueN children?

The per-N allOf branches force tx-queues-config to hold exactly queue0 to
queue(N-1). dma-names only needs one tx_chan entry and one rx_chan entry,
and it has no uniqueItems. As far as I can tell, this would validate:

    xlnx,num-priorities = <8>;
    dma-names = "tx_chan0", "rx_chan0";
    tx-queues-config {
        queue0 { xlnx,dma-channel-num = <0>; };
        ...
        queue7 { xlnx,dma-channel-num = <0>; };
    };

That contradicts the description above, which says each queue maps to a
distinct TX channel listed in dma-names.

The driver added later in the series ("net: xilinx: tsn: parse endpoint
DMA channel configuration") also requires an exact match in
xlnx_tsn_ep_probe():

    if (num_tx_dma_channels != num_prio)
        return dev_err_probe(dev, -EINVAL,
                     "TX channel count %u must equal num-priorities %u\n",

The binding does not document this rule. A DT with more tx_chan entries
than priorities passes dt_binding_check but fails probe. The driver
rejects all of these cases at probe time with an error message.

Could each per-N if/then block also limit the tx_chan entries to exactly
N (contains with minContains/maxContains), and could dma-names get
uniqueItems: true?

The MAINTAINERS entry here lists only the binding file. The driver
directory is added to it later in the series.

[ ... ]

> +          ethernet-port@1:
> +            type: object
> +            unevaluatedProperties: true
> +            description:
> +              External Ethernet port wired to MAC1, reached through the
> +              mdio-1 bus.
> +
> +            properties:
> +              reg:
> +                const: 1
> +
> +              phy-mode:
> +                enum:
> +                  - gmii
> +                  - rgmii
> +                  - rgmii-id

[Severity: Low]
Why are rgmii-txid and rgmii-rxid left out here and on ethernet-port@2?

phy-mode describes which RGMII delays the board does not provide. A board
whose PCB adds only one of the two delays needs one of those modes. With
this enum, the board author has to choose rgmii (one delay missing) or
rgmii-id (one delay applied twice).

The gtx90 clock is described as "GTX 90-degree phase shifted clock for
RGMII", which suggests the MAC may shift TXC itself. Does the MAC add the
TX delay? If it does, and the PHY also adds the TX delay for rgmii-id, the
delay would be applied twice.

Should the binding say whether the MAC applies this delay, or describe it
with a property such as tx-internal-delay-ps?

[ ... ]

> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - xlnx,num-priorities
> +  - ranges
> +  - '#address-cells'
> +  - '#size-cells'

[Severity: Low]
Should the ethernet@ and switch@ children be required here?

The description and changelog say the binding covers only the fixed
Bridged Endpoint configuration. ethernet-port@0/1/2 are required because
a DT missing any of them "cannot describe working hardware". Even so, a
wrapper with no switch@ child, or with no children at all, still passes
dt_binding_check.

A node with only an ethernet@ child already validates under
xlnx,tsn-endpoint-ethernet-mac-3.0. That is the Endpoint-only layout the
changelog says is not supported yet.

If the two configurations are told apart later by which children are
present, shouldn't this schema state that requirement now?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-patches_v2_external-v4-0-56bb26f042a4%40amd.com

