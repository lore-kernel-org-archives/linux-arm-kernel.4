Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC71606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 17:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ch65tzNW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ihNWaeW2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PNh8YN4lO0/xfHtYOrOb/Cy+IoC6FYA0GOT8T94Fmb0=; b=ch65tzNWXCd6ef1kMOuj3yZlNo
	gXf6Eq24grcUDUn1RKoPVbQUAa/Q3mJ2GoguxVua/lZLTp2YqbYiSDCVReW9fOwjFaqZO5FN8F77n
	ZeRMwnNwi129gDieyH6LYrMNFDQY79HsS/EojUlSTux5OeuU9oXoRyvJmaNyW3RQdMRHMrj9HGKfG
	uhaANmAKWdC1ydJInGtZ8HSVb9YZ7j2LCjJzyk12g51JIqU4r4Vg3ewIWYqMOi0y4E6iCduBQOCA9
	Fq+dlWPAwON8VlB42rzt9IlCeSaBUh6LYjD0I8lCqPTtE5mi+f486pAPqoz69VzYFXXg7IOpLx3iW
	jTw8WVVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVB3W-00000001PO1-2CxL;
	Sun, 22 Nov 2026 17:08:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVB3V-00000001PNt-0HIf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 17:08:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BA6160D66;
	Sun, 22 Nov 2026 17:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84D11F000C0;
	Sun, 22 Nov 2026 17:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795367323;
	bh=PNh8YN4lO0/xfHtYOrOb/Cy+IoC6FYA0GOT8T94Fmb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ihNWaeW2Ry4FyKYjKi/lepkAgonGFOQE+zw06+ykkfcgEZAW3HbZEOzTHAWyN2FAq
	 m8hbn6uW+BTMyvcCmIhdktJDtpR9FwM1L851EsytE7dblccgtsuWSte7lzz2ddBArX
	 C83NEWu8lp2i3KIYiRQdXGxBEt2ZiLfAItaJkub36XiYFwd/9BLmE3nUiVrdiab3qi
	 HUEfyRAfP1EkVSs/GUABxdNm/QsbGOTpep93x6RD2qHNm175AKNP1+Yyk+l981RlQ5
	 QZ4TsbbirfRbpA6VlLloZXb6z62QFSchPGB5csJiNFX/iz4FDbm5wHMIQ2uQP3ynXV
	 RsTSjB2BtHRxA==
Date: Sun, 22 Nov 2026 18:08:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, michal.simek@amd.com, tanmay.shah@amd.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: mailbox: Add AMD PL Mailbox IP
Message-ID: <20261122-gainful-bloodhound-of-apotheosis-baf5f9@quoll>
References: <20261119220405.2838553-1-ben.levinsky@amd.com>
 <20261119220405.2838553-2-ben.levinsky@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119220405.2838553-2-ben.levinsky@amd.com>
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

On Thu, Nov 19, 2026 at 02:04:02PM -0800, Ben Levinsky wrote:
> Add a binding for the AMD PL Mailbox, a soft IP used to exchange 32-bit
> words between two processors through a pair of FIFOs.
> 
> The IP lives in programmable logic and isn't tied to a SoC, so the
> compatible names the IP and its version.  The FIFO depth is set when the
> design is synthesized and can't be read from the hardware, hence
> property amd,pl-mailbox-depth.
> 
> Assisted-by: Claude:claude-opus-5.5

Drop, wasn't even here before, so you must have added it.
https://lore.kernel.org/all/20261014213426.2957480-6-ben.levinsky@amd.com/

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  .../bindings/mailbox/amd,pl-mailbox-2.1.yaml  | 71 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml b/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
> new file mode 100644
> index 000000000000..50ac14a4cbac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
> @@ -0,0 +1,71 @@
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
> +  The AMD Programmable Logic Mailbox IP passes messages between two
> +  processors through a pair of FIFOs. Each side of the IP has its own
> +  registers, interrupt and clock, and is described by its own node.
> +  Channel 0 is used to transmit and channel 1 to receive.
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
> index ca1c59e1fc59..dc6a835f7bbc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1315,6 +1315,12 @@ S:	Supported
>  T:	git https://gitlab.freedesktop.org/agd5f/linux.git
>  F:	drivers/gpu/drm/amd/pm/
>  
> +AMD PROGRAMMABLE LOGIC MAILBOX DRIVER
> +M:	Ben Levinsky <ben.levinsky@amd.com>
> +L:	linux-kernel@vger.kernel.org

Drop list, there is no point in mentioning lkml for every driver. lkml
is standard list, catch all.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


