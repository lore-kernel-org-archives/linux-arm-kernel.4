Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707B8606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hOqVuiwq;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=lp7z7ZXU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zMUOTf/upqWE8PmKUGyV8pTt0i4NWtIy6Bb7m2a+O3k=; b=hOqVuiwqz4iOsWCgTfrj2IjGZw
	xTOPLllWl3z0j6aU1VlqK7UzLzXX9FTLvwsSsvWFYpK+/DytO17xtRYfjSJk90LiKD7GqnZJBANDH
	PlQbpKM9il79pvdHb0corrwH6AsV1AaG3zPn3XRSp1bGSC/kwTfQNxCPPjg26LhQtqD9X5CQvXxMf
	hbLu5Odl4X8nagTa1RGa39X7jVzjeM1QaaUxEWcYcGpPFlr88mvgVWEfagYucLsFZloM0SLk4qoeK
	nVlqEQdlgYJKmTWc8zWmXwZ2iPprqWY6AXCt4QFMnP/ao4HXpib3B2Q2aXt1P677au6zBARkmRBw2
	GYH8uTAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3t8-0000000COun-44qz;
	Thu, 19 Nov 2026 15:17:26 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3t4-0000000COry-3bRH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:17:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 020F81483750;
	Thu, 19 Nov 2026 16:17:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1795101445; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=zMUOTf/upqWE8PmKUGyV8pTt0i4NWtIy6Bb7m2a+O3k=;
	b=lp7z7ZXUBpEBkO652IcK2/GVHonbqF10yhwWr0qa0dlru3OSuGktfPpoJxyDUFrhZnxo9B
	0y3UZGGW6fhgF+w4uhec61zFDLdz1KMeh1yaTFZ2lKrnveB2L5a9ARYaXrThhddPlh6Mrb
	3gSsv8m9cqqq+Ojs9s9fJMqmmG7SwNs+1O3UbwS/VUv5cQLuD5E7qPahHld1hpSPU2d2Yx
	TfU/5K9lqKmvVW5LT3goXtFv8b58eIz0AYglMWZDR5b/QHc1fZde/xR7fxZjjsWGYnnN+p
	WBmQxL/PdVHhOyVqY7lAmZb0d+WnH+lwV39XtVgAqgizEo8y84oxx/fAeagQhg==
Date: Thu, 19 Nov 2026 16:17:16 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: Alexander Dahl <ada@thorsis.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 15/16] ARM: dts: microchip: sam9x60_curiosity: Enable
 OTP Controller
Message-ID: <20261119-gaming-employed-e2f29d4756aa@thorsis.com>
Mail-Followup-To: Claudiu Beznea <claudiu.beznea@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-16-ada@thorsis.com>
 <1d45ab58-9e5a-4b9f-adc4-691a99f0e05e@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d45ab58-9e5a-4b9f-adc4-691a99f0e05e@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_071723_139235_74CF43DC 
X-CRM114-Status: GOOD (  12.11  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Claudiu,

Am Sun, Nov 15, 2026 at 04:27:35PM +0200 schrieb Claudiu Beznea:
> 
> 
> On 11/5/26 13:06, Alexander Dahl wrote:
> > Allows to access the OTP memory and Product UID now.
> > 
> > Signed-off-by: Alexander Dahl<ada@thorsis.com>
> 
> Reviewed-by: Claudiu Beznea <claudiu.beznea@kernel.org>

Well, in feedback to v4 sashiko suggested [1] it is not necessary to
enable the node in board dts, because the node is implicitly enabled
already in SoC dtsi.  Can confirm this from testing.  I would therefor
drop this patch for v5 of the series.  Or is it better to keep it to
make it explicit?

Greets
Alex

[1] https://lore.kernel.org/linux-devicetree/sashiko-outbox-199240@kernel.org/

