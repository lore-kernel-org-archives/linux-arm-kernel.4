Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1AC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 14:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NMOJEp3p;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vqpq04bn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bgmHtN/2PdMynT9bP6VE3sLHcXorlitWbwyp8VUnuZ8=; b=NMOJEp3pASQVOB
	85g52INYRyf2SK8azNmx2zptGsjtnpaQXLTX2Pztv06ZQuZyXfiVW3TyfPUMYZWBXx4KFH/ORgpFg
	6/IaoLv+QCLchRIYMdktkrgHzot5sPOWuhwU72/IflK6r/DOOs/xIEFP/yoOtm0cgi3OLUZiJ56W4
	IiuGdmVnBbtfZZvXw5lD162KGNVVl/XRFNaXXeAJceSdkRsLpvcfcj3bfufeWnrINLJ9WWHSd6H+T
	KF6rmO59BBqo7SDvmgEPYymZTHnGcTGnjzaEleroljfz7lv9JC7faytkHwHBvRvi2vkAXfOmuQOPH
	Xt/z+9QUpg22XjzC6wIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbEQ-000000003pm-3jNj;
	Sun, 15 Nov 2026 14:29:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbEC-000000003lg-118T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 14:29:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0522741820;
	Sun, 15 Nov 2026 14:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E70A1F000C5;
	Sun, 15 Nov 2026 14:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794752947;
	bh=bgmHtN/2PdMynT9bP6VE3sLHcXorlitWbwyp8VUnuZ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Vqpq04bnF9Yte5CZmjLtY8Ag47WsXok909DICTc3Q+9ZEaWfe/milJi/fsBg1MjbX
	 l4o8ENyNkRxMorAinGma/UWFwtk0Hl/PfRJ8H9PfJwWjJ3dNUJ+X4tOxmLqg6MzHe0
	 9mm++t1sGQYzkxwvlEAEB/ueWNAHLWPzoBt8et+xBeXgWY46iwEU77bXmB6nPjqaLR
	 Z1ROVHkkK4fJ4yUsilAYlLZRvYeRBs0SDGTjkvzL6BUitqBR+s/UPgk6bTFArUFSLi
	 sf/Opau+cPE16xoqXSQ5tHiuyqdWnx6PCK01Ra63KdjdKOcGCBmFmYLW861Yy9hcWx
	 zGDuc8yGq0gUw==
Message-ID: <c05aefdc-7b60-472b-ae08-2c3af3cd533f@kernel.org>
Date: Sun, 15 Nov 2026 16:29:03 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/16] clk: at91: Use new per SoC PMC clock index
 definitions
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Mihai Sain <mihai.sain@microchip.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Durai Manickam KR <durai.manickamkr@microchip.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-5-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261105110715.2486432-5-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 11/5/26 13:06, Alexander Dahl wrote:
> Adding missing clocks for only some (more recent) SoCs got more and more
> complex and confusing with the old common definitions, while there was
> no actual need to have them common.
> 
> A splitup of the definitions in the bindings was prosoded and done per
> SoC, before adding new array members for missing clocks.
> 
> Switch from the old common indexes to the new per SoC indexes.
> No functional change.  Old defines can be removed later.
> 
> Signed-off-by: Alexander Dahl<ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@kernel.org>

