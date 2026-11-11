Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BB4606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j8/gumWJ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nOefZ9Au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K4KsszHoQU25eoLKNk19Xgiydvgb75r3NOFjVZOwVl4=; b=j8/gumWJc1UkoxKPATjy82ELBX
	ak40nv1pOGEd/XvKPH7yz5cN3+7e67tw4HtUtsmhoMAQA1/0DFuhv/TjT9Oo6jVsR78lzzfdN7dGn
	gEkP8yt4QU76C5eKLqga+roPlVgjpqG2DEV9hHlBKzlwTOT2xmP1KpFYT+pr9JF+XdZTleagXDjkF
	9P/Nb2C0wpxJ73YEEB6lwLlBP1KVnii6ZXSssXhGQDbfw+ysTrrcz67XaXLiwMJFQFlewtl3+DZTk
	ilm49fbavQEjPam8C4MfnlpPMrfdF7xZHvTW09VhFS3SOAGJm6jZtCXi21Jr4XSn29Kn/D+Iz2b+S
	wYtyqVRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7jD-00000006i7C-0wkF;
	Wed, 11 Nov 2026 12:47:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7jC-00000006i73-2wPd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:47:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E7409611EA;
	Wed, 11 Nov 2026 12:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58021F00A05;
	Wed, 11 Nov 2026 12:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794401221;
	bh=K4KsszHoQU25eoLKNk19Xgiydvgb75r3NOFjVZOwVl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nOefZ9AuKw2af0APzYszhjr9lNBNl3iOe4vesBFAvwseV8O/YjueOjx9WG9DNBwLd
	 NypvJUnQlFaSejzvulYLfdeiZJtNPVgZufvsyxv0yFFTJfcVuOc/qCOg0ZHcMmYr3J
	 f+FjyOWBHRomV2AlXfPiVBeiHVInrosetF5wOTfszdzObI9HOsIryW2oKcfBk8bTcI
	 SbK9G++K283ZWgbQ7spQFteD0RxsJB/2SNGLj6u6pKpzYn5Yl84ygFyFISdOwbzbZc
	 Dnv2NY6jg8OyNdc8mev6W87CwEcVtuJEy6a4ZzqP2xl1AA3rFkvCiev5sIfTCkwXF3
	 a9RN4LBuAd3Hg==
Date: Wed, 11 Nov 2026 13:46:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 07/15] dt-bindings: mailbox: apple,mailbox: Add t8142
 compatible
Message-ID: <20261111-daring-tacky-cockatrice-a9bae9@quoll>
References: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
 <20261106-apple-dts-m4-m5-nvme-v1-7-22f4827b4ece@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106-apple-dts-m4-m5-nvme-v1-7-22f4827b4ece@cyberchaos.dev>
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

On Fri, Nov 06, 2026 at 10:04:16PM +0100, Yureka Lilian wrote:
> The mailbox hardware remains unchanged on M5 SoC so just add its per-SoC
> compatible.

Please stop inflating this. You are only making it difficult to review
your work.

I am dropping entire set from DT patchwork.

Best regards,
Krzysztof


