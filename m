Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AE760A2604
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oYrYulD6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TR4vM2Ah
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JNRjmvatIytyZx5eeAPe6e2dTWDCPb6wN/GsQvJbRCo=; b=oYrYulD66pOeL0e7pcxV8HZa8V
	C/WKbZbBNaYSMRAoxDjWU2A7CgFCXxtRkFj6RhPspA2T2HRtaLIyg8AmprQD4xHWNcC3drapkwpI4
	RqyFRHAZzMz2/6Py9VqWPfFO77cm7275I79SSAMJPHhyUY6P36+JlHQESXDUonA5ICFF++h0p4SmH
	Dub19xZq7o/UNYRAcOb5Pnqc9tjPiB6cPAh5Ic/OcxX2D/EeuJONXOsUvlQD6Qy0aE786i5CBgzYi
	QgEDJdqVqsAGj2Tt2/rg6vTUKz1OpWh9Ia/kgG5Ig/4/6J65E6BVRelxkXA/JPDFUTM4IZmgZp0mD
	kBQ4hPoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2PP-0000000C6IG-14iv;
	Thu, 19 Nov 2026 13:42:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2PH-0000000C6EF-3HrL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:42:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id A653363413;
	Thu, 19 Nov 2026 13:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A98571F000C7;
	Thu, 19 Nov 2026 13:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095750;
	bh=JNRjmvatIytyZx5eeAPe6e2dTWDCPb6wN/GsQvJbRCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TR4vM2Ah76bWIM3RBsjqn6+l6nJ7Ld5yGU+drZxatLmMholRuWQziHoyZ6fxCWyE9
	 vlg/EPUDAJAml67YcUzBYVOl93STL5Fu6LCOFhlY7AoR64egmswELnMN+vjWAnR/ng
	 QmieGIvNnmWPxaseOz7hJZCMAfJrGUC4ONBHR6obi5HHlR9dYMTF5VqZyJqWS5UWyC
	 vzgROzm2IJ4eDxxXUbd2bAnlGGDE/J9q7RsfALpBhm55MxHUrVihvGO3/C//uHnnjj
	 lc3kFsmVNwRJzVo3fnv8Zwi+Z76CH0khgBAt7on4xLO8tSNTBib+N3mFpX4LEWy3Vr
	 pG0GSSum9qCLw==
Date: Thu, 19 Nov 2026 14:42:27 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] gpio: Add Cortina Systems CS75xx GPIO driver
Message-ID: <p3qjb3oncivinobxa5wvwwkql3xmjfujdwmxigyxczk5ya23ua@xayhbwbn35af>
References: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 02:02:48PM +0300, Fil Dunsky wrote:
> The Cortina Systems CS75xx ("Goldengate G2") SoCs have five banks of 32
> GPIO lines, each bank with its own interrupt. This series adds the
> binding and a driver based on gpio-mmio; level and edge triggers are
> supported, both edges are emulated by flipping the polarity.
> 
> Each pin is either a GPIO line or belongs to a peripheral (NAND,
> Ethernet, UART, I2C, ...). That choice is made in the global control
> block, which is not part of the GPIO controller: as discussed on v1 [1],
> the driver does not touch the pin mux and leaves it as the boot loader
> set it up, until there is a pin controller driver for that block.
> Testing the reset button on the Securifi Almond+ requires selecting
> GPIO37 in the global pin mux before gpio-keys is probed; the current
> boot path does not provide that setup. The tests used a separate,
> board-specific setup step. The GPIO driver does not program the mux.
> 
> The driver used to be part of a series with the interrupt controller,
> I2C and watchdog drivers and the device tree changes. That series is now
> split per subsystem. The driver can be built with COMPILE_TEST without
> the platform series [2], which is under review separately. The other
> Kconfig option, ARCH_CORTINA_ACCESS, is defined by that series in
> arch/arm/mach-goldengate/Kconfig; it is not in mainline yet. There is no
> code dependency on the platform series. The device tree nodes will
> follow with the other CS75xx dts changes once the platform is merged.
> 
> There is no public documentation; the register layout comes from the GPL
> vendor kernels. Tested on a Securifi Almond+ (CS7542): the reset button
> (GPIO 37) works as an active-low gpio-keys input, and the SX8650
> touchscreen uses a level-triggered GPIO interrupt.
> 
> [1] https://lore.kernel.org/all/20261012-dreamlike-hazily-19bb60326f0a@spud/
> [2] https://lore.kernel.org/all/20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com/
> 

The driver looks good but I cannot pick it up while it references a
Kconfig symbol that's not upstream.

Bart

