Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEEC60A3809
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JdWSsi1c;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DP6aS3o6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tU70rkAg+574vgu487sbjgQCUDsnSlr+Ix8M/GBIFUk=; b=JdWSsi1c2me8W7P2wV5A4XUDVv
	0POFPpUvvJ9KbGDa//xcSpEV4HMi+CaLcY9/O9VlPr2JlJWnIED6Xmp6HLqavggbn4FGWi2CRkxW2
	P2gm1e0cll0+ZlDHJMQQ6CdcXe7SZjgbnWLm1om6dwQiDVNgqHbtHcRyiQDsFGSZU0yA2jKF4HFC3
	LOaiuwZDBXehByQX6kb/WXTrswOSoLp2s2VaHq+XSnGRI+Tfr+8ssFO4OwyfaWzJ6GSI20jGttqNw
	QPt6nkS70uCKY+D7wBcoJqbjJ1KX09oDmyQ8TEuxaSRtbH/8jEdqxqrDO2+XK5xzcG2klfFGZAbBH
	a7aStPWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnEt-00000004HfX-0bDa;
	Tue, 10 Nov 2026 14:54:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnEq-00000004Hdm-07dQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 14:54:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 215D7639C9;
	Tue, 10 Nov 2026 14:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA411F008A4;
	Tue, 10 Nov 2026 14:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794322458;
	bh=tU70rkAg+574vgu487sbjgQCUDsnSlr+Ix8M/GBIFUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DP6aS3o6jpTl7p6kQ+3Ohzu6vewKiJu6Y3pMPcN4g9pzxnDVvCQuE5ceRMSFrX+a1
	 3AXrcPapKJ1EmYUjLxBCCI4T2UoH1u9a9qoucrm0WNVciYasEQpHu0iJWFE7pWWS6j
	 boWcIX6a0VePN5jszwb7jxXJDVB7TPVMhOz5TXPepwo4PeGrrni6RtQHQU/iQZQTL7
	 dWUuWbLL+rs0bw2izuJpK4h4c0eX4+ht4/1FURWsMIupUkRmqepWvygDwPSUatg/8O
	 vcxDKawh8ysJan2gNwT45AwHSJNAaGYC586psdionq5lb3hYxnaVGlfNDjlxSqSqRx
	 cM/QUFefl6NjQ==
Date: Tue, 10 Nov 2026 08:54:14 -0600
From: Rob Herring <robh@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@roeck-us.net, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan
 controller
Message-ID: <20261110145414.GA3828324-robh@kernel.org>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109133609.810876-1-robert.marko@sartura.hr>
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

On Mon, Nov 09, 2026 at 02:35:05PM +0100, Robert Marko wrote:
> The LAN969x fan controller has a PWM output and tachometer input in a
> register block separate from the Sparx5-compatible temperature sensor.
> Describe it with its own compatible and binding.
> 
> The optional fan child specifies PWM period and polarity, tachometer
> pulses per revolution, and thermal cooling levels.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v2:
> - Describe the fan controller in a separate binding and compatible.
> - Keep the existing temperature-sensor binding unchanged.
> 
>  .../bindings/hwmon/microchip,lan9691-fan.yaml | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
> new file mode 100644
> index 0000000000000..0b7d38a6d20ae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/microchip,lan9691-fan.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip LAN969x Fan Controller
> +
> +maintainers:
> +  - Robert Marko <robert.marko@sartura.hr>
> +
> +description: |

Don't need '|'

> +  LAN969x fan controller with a PWM output and tachometer input. The fan
> +  child's pwms property references this node to specify the PWM period and
> +  polarity.
> +
> +properties:
> +  compatible:
> +    const: microchip,lan9691-fan
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: System reference clock
> +
> +  '#pwm-cells':
> +    const: 2
> +    description: |
> +      Number of cells in a PWM specifier.
> +      - cell 0: PWM period in nanoseconds
> +      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
> +
> +  fan:
> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      cooling-levels:
> +        description:
> +          PWM duty-cycle values corresponding to thermal cooling states.
> +        items:
> +          maximum: 255
> +
> +      pulses-per-revolution:
> +        minimum: 1
> +        maximum: 4

Drop. That's already the max in fan-common.yaml. minimum should be added 
there too as 0 would never make sense.

> +        default: 2
> +
> +    required:
> +      - pwms
> +
> +    dependencies:
> +      '#cooling-cells':
> +        - cooling-levels
> +      cooling-levels:
> +        - '#cooling-cells'

The dependencies should also go in fan-common.yaml. Perhaps 
cooling-levels without #cooling-cells might make sense sometimes?

Rob

