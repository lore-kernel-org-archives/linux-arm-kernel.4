Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DDB606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TqrIMbRc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ola3z5aN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Jxqitei9n4jTIEvLaRLKlJWrH7A0OCWEQUnpoPUhO5Y=; b=TqrIMbRcvNPHt8YHYjaD8KXbc4
	SAsmJWELqxbush3k07IRJReC6sK8dzTo3hxIPfQiKS3s0bUMwQ5gk71mx/ln4i0YssmspLsExYJ3k
	tOtxvN148Uu30xW1obpqgUlgDUMWlJrDqwzM+4NgxdEsehAo7mrRy9F/f3ihjQTVMz87AzJ89j9go
	Nhpx8W9rM1cqZfOXsf3/kJ6XsgiDs0IbATLEuQd5iuNERkPpMTnkDl7iTgiyAHW6/Lv59cmSiRR8h
	AXuOmePoMn0sI2pvBGPFpyy+8dqTNaFkYo9AUOIct9GmAXjXu148LsnWrQ8A39mTAGmOjBL5ott2s
	XWay4lCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzRR-0000000BYom-0uCZ;
	Thu, 19 Nov 2026 10:32:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzRP-0000000BYoc-3E9q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:32:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 693F96122A;
	Thu, 19 Nov 2026 10:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 70EAF1F000C8;
	Thu, 19 Nov 2026 10:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795084350;
	bh=Jxqitei9n4jTIEvLaRLKlJWrH7A0OCWEQUnpoPUhO5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ola3z5aN3akS10EcfjC4l+IeVZCeKiIcr+JOyPMGC6YqTmdZXAm7MVtszMOyqM+lt
	 MwDCVAytM1MkH2+OHj/l76KqistiZOE5eYfI2vSmammm5jtkzzlb+K5zcNj/JbVnf0
	 o6hEhleT2ZL2jtHk3ukaTwG+q3AaEMtU1udHyj6sJZpQ9Nkem7+rKrFobw8nZQE7TS
	 GVAOTuZpQgUCI+vkz5tQc2CxkyI0d8YkC+Q14OEOrXj+wLRgrmT3S/sQP+Ug6H5g/h
	 jIjwkZJgmJ6KM0BRSgF54m5ySxYaaaVC0BmUTQxGpRk1Y2fbmG02w+Vzw/4KinVqVu
	 FKnhnoupiQPIw==
Date: Thu, 19 Nov 2026 11:32:23 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: filipp.dunsky@gmail.com
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] gpio: Add Cortina Systems CS75xx GPIO driver
Message-ID: <ndapsfnk4wdon57ihawkorz5rwrhxsb7ql3mujqvuu6ixi4sbc@ugtxsjqt7gcc>
References: <20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com>
 <20261116-cs75xx-gpio-v4-2-ad80a944e966@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-cs75xx-gpio-v4-2-ad80a944e966@gmail.com>
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

On Mon, Nov 16, 2026 at 05:08:17AM +0300, Fil Dunsky via B4 Relay wrote:
> From: Fil Dunsky <filipp.dunsky@gmail.com>
> 
> Add a driver for the GPIO banks of the Cortina Systems CS75xx SoCs. The
> data and direction registers are handled by gpio-mmio; each bank has its
> own interrupt with level and edge triggers, both edges are emulated by
> flipping the polarity.
> 
> A pin only works as a GPIO when the pin mux in the global control block
> selects the GPIO function. That is not part of the GPIO controller and
> is left to the boot loader until there is a pin controller driver.
> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---

Can you please address sashiko comments?

Bart

