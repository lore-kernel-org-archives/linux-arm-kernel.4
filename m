Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBD9606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qtHzv5It;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrZt0FAZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AuVnC3QeDQmp/2GBHhjFUynHCQhwPZJBh/DIv/2i+BQ=; b=qtHzv5Itq48hXc0hdlPldQDLt1
	gUA4e40vCfo9IPQ5ipLgGZOHYq79qf2R+vY0Fbs7HlIteib3SMxMevadAzxXRlcXVE5QD7gl4cYbD
	gEA1uMOVgYJh33nd+me1tCjGNhpjHxlcQDpT38p4kdlM5r90q5SJaYM4DtQa67GkG2SzRFQSp9SkH
	IY6GWUDQQsAhe171zpSbHTayhvzW2UeGRXIw7JLC8qRF7q7B/el4og6dRmMbmHL2zj7lYX8i3Soz+
	0drx1r5HcQaDdvvuwVpr9uwiT1L5s6Cd2gtBsiQYkzGeTxwkIHB+83+ixrXqZUlP2P1+MZnXBxPR2
	rb1aS40A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRJ8-00000002xCN-0QGf;
	Mon, 23 Nov 2026 10:29:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRJ7-00000002xCE-0r7X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:29:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6750C61F90;
	Mon, 23 Nov 2026 10:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52B51F000CA;
	Mon, 23 Nov 2026 10:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795429795;
	bh=AuVnC3QeDQmp/2GBHhjFUynHCQhwPZJBh/DIv/2i+BQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TrZt0FAZWCxadq6lSV2HocGz28UeBDFH9LDs72d3p+3O1oevKMIg9PVDj314BYMkd
	 2SDvwt47R03mghBk/OaBe8jrV9uuGhp+nuk+Z18IhbvNmHblLEjlcYCRzgawXh6gvP
	 aDUrakno3/+mqEh5ZxcvuAOT4/ibYkoydZHxOTJNJm4rzOiy5c4VOn08fB1PhFyicd
	 SSqbHfaKThmJCXvPsnE3vM2I3luCJB7513rwvN1cS5BJNXXQTAxCAzYI17TxBsbB+m
	 BeeumuqL/y/3pWr+HKoNJ2/0gfN2gtuVrWZBYt97D2S/crhHpQwmtTwOV1iT0bO4yW
	 6ZDtoBGYO2bmQ==
Date: Mon, 23 Nov 2026 11:29:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 04/13] pinctrl: berlin: add optional pinconf support
Message-ID: <20261123-pillbug-of-objective-whirlwind-7f341e@quoll>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-5-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115102401.3520-5-jszhang@kernel.org>
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

On Sun, Nov 15, 2026 at 06:23:43PM +0800, Jisheng Zhang wrote:
> Add pin configuration support for newer Synaptics SoCs.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

...

> @@ -339,5 +563,5 @@ int berlin_pinctrl_probe(struct platform_device *pdev,
>  }
>  EXPORT_SYMBOL_GPL(berlin_pinctrl_probe);
>  
> -MODULE_LICENSE("GPL v2");
> +MODULE_LICENSE("GPL");

I don't see how this is relevant to the change described in the commit
msg.

>  MODULE_DESCRIPTION("pinctrl library for Synaptics SoCs");

Best regards,
Krzysztof


