Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49E3607E045
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b3u0O1wN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WEdAJIaY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cSWIafk7ikiCCY+OyvdNor7sWV+uHSYsERPSHy5tkIM=; b=b3u0O1wN5BSI5BsxidXP97/oF8
	DXhz3dbQ3bIIqgfbdiTFbEjOJLSty6TSE5qhsqVWtm06YX/J3BDZMHEdc1XrVe3Isqg7HbODy2jS7
	Gx2/69mVv9krI35DqhlW21k6EytCn9Nyw2SkXfJQLQW5kEXXETekS6Ko1JiRKpzP6m1D8TIqOZoc3
	7wb8/jMGTBbHLZ5G3dF9GWiPreRJkcowGBcsBUy8Cq8YjGaM9GYZ8wCf3fMKrTunLh8Y4UL7W0ubZ
	9HiNLZf14/QO/cq0KZjUWoAQmn2MNxkjON5CHKqInRG6R2HhcPUkjHdD0OZ8beu0/GIO8ArbtBF+K
	cBzHsSsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQi1m-00000003F2j-2uca;
	Tue, 10 Nov 2026 09:20:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQi1j-00000003F1T-3dKc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:20:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F5A846B12;
	Tue, 10 Nov 2026 09:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4AC1F0089F;
	Tue, 10 Nov 2026 09:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794302427;
	bh=cSWIafk7ikiCCY+OyvdNor7sWV+uHSYsERPSHy5tkIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WEdAJIaYOybMdnxp8lc5A/tcQ1/l8K75skGyY/pa5rMXczpT03UtV/cTttuq/Uesf
	 UhydKLbscaLxCGDmtfoibbmWWRc9x0IP4cxao7rCCYhRzPoNwPkuwLem4eljHoi9Lo
	 wnLaBje8gtyfehzvLux2So3ofm5WIwEmH+1wZWJXiNWtU/INDo9fmWiyl3EPuxSkKf
	 gwdSSJWD9WW38Sl+GZtqEPEDRXHMdxJmTNdEfyYoal9dG7NKf5mdWl0XSs5eiLEDk9
	 yKCqZ/nFz1B52u7+axUPmWeELgGsbe39k2vv6hLItpHhCYbs3Ur0H7xZv+Ya1UMxHY
	 0aLhi1hftZd0A==
Date: Tue, 10 Nov 2026 10:20:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH v5 2/8] dt-bindings: input: apple: Add DockChannel HID
 transport
Message-ID: <20261110-accurate-unselfish-cockle-3a39bd@quoll>
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
 <20261108-b4-apple-mtp-keyboard-v5-2-e2c97b82669a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261108-b4-apple-mtp-keyboard-v5-2-e2c97b82669a@gmail.com>
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

On Sun, Nov 08, 2026 at 07:25:07AM +0000, Michael Reeves wrote:
> +description:
> +  HID transport for keyboard and trackpad devices connected via the
> +  DockChannel FIFO mailbox on Apple Silicon SoCs. The endpoint includes a
> +  small RTKit coprocessor called MTP which must be booted before the HID
> +  transport becomes available.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

Just an enum instead of items and const below.

> +          - const: apple,t8112-dockchannel-hid



> +      - items:
> +          - enum:
> +              - apple,t6020-dockchannel-hid
> +              - apple,t6030-dockchannel-hid
> +              - apple,t6031-dockchannel-hid
> +              - apple,t8122-dockchannel-hid
> +          - const: apple,t8112-dockchannel-hid
> +
> +  reg:
> +    items:
> +      - description: Coprocessor ASC registers
> +      - description: Coprocessor SRAM/mailbox registers
> +
> +  reg-names:
> +    items:
> +      - const: asc
> +      - const: sram
> +
> +  mboxes:
> +    items:
> +      - description: ASC mailbox used for RTKit control
> +      - description: DockChannel FIFO mailbox used for HID packets
> +
> +  mbox-names:
> +    items:
> +      - const: asc
> +      - const: dockchannel
> +
> +  iommus:
> +    maxItems: 1
> +
> +  apple,has-stm:
> +    type: boolean
> +    description:
> +      Specifies that the coprocessor provides STM device and serial
> +      number query endpoints that must be ready before registering HID devices.

Isn't this implied by the compatible?

> +
> +  hid-country-code:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      HID country code for the keyboard layout variant.

What is the meaning of values? Do they map to any existing ABI? Like USB
HID? Otherwise, why country code is 32 bit integer instead of ISO3166
codes? As pointed last time, this should go probably to a common hid
schema.

No default? Not required?

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - mboxes
> +  - mbox-names
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        hid@24e400000 {
> +            compatible = "apple,t8112-dockchannel-hid";
> +            reg = <0x2 0x4e400000 0x0 0x4000>,
> +                  <0x2 0x4ec00000 0x0 0x100000>;
> +            reg-names = "asc", "sram";
> +            mboxes = <&mtp_mbox>, <&mtp_dockchannel>;
> +            mbox-names = "asc", "dockchannel";
> +            iommus = <&mtp_dart 1>;
> +            apple,has-stm;
> +            hid-country-code = <0>;

Which country is 0? Isn't this just a default?


> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0c1963150f04..41b12717c657 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2714,6 +2714,7 @@ F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
>  F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
>  F:	Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
>  F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> +F:	Documentation/devicetree/bindings/input/apple,t8112-dockchannel-hid.yaml
>  F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
>  F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
> 
> -- 
> 2.56.0
> 

