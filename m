Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791AD606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 21:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OzwPlLea;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RuI4e2me
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Kl+5DghMKTaZgPNB/B3Ks3HUgsKJJ4T95CFWeDz/JHc=; b=OzwPlLeadRbGqONZcE1SIy+I0P
	e4BZVJhMufbZKpzRm9A4tNzqy2d8eQ9S6BwkSMROrH7jyl63J9w5xdGjow715XMqSuTGK1W9jTV04
	Si24GixcAdUU1rv8DzKNL5KrVL3R/E/f2iv0GEu5ZHeKNKh2LCWKul4yS0rKCg3XivYOKwbGBgux8
	636tiyApADsD748Lvj+9QLVvBB4G8btTwLcw+LPNxr6J6keOIGqLD8hN4dWsz7dRWHzrY/MSRc+CN
	4/1vexjCc2MLoDmyFycmlsKKvCT3TA5/3QOpjPW33d60sOZijWmh71ieWgAGFMkCYV+gjmBwUE/8W
	Lmc0kkmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTn3E-0000000AIdb-22R3;
	Wed, 18 Nov 2026 21:18:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTn3D-0000000AIdS-0par
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 21:18:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E01D6249B;
	Wed, 18 Nov 2026 21:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC9C1F000C4;
	Wed, 18 Nov 2026 21:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036722;
	bh=Kl+5DghMKTaZgPNB/B3Ks3HUgsKJJ4T95CFWeDz/JHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RuI4e2mec3sUPfeNBE8UyWG3m6Z4skLFGEsE1FO//kVaQ7WfnzvPrFxCotQd2MLA5
	 LUCF42/jeOQ1vGSfrcUY31/bjnot37kc4giVZwYN8ak02qNwFtnm0xFc0qjWobMW9a
	 i6e4kNhrEzjJv5TnpSbg9tBqdvdWQ3E3Obf3cleE9lT+xyyw3/186jd250TrFZvg8V
	 rq7k/ApCBEI5iR/OhhbxSV0utbJ30F41VVToezOUWOH42B0QTmfyiuqRSYFm6TzWb1
	 2vHJEm9rB3L18ZRsPSRHYLKKk2qiT+hm+qm7urvwjGeVsT/eB9rGAFJ33xlgLlYEdQ
	 HS78cweMQqG3A==
Date: Wed, 18 Nov 2026 15:18:39 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev, Daniel Baluta <daniel.baluta@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: hwmon: Add National/TI LM77
 temperature sensor
Message-ID: <179503671942.1054722.10836348939766634841.robh@kernel.org>
References: <20261116111802.2442456-1-lukma@nabladev.com>
 <20261116111802.2442456-2-lukma@nabladev.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116111802.2442456-2-lukma@nabladev.com>
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


On Mon, 16 Nov 2026 12:18:01 +0100, Lukasz Majewski wrote:
> Add binding description for National/TI LM77 temperature sensor.
> When compared to LM75 - it has two output pins one for interrupt
> and another one to signal the critical temperature alarm.
> 
> It also has only two I2C address pins (A0 and A1) - possible I2C
> addresses are: 0x4[89ab].
> 
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---
> Changes for v3:
> - New patch, as this IC description is added to Documentation/hwmon
>   as a separate entry and not to trivial devices
> ---
>  .../bindings/hwmon/national,lm77.yaml         | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/national,lm77.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


