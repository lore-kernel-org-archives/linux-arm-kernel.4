Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A7E606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XYYlTo+U;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PlhtjMp8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Jrkn+iO2qxKDc8vSbt20tA6wQd7qR/MNXzcYza4ZjkA=; b=XYYlTo+UubJnkmUX4jhLD89Lz6
	NXpt7Fv59NS/FVCF7mM0uU0y2tCj6mIFW5oZXVSW8v1VgKHHbOOkD2zoNINUyiwVVcSHR75+oqB5/
	sSAzSJ+bleYiZMPbbQ6K+giAQvixdcFGV3aap7+3dFq5A0XJGn4IsOYUf0ylg/6RoczXuxYOOBr+5
	H15zSoqsRbVbkxopvMzASw5bjvvr7TB9jvwFxqTreer9AvVnmXZjn2UWjObT7P2FW43CtnK0tlgYi
	oOUfvTKEOfTibRimmqh3QGmpDjoqnKV1WmtZy12iEHE4VBBduHpd23XytsJuBgiJzGJFN6pG0uO6K
	fzf7N75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSv0i-00000002Cc2-133H;
	Mon, 16 Nov 2026 11:36:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSv0g-00000002CbO-3Pcq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:36:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F770456C4;
	Mon, 16 Nov 2026 11:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D922B1F000C7;
	Mon, 16 Nov 2026 11:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794828990;
	bh=Jrkn+iO2qxKDc8vSbt20tA6wQd7qR/MNXzcYza4ZjkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PlhtjMp8MB+qh3Mac/Q6jAIc7kPG3vr9iApjmYHqoMXeNJD6hv/T/X64whrLsuwi9
	 vVIHlsmh17hhL5gZ3VRO9rT0oXCRKfP+mUp/gFjFfdjtPFXPcgrkTfn8YX6xLI73iz
	 ZJ2SDme8ywJ5Wwajxksk0rM0S0eDLk1OjR80FWVn16OEVehG30+HTI/9hEMhfkD7yy
	 5VGLeqSkl02fuCsKZHFsknPZodNaEg1bq29EegjE6VZhn5xzwGjafI3bVkR88GSrdr
	 G6a2PEFxtCtfpV3nuzaoK2MZl/+HUXhpmzmWV09Wk9cTlLWj02YF95yl3FIiuxeJ6u
	 NilseI6xWLxRg==
Date: Mon, 16 Nov 2026 12:36:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio: Add Cortina Systems CS7542
 GPIO controller
Message-ID: <20261116-brave-barracuda-of-acumen-ddb4ac@quoll>
References: <20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com>
 <20261116-cs75xx-gpio-v4-1-ad80a944e966@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116-cs75xx-gpio-v4-1-ad80a944e966@gmail.com>
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

On Mon, Nov 16, 2026 at 05:08:16AM +0300, Fil Dunsky wrote:
> The Cortina Systems CS75xx SoCs have five banks of 32 GPIO lines. Each
> pin is shared between a GPIO line and a peripheral function; the pin
> mux lives in the global control block and is not described here.
> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>  .../bindings/gpio/cortina,cs7542-gpio.yaml         | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


