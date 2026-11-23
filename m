Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51299606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QlpU0BjA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F5ijIkK3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8tMXBNHyUHHfUggSCwq/LV8i3JWEVeKo4tKMHJBx7DQ=; b=QlpU0BjAId7Xdedi30GMRRm0n7
	HEYIUwzsDTTE54h1XL2zChR7M3XQixu0INPwejKy8aitzh+tGRssMrjPXgpXkcIrnbeS+5bTwPDGZ
	QbN3HT+3Q5v26AAu6aypvid1G0T4wrbBk6wkb0Uo2fRC/gH7M0+UZK3RkbQMojza+sQ3AxmU2xNpO
	FgHJxsSaQDN2sr0jy25SGQnofaOQzM6mn1SOh8FXN721nTS25gwYhmcTsyRqUB1Jgkl1+Ev8wsrRb
	8xAJop8BjfirRequzGIvBq0G8REgOvjvhD0MLhkPlqZ9gOp4E4Wd8x4HIPEQTBhJaWxvx7iRwJRNG
	LJsxoBsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRaq-000000032DD-3ysT;
	Mon, 23 Nov 2026 10:48:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRaq-000000032CI-0SUY;
	Mon, 23 Nov 2026 10:48:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FEF1602BA;
	Mon, 23 Nov 2026 10:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53FE1F0093C;
	Mon, 23 Nov 2026 10:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795430894;
	bh=8tMXBNHyUHHfUggSCwq/LV8i3JWEVeKo4tKMHJBx7DQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F5ijIkK3qmhTNAbyoDXS3+JKuB540448nfPqbiEzlHCJrpXwFadSY+79HtYMLG2hq
	 +4jt3eX5cWzHbPFRwlezbVbAnwpkpoYll421fXLUUIPdQT/D2vrbGJi4BXhZ0sdlMr
	 nqxq4kTzKP7/B9hUGMz7Tg+gAVrG4WMaA38iSFgla7CnZo/eAmBKWavTEqw+0qboL3
	 t2JmEMJD7fpWHWo5r5BByuQn8SDuDRhdvkkC4wsXxdR1raN/dUVnZELLTHV4JPPgVf
	 S/lTehUZ+k+uGhS9CUE9h/rjJp9eo8+8DcwrEcTzTW9rMXiW74PerA5KOMMDjc5KUm
	 E6W9hJYr1XHaA==
Date: Mon, 23 Nov 2026 11:48:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Velkov <iav@iav.lv>
Cc: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] dt-bindings: rtc: Add linux,wakeup-states
Message-ID: <20261123-literate-significant-wildcat-dcfffa@quoll>
References: <20261116-b4-alarmtimer-rtc-priority-v2-0-b2c69721e489@iav.lv>
 <20261116-b4-alarmtimer-rtc-priority-v2-6-b2c69721e489@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116-b4-alarmtimer-rtc-priority-v2-6-b2c69721e489@iav.lv>
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

On Mon, Nov 16, 2026 at 12:25:05AM +0000, Igor Velkov wrote:
> A board can have more than one RTC with an alarm that wakes the system,
> for example an I2C RTC next to an RTC in the PMIC or the SoC firmware.
> Which of them wakes the system depends on the sleep state and on the
> board's firmware: amlogic,meson-vrtc is a register the firmware reads
> when the application processors suspend, so it wakes the system from
> deep sleep only, and whether an I2C RTC wakes the system from deep
> sleep depends on the firmware handling its interrupt line.
> 
> Add linux,wakeup-states to describe this per RTC: the suspend states an
> alarm of the RTC wakes the system from, named as in /sys/power/mem_sleep,
> or none for an RTC whose alarm wakes the system from no suspend state.
> 
> List it in nxp,pcf8563.yaml and amlogic,meson-vrtc.yaml, which do not
> allow unlisted properties.
> 
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
>  .../devicetree/bindings/rtc/amlogic,meson-vrtc.yaml     |  2 ++
>  Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml  |  2 ++
>  Documentation/devicetree/bindings/rtc/rtc.yaml          | 17 +++++++++++++++++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
> index a89865fa676a..51cce4b2a7ff 100644
> --- a/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
> @@ -30,6 +30,8 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  linux,wakeup-states: true
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
> index 22909a96123e..e464432e4690 100644
> --- a/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
> @@ -32,6 +32,8 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  linux,wakeup-states: true
> +
>    start-year: true
>    wakeup-source: true
>  
> diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
> index e46d50b1063e..54f41858dda4 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
> @@ -26,6 +26,23 @@ properties:
>        0: not chargeable
>        1: chargeable
>  
> +  linux,wakeup-states:
> +    $ref: /schemas/types.yaml#/definitions/string-array

This looks exactly like re-implementing system-idle-states.yaml and wakeup-source.

Best regards,
Krzysztof


