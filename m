Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9396F606A88A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1XcK4I3w;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KGh0F6w4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Kzqp5iGyk++So6EO/Kp6qWBhwWMWDzt/i/L4ZdkxQQk=; b=1XcK4I3wmW5IlCC2/8RIBlJ8zG
	UmJp9szlIXOZk9OoRQoHq6zVcDHWiZ40u3EQuzjUKPZx9H43UqDKQXUHb3CzTPHFlKNdhVmgxMfAX
	U0SNKDDgHf/QHEVXkCgOn/Hyy4SVExzdie/FSvt3bJYLPDPLXj2KDzUPImkfk7VkzhH2npzDFfl5k
	SP02d3WdM3notbkeMjO1P22gRl5pXKwPGeroUJeo+eaBdUECgU6Wg3VT70TgynKsl2EqGe32g6zMT
	ceVOh54x7UGqq+cv0Xd4jPnc5adin0ks0/EyL8r7hJ7EUWIZEjCqQelo1xSoFWnYSzq44nt9I5InD
	KaMd7ixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSBA-00000009XuZ-32lJ;
	Thu, 12 Nov 2026 10:37:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSB7-00000009Xtz-2x4Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 10:37:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D38C962FE9;
	Thu, 12 Nov 2026 10:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A181F00A05;
	Thu, 12 Nov 2026 10:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479832;
	bh=Kzqp5iGyk++So6EO/Kp6qWBhwWMWDzt/i/L4ZdkxQQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KGh0F6w4o5tT3aaRjJyR2mSvD+mRV/4eW9/IrbnWkDLToYL+XlbOoeFHUFGNagRSp
	 ie4wY8eZFlJa2N0LZ+/SpEXwSCoZJOB38ZQS51GWQgb2KpKiYKuaU+/FnIK6v/sknJ
	 Y+VlyA3YXXM3uGu2igjvE4nwIo5R6zXknjaLtOcPqhVzPG1C6Oaf1mSNMoN4vgjp+0
	 rXX/NYzxN2S62j1Mqy8QHCxqEjJMFSjd5XKE9wj031IwzuPJHfODUjXthX++LhoX+E
	 6I9oMhpMNSr7oOsIP3OJYNUbEAJPqR0NpuJ0ictLkVZkj3fPZZ2LnM4XMEyjLjnYkw
	 k1vAnQXpOj9HA==
Date: Thu, 12 Nov 2026 11:37:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fugang Duan <fugang.duan@cixtech.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: add Realtek RTS5453H Type-C
 port controller
Message-ID: <20261112-memorable-ruddy-auk-8df30c@quoll>
References: <20261110051723.434009-1-gary.yang@cixtech.com>
 <20261110051723.434009-2-gary.yang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110051723.434009-2-gary.yang@cixtech.com>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 01:17:22PM +0800, Gary Yang wrote:
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        typec@30 {
> +            compatible = "realtek,rts5453h";
> +            reg = <0x30>;
> +            interrupt-parent = <&gpio0>;
> +            interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> +
> +            connector {
> +                compatible = "usb-c-connector";
> +                data-role = "host";
> +                power-role = "source";
> +
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    port@0 {
> +                        reg = <0>;
> +
> +                        typec_hs_ep: endpoint {
> +                            remote-endpoint = <&usb_hs_ep>;
> +                        };
> +                    };
> +
> +                    port@1 {
> +                        reg = <1>;
> +
> +                        typec_ss_ep: endpoint {
> +                            remote-endpoint = <&usb_ss_ep>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };

Drop all nodes below, not really part of the scope.

With this fixed

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


