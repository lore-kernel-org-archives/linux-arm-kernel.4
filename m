Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CEF606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 01:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1IGJygog;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xr5LkQl2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+QKWNF013aDPSU8lbGBlKzPWdu+x0Ycm3WsJvLZrms8=; b=1IGJygog3ZXabU/ZC3WOi+eNrm
	edS/LHLMUIbvd79oSGGFKjWPC5tSY2hSwkpbD0vtl4UDqTvjKfVOqxVlTXL+Wgc2xhJxYD3dnhMtr
	tRi+bMk7hVBnB1zygky8LeYvV14lfF2WcNKuugXz+ck7i2rIY4oAPDzN92aDiwH3WOH0DG3CbsnMg
	oIBCPUdN5p79Zv8VAFQZqa7VlSuBBHyPlMO/RsiwrZkeFac1Dtv3WrOubJO+1k+HbZC9cFlt/y3G8
	GybZHMUgNiO+yw4JYiN4hjY2HpeEb+OHvfkOvUNGsg0/IjWrkmF0Gp1DiJBMtY8fVyze9Nnwma7Uv
	zNGTj8VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJGS-00000008J8N-04kF;
	Thu, 12 Nov 2026 01:06:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJGR-00000008J8C-1rG2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 01:06:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E63F343774;
	Thu, 12 Nov 2026 01:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989F31F00A05;
	Thu, 12 Nov 2026 01:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794445566;
	bh=+QKWNF013aDPSU8lbGBlKzPWdu+x0Ycm3WsJvLZrms8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xr5LkQl2U7rG6JJ19orlIuMeBIBDVBPqEamKTFx5FdpJfFV7p83X5m56Qc9lwbArh
	 xbLVzrcTWQiBqbGY4jAe6NV/c/M4svGGW6PaRJLY9KN53tqkLqYFOuxjcVY++D4Qod
	 1LV+LmJwg8tUCSIW9X+5Trji+AEga7caRPAef6/o3WwyL+yDcqYZc8duOtA3Bg+vGT
	 sl2MlY0/J1EQ/VLvnzK8vw5SNi/Z5JN+bfLaPii8jIA5ijegNvPPnL/2JPGmkZbcCv
	 kT8v2f07fg8pYJNmUgMxRAZak1e8mscoRf2iHiYD2Lk68w+S4JOlhaXkF5Gqur/it6
	 6oRjzY53W78QA==
Date: Wed, 11 Nov 2026 19:06:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	Conor Dooley <conor.dooley@microchip.com>, conor+dt@kernel.org,
	luka.perkov@sartura.hr, linux@roeck-us.net,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, corbet@lwn.net, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: hwmon: add Microchip LAN969x fan
 controller
Message-ID: <179444556456.3829380.4513786084250860193.robh@kernel.org>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
 <20261111161619.232141-2-robert.marko@sartura.hr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111161619.232141-2-robert.marko@sartura.hr>
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


On Wed, 11 Nov 2026 17:12:46 +0100, Robert Marko wrote:
> The LAN969x fan controller has a PWM output and tachometer input in a
> register block separate from the Sparx5-compatible temperature sensor.
> Describe it with its own compatible and binding.
> 
> The optional fan child specifies PWM period and polarity, tachometer
> pulses per revolution, and thermal cooling levels.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v3:
> - Drop the unnecessary literal-style description marker.
> - Inherit pulse-count bounds from fan-common.yaml.
> - Require cooling-levels only when #cooling-cells is present.
> - Add Conor Dooley's Acked-by tag.
> 
> Changes in v2:
> - Describe the fan controller in a separate binding and compatible.
> - Keep the existing temperature-sensor binding unchanged.
> 
>  .../bindings/hwmon/microchip,lan9691-fan.yaml | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


